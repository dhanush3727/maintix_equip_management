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
import { LoginProps } from "../types/auth.type";
import { getRedirectPath } from "../utils/auth.utils";
import { LOGIN_CONTENT } from "../constatnts/login.constants";
import { getDeviceInfo } from "@/lib/utils";

export function LoginForm({ redirect }: LoginProps) {
  const router = useRouter();
  const [error, setError] = useState<string>("");
  const loginMutation = useLogin();

  const form = useForm<LoginFormValues>({
    // zodResolver integrates Zod schema validation with React Hook Form.
    resolver: zodResolver(loginSchema),
    defaultValues: {
      email: "",
      password: "",
      deviceInfo: getDeviceInfo(),
    },
  });

  const onSubmit = (values: LoginFormValues) => {
    setError("");

    loginMutation.mutate(values, {
      onSuccess: (data) => {
        toast.success(data.message);
        console.log(redirect);
        router.replace(getRedirectPath(redirect));
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
            <Mail size={18} aria-hidden="true" /> {LOGIN_CONTENT.EMAIL}
          </FieldLabel>

          <FieldContent>
            <Input
              type="email"
              id="email"
              autoComplete="email" // Helps the browser autofill the user's email.
              placeholder="Enter your email"
              {...form.register("email")}
              className="mb-1"
            />

            <FieldError errors={[form.formState.errors.email]} />
          </FieldContent>
        </Field>

        <Field className="mb-6">
          <FieldLabel className="gap-1 text-base" htmlFor="password">
            <Lock size={17} aria-hidden="true" />
            {LOGIN_CONTENT.PASSWORD}
          </FieldLabel>

          <FieldContent>
            <PasswordInput
              id="password"
              autoComplete="current-password" // Identifies the field as the user's current login password.
              placeholder="Enter your password"
              {...form.register("password")}
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
          {LOGIN_CONTENT.LOGIN}
        </Button>

        <div className="text-center text-xs flex gap-2 mb-3 justify-center text-primary sm:text-sm">
          <p className="text-muted-foreground">{LOGIN_CONTENT.NEW_ACCOUNT}</p>
          <Link href={ROUTES.REGISTER}>{LOGIN_CONTENT.REGISTER}</Link>
        </div>

        <div className="text-xs text-center text-muted-foreground sm:text-sm">
          <Link href={ROUTES.FORGOT_PASSWORD}>
            {LOGIN_CONTENT.FORGOT_PASSWORD}
          </Link>
        </div>
      </form>
    </div>
  );
}
