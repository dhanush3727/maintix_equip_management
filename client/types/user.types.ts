import { RoleType } from "./enum/metadata.enum";

export interface UserRole {
  id: number;
  name: RoleType;
}

export interface User {
  id: number;
  name: string;
  email: string;
  organiztionId: number;
  organizationName: string;
  logoUrl: string;
  logoPublicId: string;
  isActive: boolean;
  isEmailVerified: boolean;
  roles: UserRole[];
  departmentId: number;
  departmentName: string;
}
