export const BREAKDOWN_ENDPOINTS = {
  CREATE: "breakdowns",
  LIST: "breakdowns",
  BY_ID: (id: number) => `breakdowns/${id}`,
  UPDATE: (id: number) => `breakdowns/${id}`,
  ASSIGN_TECHNICIAN: (id: number) => `breakdowns/${id}/assign`,
  CREATE_ACTIONS: (id: number) => `breakdowns/${id}/actions`,
  UPDATE_ACTIONS: (id: number, actionId: number) =>
    `breakdowns/${id}/actions/${actionId}`,
  DELETE_ACTIONS: (id: number, actionId: number) =>
    `breakdowns/${id}/actions/${actionId}`,
  RESOLVE: (id: number) => `breakdowns/${id}/resolve`,
  CLOSE: (id: number) => `breakdowns/${id}/close`,
} as const;

export const BREAKDOWN_CONTENT = {
  TITLE: "Breakdown",
  DESCRIPTION:
    "Report, track, assign, and resolve equipment breakdowns to minimize downtime and keep maintenance operations running smoothly.",

  EQUIPMENT_PLACEHOLDER: "Select Equipment",
  EQUIPMENT_SEARCH: "Search Equipment",

  SEVERITY_PLACEHOLDER: "Select Severity",
  SEVERITY_SEARCH: "Search Severity",

  STATUS_PLACEHOLDER: "Select Status",
  STATUS_SEARCH: "Search Status",

  CLEAR_BUTTON: "Clear",
} as const;

export const BREAKDOWN_FORM_CONTENT = {
  CREATE_TITLE: "Report Breakdown",
  CREATE_DESCRIPTION:
    "Report an equipment breakdown by providing the issue details, severity, and affected equipment.",

  UPDATE_TITLE: "Update Breakdown",
  UPDATE_DESCRIPTION:
    "Update the breakdown details, severity, or affected equipment.",

  TITLE_LABEL: "Title",
  TITLE_PLACEHOLDER: "Ex: Motor Overheating",

  DESCRIPTION_LABEL: "Description",
  DESCRIPTION_PLACEHOLDER: "Describe the breakdown and the issue observed...",

  SEVERITY_LABEL: "Severity",
  SEVERITY_PLACEHOLDER: "Select Severity",
  SEVERITY_SEARCH: "Search Severity",

  EQUIPMENT_LABEL: "Equipment",
  EQUIPMENT_PLACEHOLDER: "Select Equipment",
  EQUIPMENT_SEARCH: "Search Equipment",

  CREATE_BUTTON: "Report Breakdown",
  UPDATE_BUTTON: "Update",
  CANCEL_BUTTON: "Cancel"
} as const;
