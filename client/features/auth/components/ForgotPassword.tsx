"use client";

import {
  Button,
  Field,
  FieldContent,
  FieldError,
  FieldLabel,
  Input,
  Tooltip,
  TooltipContent,
  TooltipTrigger,
} from "@/components/ui";
import { ArrowLeft, LoaderCircle, Mail, Send } from "lucide-react";
import { AUTH_CONTENT } from "../constatnts/auth.constants";
import { useRouter } from "next/navigation";
import { useState } from "react";
import { useForm } from "react-hook-form";
import {
  forgotPasswordSchema,
  ForgotPasswordValues,
} from "../schemas/forgot-password.schema";
import { zodResolver } from "@hookform/resolvers/zod";
import { useForgotPassword } from "../hooks/useForgotPassword";
import { getErrorMessage } from "@/lib/error-message";
import { ROUTES } from "@/constants";
import { ErrorMessage } from "@/components/common/ErrorMessage";

export function ForgotPassword() {
  const router = useRouter();
  const forgotPasswordMutation = useForgotPassword();
  const [error, setError] = useState<string>("");

  const form = useForm<ForgotPasswordValues>({
    resolver: zodResolver(forgotPasswordSchema),
    defaultValues: {
      email: "",
    },
  });

  const onSubmit = (values: ForgotPasswordValues) => {
    setError("");

    forgotPasswordMutation.mutate(values, {
      onSuccess: () => {
        // to get the email from check email page
        router.push(
          `${ROUTES.CHECK_EMAIL}?email=${encodeURIComponent(values.email)}`,
        );
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
        noValidate
        className="relative w-full max-w-xs mx-2 bg-background px-6 py-10 rounded-md shadow-xl sm:max-w-sm"
        onSubmit={form.handleSubmit(onSubmit)}
      >
        <Tooltip>
          <TooltipTrigger
            className={"absolute left-3"}
            render={
              <Button
                variant={"ghost"}
                size={"icon"}
                onClick={() => router.push(ROUTES.LOGIN)}
                disabled={forgotPasswordMutation.isPending}
              >
                <ArrowLeft />
              </Button>
            }
          />
          <TooltipContent>
            <p>{AUTH_CONTENT.BACK}</p>
          </TooltipContent>
        </Tooltip>

        <h1 className="text-primary font-bold text-2xl text-center mb-8 sm:text-3xl">
          {AUTH_CONTENT.FORGOT_PASSWORD}
        </h1>

        {error && <ErrorMessage error={error} />}

        <Field className="mb-6">
          <FieldLabel htmlFor="email" className="gap-1 text-base">
            <Mail size={18} aria-hidden="true" /> {AUTH_CONTENT.EMAIL}
          </FieldLabel>

          <FieldContent>
            <Input
              type="email"
              id="email"
              autoComplete="email"
              placeholder="Enter your email"
              className="h-12 mb-1"
              {...form.register("email")}
            />
          </FieldContent>

          <FieldError errors={[form.formState.errors.email]} />
        </Field>

        <Button
          type="submit"
          className={"w-full mb-3"}
          disabled={forgotPasswordMutation.isPending}
        >
          {forgotPasswordMutation.isPending ? (
            <LoaderCircle aria-hidden="true" className="size-4 animate-spin" />
          ) : (
            <Send aria-hidden="true" className="size-4" />
          )}
          {AUTH_CONTENT.SEND}
        </Button>
      </form>
    </div>
  );
}
