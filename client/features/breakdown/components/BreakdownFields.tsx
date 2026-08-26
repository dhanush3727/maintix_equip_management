import {
  ClipboardPenLine,
  FileText,
  AlertTriangle,
  Wrench,
} from "lucide-react";
import {
  Field,
  FieldContent,
  FieldError,
  FieldLabel,
  Input,
  Textarea,
} from "@/components/ui";
import { BREAKDOWN_FORM_CONTENT } from "../constants/breakdown.constant";

export function BreakdownFields() {
  return (
    <div>
      <Field>
        <FieldContent>
          <FieldLabel htmlFor="title">
            <ClipboardPenLine aria-hidden="true" className="size-4" />
            {BREAKDOWN_FORM_CONTENT.TITLE_LABEL}
          </FieldLabel>

          <Input
            id="title"
            type="text"
            autoComplete="off"
            placeholder={BREAKDOWN_FORM_CONTENT.TITLE_PLACEHOLDER}
          />
          <FieldError />
        </FieldContent>
      </Field>

      <Field>
        <FieldContent>
          <FieldLabel htmlFor="description">
            <FileText aria-hidden="true" className="size-4" />
            {BREAKDOWN_FORM_CONTENT.DESCRIPTION_LABEL}
          </FieldLabel>

          <Textarea
            id="description"
            autoComplete="off"
            placeholder={BREAKDOWN_FORM_CONTENT.DESCRIPTION_PLACEHOLDER}
          />
          <FieldError />
        </FieldContent>
      </Field>

      <Field>
        <FieldContent>
          <FieldLabel>
            <AlertTriangle aria-hidden="true" className="size-4" />
            {BREAKDOWN_FORM_CONTENT.SEVERITY_LABEL}
          </FieldLabel>

          <Input
            type="text"
            autoComplete="off"
            placeholder={BREAKDOWN_FORM_CONTENT.TITLE_PLACEHOLDER}
          />
          <FieldError />
        </FieldContent>
      </Field>

      <Field>
        <FieldContent>
          <FieldLabel htmlFor="title">
            <Wrench aria-hidden="true" className="size-4" />
            {BREAKDOWN_FORM_CONTENT.EQUIPMENT_LABEL}
          </FieldLabel>

          <Input
            id="title"
            type="text"
            autoComplete="off"
            placeholder={BREAKDOWN_FORM_CONTENT.TITLE_PLACEHOLDER}
          />
          <FieldError />
        </FieldContent>
      </Field>
    </div>
  );
}
