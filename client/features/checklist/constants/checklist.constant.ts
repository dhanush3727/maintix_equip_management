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

  FILTER: {
    SEARCH: "Search checklist",
    TYPE: "Select equipment type",
    TYPE_SEARCH: "Search type",
  },

  INFORMATION_FIELD: {
    TITLE: "Checklist Information",

    NAME_LABEL: "Checklist Name",
    NAME_PLACEHOLDER: "e.g., Daily Pump Inspection",

    TYPE_LABEL: "Equipment Type",
    TYPE_PLACEHOLDER: "Select equipment type",
    TYPE_SEARCH: "Search equipment type",

    DESCRIPTION_LABEL: "Description",
    DESCRIPTION_PLACEHOLDER: "Enter a brief description of the checklist",
  },

  ITEM_FIELD: {
    TITLE: "Checklist Items",

    NAME_LABEL: "Item Name",
    NAME_PLACEHOLDER: "e.g., Check oil level",

    ORDER_LABEL: "Order",
    ORDER_PLACEHOLDER: "e.g., 1",

    TYPE_LABEL: "Item Type",
    TYPE_PLACEHOLDER: "Select item type",

    EXPECTED_VALUE_LABEL: "Expected Value",
    EXPECTED_VALUE_EMPTY: "Add option first",

    MIN_VALUE_LABEL: "Minimum Value",
    MIN_VALUE_PLACEHOLDER: "e.g., 20",

    MAX_VALUE_LABEL: "Maximum Value",
    MAX_VALUE_PLACEHOLDER: "e.g., 60",

    OPTIONS_LABEL: "Options",
    OPTIONS_PLACEHOLDER: "Add an option",
    OPTIONS_ADD: "Add",

    REQUIRED_LABEL: "Required",
    REQUIRED_PLACEHOLDER: "Mark this item as required",
  },

  UPDATE: {
    TITLE: "Update Checklist",
    DESCRIPTION:
      "Update the checklist details and maintenance tasks to keep inspection requirements accurate and up to date.",
  },

  BUTTON: {
    CREATE: "Create",
    CANCEL: "Cancel",
    UPDATE: "Update",
    LOAD_MORE: "Loading More...",
  },

  NO_DATA: {
    TITLE: "No checklist found",
    DESCRIPTION: "Create an equipment type to get started",
  },

  ERROR: {
    TITLE: "Unable to load checklists",
    DESCRIPTION:
      "Soemthing went wrong while loading equipment types. Please try again.",
  },

  ACCESS: {
    TITLE: "You cannot access this page",
    BUTTON: "Go to Dashboard",
  },
};

export const BOOLEAN_VALUES = [
  {
    value: "true",
    label: "true",
  },
  {
    value: "false",
    label: "false",
  },
];
