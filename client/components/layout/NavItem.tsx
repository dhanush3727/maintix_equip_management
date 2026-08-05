"use client";

import React from "react";
import {
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  useSidebar,
} from "../ui";
import Link from "next/link";
import { usePathname } from "next/navigation";

interface NavItemType {
  title: string;
  icon: React.ElementType; // ElementType is used for React components that are passed as props
  url: string;
}

interface NavItemProp {
  items: NavItemType[];
}

export function NavItem({ items }: NavItemProp) {
  const pathname = usePathname();
  const { isMobile, setOpenMobile } = useSidebar();

  const isActive = (url: string): boolean => {
    return pathname === url || pathname.startsWith(`${url}/`);
  };``

  return (
    <SidebarMenu>
      {items.map((item) => {
        const Icon = item.icon;

        return (
          <SidebarMenuItem key={item.title} className="pb-2">
            <SidebarMenuButton
              render={
                <Link
                  href={item.url}
                  // This onClick handler is used to close the mobile sidebar when a navigation item is clicked.
                  // It checks if the sidebar is in mobile mode (isMobile) and if so, it calls setOpenMobile(false) to close the sidebar.
                  onClick={() => {
                    if (isMobile) setOpenMobile(false);
                  }}
                />
              }
              className="m-2 group-data-[collapsible=icon]:m-0"
              isActive={isActive(item.url)}
              tooltip={item.title}
            >
              <Icon />
              <span className="font-medium text-base group-data-[collapsible=icon]:hidden">
                {item.title}
              </span>
            </SidebarMenuButton>
          </SidebarMenuItem>
        );
      })}
    </SidebarMenu>
  );
}
