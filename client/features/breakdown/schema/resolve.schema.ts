import z from "zod";

export const resolveSchema = z.object({
  rootCause: z.string().trim().min(1, "Enter the root cause"),
  action: z.string().trim().min(1, "Enter action taken"),
  remarks: z.string().trim().optional(),
});

export type ResolveValues = z.infer<typeof resolveSchema>;
