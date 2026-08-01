export interface AddEquipmentTypeRequest {
  name: string;
  code?: string;
  description?: string;
}

export interface EquipmentTypeData {
  id: number;
  name: string;
  code: string;
  description: string;
  isActive: boolean;
}

export interface EquipmentTypeParams {
  page?: number;
  limit?: number;
  search?: string;
  sortBy?: "name" | "code";
  order?: "asc" | "desc";
}

export interface EquipmentTypeDropdownData {
  id: number;
  name: string;
  code: string;
}

export interface EditEquipmentTypeRequest {
  name?: string;
  code?: string;
  description?: string;
}
