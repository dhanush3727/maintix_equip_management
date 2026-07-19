import { ROUTES } from "@/constants";

export const HERO_CONTENT = {
  badge: "EQUIPMENT MAINTENANCE SYSTEM",

  title: {
    mobile: "Every assets. Every Check. On time.",
    desktop: ["Every assets.", "Every check.", "On time."],
  },

  description:
    "Maintix runs preventive maintenance and breakdown response for process plants schedules, field checklists, and reliability metrics in one place.",
} as const;

export const HERO_BUTTON = [
  {
    label: "Get started — it's free",
    href: ROUTES.REGISTER,
  },
  {
    label: "Login",
    href: ROUTES.LOGIN,
  },
] as const;

export const HERO_CARD = {
  title: "Dashboard",

  counts: [
    {
      label: "Equipments",
      count: 150,
    },

    {
      label: "Due today",
      count: 10,
    },

    {
      label: "Overdue",
      count: 5,
    },
  ],

  list: [
    {
      equipId: "P-401",
      equipment: "Transfer Pump",
      badge: "INPROGRESS",
      variant: "info",
    },
    {
      equipId: "C-102",
      equipment: "Air Compressor",
      badge: "PENDING",
      variant: "warning",
    },
  ],

  sub_card: {
    title: "Breakdown raised - P-401",
    description: "Manager notified assign a technician",
  },
} as const;
