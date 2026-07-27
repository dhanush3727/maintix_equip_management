"use client";

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
import { ORGANIZATION_CONTENT } from "../constants/organization.constant";
import {
  ArrowRight,
  Building2,
  Factory,
  Globe,
  LoaderCircle,
  MapPin,
  UploadCloud,
  Users,
} from "lucide-react";
import { useAuth, useGetOrg, useMeta, useOnboarding } from "@/hooks";
import { Controller, useForm, useWatch } from "react-hook-form";
import {
  OrganizationFormValues,
  organizationSchema,
} from "../schemas/organization.schema";
import { zodResolver } from "@hookform/resolvers/zod";
import { useEffect, useMemo } from "react";
import Image from "next/image";
import { useSetupOrg } from "../hooks/useSetupOrg";
import { appToast } from "@/lib/toast";
import { useRouter } from "next/navigation";
import { ROUTES } from "@/constants";
import { getErrorMessage } from "@/lib";
import axios from "axios";
import { ApiErrorResponse, OnboardingSetup } from "@/types";
import { setupRoutes } from "@/features/auth/constatnts/setup.constants";

export function Organization() {
  const { user, isLoading: isUserLoading } = useAuth();
  const { data, isLoading: isMetaLoading } = useMeta();
  const { data: onboardingStep } = useOnboarding();
  const { data: organization, isLoading: isOrgLoading } = useGetOrg();
  const organizationMutation = useSetupOrg();

  const router = useRouter();

  const industryType = data?.data?.industryType ?? [];
  const companySize = data?.data?.companySize ?? [];
  const onboarding = onboardingStep?.data?.onboardingStep;
  const organizationData = organization?.data;
  const isDisabled = onboarding !== OnboardingSetup.ORGANIZATION;

  const form = useForm<OrganizationFormValues>({
    resolver: zodResolver(organizationSchema),
    defaultValues: {
      industryType: undefined,
      companySize: undefined,
      country: "",
      city: "",
      logo: undefined,
    },
  });

  useEffect(() => {
    if (!organizationData) return;

    form.reset({
      industryType: organizationData.industryType,
      companySize: organizationData.companySize,
      country: organizationData.country,
      city: organizationData.city,
    });
  }, [organizationData, form]);

  const logo = useWatch({
    control: form.control,
    name: "logo",
  });

  const preview = useMemo(() => {
    if (!logo) return;

    return URL.createObjectURL(logo);
  }, [logo]);

  const onSubmit = (data: OrganizationFormValues) => {
    organizationMutation.mutate(data, {
      onSuccess: (data) => {
        appToast.success(data.message);
        router.replace(ROUTES.SETUP_LOCATION);
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
      <form
        noValidate
        className="w-full max-w-md mx-2 bg-background px-6 py-10 space-y-6 sm:max-w-2xl md:max-w-3xl"
        onSubmit={form.handleSubmit(onSubmit)}
      >
        <div className="space-y-1">
          <h1 className="text-xl font-semibold md:text-2xl">
            {ORGANIZATION_CONTENT.title}
          </h1>

          <p className="text-muted-foreground text-xs md:text-sm">
            {ORGANIZATION_CONTENT.description}
          </p>
        </div>

        <Field>
          <FieldLabel className="flex items-center gap-2">
            <Building2 aria-hidden="true" className="size-4" />
            {ORGANIZATION_CONTENT.organization_name}
          </FieldLabel>

          <FieldContent>
            {isUserLoading ? (
              <Skeleton className="h-10" />
            ) : (
              <Input id="name" value={user?.organizationName ?? ""} disabled />
            )}
          </FieldContent>
        </Field>

        <Field>
          <FieldLabel htmlFor="logo" className="flex items-center gap-2">
            <UploadCloud aria-hidden="true" className="size-4" />
            {ORGANIZATION_CONTENT.organization_logo}
          </FieldLabel>

          <FieldContent>
            {isOrgLoading ? (
              <div className="flex items-center gap-4">
                <Skeleton className="size-16 rounded-lg" />

                <div className="space-y-2">
                  <Skeleton className="h-4 w-32 rounded-md" />
                </div>
              </div>
            ) : organizationData?.logoUrl ? (
              <div className="flex items-center gap-4 mb-5">
                <Image
                  src={organizationData.logoUrl}
                  alt="Organization Logo"
                  width={100}
                  height={100}
                  className="size-16 rounded-lg border object-cover"
                />
                <p>{ORGANIZATION_CONTENT.uploaded_logo}</p>
              </div>
            ) : !logo ? (
              <>
                <label
                  htmlFor="logo"
                  className="flex flex-col items-center justify-center gap-3 cursor-pointer rounded-xl border-2 border-dashed border-border px-6 py-10 text-center hover:border-primary hover:bg-muted/50 transition-colors duration-200"
                >
                  <UploadCloud
                    aria-hidden="true"
                    className="size-10 text-muted-foreground"
                  />

                  <div>
                    <p className="font-medium">
                      {ORGANIZATION_CONTENT.logo_title}
                    </p>
                    <p className="text-sm text-muted-foreground">
                      {ORGANIZATION_CONTENT.logo_description}
                    </p>
                  </div>

                  <div className="bg-secondary h-10 px-4 rounded-md flex justify-center items-center text-secondary-foreground border border-border hover:bg-muted">
                    {ORGANIZATION_CONTENT.logo_file}
                  </div>
                </label>

                <Controller
                  control={form.control}
                  name="logo"
                  render={({ field }) => (
                    <Input
                      id="logo"
                      type="file"
                      accept="image/*"
                      className="hidden"
                      onChange={(e) => {
                        const file = e.target.files?.[0];

                        field.onChange(file);
                      }}
                    />
                  )}
                />
              </>
            ) : (
              <div className="rounded-xl border p-5">
                <div className="flex items-center gap-4 mb-5">
                  <Image
                    src={preview!}
                    alt="Organization Logo"
                    width={100}
                    height={100}
                    className="size-16 rounded-lg border object-cover"
                  />
                  <div>
                    <p>{logo.name}</p>
                  </div>
                </div>

                <Button
                  variant={"destructive"}
                  size={"sm"}
                  type="button"
                  onClick={() => {
                    form.resetField("logo");
                  }}
                  disabled={organizationMutation.isPending}
                >
                  {ORGANIZATION_CONTENT.remove}
                </Button>
              </div>
            )}
          </FieldContent>

          <FieldError errors={[form.formState.errors.logo]} />
        </Field>

        <div className="grid gap-5 sm:grid-cols-2">
          <Field>
            <FieldLabel
              htmlFor="industry_type"
              className="flex items-center gap-2"
            >
              <Factory aria-hidden="true" className="size-4" />
              {ORGANIZATION_CONTENT.industry_type}
            </FieldLabel>

            <FieldContent>
              {isMetaLoading ? (
                <Skeleton className="h-10" />
              ) : (
                <Controller
                  control={form.control}
                  name="industryType"
                  render={({ field }) => (
                    <SearchSelect
                      options={industryType}
                      value={field.value}
                      onValueChange={field.onChange}
                      placeholder="Industry Type"
                      searchPlaceholder="Search industry type"
                      disabled={isDisabled}
                    />
                  )}
                />
              )}
            </FieldContent>

            <FieldError errors={[form.formState.errors.industryType]} />
          </Field>

          <Field>
            <FieldLabel
              htmlFor="company_size"
              className="flex items-center gap-2"
            >
              <Users aria-hidden="true" className="size-4" />
              {ORGANIZATION_CONTENT.company_size}
            </FieldLabel>

            <FieldContent>
              {isMetaLoading ? (
                <Skeleton className="h-10" />
              ) : (
                <Controller
                  control={form.control}
                  name="companySize"
                  render={({ field }) => (
                    <SearchSelect
                      options={companySize}
                      value={field.value}
                      onValueChange={field.onChange}
                      placeholder="Organization Size"
                      searchPlaceholder="Search organization size"
                      disabled={isDisabled}
                    />
                  )}
                />
              )}
            </FieldContent>

            <FieldError errors={[form.formState.errors.companySize]} />
          </Field>
        </div>

        <div className="grid gap-5 sm:grid-cols-2">
          <Field>
            <FieldLabel htmlFor="country" className="flex items-center gap-2">
              <Globe aria-hidden="true" className="size-4" />
              {ORGANIZATION_CONTENT.country}
            </FieldLabel>

            <FieldContent>
              {isOrgLoading ? (
                <Skeleton className="h-10" />
              ) : (
                <Input
                  type="text"
                  id="country"
                  placeholder="Enter your country"
                  autoComplete="country"
                  {...form.register("country")}
                  disabled={isDisabled}
                />
              )}
            </FieldContent>

            <FieldError errors={[form.formState.errors.country]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="city" className="flex items-center gap-2">
              <MapPin aria-hidden="true" className="size-4" />
              {ORGANIZATION_CONTENT.city}
            </FieldLabel>

            <FieldContent>
              {isOrgLoading ? (
                <Skeleton className="h-10" />
              ) : (
                <Input
                  type="text"
                  id="city"
                  placeholder="Enter your city"
                  autoComplete="address-level2"
                  {...form.register("city")}
                  disabled={isDisabled}
                />
              )}
            </FieldContent>

            <FieldError errors={[form.formState.errors.city]} />
          </Field>
        </div>

        {isDisabled ? (
          <div className="flex justify-end">
            <Button type="button" variant={"ghost"} onClick={onContinue}>
              {ORGANIZATION_CONTENT.continue}
              <ArrowRight aria-hidden="true" className="size-4" />
            </Button>
          </div>
        ) : (
          <Button
            type="submit"
            className={"w-full"}
            disabled={organizationMutation.isPending}
          >
            {organizationMutation.isPending && (
              <LoaderCircle
                aria-hidden="true"
                className="size-4 animate-spin"
              />
            )}
            {ORGANIZATION_CONTENT.submit}
          </Button>
        )}
      </form>
    </div>
  );
}
