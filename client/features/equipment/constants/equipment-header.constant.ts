import { ROUTES } from "@/constants";

export const EQUIPMENT_HEADER_CONTENT = {
  EQUIPMENT_LIST_LABEL: "Equipment List",
  EQUIPMENT_TYPE_LABEL: "Equipment Type",

  ADD_EQUIPMENT: "Add Equipment",
  ADD_EQUIIPMENT_TYPE: "Add Equipment Type",
} as const;

export const EQUIPMENT_DIALOG = {
  EQUIPMENT: "equipment",
  EQUIPMENT_TYPE: "equipmentType",
} as const;

export type EquipmentDialog =
  | (typeof EQUIPMENT_DIALOG)[keyof typeof EQUIPMENT_DIALOG]
  | null;

export const EQUIPMENT_NAVIGATION = [
  {
    title: EQUIPMENT_HEADER_CONTENT.EQUIPMENT_LIST_LABEL,
    url: ROUTES.EQUIPMENT.LIST,
  },

  {
    title: EQUIPMENT_HEADER_CONTENT.EQUIPMENT_TYPE_LABEL,
    url: ROUTES.EQUIPMENT.TYPE,
  },
];
