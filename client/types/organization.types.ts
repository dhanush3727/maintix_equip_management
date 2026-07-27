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

export interface DropDown {
  value: number;
  label: string;
}

export interface OrganizationDD {
  location: DropDown[];
  department: DropDown[];
}

export interface RoleDD {
  id: number;
  name: string;
}
