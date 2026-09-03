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
  Users,
  Wrench,
} from "lucide-react";
import { ROUTES } from "@/constants";
import { useAuth, useSlug } from "@/hooks";
import { ROLE_IDS } from "@/constants/role.constant";
import { useRouter } from "next/navigation";

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
    url: ROUTES.PREVENTIVE_MAINTENANCE.SCHEDULE,
  },
  {
    title: "Breakdown",
    icon: TriangleAlert,
    url: ROUTES.BREAKDOWN,
  },
  {
    title: "Users",
    icon: Users,
    url: ROUTES.USERS,
  },
];

export function AppSidebar() {
  const { user } = useAuth();
  const router = useRouter();
  const { getSlugUrl } = useSlug();

  const canAccess = user?.roles.some(
    (role) => role.id === ROLE_IDS.ADMIN || role.id === ROLE_IDS.MANAGER,
  );

  const isAdmin = user?.roles.some((role) => role.id === ROLE_IDS.ADMIN);

  const visibleNavigation = navItems
    .filter((item) => {
      const isChecklist = item.url === ROUTES.CHECKLIST;
      const isUsers = item.url === ROUTES.USERS;

      return (!isChecklist || canAccess) && (!isUsers || isAdmin);
    })
    .map((item) => ({
      ...item,
      url: getSlugUrl(item.url),
    }));

  return (
    <Sidebar collapsible="icon" className="z-20">
      <SidebarHeader
        className="cursor-pointer"
        onClick={() => router.push(getSlugUrl(ROUTES.DASHBOARD))}
      >
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
        <NavItem items={visibleNavigation} />
      </SidebarContent>

      <SidebarFooter>
        <NavUser />
      </SidebarFooter>
    </Sidebar>
  );
}
