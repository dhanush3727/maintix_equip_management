import z from "zod";

export const resolveSchema = z.object({
  rootCause: z.string().trim().min(1, "Enter the root cause"),
});

export type ResolveValues = z.infer<typeof resolveSchema>;
