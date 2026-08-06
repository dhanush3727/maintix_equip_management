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

  const resetPage = () => {
    setParams((prev) => ({
      ...prev,
      page: prev.page === 1 ? prev.page : 1,
    }));
  };

  // Get equipment lists
  const isDesktop = useMediaQuery("(min-width: 1024px)");
  const { data: scheduleData, isLoading: isSchedule } = useScheduleList({
    ...scheduleParams,
    enabled: isDesktop === true,
  });

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
        onFilterChange={resetPage}
      />
    </div>
  );
}
