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
import { cn } from "@/lib";

interface BooleanValueProp {
  form: UseFormReturn<TaskSchemaValues>;
  index: number;
  disabled: boolean;
}

export function BooleanValue({ form, index, disabled }: BooleanValueProp) {
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
            disabled={disabled}
          >
            {BOOLEAN_VALUE.map((item) => (
              <div key={item.label} className="flex items-center gap-1">
                <RadioGroupItem
                  value={item.value}
                  id={`${item.label}-${index}`}
                  className={cn(!disabled && "cursor-pointer")}
                />
                <Label
                  htmlFor={`${item.label}-${index}`}
                  className={cn(!disabled && "cursor-pointer")}
                >
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
