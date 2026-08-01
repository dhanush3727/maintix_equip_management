export const EQUIPMENT_TYPE_ENDPOINTS = {
  CREATE: "equipment/equipment-type",
  GET_LIST: "equipment/equipment-type",
  GET_DROPDOWN: "equipment/equipment-type/dropdown",
  GET_BY_ID: (id: number) => `equipment/equipment-type/${id}`,
  UPDATE: (id: number) => `equipment/equipment-type/${id}`,
  ACTIVATE: (id: number) => `equipment/equipment-type/${id}/activate`,
  DEACTIVATE: (id: number) => `equipment/equipment-type/${id}/deactivate`,
};

export const EQUIPMENT_TYPE_CONTENT = {
  TITLE: "Add Equipment Type",
  DESCRIPTION: "Create a new equipment type for your organization.",

  UPDATE: {
    TITLE: "Update Equipment Type",
    DESCRIPITON: "Update the equipment type details and save your changes.",
  },

  FILTERS: {
    SEARCH: "Search Equipment type...",
    SORTBY: "Sort by",
    ORDER: "Order",
  },

  SORTBY: {
    NAME_VALUE: "name",
    CODE_VALUE: "code",
  },

  ORDER: {
    ASC_VALUE: "asc",
    DESC_VALUE: "desc",
  },

  FIELD: {
    NAME_LABEL: "Type Name",
    NAME_PLACEHOLDER: "e.g., Pump",

    CODE_LABEL: "Code",
    CODE_PLACEHOLDER: "e.g., PUMP",

    DESCRIPTION_LABEL: "Description",
    DESCRIPTION_PLACEHOLDER: "e.g., Equipment used for fluid transfer",
  },

  BUTTON: {
    SUBMIT: "Sumbit",
    CANCEL: "Cancel",
    LOAD_MORE: "Click to load more",
    LOADING_MORE: "Loading More...",
    UPDATE: "Update",
  },

  TOGGLE: {
    ACTIVE: "Active",
    INACTIVE: "Inactive",
  },

  NO_DATA: {
    TITLE: "No equipment types found",
    DESCRIPTION: "Create an equipment type to get started",
  },

  ERROR: {
    TITLE: "Unable to load equipment types",
    DESCRIPTION:
      "Soemthing went wrong while loading equipment types. Please try again.",
  },
};
