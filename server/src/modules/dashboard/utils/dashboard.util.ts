type GetDaysType = { today: Date; startOfDay: Date; endOfDay: Date };

export function getDays(): GetDaysType {
  const today = new Date();

  const startOfDay = new Date(today);
  startOfDay.setHours(0, 0, 0, 0);

  const endOfDay = new Date(today);
  endOfDay.setHours(23, 59, 59, 999);

  return { today, startOfDay, endOfDay };
}

export function formatKey(date: Date): string {
  const key = [
    date.getFullYear(),
    String(date.getMonth() + 1).padStart(2, '0'),
    String(date.getDate()).padStart(2, '0'),
  ].join('-');

  return key;
}
