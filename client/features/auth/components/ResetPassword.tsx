"use client";
import {
  LockKeyhole,
  ShieldCheck,
  KeyRound,
  CircleX,
  CircleCheck,
} from "lucide-react";
import {
  AUTH_CONTENT,
  PASSWORD_RULES,
  RESET_PASSWORD_CONTENT,
} from "../constatnts/auth.constants";
import {
  Button,
  Field,
  FieldContent,
  FieldError,
  FieldLabel,
} from "@/components/ui";
import { PasswordInput } from "./PasswordInput";
import { useRouter, useSearchParams } from "next/navigation";
import { useState } from "react";
import { useForm, useWatch } from "react-hook-form";
import {
  resetPasswordSchema,
  ResetPasswordValues,
} from "../schemas/reset-password.schema";
import { zodResolver } from "@hookform/resolvers/zod";
import { useResetPassword } from "../hooks/useResetPassword";
import { toast } from "sonner";
import { ROUTES } from "@/constants";
import { getErrorMessage } from "@/lib/error-message";
import { cn } from "@/lib/utils";
import { ResetPasswordRequest } from "../types/auth.type";

export function ResetPassword() {
  const resetPasswordMutation = useResetPassword();
  const searchParams = useSearchParams();
  const router = useRouter();
  const [error, setError] = useState<string>("");

  const form = useForm<ResetPasswordValues>({
    resolver: zodResolver(resetPasswordSchema),
    defaultValues: {
      password: "",
    },
  });

  const password = useWatch({
    control: form.control,
    name: "password",
  });

  const check = {
    minLength: password.length >= PASSWORD_RULES.minLength,
    uppercase: PASSWORD_RULES.uppercase.test(password),
    number: PASSWORD_RULES.number.test(password),
    symbol: PASSWORD_RULES.symbol.test(password),
  };

  const onSubmit = (values: ResetPasswordValues) => {
    setError("");

    const token = searchParams.get("token");

    if (!token) {
      setError("Something wrong try again");
      return;
    }

    const payload: ResetPasswordRequest = {
      token,
      password: values.password,
    };

    resetPasswordMutation.mutate(payload, {
      onSuccess: (data) => {
        toast.success(data.message);
        sessionStorage.removeItem("reset-link");
        form.reset();
        setTimeout(() => {
          router.push(ROUTES.LOGIN);
        }, 1000);
      },

      onError: (err) => {
        setError(getErrorMessage(err));
      },
    });
  };

  return (
    <div className="flex min-h-screen justify-center items-center">
      <form
        noValidate
        className="w-full max-w-xs mx-2 bg-background px-6 py-10 rounded-md shadow-xl sm:max-w-sm"
        onSubmit={form.handleSubmit(onSubmit)}
      >
        <h1 className="text-primary font-bold text-2xl text-center mb-6 sm:text-3xl">
          {AUTH_CONTENT.RESET_PASSWORD}
        </h1>

        {error && (
          <div
            role="alert" // Announces login/register errors to screen readers immediately.
            className="border-2 border-danger text-danger text-center text-lg mb-3 py-3"
          >
            {error}
          </div>
        )}

        <Field className="mb-4">
          <FieldLabel htmlFor="new-password" className="gap-1 text-base">
            <LockKeyhole size={18} aria-hidden="true" />
            {RESET_PASSWORD_CONTENT.NEW_PASSWORD}
          </FieldLabel>

          <FieldContent>
            <PasswordInput
              id="new-password"
              autoComplete="new-password"
              placeholder="Enter new password"
              className="h-12"
              {...form.register("password")}
            />
          </FieldContent>

          <FieldError errors={[form.formState.errors.password]} />
        </Field>

        <Field className="mb-2">
          <FieldLabel htmlFor="confirm-password" className="gap-1 text-base">
            <ShieldCheck size={18} aria-hidden="true" />
            {RESET_PASSWORD_CONTENT.CONFIRM_PASSWORD}
          </FieldLabel>

          <FieldContent>
            <PasswordInput
              id="confirm-password"
              autoComplete="new-password"
              placeholder="Enter confirm password"
              className="h-12"
              {...form.register("confirmPassword")}
            />
          </FieldContent>

          <FieldError errors={[form.formState.errors.confirmPassword]} />
        </Field>

        <div className="text-xs mb-3 text-danger grid gap-1">
          <p
            className={cn(
              "flex gap-1 items-center",
              check.minLength && "text-success",
            )}
          >
            {check.minLength ? (
              <CircleCheck className="size-3" />
            ) : (
              <CircleX className="size-3" />
            )}
            Minimum 8 characters
          </p>

          <p
            className={cn(
              "flex gap-1 items-center",
              check.uppercase && "text-success",
            )}
          >
            {check.uppercase ? (
              <CircleCheck className="size-3" />
            ) : (
              <CircleX className="size-3" />
            )}
            Contain one uppercase
          </p>

          <p
            className={cn(
              "flex gap-1 items-center",
              check.number && "text-success",
            )}
          >
            {check.number ? (
              <CircleCheck className="size-3" />
            ) : (
              <CircleX className="size-3" />
            )}
            Contain numbers
          </p>

          <p
            className={cn(
              "flex gap-1 items-center",
              check.symbol && "text-success",
            )}
          >
            {check.symbol ? (
              <CircleCheck className="size-3" />
            ) : (
              <CircleX className="size-3" />
            )}
            Contain one special character
          </p>
        </div>

        <Button type="submit" className={"w-full"}>
          <KeyRound aria-hidden="true" />
          {RESET_PASSWORD_CONTENT.CHANGE_PASSWORD}
        </Button>
      </form>
    </div>
  );
}
