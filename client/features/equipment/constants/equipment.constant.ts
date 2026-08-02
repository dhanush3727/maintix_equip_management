export const EQUIPMENT_ENDPOINT = {
  CREATE: "equipment",
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
  },

  BUTTON: {
    SUBMIT: "Submit",
    CANCEL: "Cancel",
    UPDATE: "Update",
  },
} as const;
