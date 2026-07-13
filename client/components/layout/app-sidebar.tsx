"use client";

import Image from "next/image";
import {
  Separator,
  Sidebar,
  SidebarContent,
  SidebarHeader,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
} from "../ui";
import Logo from "@/assets/logo.png";
import { LayoutDashboard } from "lucide-react";

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
      <Separator />

      <SidebarContent className="py-3">
        <SidebarMenu>
          <SidebarMenuItem>
            <SidebarMenuButton>
              <LayoutDashboard />
              <span className="text-lg">Dashboard</span>
            </SidebarMenuButton>
          </SidebarMenuItem>
        </SidebarMenu>
      </SidebarContent>
    </Sidebar>
  );
}
