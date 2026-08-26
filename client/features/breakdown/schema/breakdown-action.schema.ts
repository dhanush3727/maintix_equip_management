import z from "zod";

export const breakdownActionSchema = z.object({
  action: z.string().trim().min(1, "enter action"),
  remarks: z.string().trim().optional(),
});

export type BreakdownActionValues = z.infer<typeof breakdownActionSchema>;
