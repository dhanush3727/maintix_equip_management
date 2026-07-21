// Login Request
export interface LoginRequest {
  email: string;
  password: string;
}

// User data
export interface User {
  id: number;
  name: string;
  email: string;
}

// Login data
export interface LoginData {
  user: User;
  accessToken: string;
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
