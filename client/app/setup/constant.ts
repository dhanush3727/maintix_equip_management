import { ROUTES } from "@/constants";
import { OnboardingSetup } from "@/types";

export const HEADER_CONTENT = {
  title: "Set Up Your Organization",
  description: "Configure your organization details to get started.",
  skipButtonLabel: "Skip",

  steps: [
    {
      step: 1,
      title: "Organization",
      key: OnboardingSetup.ORGANIZATION,
      url: ROUTES.SETUP_ORGANIZATION,
    },
    {
      step: 2,
      title: "Location",
      key: OnboardingSetup.LOCATION,
      url: ROUTES.SETUP_LOCATION,
    },
    {
      step: 3,
      title: "Department",
      key: OnboardingSetup.DEPARTMENT,
      url: ROUTES.SETUP_DEPARTMENT,
    },
    {
      step: 4,
      title: "Invite User",
      key: OnboardingSetup.USERS,
      url: ROUTES.SETUP_INVITE_USER,
    },
  ],
} as const;
