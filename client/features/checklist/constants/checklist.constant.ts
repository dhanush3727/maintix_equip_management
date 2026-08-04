export const CHECKLIST_ENDPOINTS = {
  CREATE: "checklist/checklist-template",
  LIST: "checklist/checklist-template",
  BY_ID: (id: number) => `checklist/checklist-template/${id}`,
  UPDATE: (id: number) => `checklist/checklist-template/${id}`,
  DROPDOWN: (id: number) =>
    `checklist/checklist-template/equipment-type/${id}/dropdown`,
};

export const CHECKLIST_CONTENT = {
  HEADER: {
    TITLE: "Checklists",
    DESCRIPTION:
      "Create and manage maintenance checklists to ensure tasks are completed consistently and accurately.",
  },

  CREATE: {
    TITLE: "Create Checklist",
    DESCRIPTION:
      "Create a checklist to define the tasks and inspection steps required for maintenance activities.",
  },

  UPDATE: {
    TITLE: "Update Checklist",
    DESCRIPTION:
      "Update the checklist details and maintenance tasks to keep inspection requirements accurate and up to date.",
  },

  FIELD: {},

  BUTTON: {
    CREATE: "Create",
    CANCEL: "Cancel",
    UPDATE: "Update",
  },
};
