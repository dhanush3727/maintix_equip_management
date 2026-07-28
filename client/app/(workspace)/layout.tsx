import { AppShell } from "@/components/layout/AppShell";
import { AuthInitializer } from "./AuthInitializer";
import { OnBoardingGuard } from "../OnboardingGuard";

export default function WorkspaceLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <OnBoardingGuard mode="dashboard">
      <AppShell>
        <AuthInitializer />
        {children}
      </AppShell>
    </OnBoardingGuard>
  );
}
