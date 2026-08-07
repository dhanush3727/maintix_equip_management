import { Button } from "@/components/ui";
import { ChecklistItems } from "../types/task.type";
import { TASK_CONTENT } from "../constant/task.constant";
import { ChecklistItemType, TaskStatus } from "@/types";
import { BooleanValue } from "./BooleanValue";
import { NumberValue } from "./NumberValue";
import { SelectValue } from "./SelectValue";
import { TextValue } from "./TextValue";
import { useForm, useWatch } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { taskSchema, TaskSchemaValues } from "../schema/task.schema";
import { useUpdateTaskItem } from "../hooks/useUpdateTaskItem";
import { appToast, getErrorMessage } from "@/lib";
import { LoaderCircle, Save } from "lucide-react";
import { useAuth } from "@/hooks";

interface UpdateTaskContentProps {
  item: ChecklistItems;
  index: number;
  userId: number;
  status: TaskStatus;
}

export function UpdateTaskContent({
  item,
  index,
  userId,
  status,
}: UpdateTaskContentProps) {
  const { user } = useAuth();
  const updateTask = useUpdateTaskItem();

  const form = useForm<TaskSchemaValues>({
    resolver: zodResolver(taskSchema),
    defaultValues: {
      actualValue: item.actualValue ?? "",
      remarks: "",
    },
  });

  const actualValue = useWatch({
    control: form.control,
    name: "actualValue",
  });

  const onSubmit = () => {
    const payload: TaskSchemaValues = {
      actualValue,
    };

    updateTask.mutate(
      { id: item.taskId, itemId: item.id, payload },
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

  const canAccessButton =
    actualValue && actualValue !== item.actualValue && userId === user?.id;

  const disabled = userId !== user?.id || status === TaskStatus.COMPLETED;

  return (
    <div className="flex flex-col items-start justify-between gap-4">
      <div className="min-w-0 flex-1">
        <h3 className="truncate font-medium">
          {index + 1}. {item.name}
        </h3>

        {item.type !== ChecklistItemType.TEXT && (
          <>
            <p className="mt-1 text-sm text-muted-foreground">
              {TASK_CONTENT.FIELD.EXPECTED}: {item.expectedValue ?? "-"}
            </p>
            <p className="text-sm text-muted-foreground">
              {item.type === ChecklistItemType.NUMBER &&
                `${TASK_CONTENT.FIELD.RANGE}: ${item.minValue} - ${item.maxValue}`}
            </p>
          </>
        )}
      </div>

      <div className="w-full space-y-2">
        <p className="text-sm font-medium">{TASK_CONTENT.FIELD.ACTUAL}</p>
        {item.type === ChecklistItemType.BOOLEAN ? (
          <BooleanValue form={form} index={index} disabled={disabled} />
        ) : item.type === ChecklistItemType.NUMBER ? (
          <NumberValue form={form} disabled={disabled} />
        ) : item.type === ChecklistItemType.SELECT ? (
          <SelectValue options={item.options} form={form} disabled={disabled} />
        ) : (
          <TextValue form={form} disabled={disabled} />
        )}
      </div>

      {canAccessButton && (
        <Button
          size="sm"
          className={"self-end"}
          onClick={onSubmit}
          disabled={updateTask.isPending}
        >
          {updateTask.isPending ? (
            <LoaderCircle aria-hidden="true" className="size-4 animate-spin" />
          ) : (
            <Save aria-hidden="true" className="size-4" />
          )}
          {TASK_CONTENT.BUTTONS.SAVE}
        </Button>
      )}
    </div>
  );
}
