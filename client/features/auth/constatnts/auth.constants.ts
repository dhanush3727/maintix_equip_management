import { ROUTES } from "@/constants";

export const AUTH_ENDPOINTS = {
  LOGIN: "auth/login",
  REGISTER: "auth/register",
  LOGOUT: "auth/logout",
  FORGOT_PASSWORD: "auth/forgot-password",
  RESET_PASSWORD: "auth/reset-password",
} as const;

export const AUTH_CONTENT = {
  EMAIL: "Email",
  PASSWORD: "Password",
  LOGIN: "Login",
  REGISTER: "Register",
  NEW_ACCOUNT: "Don't have an account?",
  FORGOT_PASSWORD: "Forgot Password",
  RESET_PASSWORD: "Reset Password",
  SEND: "Send",
  BACK: "Back",
} as const;

export const DEFAULT_REDIRECT_PATH = ROUTES.DASHBOARD;

export const REGISTER_CONTENT = {
  NAME: "Name",
  ORGANIZATION: "Organization Name",
  EXISTING_ACCOUNT: "Already have an account?",
};

// Check email contents
export const CHECK_EMAIL_CONTENT = {
  HEAD: "Check your email",
  SUB_HEAD:
    "If an account exists for the email address you entered, we've sent a password reset link. Please check your inbox and follow the instructions to reset your password.",
  DESCRIPTION: "Didn't receive the email?",
  TEXT: [
    "- Check your spam or junk folder.",
    "- Make sure you entered the correct email address.",
    "- Wait a few minutes and try again if necessary.",
  ],
  BUTTONS: {
    RESEND: "Resend Link",
    BACK: "Back to Login",
  },
} as const;

// Reset password contents
export const RESET_PASSWORD_CONTENT = {
  NEW_PASSWORD: "New Password",
  CONFIRM_PASSWORD: "Confirm Password",
  CHANGE_PASSWORD: "Change Password",
} as const;

export const PASSWORD_RULES = {
  minLength: 8,
  uppercase: /[A-Z]/,
  number: /\d/,
  symbol: /[!@#$%^&*(),.?":{}|<>]/,
};
