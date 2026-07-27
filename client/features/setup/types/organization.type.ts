import { CompanySize, IndustryType, LocationType } from "@/types";

export interface OrganizationRequest {
  industryType: IndustryType;
  companySize: CompanySize;
  country: string;
  city: string;
  logo: File;
}

export interface LocationRequest {
  name: string;
  type: LocationType;
  address: string;
}
