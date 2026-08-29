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
  LOAD_MORE: "Loading More...",

  ERROR: {
    TITLE: "Unable to Load Breakdowns",
    DESCRIPTION:
      "Something went wrong while loading the breakdowns. Please try again.",
  },

  EMPTY: {
    TITLE: "No Breakdowns Found",
    DESCRIPTION:
      "There are no breakdowns reported yet. Report a breakdown when equipment requires maintenance.",
    BUTTON: "Raise Breakdown",
  },
} as const;

export const BREAKDOWN_FORM_CONTENT = {
  CREATE_TITLE: "Report Breakdown",
  CREATE_DESCRIPTION:
    "Report an equipment breakdown by providing the issue details, severity, and affected equipment.",

  VIEW_TITLE: "Breakdown Details",
  VIEW_DESCRIPTION:
    "View the reported breakdown details, severity, equipment, and current status.",

  ASSIGN_TITLE: "Assign Technician",
  ASSIGN_DESCRIPTION:
    "Assign a technician to this breakdown to begin the maintenance work.",
  RESOLVE_TITLE: "Resolve Breakdown",
  RESOLVE_DESCRIPTION:
    "Mark this breakdown as resolved after the required maintenance work has been completed.",

  // CLOSE_TITLE: "Close Breakdown",
  // CLOSE_DESCRIPTION:
  //   "Close this breakdown after confirming that the issue has been resolved and the equipment is ready for operation.",

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

  ASSIGN_TECHNICIAN_LABEL: "Assign Technician",
  ASSIGN_TECHNICIAN_PLACEHOLDER: "Select Technician",
  ASSIGN_TECHNICIAN_SEARCH: "Search Technician",

  ROOTCAUSE_LABEL: "Root Cause",
  ROOTCAUSE_DESCRIPTION:
    "Ex: Motor bearing failure due to insufficient lubrication.",

  ACTION_LABEL: "Action",
  ACTION_DESCRIPTION: "Ex: Replaced the damaged motor bearing.",

  REMARKS_LABEL: "Remarks",
  REMARKS_DESCRIPTION: "Ex: Installed a new SKF bearing.",

  CREATE_BUTTON: "Report Breakdown",
  ASSIGN_BUTTON: "Assign Technician",
  RESOLVE_BUTTON: "Resolve Breakdown",
  CANCEL_BUTTON: "Cancel",
} as const;

export const BREAKDOWN_CARD_CONTENT = {
  REPORTED_BY: "Report By",
  ASSIGNED_TO: "Assigned To",
  UNASSIGNED: "Un Assigned",
  REPORTED_AT: "Reported At",
  VIEW: "View",
  ASSIGN_TECHNICIAN: "Assign Technician",
  RESOLVE: "Resolve",
} as const;
