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
import { AlignLeft, ClipboardList, FileText, Wrench } from "lucide-react";
import { CHECKLIST_CONTENT } from "../constants/checklist.constant";
import { Controller, UseFormReturn } from "react-hook-form";
import { EquipmentTypeDropdownData } from "@/features/equipment/types/equipment-type.type";
import { ChecklistValues } from "../schema/checklist.schema";

interface ChecklistInformationProps {
  form: UseFormReturn<ChecklistValues>;
  isEquipType: boolean;
  equipTypeDD: EquipmentTypeDropdownData[];
  isChecklist?: boolean;
  disabled?: boolean;
}

export function ChecklistInformation({
  form,
  isEquipType,
  equipTypeDD,
  isChecklist = false,
  disabled = false,
}: ChecklistInformationProps) {
  return (
    <>
      <div className="flex gap-1 items-center">
        <ClipboardList aria-hidden="true" className="size-4" />

        <h1 className="font-medium">
          {CHECKLIST_CONTENT.INFORMATION_FIELD.TITLE}
        </h1>
      </div>

      <div className="grid gap-3 sm:grid-cols-2">
        <Field>
          <FieldLabel htmlFor="name">
            <FileText aria-hidden="true" className="size-4" />
            {CHECKLIST_CONTENT.INFORMATION_FIELD.NAME_LABEL}
          </FieldLabel>

          <FieldContent>
            {isChecklist ? (
              <Skeleton className="h-10" />
            ) : (
              <Input
                type="text"
                id="name"
                autoComplete="off"
                disabled={disabled}
                placeholder={
                  CHECKLIST_CONTENT.INFORMATION_FIELD.NAME_PLACEHOLDER
                }
                {...form.register("name")}
              />
            )}
          </FieldContent>

          <FieldError errors={[form.formState.errors.name]} />
        </Field>

        <Field>
          <FieldLabel htmlFor="type">
            <Wrench aria-hidden="true" className="size-4" />
            {CHECKLIST_CONTENT.INFORMATION_FIELD.TYPE_LABEL}
          </FieldLabel>

          <FieldContent>
            {isEquipType || isChecklist ? (
              <Skeleton className="h-10" />
            ) : (
              <Controller
                control={form.control}
                name="equipmentTypeId"
                render={({ field }) => (
                  <SearchSelect
                    options={equipTypeDD}
                    value={field.value}
                    onValueChange={field.onChange}
                    disabled={disabled}
                    placeholder={
                      CHECKLIST_CONTENT.INFORMATION_FIELD.TYPE_PLACEHOLDER
                    }
                    searchPlaceholder={
                      CHECKLIST_CONTENT.INFORMATION_FIELD.TYPE_SEARCH
                    }
                  />
                )}
              />
            )}
          </FieldContent>

          <FieldError errors={[form.formState.errors.equipmentTypeId]} />
        </Field>

        <Field className="col-span-full">
          <FieldLabel htmlFor="description">
            <AlignLeft aria-hidden="true" className="size-4" />
            {CHECKLIST_CONTENT.INFORMATION_FIELD.DESCRIPTION_LABEL}
          </FieldLabel>

          <FieldContent>
            {isChecklist ? (
              <Skeleton className="h-10" />
            ) : (
              <Textarea
                id="description"
                disabled={disabled}
                placeholder={
                  CHECKLIST_CONTENT.INFORMATION_FIELD.DESCRIPTION_PLACEHOLDER
                }
                {...form.register("description")}
              />
            )}
          </FieldContent>

          <FieldError errors={[form.formState.errors.description]} />
        </Field>
      </div>
    </>
  );
}
