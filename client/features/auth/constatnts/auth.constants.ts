import { ROUTES } from "@/constants";

export const AUTH_ENDPOINTS = {
  LOGIN: "auth/login",
  REGISTER: "auth/register",
  LOGOUT: "auth/logout",
  FORGOT_PASSWORD: "auth/forgot-password",
} as const;

export const AUTH_CONTENT = {
  EMAIL: "Email",
  PASSWORD: "Password",
  LOGIN: "Login",
  REGISTER: "Register",
  NEW_ACCOUNT: "Don't have an account?",
  FORGOT_PASSWORD: "Forgot Password",
  SEND: "Send",
  BACK: "Back",
} as const;

export const DEFAULT_REDIRECT_PATH = ROUTES.DASHBOARD;

export const CHECK_EMAIL_CONTENT = {
  head: "Check your email",
  subHead:
    "If an account exists for the email address you entered, we've sent a password reset link. Please check your inbox and follow the instructions to reset your password.",
  description: "Didn't receive the email?",
  text: [
    "- Check your spam or junk folder.",
    "- Make sure you entered the correct email address.",
    "- Wait a few minutes and try again if necessary.",
  ],
  buttons: {
    resend: "Resend Link",
    back: "Back to Login",
  },
} as const;
