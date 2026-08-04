import {
  Button,
  Field,
  FieldContent,
  FieldError,
  FieldLabel,
  Input,
  SearchSelect,
  Skeleton,
} from "@/components/ui";
import { ListFilter, ListTodo, Trash2 } from "lucide-react";
import { CHECKLIST_CONTENT } from "../constants/checklist.constant";
import { Controller, UseFormReturn, useWatch } from "react-hook-form";
import { ChecklistItems, ChecklistItemType } from "@/types";
import { ChecklistValues } from "../schema/checklist.schema";
import { NumberType } from "./NumberType";
import { BooleanType } from "./BooleanType";
import { SelectType } from "./SelectType";

interface ChecklistItemProps {
  form: UseFormReturn<ChecklistValues>;
  isMeta: boolean;
  checklistItemType: ChecklistItems[];
  index: number;
  canRemove: boolean;
  onRemoveItem: (index: number) => void;
}

export function ChecklistItem({
  form,
  isMeta,
  checklistItemType,
  index,
  canRemove,
  onRemoveItem,
}: ChecklistItemProps) {
  const itemType = useWatch({
    control: form.control,
    name: `items.${index}.type`,
  });

  return (
    <div className="grid gap-3 sm:grid-cols-2 border border-border p-5 rounded-md">
      <div className="col-span-full flex justify-end">
        {canRemove && (
          <Button
            type="button"
            size="icon"
            variant="destructive"
            className="h-7 w-7 rounded-sm"
            onClick={() => onRemoveItem(index)}
          >
            <Trash2 aria-hidden="true" className="size-4" />
          </Button>
        )}
      </div>

      <Field>
        <FieldLabel htmlFor={`item-name-${index}`}>
          <ListTodo aria-hidden="true" className="size-4" />
          {CHECKLIST_CONTENT.ITEM_FIELD.NAME_LABEL}
        </FieldLabel>

        <FieldContent>
          <Input
            id={`item-name-${index}`}
            type="text"
            autoComplete="off"
            placeholder={CHECKLIST_CONTENT.ITEM_FIELD.NAME_PLACEHOLDER}
            {...form.register(`items.${index}.name`)}
          />
        </FieldContent>

        <FieldError errors={[form.formState.errors.items?.[index]?.name]} />
      </Field>

      <Field>
        <FieldLabel htmlFor={`item-type-${index}`}>
          <ListFilter aria-hidden="true" className="size-4" />
          {CHECKLIST_CONTENT.ITEM_FIELD.TYPE_LABEL}
        </FieldLabel>

        <FieldContent>
          {isMeta ? (
            <Skeleton className="h-10" />
          ) : (
            <Controller
              control={form.control}
              name={`items.${index}.type`}
              render={({ field }) => (
                <SearchSelect
                  options={checklistItemType}
                  value={field.value}
                  onValueChange={field.onChange}
                  placeholder={CHECKLIST_CONTENT.ITEM_FIELD.TYPE_PLACEHOLDER}
                />
              )}
            />
          )}
        </FieldContent>

        <FieldError errors={[form.formState.errors.items?.[index]?.type]} />
      </Field>

      {itemType === ChecklistItemType.NUMBER && (
        <NumberType form={form} index={index} />
      )}

      {itemType === ChecklistItemType.BOOLEAN && (
        <BooleanType form={form} index={index} />
      )}

      {itemType === ChecklistItemType.SELECT && (
        <SelectType form={form} index={index} />
      )}
    </div>
  );
}
