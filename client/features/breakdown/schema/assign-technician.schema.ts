import z from "zod";

export const assignTechnicianSchema = z.object({
  assignedTo: z.number().min(1, "Select Technician"),
});

export type AssignTechnicianValue = z.infer<typeof assignTechnicianSchema>;
