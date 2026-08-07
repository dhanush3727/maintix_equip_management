import {
  ChecklistItemType,
  ItemStatus,
  QueryParams,
  TaskStatus,
} from "@/types";

export interface ChecklistItems {
  id: number;
  taskId: number;
  templateItemId: number;
  name: string;
  order: number;
  type: ChecklistItemType;
  expectedValue: string | null;
  minValue: number | null;
  maxValue: number | null;
  options: string[] | null;
  actualValue: string | null;
  status: ItemStatus | null;
}

export interface TaskData {
  id: number;
  template: string;
  equipment: string;
  assignedTo: string;
  assignedToById: number;
  title: string;
  dueDate: string;
  completedAt: string | null;
  status: TaskStatus;
  createdAt: string;
  isOverdue: boolean;
  isComplete: boolean;
}

export interface TaskParams extends QueryParams {
  cursor?: string;
  status?: TaskStatus;
  assignedTo?: string;
  equipment?: string;
  from?: string;
  to?: string;
  isOverdue?: boolean;
}

export interface TaskDataById {
  id: number;
  scheduleId: number;
  equipmentName: number;
  title: string;
  remarks: string | null;
  dueDate: string;
  completedAt: string | null;
  status: TaskStatus;
  createdAt: string;
  assignedTo: number;
  isOverdue: boolean;
  checklistItems: ChecklistItems[];
}

export interface UpdateTaskItemRequest {
  actualValue: string;
  remarks?: string;
}
