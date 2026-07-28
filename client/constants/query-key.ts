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
  },
} as const;
