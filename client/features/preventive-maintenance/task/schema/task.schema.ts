import z from "zod";

export const taskSchema = z.object({
  actualValue: z.string().min(1, "Enter the value"),
  remarks: z.string().optional(),
});

export type TaskSchemaValues = z.infer<typeof taskSchema>;
