import { Field, FieldError, SearchSelect } from "@/components/ui";
import { Controller, UseFormReturn } from "react-hook-form";
import { TaskSchemaValues } from "../schema/task.schema";

interface SelectValueProps {
  options: string[] | null;
  form: UseFormReturn<TaskSchemaValues>;
  disabled: boolean;
}

export function SelectValue({ options, form, disabled }: SelectValueProps) {
  const values =
    options?.map((option) => ({
      label: option,
      value: option,
    })) ?? [];

  return (
    <Field>
      <Controller
        control={form.control}
        name="actualValue"
        render={({ field }) => (
          <SearchSelect
            options={values}
            value={field.value}
            onValueChange={field.onChange}
            disabled={disabled}
          />
        )}
      />

      <FieldError errors={[form.formState.errors.actualValue]} />
    </Field>
  );
}
