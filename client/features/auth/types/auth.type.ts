import { OnboardingSetup, Role } from "@/types";

// User data
export interface UserRole {
  id: number;
  name: Role;
}

export interface User {
  id: number;
  name: string;
  organizationId: number;
  email: string;
  isSetupCompleted: OnboardingSetup;
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
