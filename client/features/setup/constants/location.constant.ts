export const LOCATION_CONTENT = {
  title: "Set Up Your Primary Location",
  description:
    "Create your primary location to get started. You can add additional locations later from the Locations settings.",

  name: "Location name",
  type: "Location type",
  address: "Location address",
  create: "Create & Continue",

  success_title: "Your Primary Location Is Ready",
  success_description:
    "Your primary location has been successfully created and is ready to use. This location will be used as the foundation for organizing your equipment, maintenance activities, and operational resources. If your organization operates across multiple sites, you can add additional locations at any time after completing the setup. Continue to the next step to finish setting up your Maintix workspace.",

  continue: "Continue",
} as const;

export const SETUP_LOCATION_ENDPOINT = {
  SETUP_LOCATION: "organization/location",
} as const;
