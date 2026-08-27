import {
  BreakdownSeverity,
  BreakdownStatus,
  DropDown,
  QueryParams,
} from "@/types";

export interface BreakdownAction {
  id: number;
  breakdownId: number;
  performedBy: number;
  action: string;
  remarks: string;
  createdAt: string;
}

export interface BreakdownRequest {
  title: string;
  description?: string;
  severity: BreakdownSeverity;
  equipmentId: number;
}

export interface BreakdownParams extends QueryParams {
  cursor?: string;
  equipment?: string;
  severity?: BreakdownSeverity;
  status?: BreakdownStatus;
}

export interface BreakdownData {
  id: number;
  equipment: string;
  reportedBy: string;
  assignedTo: string;
  title: string;
  severity: BreakdownSeverity;
  status: BreakdownStatus;
  reportedAt: string;
  createdAt: string;
}

export interface BreakdownDataById {
  id: number;
  title: string;
  rootCause: string;
  description: string;
  severity: BreakdownSeverity;
  status: BreakdownStatus;
  createdAt: string;
  actions: BreakdownAction[];
  equipment: DropDown;
  assignedTo: DropDown;
}

export interface AssignTechnicianRequest {
  assignedTo: number;
}

export interface BreakdownActionRequest {
  action: string;
  remarks: string;
}

export interface ResolveRequest {
  rootCause: string;
}
