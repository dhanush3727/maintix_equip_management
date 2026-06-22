import { Injectable } from '@nestjs/common';
import { Cron, CronExpression } from '@nestjs/schedule';

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
export class CronService {
  @Cron(CronExpression.EVERY_DAY_AT_MIDNIGHT)
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
}
