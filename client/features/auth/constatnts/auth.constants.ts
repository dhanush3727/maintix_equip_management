import { ROUTES } from "@/constants";

export const AUTH_ENDPOINTS = {
  LOGIN: "auth/login",
  REGISTER: "auth/register",
  LOGOUT: "auth/logout",
  FORGOT_PASSWORD: "auth/forgot-password",
};

export const AUTH_CONTENT = {
  EMAIL: "Email",
  PASSWORD: "Password",
  LOGIN: "Login",
  REGISTER: "Register",
  NEW_ACCOUNT: "Don't have an account?",
  FORGOT_PASSWORD: "Forgot Password",
  SEND: "Send",
};

export const DEFAULT_REDIRECT_PATH = ROUTES.DASHBOARD;
