import { ROUTES } from "@/constants";
import { OnboardingSetup } from "@/types";

export const setupRoutes: Record<OnboardingSetup, string> = {
  [OnboardingSetup.ORGANIZATION]: ROUTES.SETUP_ORGANIZATION,
  [OnboardingSetup.LOCATION]: ROUTES.SETUP_LOCATION,
  [OnboardingSetup.DEPARTMENT]: ROUTES.SETUP_DEPARTMENT,
  [OnboardingSetup.USERS]: ROUTES.SETUP_INVITE_USER,
  [OnboardingSetup.COMPLETED]: ROUTES.DASHBOARD,
};
