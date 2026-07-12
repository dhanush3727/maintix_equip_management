import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarGroup,
  SidebarHeader,
  SidebarProvider,
  SidebarTrigger,
} from "@/components/ui";

export default function Home() {
  return (
    <>
      <SidebarProvider>
        <Sidebar collapsible="icon">
          <SidebarHeader>Maintix</SidebarHeader>
          <SidebarContent></SidebarContent>
        </Sidebar>
        <SidebarTrigger />
      </SidebarProvider>
    </>
  );
}
