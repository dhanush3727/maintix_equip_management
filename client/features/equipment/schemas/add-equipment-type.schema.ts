import z from "zod";

export const addEquipmentTypeSchema = z.object({
  name: z.string().min(1, "Enter the name of type").trim(),
  code: z.string().min(1, "Enter the type code").trim(),
  description: z.string().trim().optional(),
});

export type AddEquipmentTypeValues = z.infer<typeof addEquipmentTypeSchema>;
