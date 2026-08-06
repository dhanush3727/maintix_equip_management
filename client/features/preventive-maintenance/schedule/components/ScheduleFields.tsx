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

interface BaseProps {
  form: UseFormReturn<ScheduleValues>;

  isEquipment: boolean;
  equipment: DropDown[];

  isChecklist: boolean;
  checklist: DropDown[];

  isMeta: boolean;
  frequencyType: Frequency[];

  isUser: boolean;
  users: DropDown[];
}

interface CreateProps extends BaseProps {
  mode: "create";

  typeValue: number;
  setTypeValue: (value: number) => void;

  isEquipType: boolean;
  equipmentType: DropDown[];
}

interface UpdateProps extends BaseProps {
  mode: "update";
}

type ScheduleFieldsProps = CreateProps | UpdateProps;

export function ScheduleFields(props: ScheduleFieldsProps) {
  const disableEquipment =
    props.mode === "update" || props.typeValue === 0 || props.isEquipment;

  const disableChecklist =
    props.mode === "update" || props.typeValue === 0 || props.isChecklist;

  const { form } = props;

  return (
    <div className="grid gap-3 sm:grid-cols-2">
      {props.mode === "create" && (
        <Field className="col-span-full">
          <FieldLabel htmlFor="equip-type">
            {SCHEDULE_CONTENT.FIELDS.EQUIPMENT_TYPE.LABEL}
          </FieldLabel>

          <FieldContent>
            {props.isEquipType ? (
              <Skeleton className="h-10" />
            ) : (
              <SearchSelect
                options={props.equipmentType}
                value={props.typeValue}
                onValueChange={(value) => props.setTypeValue(Number(value))}
                placeholder={SCHEDULE_CONTENT.FIELDS.EQUIPMENT_TYPE.PLACEHOLDER}
              />
            )}
          </FieldContent>
        </Field>
      )}

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
                options={props.equipment}
                value={field.value}
                onValueChange={field.onChange}
                disabled={disableEquipment}
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
                options={props.checklist}
                value={field.value}
                onValueChange={field.onChange}
                disabled={disableChecklist}
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
          {props.isMeta ? (
            <Skeleton className="h-10" />
          ) : (
            <Controller
              control={form.control}
              name="frequencyType"
              render={({ field }) => (
                <SearchSelect
                  options={props.frequencyType}
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
          {props.isUser ? (
            <Skeleton className="h-10" />
          ) : (
            <Controller
              control={form.control}
              name="assignedTo"
              render={({ field }) => (
                <SearchSelect
                  options={props.users}
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
