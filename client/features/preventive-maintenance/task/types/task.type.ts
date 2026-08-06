import { TaskStatus } from "@/types";

export interface TaskData {
  id: number;
  template: string;
  equipment: string;
  assignedTo: string;
  title: string;
  dueDate: string;
  completedAt: string | null;
  status: TaskStatus;
  createdAt: string;
  isOverdue: boolean;
}
