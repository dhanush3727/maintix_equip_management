import z from "zod";

export const equipmentSchema = z.object({
  name: z.string().min(1, "Enter a name of equipment").trim(),
  code: z.string().min(1, "Enter a code").trim(),
  equipmentTypeId: z.number().min(1, "Select an equipment type"),
  locationId: z.number().min(1, "Select a location"),
  departmentId: z.number().min(1, "Select a department"),
  installedDate: z.date().optional(),
  warrantyExpiry: z.date().optional(),
  serialNumber: z.string().optional(),
  manufacturer: z.string().optional(),
  model: z.string().optional(),
});

export type EquipmentValues = z.infer<typeof equipmentSchema>;
