import { Role } from "./enum/role.enum";

export interface UserRole {
  id: number;
  name: Role;
}

export interface User {
  id: number;
  name: string;
  email: string;
  organiztionId: number;
  organizationName: string;
  isActive: boolean;
  isEmailVerified: boolean;
  roles: UserRole[];
  departmentId: number;
  departmentName: string;
}
