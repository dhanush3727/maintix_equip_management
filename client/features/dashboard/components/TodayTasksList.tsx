"use client";

import {
  Avatar,
  AvatarFallback,
  Badge,
  Button,
  Separator,
  Tooltip,
  TooltipContent,
  TooltipTrigger,
} from "@/components/ui";
import { DASHBOARD_CONTENT } from "../constants/dashboard.constant";
import { TodayTasks } from "../types/dashboard.type";
import { ArrowRight } from "lucide-react";
import { useRouter } from "next/navigation";
import { ROUTES } from "@/constants";
import { TaskStatus } from "@/types";

export interface TodayTasksListProps {
  pmTasks: TodayTasks[];
  isDashboard: boolean;
}

export function TodayTasksList({ pmTasks, isDashboard }: TodayTasksListProps) {
  const router = useRouter();

  const hasData = pmTasks.length !== 0;

  return (
    <div className="flex-1 space-y-2">
      <div className="flex justify-between">
        <p className="text-base font-semibold text-muted-foreground">
          {DASHBOARD_CONTENT.TODAY_TASK_TITLE}
        </p>

        <Button
          variant={"ghost"}
          className={"text-primary"}
          onClick={() => router.push(ROUTES.PREVENTIVE_MAINTENANCE)}
        >
          All tasks
          <ArrowRight className="size-4" />
        </Button>
      </div>

      {hasData ? (
        <div className="space-y-4">
          {pmTasks.slice(0, 3).map((task) => (
            <div key={task.id}>
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-3">
                  <p className="text-sm text-muted-foreground">
                    {task.equipment}
                  </p>

                  <p className="font-medium">{task.title}</p>
                </div>

                <div className="ml-4 flex shrink-0 items-center gap-3">
                  <Badge
                    variant={
                      task.status === TaskStatus.IN_PROGRESS
                        ? "info"
                        : task.status === TaskStatus.SKIPPED
                          ? "warning"
                          : task.status === TaskStatus.COMPLETED
                            ? "success"
                            : "default"
                    }
                  >
                    {task.status}
                  </Badge>

                  <Tooltip>
                    <TooltipTrigger>
                      <Avatar size="sm">
                        <AvatarFallback>
                          {task.userName.charAt(0).toUpperCase()}
                        </AvatarFallback>
                      </Avatar>
                    </TooltipTrigger>

                    <TooltipContent>
                      <p>{task.userName}</p>
                    </TooltipContent>
                  </Tooltip>
                </div>
              </div>

              <Separator className="mt-4" />
            </div>
          ))}
        </div>
      ) : (
        <div className="flex h-full items-center justify-center text-sm text-muted-foreground pb-6">
          {DASHBOARD_CONTENT.NO_DATA}
        </div>
      )}
    </div>
  );
}
