import { CompanySize, IndustryType } from "@/types";

export interface OrganizationRequest {
  industryType: IndustryType;
  companySize: CompanySize;
  country: string;
  city: string;
  logo: File;
}
