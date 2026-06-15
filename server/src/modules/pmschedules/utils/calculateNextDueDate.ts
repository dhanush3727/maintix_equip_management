import { FrequencyType } from '@prisma/client';

export function calculateNextDueDate(
  startDate: Date,
  frequencyType: FrequencyType,
  interval: number,
): Date {
  const next = new Date(startDate);

  switch (frequencyType) {
    case FrequencyType.DAILY:
      next.setDate(next.getDate() + interval);
      break;

    case FrequencyType.WEEKLY:
      next.setDate(next.getDate() + 7 * interval);
      break;

    case FrequencyType.MONTHLY:
      next.setMonth(next.getMonth() + interval);
      break;

    case FrequencyType.YEARLY:
      next.setFullYear(next.getFullYear() + interval);
      break;

    default:
      throw new Error('Invalid frequency type');
  }

  return next;
}
