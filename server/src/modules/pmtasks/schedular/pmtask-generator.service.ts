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
  generateTask() {}

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
}
