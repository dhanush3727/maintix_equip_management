import {
  CompanySize,
  IndustryType,
  OnboardingSetup,
} from "./enum/metadata.enum";

export interface Onboarding {
  onboardingStep: OnboardingSetup;
}

export interface Organization {
  id: number;
  name: string;
  slug: string;
  industryType: IndustryType;
  companySize: CompanySize;
  city: string;
  country: string;
  isActive: boolean;
  logoUrl: string;
}
