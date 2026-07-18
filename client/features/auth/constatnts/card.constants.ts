import {
  Building2,
  CalendarCheck2,
  ClipboardCheck,
  TriangleAlert,
} from "lucide-react";

export const FEATURE_CARD = [
  {
    icon: Building2,
    title: "Your Organization",
    description:
      "Manage teams, plants, and departments from one workspace. Keep users organized with secure role-based access.",
    text: "text-[#ea6721]",
    bg: "bg-[#fff3ec]",
  },
  {
    icon: CalendarCheck2,
    title: "Preventive Maintenance",
    description:
      "Schedules auto-generate tasks at any frequency Engineers execute reusable checklists in the field.",
    text: "text-[#23864f]",
    bg: "bg-[#eaf8f0]",
  },
  {
    icon: ClipboardCheck,
    title: "Checklist Template",
    description:
      "Create reusable maintenance checklists for every equipment type. Standardize inspections and reduce errors.",
    text: "text-[#4d87f5]",
    bg: "bg-[#eef4ff]",
  },
  {
    icon: TriangleAlert,
    title: "Breakdown Maintenance",
    description:
      "Raise failure with urgency. Assign, track the timeline, resolve",
    text: "text-[#d84a3a]",
    bg: "bg-[#fdeeee]",
  },
] as const;
