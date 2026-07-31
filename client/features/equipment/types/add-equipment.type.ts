export interface AddEquipmentRequest {
  name: string;
  code: string;
  serialNumber?: string;
  equipmentTypeId: number;
  locationId: number;
  departmentId: string;
  installedDate?: Date;
  warrantyExpiry?: Date;
  manufacturer?: string;
  model?: string;
}
