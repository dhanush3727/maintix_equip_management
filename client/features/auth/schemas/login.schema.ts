import { z } from "zod";

export const loginSchema = z.object({
  email: z.email("Please enter a valid email address").trim().toLowerCase(),
  password: z.string().min(8, "Password must contain 8 characters"),
  deviceInfo: z.string().trim(),
});

// instead of creating a separate interface or type we can create like this
export type LoginFormValues = z.infer<typeof loginSchema>;
