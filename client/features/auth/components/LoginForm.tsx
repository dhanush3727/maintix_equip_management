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
import { Lock, Mail } from "lucide-react";
import Link from "next/link";
import { useState } from "react";
import { getErrorMessage } from "@/lib/error-message";
import { useRouter } from "next/navigation";

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
    loginMutation.mutate(values, {
      onSuccess: () => {
        router.push("/dashboard");
      },

      onError: (err) => {
        setError(getErrorMessage(err));
      },
    });
  };

  return (
    <div className="flex min-h-screen justify-center items-center">
      <form
        onSubmit={form.handleSubmit(onSubmit)}
        className="w-full max-w-xs mx-2 bg-background px-6 py-10 rounded-md shadow-md sm:max-w-sm"
      >
        <h1 className="text-primary font-bold text-2xl text-center mb-8 sm:text-4xl">
          MAINTIX
        </h1>

        {error && (
          <div className="border-2 border-danger text-danger text-center text-lg mb-6 py-3">
            {error}
          </div>
        )}

        <Field className="mb-8">
          <FieldLabel className="gap-1 text-base" htmlFor="email">
            <Mail size={18} /> Email
          </FieldLabel>

          <FieldContent>
            <Input
              id="email"
              placeholder="Enter your email"
              {...form.register("email")}
            />

            <FieldError errors={[form.formState.errors.email]} />
          </FieldContent>
        </Field>

        <Field className="mb-6">
          <FieldLabel className="gap-1 text-base" htmlFor="password">
            <Lock size={17} />
            Password
          </FieldLabel>

          <FieldContent>
            <PasswordInput
              id="password"
              placeholder="Enter your password"
              {...form.register("password")}
            />

            <FieldError errors={[form.formState.errors.password]} />
          </FieldContent>
        </Field>

        <Button
          type="submit"
          disabled={loginMutation.isPending}
          className={"w-full mb-3"}
        >
          Login
        </Button>

        <p className="text-sm text-center">
          Create new organization{" "}
          <Link href={"/register"} className="text-primary">
            Register
          </Link>
        </p>
      </form>
    </div>
  );
}
