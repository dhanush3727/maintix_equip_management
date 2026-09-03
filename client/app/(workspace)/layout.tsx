import { AppShell } from "@/components/layout/AppShell";
import { AuthInitializer } from "./AuthInitializer";
import { OnBoardingGuard } from "../OnboardingGuard";

interface WorkspaceLayoutProp {
  children: React.ReactNode;
}

export default function WorkspaceLayout({ children }: WorkspaceLayoutProp) {
  return (
    <OnBoardingGuard mode="dashboard">
      <AppShell>
        <AuthInitializer />
        {children}
      </AppShell>
    </OnBoardingGuard>
  );
}
