export const TASK_ENDPOINT = {
  LIST: "pmtasks",
  BY_ID: (id: number) => `pmtasks/${id}`,
  UPDATE: (id: number, itemId: number) =>
    `pmtasks/${id}/checklist-items/${itemId}`,
  COMPLETE: (id: number) => `pmtasks/${id}/complete`,
};

export const TASK_CONTENT = {
  HEADER: {
    TITLE: "Tasks",
    DESCRIPTION:
      "View, track, and complete preventive maintenance tasks assigned to your team.",
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
} as const;
