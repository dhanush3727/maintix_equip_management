import { z } from "zod";

export const resetPasswordSchema = z
  .object({
    password: z
      .string()
      .regex(
        /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$/,
        "Enter valid password",
      ),

    confirmPassword: z.string(),
  })
  .refine((data) => data.password === data.confirmPassword, {
    message: "Password do not match",
    path: ["confirmPassword"], // Attach the error to the confirmPassword field
  });

export type ResetPasswordValues = z.infer<typeof resetPasswordSchema>;
