export enum NotificationType {
  SCHEDULE_ASSIGNED = 'SCHEDULE_ASSIGNED',
  TASK_ASSIGNED = 'TASK_ASSIGNED',
  TASK_OVERDUE = 'TASK_OVERDUE',
  BREAKDOWN_RAISED = 'BREAKDOWN_RAISED',
  BREAKDOWN_ASSIGNED = 'BREAKDOWN_ASSIGNED',
  BREAKDOWN_RESOLVED = 'BREAKDOWN_RESOLVED',
}

export enum ReferenceType {
  SCHEDULE = 'SCHEDULE',
  TASK = 'TASK',
  BREAKDOWN = 'BREAKDOWN',
}

export type NotificationParam = {
  organizationId: number;
  userId: number;
  type: NotificationType;
  title: string;
  message: string;
  referenceId?: number;
  referenceType?: ReferenceType;
};
