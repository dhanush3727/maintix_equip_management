"use client";

import {
  useChecklistDD,
  useEquipmentDD,
  useMediaQuery,
  useMeta,
} from "@/hooks";
import { FilterItems } from "./FilterItems";
import { useState } from "react";
import { ScheduleParams } from "../types/schedule.type";
import { getOptionLabel } from "@/lib";
import { useScheduleList } from "../hooks/useScheduleList";
import { ScheduleTable } from "./ScheduleTable";
import { DataPagination } from "@/components/common";
import { useScheduleInfiniteList } from "../hooks/useScheduleInfiniteList";
import { ScheduleCard } from "./ScheduleCard";
import { Dialog, DialogContent } from "@/components/ui";
import { UpdateSchedule } from "./UpdateSchedule";

export interface ScheduleParamsValues {
  page?: number;
  equipment?: number;
  template?: number;
  frequencyType?: ScheduleParams["frequencyType"];
  from?: string;
  to?: string;
}

export function Schedule() {
  // For filters
  const { data: equipmentData, isLoading: isEquipment } = useEquipmentDD();
  const { data: checklistData, isLoading: isChecklist } = useChecklistDD();
  const { data: meta, isLoading: isMeta } = useMeta();

  const equipments = equipmentData?.data ?? [];
  const checklists = checklistData?.data ?? [];
  const frequencyType = meta?.data?.frequencyType ?? [];

  const [params, setParams] = useState<ScheduleParamsValues>({});

  const scheduleParams: ScheduleParams = {
    ...params,
    equipment: getOptionLabel(equipments, params.equipment),
    template: getOptionLabel(checklists, params.template),
  };

  const isDesktop = useMediaQuery("(min-width: 1280px)");

  const handlePage = (page: number) => {
    setParams((prev) => ({
      ...prev,
      page,
    }));
  };

  const {
    data: scheduleTableData,
    isLoading: isScheduleTable,
    isError: isScheduleTableError,
  } = useScheduleList({
    ...scheduleParams,
    enabled: isDesktop === true,
  });
  const scheduleTableList = scheduleTableData?.data ?? [];
  const pagination = scheduleTableData?.pagination;

  // Get scheduel lists for mobile
  const {
    data: scheduleCardData,
    isLoading: isScheduleCard,
    isError: isScheduleCardError,
    hasNextPage,
    isFetchingNextPage,
    fetchNextPage,
  } = useScheduleInfiniteList({
    ...scheduleParams,
    enabled: isDesktop === false,
  });
  const scheduleCardList =
    scheduleCardData?.pages.flatMap((page) => page.data ?? []) ?? [];

  const [editScheduleId, setEditScheduleId] = useState<number | null>(null);

  return (
    <div className="space-y-6">
      <FilterItems
        equipments={equipments}
        isEquipment={isEquipment}
        checklists={checklists}
        isChecklist={isChecklist}
        frequencyType={frequencyType}
        isMeta={isMeta}
        params={params}
        setParams={setParams}
      />

      <div className="hidden xl:block">
        <ScheduleTable
          scheduleList={scheduleTableList}
          isLoading={isScheduleTable}
          isError={isScheduleTableError}
          onEdit={setEditScheduleId}
        />

        {!isScheduleTable && !isScheduleTableError && pagination && (
          <DataPagination pagination={pagination} onPageChange={handlePage} />
        )}
      </div>

      <div className="xl:hidden">
        <ScheduleCard
          scheduleList={scheduleCardList}
          isLoading={isScheduleCard}
          isError={isScheduleCardError}
          hasNextPage={hasNextPage}
          isFetchingNextPage={isFetchingNextPage}
          fetchNextPage={fetchNextPage}
          onEdit={setEditScheduleId}
        />
      </div>

      <Dialog
        open={editScheduleId !== null}
        onOpenChange={(open) => {
          if (!open) {
            setEditScheduleId(null);
          }
        }}
      >
        <DialogContent className={"w-[90vw] max-w-6xl"}>
          {editScheduleId !== null && (
            <UpdateSchedule
              id={editScheduleId}
              onClose={() => setEditScheduleId(null)}
            />
          )}
        </DialogContent>
      </Dialog>
    </div>
  );
}
