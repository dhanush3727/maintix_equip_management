import { Field, FieldError, SearchSelect } from "@/components/ui";
import { Controller, UseFormReturn } from "react-hook-form";
import { TaskSchemaValues } from "../schema/task.schema";

interface SelectValueProps {
  options: string[] | null;
  form: UseFormReturn<TaskSchemaValues>;
}

export function SelectValue({ options, form }: SelectValueProps) {
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
          />
        )}
      />

      <FieldError errors={[form.formState.errors.actualValue]} />
    </Field>
  );
}
