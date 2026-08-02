"use client";

import { useEquipmentList } from "../../hooks/equipment/useEquipmentList";
import { EquipmentList } from "./EquipmentList";

export function Equipment() {
  const {
    data: equipment,
    isLoading: isEquipment,
    isError,
    hasNextPage,
    fetchNextPage,
    isFetchingNextPage,
  } = useEquipmentList();

  const equipmentList =
    equipment?.pages.flatMap((page) => page.data ?? []) ?? [];

  return (
    <div className="space-y-6">
      <div className="hidden lg:block">
        <EquipmentList equipmentList={equipmentList} />
      </div>
    </div>
  );
}
