export const SETUP_DEPARTMENT_ENDPOINT = {
  SETUP_DEPARTMENT: "organization/department",
} as const;

export const DEPARTMENT_CONTENT = {
  TITLE: "Set Up Your Primary Department",
  DESCRIPTION:
    "Create your primary department to get started. You can add additional departments later from the Departments settings.",

  NAME: "Department name",
  TYPE: "Department type",
  CODE: "Department code",

  SUCCESS_TITLE: "Your Primary Department Is Ready",
  SUCCESS_DESCRIPTION:
    "Your primary department has been successfully created and is ready to use. This department will serve as the foundation for organizing your team members, equipment, and maintenance operations. If your organization has additional departments, you can add them at any time after completing the setup. Continue to the next step to finish setting up your Maintix workspace.",

  CREATE_BUTTON: "Create & Continue",
  CONTINUE_BUTTON: "Continue",
} as const;
