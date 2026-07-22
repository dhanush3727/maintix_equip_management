"use client";
import {
  LockKeyhole,
  ShieldCheck,
  KeyRound,
  CircleX,
  CircleCheck,
  LoaderCircle,
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
import { ErrorMessage } from "@/components/common/ErrorMessage";
import { appToast } from "@/lib/toast";

export type CheckType = {
  minLength: boolean;
  uppercase: boolean;
  number: boolean;
  symbol: boolean;
};

export type PasswordRequirement = {
  label: string;
  valid: boolean;
};

export function ResetPassword() {
  const resetPasswordMutation = useResetPassword();
  const searchParams = useSearchParams();
  const router = useRouter();

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

  const check: CheckType = {
    minLength: password.length >= PASSWORD_RULES.minLength,
    uppercase: PASSWORD_RULES.uppercase.test(password),
    number: PASSWORD_RULES.number.test(password),
    symbol: PASSWORD_RULES.symbol.test(password),
  };

  const passwordRequirements: PasswordRequirement[] = [
    {
      label: "Minimum 8 characters",
      valid: check.minLength,
    },
    {
      label: "Must contain uppercase",
      valid: check.uppercase,
    },
    {
      label: "Must contain number",
      valid: check.number,
    },
    {
      label: "Must contain symbol",
      valid: check.symbol,
    },
  ];

  const onSubmit = (values: ResetPasswordValues) => {
    const token = searchParams.get("token");

    console.log("token", token);

    if (!token) {
      appToast.error("Invalid or expired link. Try again");
      return;
    }

    // const payload: ResetPasswordRequest = {
    //   token,
    //   password: values.password,
    // };

    // resetPasswordMutation.mutate(payload, {
    //   onSuccess: (data) => {
    //     appToast.success(data.message);
    //     sessionStorage.removeItem("resend-link");
    //     form.reset();
    //     setTimeout(() => {
    //       router.replace(ROUTES.LOGIN);
    //     }, 1000);
    //   },

    //   onError: (err) => {
    //     appToast.error(getErrorMessage(err));
    //   },
    // });
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

        <div className="text-xs mb-3 text-muted-foreground grid gap-1 sm:grid-cols-2">
          {passwordRequirements.map((requirement) => (
            <p
              key={requirement.label}
              className={cn(
                "flex gap-1 items-center",
                requirement.valid && "text-success",
              )}
            >
              {requirement.valid ? (
                <CircleCheck aria-hidden="true" className="size-3" />
              ) : (
                <CircleX aria-hidden="true" className="size-3" />
              )}
              {requirement.label}
            </p>
          ))}
        </div>

        <Button
          type="submit"
          className={"w-full"}
          disabled={resetPasswordMutation.isPending}
        >
          {resetPasswordMutation.isPending ? (
            <LoaderCircle aria-hidden="true" className="size-4 animate-spin" />
          ) : (
            <KeyRound aria-hidden="true" className="size-4" />
          )}
          {RESET_PASSWORD_CONTENT.CHANGE_PASSWORD}
        </Button>
      </form>
    </div>
  );
}
