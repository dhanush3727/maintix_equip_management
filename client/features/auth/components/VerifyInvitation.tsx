"use client";

import { useRouter, useSearchParams } from "next/navigation";
import { useVerifyInvitation } from "../hooks/useVerifyInvitation";
import { VERIFY_INVITATION_CONTENT } from "../constatnts/verify-invite.constants";
import {
  Button,
  Field,
  FieldContent,
  FieldError,
  FieldLabel,
  Input,
  Skeleton,
} from "@/components/ui";
import {
  Building,
  Building2,
  CircleCheck,
  CircleX,
  LoaderCircle,
  Lock,
  Mail,
  ShieldCheck,
  User,
  UserRoundPlus,
} from "lucide-react";
import { EmptyState } from "./EmptyState";
import { useState } from "react";
import { useForm, useWatch } from "react-hook-form";
import {
  acceptInviteSchema,
  AcceptInviteValues,
} from "../schemas/accept-invite.schema";
import { zodResolver } from "@hookform/resolvers/zod";
import { useAcceptInvitation } from "../hooks/useAcceptInvitation";
import {
  AcceptInvitationRequest,
  CheckType,
  PasswordRequirement,
} from "../types/auth.type";
import { PASSWORD_RULES } from "../constatnts/auth.constants";
import { PasswordInput } from "./PasswordInput";
import { appToast, cn, getErrorMessage } from "@/lib";
import { ROUTES } from "@/constants";

