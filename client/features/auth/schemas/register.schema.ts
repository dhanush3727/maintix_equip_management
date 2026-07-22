import z from "zod";

export const registerSchema = z.object({
  name: z.string().min(1, "Enter your name").trim(),
  companyName: z.string().min(1, "Enter your organization").trim(),
  email: z.email("Enter a valid email").trim().toLowerCase(),
  password: z
    .string()
    .regex(
      /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$/,
      "Enter valid password",
    ),
  deviceInfo: z.string(),
});

export type RegiserFormValues = z.infer<typeof registerSchema>;
