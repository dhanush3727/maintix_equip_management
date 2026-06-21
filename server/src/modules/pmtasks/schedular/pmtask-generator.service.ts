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
  
}
