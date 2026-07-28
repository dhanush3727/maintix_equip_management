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

  NO_INVITATIONS: "No invitations have been sent yet.",

  INVITE_BUTTON: "Send Invitations",
  CONTINUE_BUTTON: "Complete Setup",
  SKIP_BUTTON: "Skip Invite User",
  ADD_USER_BUTTON: "Add Another User",
} as const;

export const COMPLETE_SETUP_ENPOINT = {
  COMPLETE_SETUP: "organization/onboarding/complete",
} as const;
