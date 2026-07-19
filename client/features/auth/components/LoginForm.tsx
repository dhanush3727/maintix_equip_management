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
import { LoaderCircle, Lock, Mail } from "lucide-react";
import Link from "next/link";
import { useState } from "react";
import { getErrorMessage } from "@/lib/error-message";
import { useRouter } from "next/navigation";
import { toast } from "sonner";
import { ROUTES } from "@/constants";
import { APP_NAME } from "../constatnts/auth.constants";

export function LoginForm() {
  const router = useRouter();
  const [error, setError] = useState<string>("");

  const form = useForm<LoginFormValues>({
    resolver: zodResolver(loginSchema),
    defaultValues: {
      email: "",
      password: "",
    },
  });

  const loginMutation = useLogin();

  const onSubmit = (values: LoginFormValues) => {
    setError("");

    loginMutation.mutate(values, {
      onSuccess: (data) => {
        toast.success(data.message);
        router.push(ROUTES.DASHBOARD);
        form.reset();
      },

      onError: (err) => {
        setError(getErrorMessage(err));
      },
    });
  };

  return (
    <div className="flex min-h-screen justify-center items-center">
      <form
        noValidate // Disables native browser validation in favor of React Hook Form + Zod.
        onSubmit={form.handleSubmit(onSubmit)}
        className="w-full max-w-xs mx-2 bg-background px-6 py-10 rounded-md shadow-md sm:max-w-sm"
      >
        <h1 className="text-primary font-bold text-2xl text-center mb-8 sm:text-4xl">
          {APP_NAME}
        </h1>

        {error && (
          <div
            role="alert" // Announces login/register errors to screen readers immediately.
            className="border-2 border-danger text-danger text-center text-lg mb-6 py-3"
          >
            {error}
          </div>
        )}

        <Field className="mb-8">
          <FieldLabel className="gap-1 text-base" htmlFor="email">
            {/* aria-hidden = "true" hides decorative icons from screen readers. */}
            <Mail size={18} aria-hidden="true" /> Email
          </FieldLabel>

          <FieldContent>
            <Input
              type="email"
              id="email"
              autoComplete="email" // Helps the browser autofill the user's email.
              placeholder="Enter your email"
              {...form.register("email")}
              onChange={() => setError("")}
              className="mb-1"
            />

            <FieldError errors={[form.formState.errors.email]} />
          </FieldContent>
        </Field>

        <Field className="mb-6">
          <FieldLabel className="gap-1 text-base" htmlFor="password">
            <Lock size={17} aria-hidden="true" />
            Password
          </FieldLabel>

          <FieldContent>
            <PasswordInput
              id="password"
              autoComplete="current-password" // Identifies the field as the user's current login password.
              placeholder="Enter your password"
              {...form.register("password")}
              onChange={() => setError("")}
              className="mb-1"
            />

            <FieldError errors={[form.formState.errors.password]} />
          </FieldContent>
        </Field>

        <Button
          type="submit"
          disabled={loginMutation.isPending}
          className={"w-full mb-3"}
        >
          {loginMutation.isPending && (
            <LoaderCircle className="size-4 animate-spin" />
          )}
          Login
        </Button>

        <p className="text-sm text-center">
          Don&apos;t have an account?{" "}
          <Link href={ROUTES.REGISTER} className="text-red-500">
            Register
          </Link>
        </p>
      </form>
    </div>
  );
}
