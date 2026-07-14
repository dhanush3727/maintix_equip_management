"use client";

import Image from "next/image";
import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarHeader,
  SidebarSeparator,
} from "../ui";
import Logo from "@/assets/logo.png";
import { NavItem } from "./NavItem";
import { NavUser } from "./NavUser";

import {
  ClipboardCheck,
  Cog,
  LayoutDashboard,
  TriangleAlert,
  Wrench,
} from "lucide-react";

export const navItems = [
  {
    title: "Dashboard",
    icon: LayoutDashboard,
    url: "/dashboard",
  },
  {
    title: "Equipment",
    icon: Cog,
    url: "/equipment",
  },
  {
    title: "Checklist",
    icon: ClipboardCheck,
    url: "/checklist",
  },
  {
    title: "Preventive Maintenance",
    icon: Wrench,
    url: "/preventive-maintenance",
  },
  {
    title: "Breakdown",
    icon: TriangleAlert,
    url: "/breakdown",
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
