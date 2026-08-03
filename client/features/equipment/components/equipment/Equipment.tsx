"use client";

import { DataPagination } from "@/components/common";
import { useEquipmentList } from "../../hooks/equipment/useEquipmentList";
import { EquipmentList } from "./EquipmentList";
import { useState } from "react";
import { TABLE_LIMIT } from "@/constants";
import { EquipmentParams } from "../../types/equipment.type";
import { FilterItems } from "./FilterItems";
import { useDebounce, useMeta, useOrganizationDD } from "@/hooks";
import { useEquipmentTypeDD } from "../../hooks/equipment-type/useEquipmentTypeDD";
import { EquipmentCard } from "./EquipmentCard";
import { useEquipmentInfiniteList } from "../../hooks/equipment/useEquipmentInfiniteList";

export interface DropdownOptions {
  value: string | number;
  label: string;
}

export function Equipment() {
  const { data: organization, isLoading: isOrganization } = useOrganizationDD();
  const { data: meta, isLoading: isMeta } = useMeta();
  const { data: equipType, isLoading: isEquipType } = useEquipmentTypeDD();

  const statusDD = meta?.data?.euqipmentStatus ?? [];
  const locationDD = organization?.data?.location ?? [];
  const deparmentDD = organization?.data?.department ?? [];
  const equipTypeDD = equipType?.data ?? [];

  const [page, setPage] = useState<number>(1);
  const [search, setSearch] = useState<string>("");
  const [sortBy, setSortyBy] = useState<EquipmentParams["sortBy"] | "">("");
  const [order, setOrder] = useState<EquipmentParams["order"]>("desc");
  const [status, setStatus] = useState<EquipmentParams["status"] | "">("");
  const [location, setLocation] = useState<number | undefined>(undefined);
  const [department, setDepartment] = useState<number | undefined>(undefined);
  const [type, setType] = useState<number | undefined>(undefined);

  const debouncedSearch = useDebounce(search, 500);

  // The location, type, department return {value: 1, label: "Mechanical"}
  // but for equipment param we want only string value not number so we get label instead of value
  const getOptionLabel = (
    options: DropdownOptions[],
    value: number | undefined,
  ): string => {
    const label = options.find((option) => value === option.value)?.label || "";

    return label;
  };

  const locationName = getOptionLabel(locationDD, location);
  const departmentName = getOptionLabel(deparmentDD, department);
  const typeName = getOptionLabel(equipTypeDD, type);

  // Hook for desktop
  const {
    data: equipment,
    isLoading: isEquipment,
    isError: isEquipmentErr,
  } = useEquipmentList({
    page,
    limit: TABLE_LIMIT,
    search: debouncedSearch,
    sortBy: sortBy || undefined,
    order,
    status: status || undefined,
    location: locationName,
    department: departmentName,
    type: typeName,
  });

  const equipmentList = equipment?.data ?? [];
  const pagination = equipment?.pagination;

  // Hook for mobile
  const {
    data: cardEquipment,
    isLoading: isCardEquipment,
    isError: isCardEquipmentError,
    hasNextPage,
    isFetchingNextPage,
    fetchNextPage,
  } = useEquipmentInfiniteList({
    search: debouncedSearch,
    sortBy: sortBy || undefined,
    order,
    status: status || undefined,
    location: locationName,
    department: departmentName,
    type: typeName,
  });

  const cardEquipmentList =
    cardEquipment?.pages.flatMap((page) => page.data ?? []) ?? [];

  return (
    <div className="space-y-6">
      <FilterItems
        search={search}
        setSearch={setSearch}
        sortBy={sortBy}
        setSortyBy={setSortyBy}
        order={order}
        setOrder={setOrder}
        status={status}
        setStatus={setStatus}
        location={location}
        setLocation={setLocation}
        department={department}
        setDepartment={setDepartment}
        type={type}
        setType={setType}
        statusDD={statusDD}
        locationDD={locationDD}
        departmentDD={deparmentDD}
        equipTypeDD={equipTypeDD}
        isEquipType={isEquipType}
        isOrganization={isOrganization}
        isMeta={isMeta}
      />

      <div className="lg:hidden">
        <EquipmentCard
          equipmentList={cardEquipmentList}
          isLoading={isCardEquipment}
          isError={isCardEquipmentError}
          hasNextPage={hasNextPage}
          isFetchingNextPage={isFetchingNextPage}
          fetchNextPage={fetchNextPage}
        />
      </div>

      <div className="hidden lg:block">
        <EquipmentList
          equipmentList={equipmentList}
          isLoading={isEquipment}
          isError={isEquipmentErr}
        />
        {!isEquipment && !isEquipmentErr && pagination && (
          <DataPagination pagination={pagination} onPageChange={setPage} />
        )}
      </div>
    </div>
  );
}
