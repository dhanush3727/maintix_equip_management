"use client";

import { useEffect } from "react";
import { useRouter } from "next/navigation";

import { ROUTES } from "@/constants";
import { useOnboarding, useSlug } from "@/hooks";
import { OnboardingSetup } from "@/types";
import { setupRoutes } from "@/features/auth/constatnts/setup.constants";
import { Loading } from "@/components/ui";

export interface OnBoardingGuardProps {
  children: React.ReactNode;
  mode: "setup" | "dashboard";
}

/**
 * Protects onboarding and dashboard routes.
 *
 * Setup Mode:
 * - Redirects completed organizations to the dashboard.
 *
 * Dashboard Mode:
 * - Redirects organizations that haven't completed onboarding
 *   to their current onboarding step.
 */
export function OnBoardingGuard({
  children,
  mode,
}: OnBoardingGuardProps): React.ReactNode {
  const router = useRouter();
  const { getSlugUrl } = useSlug();

  const { data, isLoading } = useOnboarding();

  const onboardingStep = data?.data?.onboardingStep;

  useEffect(() => {
    if (isLoading || !onboardingStep) {
      return;
    }

    if (mode === "setup" && onboardingStep === OnboardingSetup.COMPLETED) {
      router.replace(getSlugUrl(ROUTES.DASHBOARD));
      return;
    }

    if (mode === "dashboard" && onboardingStep !== OnboardingSetup.COMPLETED) {
      const targetRoute = setupRoutes[onboardingStep];

      router.replace(targetRoute);
    }
  }, [isLoading, onboardingStep, mode, router, getSlugUrl]);

  // Wait until onboarding status is loaded.
  if (isLoading) {
    return (
      <div className="h-screen w-screen flex flex-col gap-3 justify-center items-center">
        <p>Please wait...</p>
        <Loading />
      </div>
    );
  }

  // Prevent rendering dashboard while redirecting.
  if (
    mode === "dashboard" &&
    onboardingStep &&
    onboardingStep !== OnboardingSetup.COMPLETED
  ) {
    return null;
  }

  // Prevent rendering setup pages while redirecting.
  if (mode === "setup" && onboardingStep === OnboardingSetup.COMPLETED) {
    return null;
  }

  return children;
}