export function VerifyInvitation() {
  const searchParam = useSearchParams();
  const token = searchParam.get("token") ?? "";
  const { data, isLoading } = useVerifyInvitation(token);
  const acceptInviteMutation = useAcceptInvitation();
  const router = useRouter();
  const [open, setOpen] = useState<boolean>(false);

  const organizationName = data?.data?.organizationName;
  const roleName = data?.data?.roleName;
  const departmentName = data?.data?.departmentName;
  const email = data?.data?.email;

  const form = useForm<AcceptInviteValues>({
    resolver: zodResolver(acceptInviteSchema),
    defaultValues: {
      name: "",
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
      label: "Password must be atleast 8 character",
      valid: check.minLength,
    },
    {
      label: "Password must contain one uppercase",
      valid: check.uppercase,
    },
    {
      label: "Password must contain one number",
      valid: check.number,
    },
    {
      label: "Password must contain one symbol",
      valid: check.symbol,
    },
  ];

  const onSubmit = (values: AcceptInviteValues) => {
    if (!token) {
      appToast.error("Invalid Link");
      return;
    }

    const payload: AcceptInvitationRequest = {
      token,
      ...values,
    };

    acceptInviteMutation.mutate(payload, {
      onSuccess: (data) => {
        appToast.success(data.message);
        router.replace(ROUTES.LOGIN);
        form.reset();
      },

      onError: (err) => {
        appToast.error(getErrorMessage(err));
      },
    });
  };

  return (
    <div className="mx-auto flex justify-center items-center min-h-screen w-full max-w-xs flex-col gap-8 py-5 px-2 sm:max-w-lg">
      {!token ? (
        <EmptyState
          title={VERIFY_INVITATION_CONTENT.MISSING_TOKEN_TITLE}
          description={VERIFY_INVITATION_CONTENT.MISSING_TOKEN_DESCRIPTION}
        />
      ) : (
        <>
          <div className="space-y-2 text-center">
            <h1 className="text-lg font-bold sm:text-2xl">
              {VERIFY_INVITATION_CONTENT.TITLE}
            </h1>

            <p className="text-xs text-muted-foreground sm:text-sm">
              {VERIFY_INVITATION_CONTENT.DESCRIPTION}
            </p>
          </div>

          <form
            noValidate
            className="w-full space-y-3"
            onSubmit={form.handleSubmit(onSubmit)}
          >
            <h2 className="text-lg text-center font-bold sm:text-xl">
              {VERIFY_INVITATION_CONTENT.ACCOUNT_TITLE}
            </h2>

            <p className="text-xs text-center text-muted-foreground">
              {VERIFY_INVITATION_CONTENT.ACCOUNT_DESCRIPTION}
            </p>

            <Field>
              <FieldLabel htmlFor="name" className="flex gap-1 items-center">
                <User aria-hidden="true" className="size-4" />
                {VERIFY_INVITATION_CONTENT.NAME_LABEL}
              </FieldLabel>

              <FieldContent>
                <Input
                  id="name"
                  type="text"
                  autoComplete="name"
                  placeholder="Your name"
                  {...form.register("name")}
                />
              </FieldContent>

              <FieldError errors={[form.formState.errors.name]} />
            </Field>

            <Field>
              <FieldLabel htmlFor="password" className="flex gap-1">
                <Lock aria-hidden="true" className="size-4" />
                {VERIFY_INVITATION_CONTENT.PASSWORD_LABEL}
              </FieldLabel>

              <FieldContent className="relative">
                <PasswordInput
                  id="password"
                  autoComplete="new-password"
                  placeholder="Your Password"
                  {...form.register("password")}
                  onFocus={() => setOpen(true)}
                  onBlur={() => setOpen(false)}
                  onMouseEnter={() => setOpen(true)}
                  onMouseLeave={() => setOpen(false)}
                />

                {open && (
                  <div className="absolute bg-card top-15 left-5 p-3 rounded-md z-100 text-xs text-danger grid gap-2 shadow-lg">
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
                )}
              </FieldContent>

              <FieldError errors={[form.formState.errors.password]} />
            </Field>

            <Button
              type="submit"
              className={"w-full"}
              disabled={acceptInviteMutation.isPending}
            >
              {acceptInviteMutation.isPending ? (
                <LoaderCircle
                  aria-hidden="true"
                  className="size-4 animate-spin"
                />
              ) : (
                <UserRoundPlus aria-hidden="true" className="size-4" />
              )}
              {VERIFY_INVITATION_CONTENT.JOIN_BUTTON}
            </Button>
          </form>

          <div className="text-center space-y-2 w-full">
            <h2 className="text-base font-semibold sm:text-xl">
              {VERIFY_INVITATION_CONTENT.INVITATION_DETAILS}
            </h2>

            <div className="grid gap-3 sm:grid-cols-2">
              <Field>
                <FieldLabel className="flex gap-1">
                  <Building2 aria-hidden="true" className="size-4" />
                  {VERIFY_INVITATION_CONTENT.ORGANIZATION_LABEL}
                </FieldLabel>

                <FieldContent>
                  {isLoading ? (
                    <Skeleton className="h-10" />
                  ) : (
                    <Input value={organizationName} disabled />
                  )}
                </FieldContent>
              </Field>

              <Field>
                <FieldLabel className="flex gap-1">
                  <ShieldCheck aria-hidden="true" className="size-4" />
                  {VERIFY_INVITATION_CONTENT.ROLE_LABEL}
                </FieldLabel>

                <FieldContent>
                  {isLoading ? (
                    <Skeleton className="h-10" />
                  ) : (
                    <Input value={roleName} disabled />
                  )}
                </FieldContent>
              </Field>

              <Field>
                <FieldLabel className="flex gap-1">
                  <Building aria-hidden="true" className="size-4" />
                  {VERIFY_INVITATION_CONTENT.DEPARTMENT_LABEL}
                </FieldLabel>

                <FieldContent>
                  {isLoading ? (
                    <Skeleton className="h-10" />
                  ) : (
                    <Input value={departmentName} disabled />
                  )}
                </FieldContent>
              </Field>

              <Field>
                <FieldLabel className="flex gap-1">
                  <Mail aria-hidden="true" className="size-4" />
                  {VERIFY_INVITATION_CONTENT.EMAIL_LABEL}
                </FieldLabel>

                <FieldContent>
                  {isLoading ? (
                    <Skeleton className="h-10" />
                  ) : (
                    <Input value={email} disabled />
                  )}
                </FieldContent>
              </Field>
            </div>
          </div>
        </>
      )}
    </div>
  );
}
