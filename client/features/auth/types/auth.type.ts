import { OnboardingSetup, RoleType } from "@/types";

// User data
export interface UserRole {
  id: number;
  name: RoleType;
}

export interface User {
  id: number;
  slug: string;
  name: string;
  organizationId: number;
  email: string;
  onboardingStep: OnboardingSetup;
  isActive: boolean;
  roles: UserRole[];
}

// Login Request
export interface LoginRequest {
  email: string;
  password: string;
  deviceInfo: string;
}

// Login data
export interface LoginData {
  user: User;
  accessToken: string;
}

// Register Request
export interface RegisterRequest {
  name: string;
  companyName: string;
  email: string;
  password: string;
  deviceInfo: string;
}

// Register data
export interface RegisterData {
  user: User;
  verificationEmailSent: string;
}

// Send Email Verification
export interface SendEmailRequest {
  email: string;
}

// Verify Email
export interface VerifyEmailRequest {
  token: string;
}

// Forgot password request
export interface ForgotPasswordRequest {
  email: string;
}

// Reset password request
export interface ResetPasswordRequest {
  token: string;
  password: string;
}

// Verify invitation data
export interface VerifyInvitationData {
  email: string;
  organizationName: string;
  roleName: string;
  departmentName: string;
}

// Accept invitation
export interface AcceptInvitationRequest {
  token: string;
  name: string;
  password: string;
}

// For password check
export type CheckType = {
  minLength: boolean;
  uppercase: boolean;
  number: boolean;
  symbol: boolean;
};

export type PasswordRequirement = {
  label: string;
  valid: boolean;
};
