import { BreakdownSeverity } from "@/types";
import z from "zod";

export const breakdownSchema = z.object({
  title: z.string().trim().min(1, "title is required"),
  description: z.string().trim().optional(),
  severity: z.enum(BreakdownSeverity, "Select severity"),
  equipmentId: z.number().min(1, "Select equipment"),
});

export type BreakdownValues = z.infer<typeof breakdownSchema>;