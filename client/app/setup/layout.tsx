import { AuthInitializer } from "../(workspace)/AuthInitializer";
import { OnBoardingGuard } from "../OnboardingGuard";
import { Header } from "./Header";

export default function SetupLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <main>
      <OnBoardingGuard mode="setup">
        <AuthInitializer />
        <Header />
        {children}
      </OnBoardingGuard>
    </main>
  );
}
