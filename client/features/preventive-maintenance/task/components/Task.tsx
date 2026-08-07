"use client";

import { useAuth, useEquipmentDD, useMeta, useUserDropdown } from "@/hooks";
import { TaskParams } from "../types/task.type";
import { useEffect, useRef, useState } from "react";
import { TASK_CONTENT } from "../constant/task.constant";
import { FilterItems } from "./FilterItems";
import { useGetTask } from "../hooks/useGetTask";
import { appToast, cn, getErrorMessage, getOptionLabel } from "@/lib";
import { ErrorState } from "./ErrorState";
import { EmptyState } from "./EmptyState";
import { TaskList } from "./TaskList";
import { SkeletionList } from "./SkeletionList";
import { Dialog, DialogContent, useSidebar } from "@/components/ui";
import { UpdateTask } from "./UpdateTask";
import { useCompleteTask } from "../hooks/useCompleteTask";

export interface TaskFilters {
  equipment?: number;
  status?: TaskParams["status"];
  assignedTo?: number;
  from?: string;
  to?: string;
}

export function Task() {
  const { open } = useSidebar();
  const { user } = useAuth();
  const { data: equipmentData, isLoading: isEquipment } = useEquipmentDD();
  const { data: meta, isLoading: isMeta } = useMeta();
  const { data: usersData, isLoading: isUsers } = useUserDropdown();
  const { mutate: completeTask } = useCompleteTask();
  const equipments = equipmentData?.data ?? [];
  const status = meta?.data?.taskStatus ?? [];
  const users = usersData?.data ?? [];

  const [params, setParams] = useState<TaskFilters>({});

  const taskParams: TaskParams = {
    ...params,
    equipment: getOptionLabel(equipments, params.equipment),
    assignedTo: getOptionLabel(users, params.assignedTo),
  };

  const {
    data: taskData,
    isLoading: isTask,
    isError: isTaskError,
    hasNextPage,
    fetchNextPage,
    isFetchingNextPage,
  } = useGetTask(taskParams);
  const tasks = taskData?.pages.flatMap((page) => page.data ?? []) ?? [];

  const loadMoreRef = useRef<HTMLDivElement | null>(null);
  useEffect(() => {
    const element = loadMoreRef.current;

    if (!element || !hasNextPage || isFetchingNextPage) return;

    const observe = new IntersectionObserver(
      (entries) => {
        const [entry] = entries;

        if (entry.isIntersecting) {
          fetchNextPage();
        }
      },
      {
        rootMargin: "200px",
      },
    );

    observe.observe(element);

    return () => {
      observe.disconnect();
    };
  }, [hasNextPage, fetchNextPage, isFetchingNextPage]);

  const [editTask, setEditTask] = useState<number | null>(null);

  const [completingTaskId, setCompletingTaskId] = useState<number | null>(null);
  const handleCompleteTask = (id: number) => {
    setCompletingTaskId(id);

    completeTask(
      { id },
      {
        onSuccess: (data) => {
          appToast.success(data.message);
        },
        onError: (err) => {
          appToast.error(getErrorMessage(err));
        },
      },
    );
  };

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

      <div
        className={cn(
          "grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3 2xl:grid-cols-4",
          open && "md:grid-cols-1 lg:grid-cols-2 2xl:grid-cols-3",
        )}
      >
        {isTask ? (
          Array.from({ length: 8 }, (_, i) => <SkeletionList key={i} />)
        ) : isTaskError ? (
          <ErrorState />
        ) : tasks.length === 0 ? (
          <EmptyState />
        ) : (
          tasks.map((item) => (
            <TaskList
              key={item.id}
              item={item}
              onEdit={setEditTask}
              userId={user?.id}
              completeTask={handleCompleteTask}
              completingTaskId={completingTaskId}
            />
          ))
        )}
      </div>

      {hasNextPage && (
        <div ref={loadMoreRef} className="flex h-10 justify-center">
          <span>{isFetchingNextPage && TASK_CONTENT.BUTTONS.LOADING_MORE}</span>
        </div>
      )}

      <Dialog
        open={editTask !== null}
        onOpenChange={(open) => {
          if (!open) {
            setEditTask(null);
          }
        }}
      >
        <DialogContent className={"w-[90vw] max-w-6xl"}>
          {editTask && <UpdateTask id={editTask} />}
        </DialogContent>
      </Dialog>
    </div>
  );
}
