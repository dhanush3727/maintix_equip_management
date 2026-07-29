import { BreakdownSeverity, BreakdownStatus, TaskStatus } from "@/types";

export interface Summary {
  totalEquipment: number;
  todayDue: number;
  overdue: number;
  openBreakdown: number;
}

export interface EquipmentStatus {
  active: number;
  inactive: number;
  underMaintenance: number;
  breakdown: number;
  decommissioned: number;
}

export interface BreakdownTrend {
  date: string;
  count: number;
}

export interface PmTaskCompletion {
  month: string;
  completed: number;
}

export interface BreakdownPriority {
  priority: string;
  count: number;
}

export interface TodayTasks {
  id: number;
  title: number;
  equipmentId: number;
  equipment: string;
  assignedTo: number;
  userName: string;
  status: TaskStatus;
}

export interface RecentBreakdowns {
  id: number;
  equipmentId: number;
  equipment: string;
  severity: BreakdownSeverity;
  status: BreakdownStatus;
}

export interface DashboardData {
  summary: Summary;
  equipmentStatus: EquipmentStatus;
  breakdownTrend: BreakdownTrend[];
  pmTaskCompletion: PmTaskCompletion[];
  breakdownPriority: BreakdownPriority[];
  todayTasks: TodayTasks[];
  recentBreakdowns: RecentBreakdowns[];
}
