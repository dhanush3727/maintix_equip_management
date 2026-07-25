import { AppShell } from "@/components/layout/AppShell";
import { AuthInitializer } from "./AuthInitializer";

export default function WorkspaceLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <AppShell>
      <AuthInitializer />
      {children}
    </AppShell>
  );
}
