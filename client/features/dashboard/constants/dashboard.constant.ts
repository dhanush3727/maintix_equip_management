import {
  BreakdownPriority,
  BreakdownTrend,
  EquipmentStatus,
  PmTaskCompletion,
  Summary,
} from "../types/dashboard.type";

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

  SUMMARY_EQUIPMENT_LABEL: "TOTAL EQUIPMENT",
  SUMMARY_TASK_LABEL: "DUE TODAY",
  SUMMARY_OVERDUE_LABEL: "OVERDUE",
  SUMMARY_BREAKDOWN_LABEL: "OPEN BREAKDOWN",

  EQUIPMENT_STATUS_ACTIVE: "Active",
  EQUIPMENT_STATUS_INACTIVE: "In Active",
  EQUIPMENT_STATUS_MAINTENANCE: "Under Maintenance",
  EQUIPMENT_STATUS_BREAKDOWN: "Breakdown",
  EQUIPMENT_STATUS_DECOMMISSIONED: "Decommissioned",
} as const;

export const EQUIPMENT_STATUS_CHART_COLORS = {
  ACTIVE: "var(--chart-1)",
  UNDER_MAINTENANCE: "var(--chart-2)",
  BREAKDOWN: "var(--chart-3)",
  INACTIVE: "var(--chart-4)",
  DECOMMISSIONED: "var(--chart-5)",
} as const;

export const DEFAULT_SUMMARY: Summary = {
  totalEquipment: 0,
  todayDue: 0,
  overdue: 0,
  openBreakdown: 0,
} as const;

export const DEFAULT_EQUIPMENT_STATUS: EquipmentStatus = {
  active: 0,
  inactive: 0,
  underMaintenance: 0,
  breakdown: 0,
  decommissioned: 0,
} as const;

export const DEFAULT_BREAKDOWN_TREND: BreakdownTrend[] = [];

export const DEFAULT_PM_TASK_COMPLETION: PmTaskCompletion[] = [];

export const DEFAULT_BREAKDOWN_PRIORITY: BreakdownPriority[] = [
  {
    priority: "HIGH",
    count: 2,
  },
  {
    priority: "LOW",
    count: 4,
  },
];
