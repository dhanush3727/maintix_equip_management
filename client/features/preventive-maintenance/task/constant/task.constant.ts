export const TASK_ENDPOINT = {
  LIST: "pmtasks",
  BY_ID: (id: number) => `pmtasks/${id}`,
  UPDATE: (id: number, itemId: number) =>
    `pmtasks/${id}/checklist-items/${itemId}`,
  COMPLETE: (id: number) => `pmtasks/${id}/complete`,
} as const;

export const TASK_CONTENT = {
  HEADER: {
    TITLE: "Tasks",
    DESCRIPTION:
      "View, track, and complete preventive maintenance tasks assigned to your team.",
  },

  UPDATE: {
    TITLE: "Update Task",
    DESCRIPTION:
      "Review the task details, record inspection results, add remarks, and complete the task.",
  },

  CARD: {
    OVERDUE: "Overdue",
    TEMPLATE: "Template",
    ASSIGNED: "Assigned",
    DUE: "Due",
    COMPLETED: "Completed",
  },

  FIELD: {
    STATUS: "Status",
    DUE_DATE: "Due date",
    OVERDUE: "Task is overdue",

    EXPECTED: "Expected value",
    ACTUAL: "Actual Value",
    RANGE: "Expected Range",

    INPUT_PLACEHOLDER: "Enter actual value",
  },

  FILTERS: {
    STATUS_PLACEHOLDER: "Select status",
    STATUS_SEARCH_PLACEHOLDER: "Search status",

    EQUIPMENT_PLACEHOLDER: "Select equipment",
    EQUIPMENT_SEARCH_PLACEHOLDER: "Search equipment",

    USERS_PLACEHOLDER: "Select assignee",
    USERS_SEARCH_PLACEHOLDER: "Search assignee",

    FROM_DATE_LABEL: "From date",
    TO_DATE_LABEL: "To date",
  },

  EMPTY: {
    TITLE: "No tasks found",
    DESCRIPTION:
      "Try adjusting your search or filters to find preventive maintenance tasks.",
  },

  ERROR: {
    TITLE: "Unable to load tasks",
    DESCRIPTION: "Soemthing went wrong while loading tasks. Please try again.",
  },

  BUTTONS: {
    EDIT: "Edit",
    UPDATE: "Update Task",
    COMPLETE: "Complete",
    LOADING_MORE: "Loading More...",
    CANCEL: "Cancel",
    VIEW: "View",
    SAVE: "Save",
  },
} as const;

export const BOOLEAN_VALUE = [
  {
    label: "True",
    value: true,
  },
  {
    label: "False",
    value: false,
  },
];
