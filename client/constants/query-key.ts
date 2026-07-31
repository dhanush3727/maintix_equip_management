export const QUERY_KEYS = {
  auth: {
    me: ["me"],
  },

  metaData: {
    meta: ["meta"],
  },

  organization: {
    details: ["org-details"],
    onboarding: ["org-onboarding"],
    dropdown: ["org-dropdown"],
  },

  role: {
    dropdown: ["role-dropdown"],
  },

  invitations: {
    get_invitations: ["get-invitations"],
    verify_invitation: ["verify-invitation"],
  },

  dashboard: {
    get_dashboard: ["get-dashboard"],
  },

  equipment_type: {
    get_list: ["get-equipment-type"],
  },
} as const;
