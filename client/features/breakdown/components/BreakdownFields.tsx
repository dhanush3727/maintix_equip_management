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
  SearchSelect,
  Skeleton,
  Textarea,
} from "@/components/ui";
import { BREAKDOWN_FORM_CONTENT } from "../constants/breakdown.constant";
import { BreakdownSeverityType, DropDown } from "@/types";
import { Controller, UseFormReturn } from "react-hook-form";
import { BreakdownValues } from "../schema/breakdown.schema";

interface BreakdownFieldsProps {
  form: UseFormReturn<BreakdownValues>;
  equipments: DropDown[];
  breakdownSeverity: BreakdownSeverityType[];
  isEquipment: boolean;
  isMeta: boolean;
  isDisabled: boolean;
}

export function BreakdownFields({
  form,
  equipments,
  breakdownSeverity,
  isEquipment,
  isMeta,
  isDisabled,
}: BreakdownFieldsProps) {
  return (
    <div className="grid gap-4">
      <Field>
        <FieldContent className="gap-1">
          <FieldLabel htmlFor="title" className="gap-1">
            <ClipboardPenLine aria-hidden="true" className="size-4" />
            {BREAKDOWN_FORM_CONTENT.TITLE_LABEL}
          </FieldLabel>

          <Input
            id="title"
            type="text"
            autoComplete="off"
            placeholder={BREAKDOWN_FORM_CONTENT.TITLE_PLACEHOLDER}
            disabled={isDisabled}
            {...form.register("title")}
          />
          <FieldError errors={[form.formState.errors.title]} />
        </FieldContent>
      </Field>

      <Field>
        <FieldContent className="gap-1">
          <FieldLabel className="gap-1">
            <Wrench aria-hidden="true" className="size-4" />
            {BREAKDOWN_FORM_CONTENT.EQUIPMENT_LABEL}
          </FieldLabel>

          {isEquipment ? (
            <Skeleton className="h-10" />
          ) : (
            <Controller
              control={form.control}
              name="equipmentId"
              render={({ field }) => (
                <SearchSelect
                  options={equipments}
                  value={field.value}
                  onValueChange={field.onChange}
                  placeholder={BREAKDOWN_FORM_CONTENT.EQUIPMENT_PLACEHOLDER}
                  searchPlaceholder={BREAKDOWN_FORM_CONTENT.EQUIPMENT_SEARCH}
                  disabled={isDisabled}
                />
              )}
            />
          )}

          <FieldError errors={[form.formState.errors.equipmentId]} />
        </FieldContent>
      </Field>

      <Field>
        <FieldContent className="gap-1">
          <FieldLabel className="gap-1">
            <AlertTriangle aria-hidden="true" className="size-4" />
            {BREAKDOWN_FORM_CONTENT.SEVERITY_LABEL}
          </FieldLabel>

          {isMeta ? (
            <Skeleton className="h-10" />
          ) : (
            <Controller
              control={form.control}
              name="severity"
              render={({ field }) => (
                <SearchSelect
                  options={breakdownSeverity}
                  value={field.value}
                  onValueChange={field.onChange}
                  placeholder={BREAKDOWN_FORM_CONTENT.SEVERITY_PLACEHOLDER}
                  searchPlaceholder={BREAKDOWN_FORM_CONTENT.SEVERITY_SEARCH}
                  disabled={isDisabled}
                />
              )}
            />
          )}
          <FieldError errors={[form.formState.errors.severity]} />
        </FieldContent>
      </Field>

      <Field>
        <FieldContent className="gap-1">
          <FieldLabel htmlFor="description" className="gap-1">
            <FileText aria-hidden="true" className="size-4" />
            {BREAKDOWN_FORM_CONTENT.DESCRIPTION_LABEL}
          </FieldLabel>

          <Textarea
            id="description"
            autoComplete="off"
            placeholder={BREAKDOWN_FORM_CONTENT.DESCRIPTION_PLACEHOLDER}
            disabled={isDisabled}
            {...form.register("description")}
          />
          <FieldError errors={[form.formState.errors.description]} />
        </FieldContent>
      </Field>
    </div>
  );
}
