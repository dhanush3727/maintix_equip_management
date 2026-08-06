"use client";

import { DataPagination } from "@/components/common";
import { useEquipmentList } from "../../hooks/equipment/useEquipmentList";
import { EquipmentList } from "./EquipmentList";
import { useState } from "react";
import { TABLE_LIMIT } from "@/constants";
import { EquipmentParams } from "../../types/equipment.type";
import { FilterItems } from "./FilterItems";
import {
  useDebounce,
  useMediaQuery,
  useMeta,
  useOrganizationDD,
} from "@/hooks";
import { useEquipmentTypeDD } from "../../hooks/equipment-type/useEquipmentTypeDD";
import { EquipmentCard } from "./EquipmentCard";
import { useEquipmentInfiniteList } from "../../hooks/equipment/useEquipmentInfiniteList";
import { Dialog, DialogContent } from "@/components/ui";
import { EditEquipment } from "./EditEquipment";
import { getOptionLabel } from "../../utils/equipment.utils";

export function Equipment() {
  const { data: organization, isLoading: isOrganization } = useOrganizationDD();
  const { data: meta, isLoading: isMeta } = useMeta();
  const { data: equipType, isLoading: isEquipType } = useEquipmentTypeDD();

  // This is help to call the api hook
  // if the width match with lg size then it run the equipment list hook
  // if false then run the infinte query hook
  const isDesktop = useMediaQuery("(min-width: 1280px)");

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

  const locationName = getOptionLabel(locationDD, location);
  const departmentName = getOptionLabel(deparmentDD, department);
  const typeName = getOptionLabel(equipTypeDD, type);

  const resetPage = () => {
    setPage((prev) => (prev === 1 ? prev : 1));
  };

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

    // Fetch only desktop width
    enabled: isDesktop === true,
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

    // Fetch only specific width
    enabled: isDesktop === false,
  });

  const cardEquipmentList =
    cardEquipment?.pages.flatMap((page) => page.data ?? []) ?? [];

  // Edit equipment
  const [editEquipId, setEditEquipId] = useState<number | null>(null);

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
        onFilterChange={resetPage}
      />

      <div className="xl:hidden">
        <EquipmentCard
          equipmentList={cardEquipmentList}
          isLoading={isCardEquipment}
          isError={isCardEquipmentError}
          hasNextPage={hasNextPage}
          isFetchingNextPage={isFetchingNextPage}
          fetchNextPage={fetchNextPage}
          onEdit={setEditEquipId}
        />
      </div>

      <div className="hidden xl:block">
        <EquipmentList
          equipmentList={equipmentList}
          isLoading={isEquipment}
          isError={isEquipmentErr}
          onEdit={setEditEquipId}
        />
        {!isEquipment && !isEquipmentErr && pagination && (
          <DataPagination pagination={pagination} onPageChange={setPage} />
        )}
      </div>

      <Dialog
        open={editEquipId !== null}
        onOpenChange={(open) => {
          if (!open) {
            setEditEquipId(null);
          }
        }}
      >
        <DialogContent className={"w-[90vw] max-w-6xl"}>
          {editEquipId !== null && (
            <EditEquipment
              id={editEquipId}
              onClose={() => setEditEquipId(null)}
              equipTypeDD={equipTypeDD}
              locationDD={locationDD}
              departmentDD={deparmentDD}
              isOrganization={isOrganization}
              isEquipType={isEquipType}
            />
          )}
        </DialogContent>
      </Dialog>
    </div>
  );
}
