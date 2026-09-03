import { MaintenanceHeader } from "@/features/preventive-maintenance";

export default function MaintenanceLayout({
  children,
}: Readonly<{ children: React.ReactNode }>) {
  return (
    <>
      <MaintenanceHeader />
      {children}
    </>
  );
}
