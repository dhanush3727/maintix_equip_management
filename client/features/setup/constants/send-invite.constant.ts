export const SETUP_SEND_INVITE_ENDPOINT = {
  SEND_INVITE: "organization/send-invite",
} as const;

export const INVITE_USERS_CONTENT = {
  TITLE: "Invite Your Team",
  DESCRIPTION:
    "Invite your team members to join your Maintix workspace. Assign roles and departments so they can start collaborating right away. You can invite multiple users now or skip this step and add them later from the Users page.",

  EMAIL: "User Email",
  ROLE: "Role",
  DEPARTMENT: "Department",

  SUCCESS_TITLE: "Invitations Sent Successfully",
  SUCCESS_DESCRIPTION:
    "Your invitations have been sent successfully. Invited users will receive an email with instructions to join your organization. You can track invitation status and invite additional team members at any time from the Users page. Continue to complete your Maintix setup.",

  SKIP_TITLE: "Invite Your Team Later",
  SKIP_DESCRIPTION:
    "No problem! You can continue setting up your workspace without inviting team members right now. Additional users can be invited at any time from the Users page once your setup is complete.",

  INVITE_BUTTON: "Send Invitations",
  CONTINUE_BUTTON: "Complete Setup",
  SKIP_BUTTON: "Skip for Now",
  ADD_USER_BUTTON: "Add Another User",
} as const;
