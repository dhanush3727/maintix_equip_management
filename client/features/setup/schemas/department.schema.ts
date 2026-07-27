import { DepartmentType } from "@/types";
import z from "zod";

export const departmentSchema = z.object({
  name: z.string().min(1, "Enter department name").trim(),
  type: z.enum(DepartmentType, "Select Department type"),
  code: z.string().min(1, "Enter department code").trim(),
});

export type DepartmentValues = z.infer<typeof departmentSchema>;
