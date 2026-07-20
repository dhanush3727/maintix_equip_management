export const ROUTES = {
  DASHBOARD: "/dashboard",
  LOGIN: "/login",
  ORGANIZATION: "/organization",
  REGISTER: "/register",
  EMAIL_VERIFICATION: "/email-verification",
  FORGOT_PASSWORD: "/forgot-password",
  RESET_PASSWORD: "/reset-password",
  ACCOUNT: "/account",
  BREAKDOWN: "/breakdown",
  CHECKLIST: "/checklist",
  EQUIPMENT: "/equipment",
  PREVENTIVE_MAINTENANCE: "/preventive-maintenance",
} as const;

export const PROTECTED_ROUTES = [
  "/dashboard",
  "/equipment",
  "/preventive-maintenance",
  "/checklist",
  "/breakdown",
  "/account",
  "/organization",
];

export const AUTH_ROUTES = [
  "/login",
  "/register",
  "/forgot-password",
  "/email-verification",
  "/reset-password",
];
