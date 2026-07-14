import { cookies } from "next/headers";
import { SidebarInset, SidebarProvider } from "../ui";
import { AppSidebar } from "./AppSidebar";
import React from "react";
import { AppHeader } from "./AppHeader";

interface AppShellProps {
  children: React.ReactNode;
}

export async function AppShell({ children }: AppShellProps) {
  // The cookies() function is only available in server components, so we need to make this component async to use it.
  const cookieStore = await cookies();

  // Check if the sidebar_state cookie is set to "true" to determine the default open state of the sidebar.
  // It returns true if the cookie is set to "true", otherwise it returns false.
  const defaultOpen = cookieStore.get("sidebar_state")?.value === "true";

  return (
    <SidebarProvider defaultOpen={defaultOpen}>
      <AppSidebar />

      <SidebarInset>
        <AppHeader />
        <main className="p-6">{children}</main>
      </SidebarInset>
    </SidebarProvider>
  );
}
