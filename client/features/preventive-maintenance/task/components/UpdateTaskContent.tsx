import { Button } from "@/components/ui";
import { ChecklistItems } from "../types/task.type";
import { TASK_CONTENT } from "../constant/task.constant";
import { ChecklistItemType } from "@/types";
import { BooleanValue } from "./BooleanValue";
import { NumberValue } from "./NumberValue";
import { SelectValue } from "./SelectValue";
import { TextValue } from "./TextValue";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { taskSchema, TaskSchemaValues } from "../schema/task.schema";

interface UpdateTaskContentProps {
  item: ChecklistItems;
  index: number;
}

export function UpdateTaskContent({ item, index }: UpdateTaskContentProps) {
  const form = useForm<TaskSchemaValues>({
    resolver: zodResolver(taskSchema),
    defaultValues: {
      actualValue: item.actualValue ?? "",
      remarks: "",
    },
  });

  return (
    <div className="flex flex-col items-start justify-between gap-2">
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
          <BooleanValue form={form} />
        ) : item.type === ChecklistItemType.NUMBER ? (
          <NumberValue form={form} />
        ) : item.type === ChecklistItemType.SELECT ? (
          <SelectValue options={item.options} form={form} />
        ) : (
          <TextValue />
        )}
      </div>

      {item.actualValue && (
        <Button size="sm" variant="outline" className={"self-end"}>
          {TASK_CONTENT.BUTTONS.SAVE}
        </Button>
      )}
    </div>
  );
}
