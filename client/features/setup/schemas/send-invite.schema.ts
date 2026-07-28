import z from "zod";

export const sendInviteSchema = z.object({
  email: z.email("Enter a valid email").trim().toLowerCase(),
  roleId: z.number().min(1, "Select a role"),
  departmentId: z.number().min(1, "Select a department"),
});

export type SendInviteValues = z.infer<typeof sendInviteSchema>;
