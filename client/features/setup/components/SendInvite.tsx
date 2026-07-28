"use client";
import { useOrganizationDD, useRoleDD } from "@/hooks";
import { useSetupInvite } from "../hooks/useSetupInvite";
import { useRouter } from "next/navigation";
import { Controller, useForm } from "react-hook-form";
import {
  sendInviteSchema,
  SendInviteValues,
} from "../schemas/send-invite.schema";
import { zodResolver } from "@hookform/resolvers/zod";
import { appToast, getErrorMessage } from "@/lib";
import { useCompleteSetup } from "../hooks/useCompleteSetup";
import { INVITE_USERS_CONTENT } from "../constants/send-invite.constant";
import {
  Button,
  Field,
  FieldContent,
  FieldError,
  FieldLabel,
  Input,
  SearchSelect,
  Skeleton,
} from "@/components/ui";
import {
  ArrowRight,
  Building2,
  Check,
  LoaderCircle,
  Mail,
  Send,
  ShieldCheck,
} from "lucide-react";
import { ROUTES } from "@/constants";
import { useGetInvitations } from "../hooks/useGetInvitations";

export function SendInvite() {
  const { data: roleDD, isLoading: isRoleDD } = useRoleDD();
  const { data: departmentDD, isLoading: isDepartmentDD } = useOrganizationDD();
  const { data: getInvitations, isLoading: isGetInvitations } =
    useGetInvitations();
  const inviteMutation = useSetupInvite();
  const completeSetupMutation = useCompleteSetup();

  const router = useRouter();

  const roles = roleDD?.data ?? [];
  const departments = departmentDD?.data?.department ?? [];
  const invitations = getInvitations?.data ?? [];

  const form = useForm<SendInviteValues>({
    resolver: zodResolver(sendInviteSchema),
    defaultValues: {
      email: "",
      roleId: 0,
      departmentId: 0,
    },
  });

  const onSubmit = (payload: SendInviteValues) => {
    inviteMutation.mutate(payload, {
      onSuccess: (data) => {
        appToast.success(data.message);
        form.reset();
      },

      onError: (err) => {
        appToast.error(getErrorMessage(err));
      },
    });
  };

  const onCompleteSetup = () => {
    completeSetupMutation.mutate(undefined, {
      onSuccess: (data) => {
        appToast.success(data.message);
        router.replace(ROUTES.DASHBOARD);
        form.reset();
      },

      onError: (err) => {
        appToast.error(getErrorMessage(err));
      },
    });
  };

  return (
    <div className="flex justify-center items-center">
      <form
        noValidate
        className="w-full max-w-md mx-2 bg-background px-6 py-10 space-y-6 sm:max-w-2xl md:max-w-3xl"
        onSubmit={form.handleSubmit(onSubmit)}
      >
        <div className="space-y-1">
          <h1 className="text-xl font-semibold md:text-2xl">
            {INVITE_USERS_CONTENT.TITLE}
          </h1>

          <p className="text-muted-foreground text-xs md:text-sm">
            {INVITE_USERS_CONTENT.DESCRIPTION}
          </p>
        </div>

        <Field>
          <FieldLabel htmlFor="email" className="flex items-center gap-2">
            <Mail aria-hidden="true" className="size-4" />
            {INVITE_USERS_CONTENT.EMAIL}
          </FieldLabel>

          <FieldContent>
            <Input
              type="email"
              id="email"
              placeholder="Ex: user@maintix.com"
              autoComplete="email"
              {...form.register("email")}
            />
          </FieldContent>

          <FieldError errors={[form.formState.errors.email]} />
        </Field>

        <Field>
          <FieldLabel htmlFor="role" className="flex items-center gap-2">
            <ShieldCheck aria-hidden="true" className="size-4" />
            {INVITE_USERS_CONTENT.ROLE}
          </FieldLabel>

          <FieldContent>
            {isRoleDD ? (
              <Skeleton className="h-10" />
            ) : (
              <Controller
                control={form.control}
                name="roleId"
                render={({ field }) => (
                  <SearchSelect
                    options={roles}
                    value={field.value}
                    onValueChange={field.onChange}
                    placeholder="Ex: ADMIN"
                    searchPlaceholder="Search role"
                  />
                )}
              />
            )}
          </FieldContent>

          <FieldError errors={[form.formState.errors.roleId]} />
        </Field>

        <Field>
          <FieldLabel htmlFor="department" className="flex items-center gap-2">
            <Building2 aria-hidden="true" className="size-4" />
            {INVITE_USERS_CONTENT.DEPARTMENT}
          </FieldLabel>

          <FieldContent>
            {isDepartmentDD ? (
              <Skeleton className="h-10" />
            ) : (
              <Controller
                control={form.control}
                name="departmentId"
                render={({ field }) => (
                  <SearchSelect
                    options={departments}
                    value={field.value}
                    onValueChange={field.onChange}
                    placeholder="Ex: Administrative"
                    searchPlaceholder="Search department"
                  />
                )}
              />
            )}
          </FieldContent>

          <FieldError errors={[form.formState.errors.departmentId]} />
        </Field>

        <Button
          type="submit"
          className={"w-full"}
          disabled={inviteMutation.isPending || completeSetupMutation.isPending}
        >
          {inviteMutation.isPending ? (
            <LoaderCircle aria-hidden="true" className="size-4 animate-spin" />
          ) : (
            <Send aria-hidden="true" className="size-4" />
          )}
          {INVITE_USERS_CONTENT.INVITE_BUTTON}
        </Button>

        <div className="p-2 border border-border rounded-md space-y-3 sm:p-5">
          <h3 className="font-bold">Invited Users</h3>

          <div className="grid gap-3 sm:grid-cols-2 md:grid-cols-3">
            {isGetInvitations ? (
              Array.from({ length: 3 }).map((_, i) => (
                <div key={i} className="flex items-center gap-3">
                  <div>
                    <Skeleton className="rounded-full size-6" />
                  </div>

                  <div className="space-y-1">
                    <Skeleton className="h-4 w-40" />
                    <Skeleton className="h-4 w-25" />
                  </div>
                </div>
              ))
            ) : invitations.length === 0 ? (
              <div className="col-span-full flex items-center justify-center">
                <p className="text-muted-foreground text-sm">
                  {INVITE_USERS_CONTENT.NO_INVITATIONS}
                </p>
              </div>
            ) : (
              invitations.map((invitation) => (
                <div key={invitation.email} className="flex items-center gap-3">
                  <div className="w-6 h-6 bg-success-light flex items-center justify-center rounded-full">
                    <Check aria-hidden="true" className="size-3 text-success" />
                  </div>
                  <div>
                    <p className="text-sm">{invitation.email}</p>
                    <p className="text-muted-foreground text-xs">
                      {invitation.role}
                    </p>
                  </div>
                </div>
              ))
            )}
          </div>
        </div>

        <div className="flex justify-end">
          <Button
            variant={"ghost"}
            size={"sm"}
            onClick={onCompleteSetup}
            disabled={
              inviteMutation.isPending || completeSetupMutation.isPending
            }
          >
            {invitations.length === 0
              ? INVITE_USERS_CONTENT.SKIP_BUTTON
              : INVITE_USERS_CONTENT.CONTINUE_BUTTON}
            {completeSetupMutation.isPending ? (
              <LoaderCircle
                aria-hidden="true"
                className="size-4 animate-spin"
              />
            ) : (
              <ArrowRight aria-hidden="true" className="size-4" />
            )}
          </Button>
        </div>
      </form>
    </div>
  );
}
