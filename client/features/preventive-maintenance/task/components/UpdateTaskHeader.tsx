import { DialogDescription, DialogHeader, DialogTitle } from "@/components/ui";
import { TaskDataById } from "../types/task.type";
import { AlertTriangle, CalendarDays, Clock3, Wrench } from "lucide-react";
import { TASK_CONTENT } from "../constant/task.constant";
import { formatStartDate } from "../../schedule/util/schedule.util";

interface UpateTaskHeaderProps {
  task?: TaskDataById;
}

export function UpdateTaskHeader({ task }: UpateTaskHeaderProps) {
  return (
    <DialogHeader className="space-y-4">
      <div className="min-w-0 space-y-1 pr-8">
        <DialogTitle className="truncate text-xl">{task?.title}</DialogTitle>

        <DialogDescription className="flex items-center gap-2">
          <Wrench className="size-4" />
          {task?.equipmentName}
        </DialogDescription>
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 rounded-lg border bg-muted/30 p-4 text-sm">
        <div className="flex items-center gap-3">
          <Clock3 className="size-4 text-muted-foreground" />

          <div>
            <p className="text-muted-foreground">{TASK_CONTENT.FIELD.STATUS}</p>
            <p className="font-medium">{task?.status}</p>
          </div>
        </div>

        <div className="flex items-center gap-3">
          <CalendarDays className="size-4 text-muted-foreground" />

          <div>
            <p className="text-muted-foreground">
              {TASK_CONTENT.FIELD.DUE_DATE}
            </p>

            <p className="font-medium">
              {formatStartDate(task?.dueDate ?? "")}
            </p>
          </div>
        </div>

        {task?.isOverdue && (
          <div className="flex w-40 items-center gap-2 rounded-md bg-destructive/10 px-3 py-2 text-destructive">
            <AlertTriangle className="size-4" />

            <span className="font-medium">{TASK_CONTENT.FIELD.OVERDUE}</span>
          </div>
        )}
      </div>
    </DialogHeader>
  );
}
