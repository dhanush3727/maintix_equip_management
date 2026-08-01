import z from "zod";

export const updateEquipmentTypeSchema = z.object({
  name: z.string().trim().min(1, "Enter name"),
  code: z.string().trim().min(1, "Enter code"),
  description: z.string().trim().min(1, "Enter description"),
});

export type UpdateEquipmentTypeValues = z.infer<
  typeof updateEquipmentTypeSchema
>;
