export const API_ENDPOINTS = {
  REFRESH: "auth/refresh",
  ME: "auth/me",
  ONBOARDING: "organization/onboarding",
  META: "meta",
  ORGANIZATION: "organization",
  ORGANIZATION_DROPDOWN: "organization/dropdown",
  ROLE_DROPDOWN: "users/roles",
  EQUIPMENT_TYPE_DROPDOWN: "equipment/equipment-type/dropdown",
  EQUIPMENT_DROPDOWN: "equipment/dropdown",
  EQUIPMENT_DROPDOWN_BY_ID: (id: number) => `equipment/type/${id}`,
  USER_DROPDOWN: "users/dropdown",
  CHECKLIST_DROPDOWN: "checklist/dropdown",
} as const;
