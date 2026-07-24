export interface UserRole {
  id: number;
  name: string;
}

export interface User {
  id: number;
  name: string;
  email: string;
  organiztionId: number;
  organizationName: string;
  isActive: boolean;
  isEmailVerified: boolean;
  roles: UserRole;
  departmentId: number;
  departmentName: string;
}
