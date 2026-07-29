import { DAYS, MONTHS } from "../constants/dashboard.constant";

interface GetToday {
  day: string;
  month_date: string;
  year: string;
}

export function getToday(): GetToday {
  const today = new Date();

  const day = DAYS[today.getDay()];
  const month = MONTHS[today.getMonth()];
  const date = today.getDate();
  const month_date = `${month} ${date}`;
  const year = today.getFullYear().toString();

  return { day, month_date, year };
}
