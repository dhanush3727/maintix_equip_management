import z from "zod";

export const acceptInviteSchema = z.object({
  name: z.string().min(1, "Enter your name").trim(),
  password: z
    .string()
    .regex(
      /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$/,
      "Enter valid password",
    ),
});

export type AcceptInviteValues = z.infer<typeof acceptInviteSchema>;
