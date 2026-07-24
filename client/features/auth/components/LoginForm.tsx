"use client";

import { useForm, useWatch } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { LoginFormValues, loginSchema } from "../schemas/login.schema";
import { useLogin } from "../hooks/useLogin";
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
  AlertDialogTrigger,
  Button,
  Field,
  FieldContent,
  FieldError,
  FieldLabel,
  Input,
} from "@/components/ui";
import { PasswordInput } from "./PasswordInput";
import { LoaderCircle, Lock, LogIn, Mail, MailX } from "lucide-react";
import Link from "next/link";
import { getErrorMessage } from "@/lib/error-message";
import { useRouter } from "next/navigation";
import { ROUTES } from "@/constants";
import { AUTH_CONTENT, LOGIN_CONTENT } from "../constatnts/auth.constants";
import { getRedirectPath } from "../utils/auth.utils";
import { getDeviceInfo } from "@/lib/utils";
import { appToast } from "@/lib/toast";
import { useState } from "react";
import axios from "axios";
import { ApiErrorResponse } from "@/types";
import { useSendEmail } from "../hooks/useSendEmail";

export type LoginProps = {
  redirect?: string | null;
};

export function LoginForm({ redirect }: LoginProps) {
  const router = useRouter();
  const loginMutation = useLogin();
  const sendEmail = useSendEmail();
  const [isEmailVerify, setIsEmailVerify] = useState<boolean>(false);

  const form = useForm<LoginFormValues>({
    // zodResolver integrates Zod schema validation with React Hook Form.
    resolver: zodResolver(loginSchema),
    defaultValues: {
      email: "",
      password: "",
      deviceInfo: getDeviceInfo(),
    },
  });

  const email = useWatch({
    control: form.control,
    name: "email",
  });

  const onSubmit = (values: LoginFormValues) => {
    loginMutation.mutate(values, {
      onSuccess: (data) => {
        appToast.success(data.message);
        router.replace(getRedirectPath(redirect));
        form.reset();
      },

      onError: (err) => {
        if (axios.isAxiosError(err)) {
          const data = err.response?.data as ApiErrorResponse;

          if (data.code === "EMAIL_NOT_VERIFIED") {
            setIsEmailVerify(true);
            return;
          }
        }

        appToast.error(getErrorMessage(err));
      },
    });
  };

  const verifyEmail = () => {
    sendEmail.mutate(
      { email },
      {
        onSuccess: (data) => {
          appToast.success(data.message);
          router.push(`${ROUTES.CHECK_VERIFY_EMAIL}?email=${email}`);
          form.reset();
        },
        onError: (err) => {
          appToast.error(getErrorMessage(err));
        },
      },
    );
  };

  return (
    <div className="flex min-h-screen justify-center items-center">
      <form
        noValidate // Disables native browser validation in favor of React Hook Form + Zod.
        onSubmit={form.handleSubmit(onSubmit)}
        className="w-full max-w-xs mx-2 bg-background px-6 py-10 rounded-md shadow-xl sm:max-w-sm"
      >
        <h1 className="text-primary font-bold text-2xl text-center mb-6 sm:text-3xl">
          {AUTH_CONTENT.LOGIN}
        </h1>

        <Field className="mb-8">
          <FieldLabel className="gap-1 text-base" htmlFor="email">
            {/* aria-hidden = "true" hides decorative icons from screen readers. */}
            <Mail size={18} aria-hidden="true" />
            {AUTH_CONTENT.EMAIL}
          </FieldLabel>

          <FieldContent>
            <Input
              type="email"
              id="email"
              autoComplete="email" // Helps the browser autofill the user's email.
              placeholder="Enter your email"
              {...form.register("email")}
              className="mb-1 h-12"
            />

            <FieldError errors={[form.formState.errors.email]} />
          </FieldContent>
        </Field>

        <Field className="mb-6">
          <FieldLabel className="gap-1 text-base" htmlFor="password">
            <Lock size={17} aria-hidden="true" />
            {AUTH_CONTENT.PASSWORD}
          </FieldLabel>

          <FieldContent>
            <PasswordInput
              id="password"
              autoComplete="current-password" // Identifies the field as the user's current login password.
              placeholder="Enter your password"
              {...form.register("password")}
              className="mb-1 h-12"
            />

            <FieldError errors={[form.formState.errors.password]} />
          </FieldContent>
        </Field>

        <Button
          type="submit"
          disabled={loginMutation.isPending}
          className={"w-full mb-3"}
        >
          {loginMutation.isPending ? (
            <LoaderCircle aria-hidden="true" className="size-4 animate-spin" />
          ) : (
            <LogIn aria-hidden="true" className="size-4" />
          )}
          {AUTH_CONTENT.LOGIN}
        </Button>

        <div className="text-center text-xs flex gap-2 mb-3 justify-center text-primary sm:text-sm">
          <p className="text-muted-foreground">{AUTH_CONTENT.NEW_ACCOUNT}</p>
          <Link href={ROUTES.REGISTER}>{AUTH_CONTENT.REGISTER}</Link>
        </div>

        <div className="text-xs text-center text-muted-foreground sm:text-sm">
          <Link href={ROUTES.FORGOT_PASSWORD}>
            {AUTH_CONTENT.FORGOT_PASSWORD}
          </Link>
        </div>
      </form>

      <AlertDialog open={isEmailVerify} onOpenChange={setIsEmailVerify}>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>{LOGIN_CONTENT.verify_title}</AlertDialogTitle>

            <AlertDialogDescription>
              {LOGIN_CONTENT.verify_description}
            </AlertDialogDescription>
          </AlertDialogHeader>

          <AlertDialogFooter className="border-none">
            <AlertDialogCancel disabled={sendEmail.isPending}>
              {LOGIN_CONTENT.verify_cancel}
            </AlertDialogCancel>

            <AlertDialogAction
              onClick={verifyEmail}
              disabled={sendEmail.isPending}
            >
              {sendEmail.isPending && (
                <LoaderCircle
                  aria-hidden="true"
                  className="size-4 animate-spin"
                />
              )}
              {LOGIN_CONTENT.verify_email}
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
    </div>
  );
}
