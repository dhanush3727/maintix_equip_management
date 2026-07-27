"use client";

import { useMeta, useOnboarding } from "@/hooks";
import { useSetupDepartment } from "../hooks/useSetupDepartment";
import { useRouter } from "next/navigation";
import { ApiErrorResponse, OnboardingSetup } from "@/types";
import { Controller, useForm } from "react-hook-form";
import {
  departmentSchema,
  DepartmentValues,
} from "../schemas/department.schema";
import { zodResolver } from "@hookform/resolvers/zod";
import { appToast, getErrorMessage } from "@/lib";
import { ROUTES } from "@/constants";
import axios from "axios";
import { setupRoutes } from "@/features/auth/constatnts/setup.constants";
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
import { DEPARTMENT_CONTENT } from "../constants/department.constant";
import { ArrowRight, Building2, Cog, Hash, LoaderCircle } from "lucide-react";

export function Department() {
  const { data: metaData, isLoading: isMetaLoading } = useMeta();
  const { data: onboardingStep } = useOnboarding();
  const departmentMutation = useSetupDepartment();

  const router = useRouter();

  const departmentType = metaData?.data?.departmentType ?? [];
  const onboarding = onboardingStep?.data?.onboardingStep;
  const isDisabled = onboarding !== OnboardingSetup.DEPARTMENT;

  const form = useForm<DepartmentValues>({
    resolver: zodResolver(departmentSchema),
    defaultValues: {
      name: "",
      type: undefined,
      code: "",
    },
  });

  const onSubmit = (data: DepartmentValues) => {
    console.log(data);
    departmentMutation.mutate(data, {
      onSuccess: (data) => {
        appToast.success(data.message);
        router.replace(ROUTES.SETUP_INVITE_USER);
        form.reset();
      },

      onError: (err) => {
        if (axios.isAxiosError(err)) {
          const data = err.response?.data as ApiErrorResponse;

          if (data.code === "ONBOARDING_MISMATCH" && onboarding) {
            appToast.error(getErrorMessage(err));
            router.replace(setupRoutes[onboarding]);
            return;
          }

          appToast.error(getErrorMessage(err));
        }
      },
    });
  };

  const onContinue = () => {
    if (onboarding) {
      router.replace(setupRoutes[onboarding]);
    }
  };

  return (
    <div className="flex justify-center items-center">
      {isDisabled ? (
        <div className="w-full max-w-md mx-2 px-6 py-10 space-y-6 sm:max-w-2xl md:max-w-3xl">
          <div className="space-y-1">
            <h1 className="text-xl font-semibold md:text-2xl">
              {DEPARTMENT_CONTENT.SUCCESS_TITLE}
            </h1>

            <p className="text-muted-foreground text-xs md:text-sm">
              {DEPARTMENT_CONTENT.SUCCESS_DESCRIPTION}
            </p>
          </div>

          <div className="flex justify-end">
            <Button type="button" variant={"ghost"} onClick={onContinue}>
              {DEPARTMENT_CONTENT.CONTINUE_BUTTON}
              <ArrowRight aria-hidden="true" className="size-4" />
            </Button>
          </div>
        </div>
      ) : (
        <form
          noValidate
          className="w-full max-w-md mx-2 bg-background px-6 py-10 space-y-6 sm:max-w-2xl md:max-w-3xl"
          onSubmit={form.handleSubmit(onSubmit)}
        >
          <div className="space-y-1">
            <h1 className="text-xl font-semibold md:text-2xl">
              {DEPARTMENT_CONTENT.TITLE}
            </h1>

            <p className="text-muted-foreground text-xs md:text-sm">
              {DEPARTMENT_CONTENT.DESCRIPTION}
            </p>
          </div>

          <Field>
            <FieldLabel htmlFor="name" className="flex items-center gap-2">
              <Building2 aria-hidden="true" className="size-4" />
              {DEPARTMENT_CONTENT.NAME}
            </FieldLabel>

            <FieldContent>
              <Input
                type="text"
                id="name"
                placeholder="Department name"
                autoComplete="off"
                {...form.register("name")}
                disabled={isDisabled}
              />
            </FieldContent>

            <FieldError errors={[form.formState.errors.name]} />
          </Field>

          <Field>
            <FieldLabel
              htmlFor="department_type"
              className="flex items-center gap-2"
            >
              <Cog aria-hidden="true" className="size-4" />
              {DEPARTMENT_CONTENT.TYPE}
            </FieldLabel>

            <FieldContent>
              {isMetaLoading ? (
                <Skeleton className="h-10" />
              ) : (
                <Controller
                  control={form.control}
                  name="type"
                  render={({ field }) => (
                    <SearchSelect
                      options={departmentType}
                      value={field.value}
                      onValueChange={field.onChange}
                      placeholder="Department type"
                      searchPlaceholder="Search deparment type"
                      disabled={isDisabled}
                    />
                  )}
                />
              )}
            </FieldContent>

            <FieldError errors={[form.formState.errors.type]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="code" className="flex items-center gap-2">
              <Hash aria-hidden="true" className="size-4" />
              {DEPARTMENT_CONTENT.CODE}
            </FieldLabel>

            <FieldContent>
              <Input
                type="text"
                id="code"
                placeholder="Department code"
                autoComplete="off"
                {...form.register("code")}
                disabled={isDisabled}
              />
            </FieldContent>

            <FieldError errors={[form.formState.errors.code]} />
          </Field>

          <Button
            type="submit"
            className={"w-full"}
            disabled={departmentMutation.isPending}
          >
            {departmentMutation.isPending && (
              <LoaderCircle
                aria-hidden="true"
                className="size-4 animate-spin"
              />
            )}
            {DEPARTMENT_CONTENT.CREATE_BUTTON}
            <ArrowRight aria-hidden="true" className="size-4" />
          </Button>
        </form>
      )}
    </div>
  );
}
