import {
  Field,
  FieldContent,
  FieldError,
  FieldLabel,
  Input,
  Skeleton,
} from "@/components/ui";
import { ArrowDownToLine, ArrowUpToLine } from "lucide-react";
import { CHECKLIST_CONTENT } from "../constants/checklist.constant";
import { UseFormReturn } from "react-hook-form";
import { ChecklistValues } from "../schema/checklist.schema";

interface NumberTypeProps {
  form: UseFormReturn<ChecklistValues>;
  index: number;
  isChecklist?: boolean;
  disabled?: boolean;
}

export function NumberType({
  form,
  index,
  isChecklist = false,
  disabled = false,
}: NumberTypeProps) {
  return (
    <>
      <Field>
        <FieldLabel htmlFor={`min-value-${index}`}>
          <ArrowDownToLine aria-hidden="true" className="size-4" />
          {CHECKLIST_CONTENT.ITEM_FIELD.MIN_VALUE_LABEL}
        </FieldLabel>

        <FieldContent>
          {isChecklist ? (
            <Skeleton className="h-10" />
          ) : (
            <Input
              id={`min-value-${index}`}
              type="number"
              autoComplete="off"
              disabled={disabled}
              placeholder={CHECKLIST_CONTENT.ITEM_FIELD.MIN_VALUE_PLACEHOLDER}
              {...form.register(`items.${index}.minValue`, {
                // Convert the input string to a number while keeping
                // an empty input as undefined instead of NaN.
                setValueAs: (value) =>
                  value === "" ? undefined : Number(value),
              })}
            />
          )}
        </FieldContent>

        <FieldError errors={[form.formState.errors.items?.[index]?.minValue]} />
      </Field>

      <Field>
        <FieldLabel htmlFor={`max-value-${index}`}>
          <ArrowUpToLine aria-hidden="true" className="size-4" />
          {CHECKLIST_CONTENT.ITEM_FIELD.MAX_VALUE_LABEL}
        </FieldLabel>

        <FieldContent>
          {isChecklist ? (
            <Skeleton className="h-10" />
          ) : (
            <Input
              id={`max-value-${index}`}
              type="number"
              autoComplete="off"
              disabled={disabled}
              placeholder={CHECKLIST_CONTENT.ITEM_FIELD.MAX_VALUE_PLACEHOLDER}
              {...form.register(`items.${index}.maxValue`, {
                // Convert the input string to a number while keeping
                // an empty input as undefined instead of NaN.
                setValueAs: (value) =>
                  value === "" || value === undefined || value === null
                    ? undefined
                    : Number(value),
              })}
            />
          )}
        </FieldContent>

        <FieldError errors={[form.formState.errors.items?.[index]?.maxValue]} />
      </Field>
    </>
  );
}
