import { AppShell } from "@/components/layout/AppShell";
import { AuthInitializer } from "./AuthInitializer";
import { OnBoardingGuard } from "../OnboardingGuard";
import { RouteGuard } from "./RouteGuard";

export default function WorkspaceLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <OnBoardingGuard mode="dashboard">
      <AppShell>
        <AuthInitializer />
        <RouteGuard>{children}</RouteGuard>
      </AppShell>
    </OnBoardingGuard>
  );
}
