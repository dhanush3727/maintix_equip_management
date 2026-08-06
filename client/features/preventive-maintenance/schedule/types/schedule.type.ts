import { DropDown, FrequencyType, QueryParams } from "@/types";

export interface ScheduleRequest {
  equipmentId: number;
  templateId: number;
  frequencyType: FrequencyType;
  interval: number;
  startDate: string;
  assignedTo: number;
}

export interface UpdateScheduleRequest {
  frequencyType?: FrequencyType;
  interval?: number;
  startDate?: string;
  assignedTo?: number;
}

export interface ScheduleParams extends QueryParams {
  equipment?: string;
  template?: string;
  frequencyType?: FrequencyType;
  from?: string;
  to?: string;
}

export interface ScheduleData {
  id: number;
  equipmentName: string;
  template: string;
  assignedTo: string;
  frequencyType: FrequencyType;
  interval: number;
  startDate: string;
  nextDueDate: string;
  isActive: boolean;
}

export interface ScheduleDataById {
  id: number;
  equipment: DropDown;
  template: DropDown;
  assignedTo: DropDown;
  frequencyType: FrequencyType;
  interval: number;
  startDate: string;
  nextDueDate: string;
  isActive: string;
}
