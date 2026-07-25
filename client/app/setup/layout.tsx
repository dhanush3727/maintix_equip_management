import { AuthInitializer } from "../(workspace)/AuthInitializer";
import { Header } from "./Header";

export default function SetupLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <main>
      <AuthInitializer />
      <Header />
      {children}
    </main>
  );
}
