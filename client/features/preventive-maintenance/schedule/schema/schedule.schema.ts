import { FrequencyType } from "@/types";
import z from "zod";

export const scheduleSchema = z.object({
  equipmentId: z.number().min(1, "Select equipment"),
  templateId: z.number().min(1, "Select Checklist"),
  frequencyType: z.enum(FrequencyType, "Select Frequency"),
  interval: z.number().min(1, "Enter interval of frequency"),
  startDate: z.string().trim().min(1, "Select start date"),
  assignedTo: z.number().min(1, "Select technician"),
});

export type ScheduleValues = z.infer<typeof scheduleSchema>;
