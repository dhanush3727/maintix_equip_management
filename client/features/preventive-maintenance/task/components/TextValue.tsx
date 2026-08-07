import { Field, Input } from "@/components/ui";
import { TASK_CONTENT } from "../constant/task.constant";

export function TextValue() {
  return (
    <Field>
      <Input type="text" placeholder={TASK_CONTENT.FIELD.INPUT_PLACEHOLDER} />
    </Field>
  );
}
