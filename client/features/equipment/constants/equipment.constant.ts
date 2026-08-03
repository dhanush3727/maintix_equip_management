export const EQUIPMENT_ENDPOINT = {
  CREATE: "equipment",
  LIST: "equipment",
  GET_BY_ID: (id: number) => `equipment/${id}`,
  UPDATE: (id: number) => `equipment/${id}`,
  ACTIVATE: (id: number) => `equipment/${id}/activate`,
  DEACTIVATE: (id: number) => `equipment/${id}/deactivate`,
};

export const EQUIPMENT_CONTENT = {
  CREATE: {
    TITLE: "Add Equipment",
    DESCRIPTION:
      "Add the details of the equipment to keep maintenance and asset information organized.",
  },

  UPDATE: {
    TITLE: "Update Equipment",
    DESCRIPTION:
      "Update the equipment details to keep maintenance and asset information accurate.",
  },

  FIELD: {
    NAME_LABEL: "Name",
    NAME_PLACEHOLDER: "e.g., Conveyor belts",

    CODE_LABEL: "CODE",
    CODE_PLACEHOLDER: "e.g., CB-001",

    SERIAL_NUMBER_LABEL: "Serial Number",
    SERIAL_NUMBER_PLACEHOLDER: "e.g., CB-123",

    EQUIPMENT_TYPE_LABEL: "Equiment Type",
    EQUIPMENT_TYPE_PLACEHOLDER: "Select Equipment Type",
    EQUIPMENT_TYPE_SEARCH: "Search equipment type",

    LOCATION_LABEL: "Location",
    LOCATION_PLACEHOLDER: "Select Location",
    LOCATION_SEARCH: "Search location",

    DEPARTMENT_LABEL: "Department",
    DEPARTMENT_PLACEHOLDER: "Select Department",
    DEPARTMENT_SEARCH: "Search department",

    INSTALLED_DATE_LABEL: "Installed Date",
    INSTALLED_DATE_PLACEHOLDER: "Installed Date",

    WARRANTY_EXPIRY_LABEL: "Warranty Expiry",
    WARRANTY_EXPIRY_PLACEHOLDER: "Warranty Expiry",

    MANUFACTURER_LABEL: "Manufacturer",
    MANUFACTURER_PLACEHOLDER: "e.g., Siemens",

    MODEL_LABEL: "Model",
    MODEL_PLACEHOLDER: "e.g., SINAMICS G120",

    STATUS_LABEL: "Status",
  },

  TABLE: {
    EQUIPMENT_NAME: "Name",
    EQUIPMENT_CODE: "Code",
    EQUIPMENT_TYPE: "Equipment Type",
    LOCATION_NAME: "Location",
    DEPARTMENT_NAME: "Department",
    STATUS_NAME: "Status",
    ACTION: "Action",
  },

  FILTERS: {
    SEARCH: "Search Equipment...",
    SORTBY: "Sort by",
    ORDER: "Order",

    STATUS: "Select Status",
    SEARCH_STATUS: "Search status",

    LOCATION: "Select location",
    SEARCH_LOCATION: "Search location",

    DEPARTMENT: "Select department",
    SEARCH_DEPARTMENT: "Search department",

    TYPE: "Select type",
    SEARCH_TYPE: "Search type",
  },

  SORTBY: {
    NAME_VALUE: "name",
    CODE_VALUE: "code",
  },

  ORDER: {
    ASC_VALUE: "asc",
    DESC_VALUE: "desc",
  },

  BUTTON: {
    SUBMIT: "Submit",
    CANCEL: "Cancel",
    UPDATE: "Update",
    LOADING_MORE: "Loading More...",
  },

  TOGGLE: {
    ACTIVE: "Active",
    INACTIVE: "Inactive",
  },

  NO_DATA: {
    TITLE: "No equipments found",
    DESCRIPTION: "Create an equipment to get started",
  },

  ERROR: {
    TITLE: "Unable to load equipments",
    DESCRIPTION:
      "Soemthing went wrong while loading equipments. Please try again.",
  },
} as const;

export const EQUIPMENT_TABLE_COLUMNS = [
  {
    key: "name",
    label: EQUIPMENT_CONTENT.TABLE.EQUIPMENT_NAME,
  },
  {
    key: "code",
    label: EQUIPMENT_CONTENT.TABLE.EQUIPMENT_CODE,
  },
  {
    key: "equipmentType",
    label: EQUIPMENT_CONTENT.TABLE.EQUIPMENT_TYPE,
  },
  {
    key: "location",
    label: EQUIPMENT_CONTENT.TABLE.LOCATION_NAME,
  },
  {
    key: "department",
    label: EQUIPMENT_CONTENT.TABLE.DEPARTMENT_NAME,
  },
  {
    key: "status",
    label: EQUIPMENT_CONTENT.TABLE.STATUS_NAME,
  },
  {
    key: "actions",
    label: EQUIPMENT_CONTENT.TABLE.ACTION,
  },
] as const;
