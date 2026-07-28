export const SETUP_SEND_INVITE_ENDPOINT = {
  SEND_INVITE: "organization/send-invite",
  GET_INVITATIONS: "organization/invitations",
} as const;

export const INVITE_USERS_CONTENT = {
  TITLE: "Invite Your Team (Optional)",
  DESCRIPTION:
    "Invite your team members to join your Maintix workspace. Assign roles and departments so they can start collaborating right away. You can invite multiple users now or skip this step and add them later from the Users page.",

  EMAIL: "User Email",
  ROLE: "Role",
  DEPARTMENT: "Department",

  SKIP_TITLE: "Invite Your Team Later",
  SKIP_DESCRIPTION:
    "No problem! You can continue setting up your workspace without inviting team members right now. Additional users can be invited at any time from the Users page once your setup is complete.",

  INVITE_BUTTON: "Send Invitations",
  CONTINUE_BUTTON: "Complete Setup",
  SKIP_BUTTON: "Skip for Now",
  ADD_USER_BUTTON: "Add Another User",
} as const;

export const COMPLETE_SETUP_ENPOINT = {
  COMPLETE_SETUP: "organization/onboarding/complete",
} as const;
