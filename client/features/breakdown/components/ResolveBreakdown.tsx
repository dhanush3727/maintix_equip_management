import {
  Field,
  FieldContent,
  FieldError,
  FieldLabel,
  Textarea,
} from "@/components/ui";
import { MessageSquareText, SearchCheck, Wrench } from "lucide-react";
import { BREAKDOWN_FORM_CONTENT } from "../constants/breakdown.constant";
import { UseFormReturn } from "react-hook-form";
import { ResolveValues } from "../schema/resolve.schema";

interface ResolveBreakdownProps {
  form: UseFormReturn<ResolveValues>;
}

export function ResolveBreakdown({ form }: ResolveBreakdownProps) {
  return (
    <div className="grid gap-4">
      <Field>
        <FieldContent className="gap-1">
          <FieldLabel htmlFor="rootcause" className="gap-1">
            <SearchCheck aria-hidden="true" className="size-4" />
            {BREAKDOWN_FORM_CONTENT.ROOTCAUSE_LABEL}
          </FieldLabel>

          <Textarea
            id="rootcause"
            autoComplete="off"
            placeholder={BREAKDOWN_FORM_CONTENT.ROOTCAUSE_DESCRIPTION}
            {...form.register("rootCause")}
          />

          <FieldError errors={[form.formState.errors.rootCause]} />
        </FieldContent>
      </Field>

      <Field>
        <FieldContent className="gap-1">
          <FieldLabel htmlFor="action" className="gap-1">
            <Wrench aria-hidden="true" className="size-4" />
            {BREAKDOWN_FORM_CONTENT.ACTION_LABEL}
          </FieldLabel>

          <Textarea
            id="action"
            autoComplete="off"
            placeholder={BREAKDOWN_FORM_CONTENT.ACTION_DESCRIPTION}
            {...form.register("action")}
          />

          <FieldError errors={[form.formState.errors.action]} />
        </FieldContent>
      </Field>

      <Field>
        <FieldContent className="gap-1">
          <FieldLabel htmlFor="remarks" className="gap-1">
            <MessageSquareText aria-hidden="true" className="size-4" />
            {BREAKDOWN_FORM_CONTENT.REMARKS_LABEL}
          </FieldLabel>

          <Textarea
            id="remarks"
            autoComplete="off"
            placeholder={BREAKDOWN_FORM_CONTENT.REMARKS_DESCRIPTION}
            {...form.register("remarks")}
          />

          <FieldError errors={[form.formState.errors.remarks]} />
        </FieldContent>
      </Field>
    </div>
  );
}
