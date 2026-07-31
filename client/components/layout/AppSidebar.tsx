"use client";

import Image from "next/image";
import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarHeader,
  SidebarSeparator,
} from "../ui";
import Logo from "@/constants/logo.constant";
import { NavItem } from "./NavItem";
import { NavUser } from "./NavUser";

import {
  ClipboardCheck,
  Cog,
  LayoutDashboard,
  TriangleAlert,
  Wrench,
} from "lucide-react";
import { ROUTES } from "@/constants";

export const navItems = [
  {
    title: "Dashboard",
    icon: LayoutDashboard,
    url: ROUTES.DASHBOARD,
  },
  {
    title: "Equipment",
    icon: Cog,
    url: ROUTES.EQUIPMENT.LIST,
  },
  {
    title: "Checklist",
    icon: ClipboardCheck,
    url: ROUTES.CHECKLIST,
  },
  {
    title: "Preventive Maintenance",
    icon: Wrench,
    url: ROUTES.PREVENTIVE_MAINTENANCE,
  },
  {
    title: "Breakdown",
    icon: TriangleAlert,
    url: ROUTES.BREAKDOWN,
  },
];

export function AppSidebar() {
  return (
    <Sidebar collapsible="icon">
      <SidebarHeader>
        <div className="flex items-center gap-3">
          <Image src={Logo} alt="Maintix" width={32} height={32} />
          <div className="flex flex-col group-data-[collapsible=icon]:hidden">
            <span className="text-lg font-bold">Maintix</span>
            <span className="text-muted-foreground text-xs">
              Maintenance System
            </span>
          </div>
        </div>
      </SidebarHeader>

      <SidebarSeparator />

      <SidebarContent className="py-3">
        <NavItem items={navItems} />
      </SidebarContent>

      <SidebarFooter>
        <NavUser />
      </SidebarFooter>
    </Sidebar>
  );
}
