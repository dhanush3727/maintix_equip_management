"use client";

import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { LoginFormValues, loginSchema } from "../schemas/login.schema";
import { useLogin } from "../hooks/useLogin";
import {
  Button,
  Field,
  FieldContent,
  FieldError,
  FieldLabel,
  Input,
} from "@/components/ui";
import { PasswordInput } from "./PasswordInput";

export function LoginForm() {
  const form = useForm<LoginFormValues>({
    resolver: zodResolver(loginSchema),
    defaultValues: {
      email: "",
      password: "",
    },
  });

  const loginMutation = useLogin();

  const onSubmit = (values: LoginFormValues) => {
    loginMutation.mutate(values, {
      onSuccess: (data) => {
        console.log(data);
      },

      onError: (err) => {
        console.log(err);
      },
    });
  };

  return (
    <div>
      <form onSubmit={form.handleSubmit(onSubmit)}>
        <Field>
          <FieldLabel htmlFor="email">Email</FieldLabel>

          <FieldContent>
            <Input
              type="email"
              id="email"
              placeholder="Enter your email"
              {...form.register("email")}
            />

            <FieldError errors={[form.formState.errors.email]} />
          </FieldContent>
        </Field>

        <Field>
          <FieldLabel htmlFor="password">password</FieldLabel>

          <FieldContent>
            <PasswordInput
              id="password"
              placeholder="Enter your password"
              {...form.register("password")}
            />

            <FieldError errors={[form.formState.errors.password]} />
          </FieldContent>
        </Field>

        <Button type="submit" disabled={loginMutation.isPending}>
          Login
        </Button>
      </form>
    </div>
  );
}
