import { EquipmentHeader } from "@/features/equipment";

export default function EquipmentLayout({
  children,
}: Readonly<{ children: React.ReactNode }>) {
  return (
    <>
      <EquipmentHeader />
      {children}
    </>
  );
}
