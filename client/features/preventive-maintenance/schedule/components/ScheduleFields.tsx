import { Controller, UseFormReturn } from "react-hook-form";
import { ScheduleValues } from "../schema/schedule.schema";
import { DropDown, Frequency } from "@/types";
import {
  Field,
  FieldContent,
  FieldError,
  FieldLabel,
  Input,
  SearchSelect,
  Skeleton,
} from "@/components/ui";
import { SCHEDULE_CONTENT } from "../constant/schedule.constant";

interface ScheduleFieldsProps {
  form: UseFormReturn<ScheduleValues>;

  typeValue: number;
  setTypeValue: (value: number) => void;

  isEquipType: boolean;
  equipmentType: DropDown[];

  isEquipment: boolean;
  equipment: DropDown[];

  isChecklist: boolean;
  checklist: DropDown[];

  isMeta: boolean;
  frequencyType: Frequency[];

  isUser: boolean;
  users: DropDown[];
}

export function ScheduleFields({
  form,
  typeValue,
  setTypeValue,
  isEquipType,
  isEquipment,
  isChecklist,
  equipment,
  equipmentType,
  checklist,
  isMeta,
  frequencyType,
  isUser,
  users,
}: ScheduleFieldsProps) {
  return (
    <div className="grid gap-3 sm:grid-cols-2">
      <Field className="col-span-full">
        <FieldLabel htmlFor="equip-type">
          {SCHEDULE_CONTENT.FIELDS.EQUIPMENT_TYPE.LABEL}
        </FieldLabel>

        <FieldContent>
          {isEquipType ? (
            <Skeleton className="h-10" />
          ) : (
            <SearchSelect
              options={equipmentType}
              value={typeValue}
              onValueChange={(value) => setTypeValue(Number(value))}
              placeholder={SCHEDULE_CONTENT.FIELDS.EQUIPMENT_TYPE.PLACEHOLDER}
            />
          )}
        </FieldContent>
      </Field>

      <Field>
        <FieldLabel htmlFor="equipment">
          {SCHEDULE_CONTENT.FIELDS.EQUIPMENT.LABEL}
        </FieldLabel>

        <FieldContent>
          <Controller
            control={form.control}
            name="equipmentId"
            render={({ field }) => (
              <SearchSelect
                options={equipment}
                value={field.value}
                onValueChange={field.onChange}
                disabled={typeValue === 0 || isEquipment}
                placeholder={SCHEDULE_CONTENT.FIELDS.EQUIPMENT.PLACEHOLDER}
              />
            )}
          />

          <FieldError errors={[form.formState.errors.equipmentId]} />
        </FieldContent>
      </Field>

      <Field>
        <FieldLabel htmlFor="checklist">
          {SCHEDULE_CONTENT.FIELDS.CHECKLIST.LABEL}
        </FieldLabel>

        <FieldContent>
          <Controller
            control={form.control}
            name="templateId"
            render={({ field }) => (
              <SearchSelect
                options={checklist}
                value={field.value}
                onValueChange={field.onChange}
                disabled={typeValue === 0 || isChecklist}
                placeholder={SCHEDULE_CONTENT.FIELDS.CHECKLIST.PLACEHOLDER}
              />
            )}
          />

          <FieldError errors={[form.formState.errors.templateId]} />
        </FieldContent>
      </Field>

      <Field>
        <FieldLabel>{SCHEDULE_CONTENT.FIELDS.FREQUENCY_TYPE.LABEL}</FieldLabel>

        <FieldContent>
          {isMeta ? (
            <Skeleton className="h-10" />
          ) : (
            <Controller
              control={form.control}
              name="frequencyType"
              render={({ field }) => (
                <SearchSelect
                  options={frequencyType}
                  value={field.value}
                  onValueChange={field.onChange}
                  placeholder={
                    SCHEDULE_CONTENT.FIELDS.FREQUENCY_TYPE.PLACEHOLDER
                  }
                />
              )}
            />
          )}

          <FieldError errors={[form.formState.errors.frequencyType]} />
        </FieldContent>
      </Field>

      <Field>
        <FieldLabel htmlFor="interval">
          {SCHEDULE_CONTENT.FIELDS.INTERVAL.LABEL}
        </FieldLabel>

        <FieldContent>
          <Input
            id="interval"
            type="number"
            autoComplete="off"
            placeholder={SCHEDULE_CONTENT.FIELDS.INTERVAL.PLACEHOLDER}
            {...form.register("interval", {
              setValueAs: (value) => (value === "" ? undefined : Number(value)),
            })}
          />

          <FieldError errors={[form.formState.errors.interval]} />
        </FieldContent>
      </Field>

      <Field>
        <FieldLabel htmlFor="start-date">
          {SCHEDULE_CONTENT.FIELDS.START_DATE.LABEL}
        </FieldLabel>

        <FieldContent>
          <Input
            id="start-date"
            type="date"
            autoComplete="off"
            placeholder={SCHEDULE_CONTENT.FIELDS.START_DATE.PLACEHOLDER}
            {...form.register("startDate")}
          />

          <FieldError errors={[form.formState.errors.startDate]} />
        </FieldContent>
      </Field>

      <Field>
        <FieldLabel>{SCHEDULE_CONTENT.FIELDS.ASSIGNED_TO.LABEL}</FieldLabel>

        <FieldContent>
          {isUser ? (
            <Skeleton className="h-10" />
          ) : (
            <Controller
              control={form.control}
              name="assignedTo"
              render={({ field }) => (
                <SearchSelect
                  options={users}
                  value={field.value}
                  onValueChange={field.onChange}
                  placeholder={SCHEDULE_CONTENT.FIELDS.ASSIGNED_TO.PLACEHOLDER}
                />
              )}
            />
          )}

          <FieldError errors={[form.formState.errors.assignedTo]} />
        </FieldContent>
      </Field>
    </div>
  );
}
