export type EquipmentStatusSummary = {
  active: number;
  inactive: number;
  underMaintenance: number;
  breakdown: number;
  decommissioned: number;
};

export type BreakdownTrendType = {
  date: string;
  count: number;
};

export type PMTaskCompletionType = {
  month: string;
  completed: number;
};

export type BreakdownPriorityType = {
  priority: string;
  count: number;
};
