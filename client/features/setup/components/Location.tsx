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
import { LOCATION_CONTENT } from "../constants/location.constant";
import {
  ArrowRight,
  House,
  LoaderCircle,
  MapPinned,
  Warehouse,
} from "lucide-react";
import { useMeta, useOnboarding } from "@/hooks";
import { useSetupLocation } from "../hooks/useSetupLocation";
import { useRouter } from "next/navigation";
import { ApiErrorResponse, OnboardingSetup } from "@/types";
import { Controller, useForm } from "react-hook-form";
import { locationSchema, LocationValues } from "../schemas/location.schema";
import { zodResolver } from "@hookform/resolvers/zod";
import { appToast, getErrorMessage } from "@/lib";
import { ROUTES } from "@/constants";
import axios from "axios";
import { setupRoutes } from "@/features/auth/constatnts/setup.constants";

export function Location() {
  const { data: metaData, isLoading: isMetaLoading } = useMeta();
  const { data: onboardingStep } = useOnboarding();
  const locationMutation = useSetupLocation();

  const router = useRouter();

  const locationType = metaData?.data?.locationType ?? [];
  const onboarding = onboardingStep?.data?.onboardingStep;
  const isDisabled = onboarding !== OnboardingSetup.LOCATION;

  const form = useForm<LocationValues>({
    resolver: zodResolver(locationSchema),
    defaultValues: {
      name: "",
      type: undefined,
      address: "",
    },
  });

  const onSubmit = (data: LocationValues) => {
    locationMutation.mutate(data, {
      onSuccess: (data) => {
        appToast.success(data.message);
        router.replace(ROUTES.SETUP_DEPARTMENT);
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
              {LOCATION_CONTENT.success_title}
            </h1>

            <p className="text-muted-foreground text-xs md:text-sm">
              {LOCATION_CONTENT.success_description}
            </p>
          </div>

          <div className="flex justify-end">
            <Button type="button" variant={"ghost"} onClick={onContinue}>
              {LOCATION_CONTENT.continue}
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
              {LOCATION_CONTENT.title}
            </h1>

            <p className="text-muted-foreground text-xs md:text-sm">
              {LOCATION_CONTENT.description}
            </p>
          </div>

          <Field>
            <FieldLabel htmlFor="name" className="flex items-center gap-2">
              <Warehouse aria-hidden="true" className="size-4" />
              {LOCATION_CONTENT.name}
            </FieldLabel>

            <FieldContent>
              <Input
                type="text"
                id="name"
                placeholder="Ex: Main Warehouse"
                autoComplete="off"
                {...form.register("name")}
                disabled={isDisabled}
              />
            </FieldContent>

            <FieldError errors={[form.formState.errors.name]} />
          </Field>

          <Field>
            <FieldLabel
              htmlFor="location_type"
              className="flex items-center gap-2"
            >
              <MapPinned aria-hidden="true" className="size-4" />
              {LOCATION_CONTENT.type}
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
                      options={locationType}
                      value={field.value}
                      onValueChange={field.onChange}
                      placeholder="Ex: Warehouse"
                      searchPlaceholder="Search location type"
                      disabled={isDisabled}
                    />
                  )}
                />
              )}
            </FieldContent>

            <FieldError errors={[form.formState.errors.type]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="address" className="flex items-center gap-2">
              <House aria-hidden="true" className="size-4" />
              {LOCATION_CONTENT.address}
            </FieldLabel>

            <FieldContent>
              <Input
                type="text"
                id="address"
                placeholder="Ex: 123 Industrial Park Rd, Chennai"
                autoComplete="street-address"
                {...form.register("address")}
                disabled={isDisabled}
              />
            </FieldContent>

            <FieldError errors={[form.formState.errors.address]} />
          </Field>

          <Button
            type="submit"
            className={"w-full"}
            disabled={locationMutation.isPending}
          >
            {LOCATION_CONTENT.create}
            {locationMutation.isPending ? (
              <LoaderCircle
                aria-hidden="true"
                className="size-4 animate-spin"
              />
            ) : (
              <ArrowRight aria-hidden="true" className="size-4" />
            )}
          </Button>
        </form>
      )}
    </div>
  );
}
