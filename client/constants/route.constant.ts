export const ROUTES = {
  HOME: "/",
  DASHBOARD: "/dashboard",
  LOGIN: "/login",

  ORGANIZATION: "/organization",
  LOCATION: "/organization/location",
  DEPARTMENT: "/organization/department",
  INVITE_USER: "/organization/invite-user",

  REGISTER: "/register",
  EMAIL_VERIFICATION: "/email-verification",
  FORGOT_PASSWORD: "/forgot-password",
  RESET_PASSWORD: "/reset-password",

  EQUIPMENT: {
    LIST: "/equipment",
    TYPE: "/equipment/type",
  },

  PREVENTIVE_MAINTENANCE: {
    SCHEDULE: "/preventive-maintenance/schedule",
    TASK: "/preventive-maintenance/task",
  },

  ACCOUNT: "/account",
  BREAKDOWN: "/breakdown",
  CHECKLIST: "/checklist",

  CHECK_EMAIL: "/check-email",
  CHECK_VERIFY_EMAIL: "/check-verify-email",
  SETUP_ORGANIZATION: "/setup/organization",
  SETUP_LOCATION: "/setup/location",
  SETUP_DEPARTMENT: "/setup/department",
  SETUP_INVITE_USER: "/setup/invite-user",
  ACCEPT_INVITE: "/accept-invite",
  USERS: "/users",
} as const;

export const PROTECTED_ROUTES = [
  "/dashboard",
  "/equipment",
  "/preventive-maintenance",
  "/checklist",
  "/breakdown",
  "/account",
  "/organization",
  "/organization/location",
  "/organization/department",
  "/organization/invite-user",
  "/setup/organization",
  "/setup/location",
  "/setup/department",
  "/setup/invite-user",
];

export const AUTH_ROUTES = [
  "/",
  "/login",
  "/register",
  "/forgot-password",
  "/email-verification",
  "/reset-password",
  "/check-email",
];
