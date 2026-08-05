import { ROUTES } from "@/constants";

export const MAINTENANCE_CONTENT = {
  SCHEDULE_LABEL: "Schedule",
  TASK_LABEL: "Task",

  ADD_SCHEDULE: "Add Schedule",
} as const;

export const MAINTENANCE_NAVIGATION = [
  {
    title: MAINTENANCE_CONTENT.SCHEDULE_LABEL,
    url: ROUTES.PREVENTIVE_MAINTENANCE.SCHEDULE,
  },

  {
    title: MAINTENANCE_CONTENT.TASK_LABEL,
    url: ROUTES.PREVENTIVE_MAINTENANCE.TASK,
  },
];
