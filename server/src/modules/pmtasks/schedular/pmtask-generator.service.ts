import { Injectable, Logger } from '@nestjs/common';
import { Cron, CronExpression } from '@nestjs/schedule';
import { PrismaService } from 'src/prisma/prisma.service';

// 🔥 Strict typing for schedule (avoid "any" nonsense)
type ScheduleWithTemplate = {
  id: number;
  organizationId: number;
  equipmentId: number;
  templateId: number;
  assignedTo: number;
  nextDueDate: Date;
  frequencyType: 'DAILY' | 'WEEKLY' | 'MONTHLY';
  interval: number;
  template: {
    id: number;
    name: string;
    items: {
      id: number;
      name: string;
      order: number;
      type: string;
      expectedValue: string | null;
      minValue: number | null;
      maxValue: number | null;
      options: unknown;
    }[];
  };
};

@Injectable()
export class PMTaskGeneratorService {
  private readonly logger = new Logger(PMTaskGeneratorService.name);

  constructor(private readonly prisma: PrismaService) {}

  // 🔥 Runs every midnight
  @Cron(CronExpression.EVERY_DAY_AT_MIDNIGHT)
  async generateTasks(): Promise<void> {
    this.logger.log('PM Task generation started');

    const now: Date = new Date();
    now.setHours(0, 0, 0, 0); // normalize

    // 1️⃣ Get all due schedules
    const schedules: ScheduleWithTemplate[] =
      await this.prisma.pMSchedule.findMany({
        where: {
          isActive: true,
          nextDueDate: {
            lte: now,
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

    this.logger.log(`Schedules to process: ${schedules.length}`);

    // 2️⃣ Process each schedule
    for (const schedule of schedules) {
      await this.processSchedule(schedule, now);
    }

    this.logger.log('PM Task generation completed');
  }

  // 🔥 Core logic per schedule
  private async processSchedule(
    schedule: ScheduleWithTemplate,
    now: Date,
  ): Promise<void> {
    let nextDueDate: Date = new Date(schedule.nextDueDate);

    // 🔥 Handle missed runs (critical)
    while (nextDueDate <= now) {
      // 3️⃣ Prevent duplicate task
      const existing = await this.prisma.pMTask.findFirst({
        where: {
          scheduleId: schedule.id,
          dueDate: nextDueDate,
        },
        select: { id: true },
      });

      if (!existing) {
        await this.createTask(schedule, nextDueDate);
      }

      // 4️⃣ Move to next cycle
      nextDueDate = this.calculateNextDueDate(
        nextDueDate,
        schedule.frequencyType,
        schedule.interval,
      );
    }

    // 5️⃣ Update schedule safely
    await this.prisma.pMSchedule.update({
      where: { id: schedule.id },
      data: {
        nextDueDate,
        lastGeneratedAt: new Date(),
      },
    });
  }

  // 🔥 Task creation (snapshot logic)
  private async createTask(
    schedule: ScheduleWithTemplate,
    dueDate: Date,
  ): Promise<void> {
    const template = schedule.template;

    await this.prisma.pMTask.create({
      data: {
        organizationId: schedule.organizationId,
        scheduleId: schedule.id,
        equipmentId: schedule.equipmentId,
        templateId: schedule.templateId,

        title: template.name, // snapshot

        assignedTo: schedule.assignedTo,

        dueDate,
        status: 'PENDING',

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

    this.logger.log(
      `Task created | Schedule: ${schedule.id} | Due: ${dueDate.toISOString()}`,
    );
  }

  // 🔥 Frequency logic
  private calculateNextDueDate(
    current: Date,
    frequencyType: 'DAILY' | 'WEEKLY' | 'MONTHLY',
    interval: number,
  ): Date {
    const next = new Date(current);

    switch (frequencyType) {
      case 'DAILY':
        next.setDate(next.getDate() + interval);
        break;

      case 'WEEKLY':
        next.setDate(next.getDate() + 7 * interval);
        break;

      case 'MONTHLY':
        next.setMonth(next.getMonth() + interval);
        break;

      default:
        throw new Error('Invalid frequency type');
    }

    return next;
  }
}