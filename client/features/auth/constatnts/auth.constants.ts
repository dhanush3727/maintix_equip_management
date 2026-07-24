import { ROUTES } from "@/constants";

export const AUTH_ENDPOINTS = {
  LOGIN: "auth/login",
  REGISTER: "auth/register",
  SEND_EMAIL_VERIFICATION: "auth/send-verification",
  VERIFY_EMAIL: "auth/verify-email",
  RESEND_EMAIL_VERIFICATION: "auth/resend-verification",
  LOGOUT: "auth/logout",
  LOGOUT_ALL: "auth/logout-all",
  FORGOT_PASSWORD: "auth/forgot-password",
  RESET_PASSWORD: "auth/reset-password",
  SESSIONS: "auth/sessions",
  SESSION: (jti: string) => `auth/sessions/${jti}`,
  ME: "auth/me",
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

export const LOGIN_CONTENT = {
  verify_title: "Email Verification Required",
  verify_description:
    "Your email address hasn't been verified yet. Please verify your email before signing in.",
  verify_email: "Verify Email",
  verify_cancel: "Cancel",
};

// Register contents
export const REGISTER_CONTENT = {
  NAME: "Name",
  ORGANIZATION: "Organization Name",
  EXISTING_ACCOUNT: "Already have an account?",
};

// Check verify email contents
export const CHECK_VERIFY_EMAIL_CONTENT = {
  title: "Check your email",
  description:
    "We've sent a verification link to your email address. Please check your inbox and click the link to activate your Maintix account. If didn't receive any email, request another one after 1 minute.",
  resend: "Resend Link",
  back: "Back to Login",
};

// Verify email contents
export const VERIFY_EMAIL_CONTENT = {
  title: "Verifying Your Email",
  description:
    "Please wait while we verify your email address. This will only take a moment.",
  success_title: "Email Verified",
  success_description: "Your email has been successfully verified.",
  fail_title: "Verification Failed",
  fail_description: "This verification link is invalid or has expired.",
  fail_resend: "Resend Link",
  fail_back: "Back to login",
};

// Check email contents
export const CHECK_EMAIL_CONTENT = {
  HEAD: "Check your email",
  SUB_HEAD:
    "If an account exists for the email address you entered, we've sent a password reset link. Please check your inbox and follow the instructions to reset your password. If didn't receive any email request another one",
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
