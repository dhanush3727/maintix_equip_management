import { Field, FieldError, Input } from "@/components/ui";
import { TASK_CONTENT } from "../constant/task.constant";
import { UseFormReturn } from "react-hook-form";
import { TaskSchemaValues } from "../schema/task.schema";

interface NumberValueProps {
  form: UseFormReturn<TaskSchemaValues>;
  disabled: boolean;
}

export function NumberValue({ form, disabled }: NumberValueProps) {
  return (
    <Field>
      <Input
        type="number"
        autoComplete="off"
        placeholder={TASK_CONTENT.FIELD.INPUT_PLACEHOLDER}
        disabled={disabled}
        {...form.register("actualValue")}
      />

      <FieldError errors={[form.formState.errors.actualValue]} />
    </Field>
  );
}
