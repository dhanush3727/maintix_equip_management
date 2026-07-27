import {
  CompanySize,
  DepartmentType,
  IndustryType,
  LocationType,
} from "@/types";

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

export interface DepartmentRequest {
  name: string;
  type: DepartmentType;
  code: string;
}

export interface SendInvitationRequest {
  email: string;
  roleId: number;
  departmentId: number;
}
