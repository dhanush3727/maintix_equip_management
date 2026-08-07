export const SCHEDULE_ENDPOINTS = {
  CREATE: "pmschedules",
  LIST: "pmschedules",
  BY_ID: (id: number) => `pmschedules/${id}`,
  UPDATE: (id: number) => `pmschedules/${id}`,
  ACTIVATE: (id: number) => `pmschedules/${id}/activate`,
  DEACTIVATE: (id: number) => `pmschedules/${id}/deactivate`,
  CHECKLIST_DROPDOWN: (typeId: number) =>
    `checklist/checklist-template/equipment-type/${typeId}/dropdown`,
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
    EDIT: "Edit",
  },

  FIELDS: {
    EQUIPMENT_TYPE: {
      LABEL: "Equipment Type",
      PLACEHOLDER: "Select equipment type",
    },

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

  CARD: {
    START: "Start",
    NEXT_DUE: "Next Due",
  },

  FILTER: {
    TEMPLATE: "All Checklists",
    EQUIPMENT: "All Equipment",
    FREQUENCY_TYPE: "All Frequencies",
    FROM_DATE_LABEL: "From Date",
    TO_DATE_LABEL: "To Date",
  },

  TABLE: {
    EQUIPMENT: "Equipment",
    CHECKLIST: "Checklist",
    ASSIGNED_TO: "Assigned To",
    FREQUENCY: "Frequency",
    INTERVAL: "Interval",
    START_DATE: "Start date",
    NEXT_DUE: "Next due",
    STATUS: "Status",
    ACTION: "Action",
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

export const SCHEDULE_TABLE_COLUMN = [
  {
    key: "equipment",
    label: SCHEDULE_CONTENT.TABLE.EQUIPMENT,
  },
  {
    key: "checklist",
    label: SCHEDULE_CONTENT.TABLE.CHECKLIST,
  },
  {
    key: "assignedTo",
    label: SCHEDULE_CONTENT.TABLE.ASSIGNED_TO,
  },
  {
    key: "frequency",
    label: SCHEDULE_CONTENT.TABLE.FREQUENCY,
  },
  // {
  //   key: "interval",
  //   label: SCHEDULE_CONTENT.TABLE.INTERVAL,
  // },
  {
    key: "startDate",
    label: SCHEDULE_CONTENT.TABLE.START_DATE,
  },
  {
    key: "nextDue",
    label: SCHEDULE_CONTENT.TABLE.NEXT_DUE,
  },
  {
    key: "status",
    label: SCHEDULE_CONTENT.TABLE.STATUS,
  },
  {
    key: "action",
    label: SCHEDULE_CONTENT.TABLE.ACTION,
  },
];
