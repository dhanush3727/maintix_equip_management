// User data
export interface User {
  id: number;
  name: string;
  email: string;
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

// Forgot password request
export interface ForgotPasswordRequest {
  email: string;
}

// Reset password request
export interface ResetPasswordRequest {
  token: string;
  password: string;
}
