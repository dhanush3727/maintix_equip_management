import {
  Field,
  FieldError,
  Label,
  RadioGroup,
  RadioGroupItem,
} from "@/components/ui";
import { BOOLEAN_VALUE } from "../constant/task.constant";
import { Controller, UseFormReturn } from "react-hook-form";
import { TaskSchemaValues } from "../schema/task.schema";

interface BooleanValueProp {
  form: UseFormReturn<TaskSchemaValues>;
}

export function BooleanValue({ form }: BooleanValueProp) {
  return (
    <Field>
      <Controller
        control={form.control}
        name="actualValue"
        render={({ field }) => (
          <RadioGroup
            className={"flex gap-3"}
            value={field.value}
            onValueChange={field.onChange}
          >
            {BOOLEAN_VALUE.map((item) => (
              <div key={item.label} className="flex items-center gap-1">
                <RadioGroupItem
                  value={item.value}
                  id={item.label}
                  className={"cursor-pointer"}
                />
                <Label htmlFor={item.label} className="cursor-pointer">
                  {item.label}
                </Label>
              </div>
            ))}
          </RadioGroup>
        )}
      />
      <FieldError errors={[form.formState.errors.actualValue]} />
    </Field>
  );
}
