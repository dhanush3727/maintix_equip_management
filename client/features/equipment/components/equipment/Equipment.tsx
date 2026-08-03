"use client";

import { DataPagination } from "@/components/common";
import { useEquipmentList } from "../../hooks/equipment/useEquipmentList";
import { EquipmentList } from "./EquipmentList";
import { useState } from "react";
import { LIMIT } from "@/constants";
import { EquipmentParams } from "../../types/equipment.type";
import { FilterItems } from "./FilterItems";

export function Equipment() {
  const [page, setPage] = useState<number>(1);
  const [search, setSearch] = useState<string>("");
  const [sortBy, setSortyBy] = useState<EquipmentParams["sortBy"] | "">("");
  const [order, setOrder] = useState<EquipmentParams["order"]>("desc");
  const 

  const {
    data: equipment,
    isLoading: isEquipment,
    isError: isEquipmentErr,
  } = useEquipmentList({
    page,
    limit: LIMIT,
  });

  const equipmentList = equipment?.data ?? [];
  const pagination = equipment?.pagination;

  return (
    <div className="space-y-6">
      <FilterItems
        search={search}
        setSearch={setSearch}
        sortBy={sortBy}
        setSortyBy={setSortyBy}
        order={order}
        setOrder={setOrder}
      />
      <div className="hidden lg:block">
        <EquipmentList
          equipmentList={equipmentList}
          isLoading={isEquipment}
          isError={isEquipmentErr}
        />
        {(!isEquipment || !isEquipmentErr) && (
          <DataPagination pagination={pagination} onPageChange={setPage} />
        )}
      </div>
    </div>
  );
}
