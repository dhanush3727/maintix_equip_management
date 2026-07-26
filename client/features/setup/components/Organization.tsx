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
import { UploadCloud } from "lucide-react";
import { useAuth, useMeta } from "@/hooks";
import { Controller, useForm } from "react-hook-form";
import {
  OrganizationFormValues,
  organizationSchema,
} from "../schemas/organization.schema";
import { zodResolver } from "@hookform/resolvers/zod";

export function Organization() {
  const { user, isLoading: isUserLoading } = useAuth();
  const { data, isLoading: isMetaLoading } = useMeta();

  const industryType = data?.data?.industryType ?? [];
  const companySize = data?.data?.companySize ?? [];

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

  const onSubmit = (data: OrganizationFormValues) => {
    console.log("form", data);
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
          <FieldLabel>{ORGANIZATION_CONTENT.organization_name}</FieldLabel>
          <FieldContent>
            {isUserLoading ? (
              <Skeleton className="h-10" />
            ) : (
              <Input
                id="name"
                value={user?.organizationName ?? ""}
                disabled
                className="disabled:opacity-100"
              />
            )}
          </FieldContent>
        </Field>

        <Field>
          <FieldLabel htmlFor="logo">
            {ORGANIZATION_CONTENT.organization_logo}
          </FieldLabel>

          <FieldContent>
            <label
              htmlFor="logo"
              className="flex flex-col items-center justify-center gap-3 cursor-pointer rounded-xl border-2 border-dashed border-border px-6 py-10 text-center hover:border-primary hover:bg-muted/50 transition-colors duration-200"
            >
              <UploadCloud className="size-10 text-muted-foreground" />

              <div>
                <p className="font-medium">{ORGANIZATION_CONTENT.logo_title}</p>
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
          </FieldContent>

          <FieldError errors={[form.formState.errors.logo]} />
        </Field>

        <div className="grid gap-5 sm:grid-cols-2">
          <Field>
            <FieldLabel htmlFor="industry_type">
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
                    />
                  )}
                />
              )}
            </FieldContent>

            <FieldError errors={[form.formState.errors.industryType]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="company_size">
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
            <FieldLabel htmlFor="country">
              {ORGANIZATION_CONTENT.country}
            </FieldLabel>

            <FieldContent>
              <Input
                type="text"
                id="country"
                placeholder="Enter your country"
                {...form.register("country")}
              />
            </FieldContent>

            <FieldError errors={[form.formState.errors.country]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="city">{ORGANIZATION_CONTENT.city}</FieldLabel>

            <FieldContent>
              <Input
                type="text"
                id="city"
                placeholder="Enter your city"
                {...form.register("city")}
              />
            </FieldContent>

            <FieldError errors={[form.formState.errors.city]} />
          </Field>
        </div>

        <Button type="submit" className={"w-full"}>
          {ORGANIZATION_CONTENT.submit}
        </Button>
      </form>
    </div>
  );
}
