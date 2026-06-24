import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../../prisma/prisma.service';
import { Prisma } from '@prisma/client';
import { calculateNextDueDate } from '../../pmschedules/utils/calculateNextDueDate';
import { Cron, CronExpression } from '@nestjs/schedule';

// Define a type alias for the schedule with its related template and items
type ScheduleType = Prisma.PMScheduleGetPayload<{
  include: {
    template: {
      include: {
        items: true;
      };
    };
  };
}>;

@Injectable()
export class PMTaskGeneratorService {
  constructor(private prisma: PrismaService) {}

  // #region Create a PMTask
  async createTask(schedule: ScheduleType, dueDate: Date) {
    const template = schedule.template; // Get the template associated with the schedule

    // Create a new PMTask with the provided schedule and due date, and also create checklist items based on the template
    await this.prisma.pMTask.create({
      data: {
        organizationId: schedule.organizationId,
        scheduleId: schedule.id,
        equipmentId: schedule.equipmentId,
        templateId: schedule.templateId,
        title: template.name,
        assignedTo: schedule.assignedTo,
        dueDate,

        // Create checklist items based on the template
        checklistItems: {
          create: template.items.map((item) => ({
            templateItemId: item.id,
            name: item.name,
            order: item.order,
            type: item.type,
            expectedValue: item.expectedValue,
            minValue: item.minValue,
            maxValue: item.maxValue,
            options: item.options,
          })),
        },
      },
    });
  }
  //#endregion

  // #region Process schedule
  async processSchedule(schedule: ScheduleType, now: Date) {
    // Start with the next due date from the schedule
    // why we use new Date() here is to create a new Date object based on the nextDueDate from the schedule.
    // This is important because the nextDueDate from the schedule might be a string or a different type,
    // and we want to ensure that we are working with a Date object for accurate date comparisons and calculations.
    let nextDueDate = new Date(schedule.nextDueDate);

    // Loop to generate tasks for all due dates up to the current date
    // This loop will continue generating tasks until the next due date is in the future (i.e., greater than now).
    while (nextDueDate <= now) {
      const existing = await this.prisma.pMTask.findFirst({
        where: {
          scheduleId: schedule.id,
          dueDate: nextDueDate,
        },
        select: { id: true },
      });

      // If no existing task is found for the current due date, create a new task
      if (!existing) {
        await this.createTask(schedule, nextDueDate);
      }

      // Calculate the next due date based on the schedule's frequency type and interval
      nextDueDate = calculateNextDueDate(
        nextDueDate,
        schedule.frequencyType,
        schedule.interval,
      );
    }

    // Update the schedule
    await this.prisma.pMSchedule.update({
      where: {
        id: schedule.id,
      },
      data: {
        nextDueDate,
        lastGeneratedAt: new Date(),
      },
    });
  }
  //#endregion

  //#region Generate Task
  @Cron(CronExpression.EVERY_10_SECONDS) // runs everyday at midnight
  // This method is scheduled to run every day at midnight using the CronExpression.EVERY_DAY_AT_MIDNIGHT
  async generateTask() {
    // Get the current date and set the time to midnight for accurate comparison
    const now = new Date();

    // Fetch all active schedules where the next due date is less than or equal to the current date (now)
    const schedules = await this.prisma.pMSchedule.findMany({
      where: {
        isActive: true,
        nextDueDate: {
          lte: now, // nextDueDate <= now
        },
      },
      include: {
        template: {
          include: {
            items: true,
          },
        },
      },
    });

    // Process each schedule to generate tasks as needed
    for (const schedule of schedules) {
      await this.processSchedule(schedule, now);
    }
  }
  //#endregion
}
