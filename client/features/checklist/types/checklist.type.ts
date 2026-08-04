import { ChecklistItemType, DropDown, QueryParams } from "@/types";

export interface CreateChecklistItems {
  name: string;
  order: number;
  type: ChecklistItemType;
  expectedValue?: string;
  minValue?: number;
  maxValue?: number;
  options?: string[];
  isRequired?: boolean;
}

export interface ChecklistItems {
  id: number;
  name: string;
  order: number;
  type: ChecklistItemType;
  expectedValue: string | null;
  minValue: number | null;
  maxValue: number | null;
  options: string[] | null;
  isRequired: boolean | null;
  isActive: boolean;
}

export interface ChecklistRequest {
  name: string;
  equipmentTypeId: number;
  description?: string;
  items: CreateChecklistItems[];
}

export interface ChecklistParam extends QueryParams {
  type?: string;
}

export interface GetChecklistsData {
  id: number;
  name: string;
  equipmentType: string;
  parentId: number;
  version: number;
  description: string;
  isActive: boolean;
}

export interface GetChecklistByIdData {
  id: number;
  name: string;
  equipmentType: DropDown;
  parentId: number;
  version: number;
  description: string;
  isActive: boolean;
  checklistItems: ChecklistItems[];
}
