import { EquipmentStatus } from "@/types";
import { EquipmentTypeParams } from "./equipment-type.type";

export interface AddEquipmentRequest {
  name: string;
  code: string;
  serialNumber?: string;
  equipmentTypeId: number;
  locationId: number;
  departmentId: number;
  installedDate?: string;
  warrantyExpiry?: string;
  manufacturer?: string;
  model?: string;
}

export interface EquipmentData {
  id: number;
  name: string;
  code: string;
  status: EquipmentStatus;
  equipmentType: string;
  location: string;
  department: string;
}

export interface EquipmentParams extends EquipmentTypeParams {
  status?: EquipmentStatus;
  department?: string;
  location?: string;
  type?: string;
}
