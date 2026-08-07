import { FieldGroup } from "@/components/ui";
import { useGetTaskbyId } from "../hooks/useGetTaskById";
import { UpdateTaskHeader } from "./UpdateTaskHeader";
import { UpdateTaskHeaderSkeleton } from "./UpdateTaskHeaderSkeletion";
import { TaskChecklistSkeleton } from "./TaskChecklistSkeleton";
import { UpdateTaskContent } from "./UpdateTaskContent";

interface UpdateTaskProp {
  id: number;
}

export function UpdateTask({ id }: UpdateTaskProp) {
  const { data: taskData, isLoading: isTask } = useGetTaskbyId(id);
  const task = taskData?.data;

  return (
    <div className="flex flex-col max-h-[90vh]">
      {isTask ? <UpdateTaskHeaderSkeleton /> : <UpdateTaskHeader task={task} />}

      <FieldGroup className="flex-1 overflow-y-auto p-5">
        {isTask
          ? Array.from({ length: 4 }, (_, i) => (
              <TaskChecklistSkeleton key={i} />
            ))
          : task?.checklistItems.map((item, index) => (
              <div
                key={item.id}
                className="space-y-4 rounded-lg border bg-card p-4"
              >
                <UpdateTaskContent item={item} index={index} />
              </div>
            ))}
      </FieldGroup>
    </div>
  );
}
