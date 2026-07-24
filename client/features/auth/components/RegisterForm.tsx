"use client";

import {
  Button,
  Field,
  FieldContent,
  FieldError,
  FieldLabel,
  Input,
} from "@/components/ui";
import { AUTH_CONTENT, REGISTER_CONTENT } from "../constatnts/auth.constants";
import { PasswordInput } from "./PasswordInput";
import Link from "next/link";
import { ROUTES } from "@/constants";
import { useRouter } from "next/navigation";
import { useRegister } from "../hooks/useRegister";
import { useForm } from "react-hook-form";
import { RegiserFormValues, registerSchema } from "../schemas/register.schema";
import { zodResolver } from "@hookform/resolvers/zod";
import { appToast } from "@/lib/toast";
import { getErrorMessage } from "@/lib/error-message";
import { cn, getDeviceInfo } from "@/lib/utils";
import {
  Building2,
  LoaderCircle,
  LockKeyhole,
  Mail,
  User,
  UserPlus,
} from "lucide-react";

export function RegisterForm() {
  const router = useRouter();
  const registerMutation = useRegister();

  const form = useForm<RegiserFormValues>({
    resolver: zodResolver(registerSchema),
    defaultValues: {
      name: "",
      companyName: "",
      email: "",
      password: "",
      deviceInfo: getDeviceInfo(),
    },
  });

  const onSubmit = (values: RegiserFormValues) => {
    registerMutation.mutate(values, {
      onSuccess: (data) => {
        if (data.data?.verificationEmailSent) {
          appToast.success("Registration successful. Check your email.");
        } else {
          appToast.warning(
            "Registration successful, but we couldn't send the verification email. Click 'Resend Verification Email'.",
          );
        }

        // encodeURIComponent() is a built-in JavaScript function that converts special characters into a URL-safe format.
        // when email have some characters like +, &, ?, and etc. It can cause parsing issues or be interpreted differently depending on the context.
        // So we use this built-in function
        router.push(
          `${ROUTES.CHECK_VERIFY_EMAIL}?email=${encodeURIComponent(values.email)}`,
        );
        form.reset();
      },

      onError: (err) => {
        appToast.error(getErrorMessage(err));
      },
    });
  };

  return (
    <div className="flex min-h-screen justify-center items-center">
      <form
        noValidate
        className="w-full max-w-xs mx-2 bg-background px-6 py-8 rounded-md shadow-xl sm:max-w-sm"
        onSubmit={form.handleSubmit(onSubmit)}
      >
        <h1 className="text-primary font-bold text-2xl text-center mb-3 sm:text-3xl">
          {AUTH_CONTENT.REGISTER}
        </h1>

        <Field className="mb-3">
          <FieldLabel htmlFor="name" className="gap-1 text-base">
            <User size={18} aria-hidden="true" />
            {REGISTER_CONTENT.NAME}
          </FieldLabel>

          <FieldContent>
            <Input
              type="text"
              id="name"
              autoComplete="name"
              placeholder="Enter your name"
              className="h-12"
              {...form.register("name")}
            />
          </FieldContent>

          <FieldError errors={[form.formState.errors.name]} />
        </Field>

        <Field className="mb-3">
          <FieldLabel htmlFor="organization" className="gap-1 text-base">
            <Building2 size={18} aria-hidden="true" />
            {REGISTER_CONTENT.ORGANIZATION}
          </FieldLabel>

          <FieldContent>
            <Input
              type="text"
              id="organization"
              autoComplete="organization"
              placeholder="Enter your organization name"
              className="h-12"
              {...form.register("companyName")}
            />
          </FieldContent>

          <FieldError errors={[form.formState.errors.companyName]} />
        </Field>

        <Field className="mb-3">
          <FieldLabel htmlFor="email" className="gap-1 text-base">
            <Mail size={18} aria-hidden="true" />
            {AUTH_CONTENT.EMAIL}
          </FieldLabel>

          <FieldContent>
            <Input
              type="email"
              id="email"
              autoComplete="email"
              placeholder="Enter your email"
              className="h-12"
              {...form.register("email")}
            />
          </FieldContent>

          <FieldError errors={[form.formState.errors.email]} />
        </Field>

        <Field className="mb-5">
          <FieldLabel htmlFor="password" className="gap-1 text-base">
            <LockKeyhole size={18} aria-hidden="true" />
            {AUTH_CONTENT.PASSWORD}
          </FieldLabel>

          <FieldContent>
            <PasswordInput
              id="password"
              autoComplete="new-password"
              placeholder="Enter your password"
              className="h-12"
              {...form.register("password")}
            />

            <FieldError errors={[form.formState.errors.password]} />
          </FieldContent>
        </Field>

        <Button
          type="submit"
          className={"w-full mb-3"}
          disabled={registerMutation.isPending}
        >
          {registerMutation.isPending ? (
            <LoaderCircle aria-hidden="true" className="size-4 animate-spin" />
          ) : (
            <UserPlus aria-hidden="true" className="size-4" />
          )}
          {AUTH_CONTENT.REGISTER}
        </Button>

        <div className="text-center text-xs flex gap-2 mb-3 justify-center text-primary sm:text-sm">
          <p className="text-muted-foreground">
            {REGISTER_CONTENT.EXISTING_ACCOUNT}
          </p>
          <Link
            href={ROUTES.LOGIN}
            className={cn(registerMutation.isPending && "pointer-events-none")}
          >
            {AUTH_CONTENT.LOGIN}
          </Link>
        </div>
      </form>
    </div>
  );
}
