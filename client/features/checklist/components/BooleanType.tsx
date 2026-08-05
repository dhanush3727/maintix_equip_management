import {
  Field,
  FieldContent,
  FieldError,
  FieldLabel,
  SearchSelect,
  Skeleton,
} from "@/components/ui";
import { CircleCheck } from "lucide-react";
import {
  BOOLEAN_VALUES,
  CHECKLIST_CONTENT,
} from "../constants/checklist.constant";
import { Controller, UseFormReturn } from "react-hook-form";
import { ChecklistValues } from "../schema/checklist.schema";

interface BooleanTypeProps {
  form: UseFormReturn<ChecklistValues>;
  index: number;
  isChecklist?: boolean;
  disabled?: boolean;
}

export function BooleanType({
  form,
  index,
  isChecklist = false,
  disabled = false,
}: BooleanTypeProps) {
  return (
    <Field className="col-span-full">
      <FieldLabel htmlFor={`expected-value-${index}`}>
        <CircleCheck aria-hidden="true" className="size-4" />
        {CHECKLIST_CONTENT.ITEM_FIELD.EXPECTED_VALUE_LABEL}
      </FieldLabel>

      <FieldContent>
        {isChecklist ? (
          <Skeleton className="h-10" />
        ) : (
          <Controller
            control={form.control}
            name={`items.${index}.expectedValue`}
            render={({ field }) => (
              <SearchSelect
                options={BOOLEAN_VALUES}
                value={field.value}
                onValueChange={field.onChange}
                disabled={disabled}
              />
            )}
          />
        )}
      </FieldContent>

      <FieldError
        errors={[form.formState.errors.items?.[index]?.expectedValue]}
      />
    </Field>
  );
}
