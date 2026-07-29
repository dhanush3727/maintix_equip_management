export const DASHBOARD_ENDPOINT = {
  GET_DASHBOARD: "dashboard",
} as const;

export const MONTHS = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

export const DAYS = [
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
];

export const DASHBOARD_CONTENT = {
  GREETINGS: "Welcome",

  NO_COUNT: "No",

  HEADER_TASK_LABEL: "task due today,",
  HEADER_NO_TASK_LABEL: "No task due today,",

  HEADER_OVERDUE_LABEL: "overdue,",
  HEADER_NO_OVERDUE_LABEL: "No overdue,",

  HEADER_BREAKDOWN_LABEL: "open breakdown",
  HEADER_NO_BREAKDOWN_LABEL: "No open breakdown",
};
