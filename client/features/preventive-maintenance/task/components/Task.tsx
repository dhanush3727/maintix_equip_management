"use client";

import { useEquipmentDD, useMeta, useUserDropdown } from "@/hooks";
import { TaskParams } from "../types/task.type";
import { useEffect, useRef, useState } from "react";
import { TASK_CONTENT } from "../constant/task.constant";
import { FilterItems } from "./FilterItems";
import { useGetTask } from "../hooks/useGetTask";
import { getOptionLabel } from "@/lib";

export interface TaskFilters {
  equipment?: number;
  status?: TaskParams["status"];
  users?: number;
  from?: string;
  to?: string;
}

export function Task() {
  const { data: equipmentData, isLoading: isEquipment } = useEquipmentDD();
  const { data: meta, isLoading: isMeta } = useMeta();
  const { data: usersData, isLoading: isUsers } = useUserDropdown();
  const equipments = equipmentData?.data ?? [];
  const status = meta?.data?.taskStatus ?? [];
  const users = usersData?.data ?? [];

  const [params, setParams] = useState<TaskFilters>({});

  const taskParams: TaskParams = {
    ...params,
    equipment: getOptionLabel(equipments, params.equipment),
    assignedTo: getOptionLabel(users, params.users),
  };

  const {
    data: taskData,
    isLoading: isTask,
    isError: isTaskError,
    hasNextPage,
    fetchNextPage,
    isFetchingNextPage
  } = useGetTask(taskParams);
  const tasks = taskData?.pages.flatMap((page) => page.data ?? []) ?? [];

  const loadMoreRef = useRef<HTMLDivElement | null>(null);
  useEffect(() => {
    const element = loadMoreRef.current;

    if(!element || !hasNextPage || isFetchingNextPage) return;

    const observe = new IntersectionObserver ((entries))
  },[])

  return (
    <div className="space-y-6">
      <div className="space-y01">
        <h1 className="text-2xl font-semibold tracking-tight">
          {TASK_CONTENT.HEADER.TITLE}
        </h1>
        <p className="text-sm text-muted-foreground">
          {TASK_CONTENT.HEADER.DESCRIPTION}
        </p>
      </div>

      <FilterItems
        params={params}
        setParams={setParams}
        equipments={equipments}
        isEquipment={isEquipment}
        status={status}
        isMeta={isMeta}
        users={users}
        isUsers={isUsers}
      />
    </div>
  );
}
