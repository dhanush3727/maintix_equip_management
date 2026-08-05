export const SCHEDULE_ENDPOINTS = {
  CREATE: "pmschedules",
  LIST: "pmschedules",
  BY_ID: (id: number) => `pmschedules/${id}`,
  UPDATE: (id: number) => `pmschedules/${id}`,
  ACTIVATE: (id: number) => `pmschedules/${id}/activate`,
  DEACTIVATE: (id: number) => `pmschedules/${id}/deactivate`,
};

export const SCHEDULE_CONTENT = {
  CREATE: {
    TITLE: "Create Maintenance Schedule",
    DESCRIPTION:
      "Create a preventive maintenance schedule by selecting the equipment, checklist, frequency, start date, and technician.",
  },

  UPDATE: {
    TITLE: "Update Maintenance Schedule",
    DESCRIPTION: "Update the details of this preventive maintenance schedule.",
  },

  BUTTONS: {
    CREATE: "Create Schedule",
    UPDATE: "Update Schedule",
    CANCEL: "Cancel",
    LOADING_MORE: "Loading more...",
  },

  FIELDS: {
    EQUIPMENT: {
      LABEL: "Equipment",
      PLACEHOLDER: "Select equipment",
    },

    CHECKLIST: {
      LABEL: "Checklist",
      PLACEHOLDER: "Select checklist",
    },

    FREQUENCY_TYPE: {
      LABEL: "Frequency",
      PLACEHOLDER: "Select frequency",
    },

    INTERVAL: {
      LABEL: "Interval",
      PLACEHOLDER: "Enter interval",
    },

    START_DATE: {
      LABEL: "Start Date",
      PLACEHOLDER: "Select start date",
    },

    ASSIGNED_TO: {
      LABEL: "Assigned Technician",
      PLACEHOLDER: "Select technician",
    },
  },

  FILTER: {
    SEARCH: "Search schedules",
    EQUIPMENT: "All Equipment",
    FREQUENCY_TYPE: "All Frequencies",
    ASSIGNED_TO: "All Technicians",
  },

  NO_DATA: {
    TITLE: "No schedules found",
    DESCRIPTION: "There are no maintenance schedules to display.",
  },

  ERROR: {
    TITLE: "Unable to load Schedules",
    DESCRIPTION:
      "Soemthing went wrong while loading Schedules. Please try again.",
  },
};
