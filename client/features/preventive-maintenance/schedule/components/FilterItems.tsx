import {
  Button,
  Field,
  FieldLabel,
  Input,
  SearchSelect,
  Skeleton,
  FieldContent,
} from "@/components/ui";
import { DropDown, Frequency } from "@/types";
import { ScheduleParamsValues } from "./Schedule";
import { Dispatch, SetStateAction } from "react";
import { ScheduleParams } from "../types/schedule.type";
import { SCHEDULE_CONTENT } from "../constant/schedule.constant";
import { X } from "lucide-react";

interface FilterItemsProps {
  equipments: DropDown[];
  isEquipment: boolean;

  checklists: DropDown[];
  isChecklist: boolean;

  frequencyType: Frequency[];
  isMeta: boolean;

  params: ScheduleParamsValues;
  setParams: Dispatch<SetStateAction<ScheduleParamsValues>>;
}

export function FilterItems({
  equipments,
  isEquipment,
  checklists,
  isChecklist,
  frequencyType,
  isMeta,
  params,
  setParams,
}: FilterItemsProps) {
  const isClear = Object.keys(params).length > 0;

  const handleClearFilter = () => {
    setParams({});
  };

  return (
    <div className="mt-5 grid grid-cols-1 gap-3 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-[repeat(5,minmax(0,1fr))_auto]">
      {isEquipment ? (
        <Skeleton className="h-10" />
      ) : (
        <SearchSelect
          options={equipments}
          value={params.equipment}
          onValueChange={(value) => {
            setParams((prev) => ({
              ...prev,
              page: 1,

              // SearchSelect callback is typed as `string | number`.
              // Even if this dropdown currently returns a number,
              // TypeScript only knows it could be either.
              // Convert it explicitly to ensure `equipment` is always a number.
              equipment: Number(value),
            }));
          }}
          placeholder={SCHEDULE_CONTENT.FILTER.EQUIPMENT}
        />
      )}

      {isChecklist ? (
        <Skeleton className="h-10" />
      ) : (
        <SearchSelect
          options={checklists}
          value={params.template}
          onValueChange={(value) => {
            setParams((prev) => ({
              ...prev,
              page: 1,
              template: Number(value),
            }));
          }}
          placeholder={SCHEDULE_CONTENT.FILTER.TEMPLATE}
        />
      )}

      {isMeta ? (
        <Skeleton className="h-10" />
      ) : (
        <SearchSelect
          options={frequencyType}
          value={params.frequencyType}
          onValueChange={(value) => {
            setParams((prev) => ({
              ...prev,
              page: 1,
              frequencyType: value as ScheduleParams["frequencyType"],
            }));
          }}
          placeholder={SCHEDULE_CONTENT.FILTER.FREQUENCY_TYPE}
        />
      )}

      <Field className="relative">
        <FieldLabel
          htmlFor="from-date"
          className="absolute -top-2 left-3 px-1 text-xs text-muted-foreground"
        >
          {SCHEDULE_CONTENT.FILTER.FROM_DATE_LABEL}
        </FieldLabel>

        <FieldContent>
          <Input
            id="from-date"
            type="date"
            value={params.from ?? ""}
            onChange={(e) => {
              setParams((prev) => ({
                ...prev,
                page: 1,
                from: e.target.value,
              }));
            }}
            placeholder="Date"
          />
        </FieldContent>
      </Field>

      <Field className="relative">
        <FieldLabel
          htmlFor="to-date"
          className="absolute -top-2 left-3 px-1 text-xs text-muted-foreground"
        >
          {SCHEDULE_CONTENT.FILTER.TO_DATE_LABEL}
        </FieldLabel>

        <FieldContent>
          <Input
            id="to-date"
            type="date"
            value={params.to ?? ""}
            onChange={(e) => {
              setParams((prev) => ({
                ...prev,
                page: 1,
                to: e.target.value,
              }));
            }}
          />
        </FieldContent>
      </Field>

      {isClear && (
        <Button
          type="button"
          variant="ghost"
          className="w-fit justify-self-end shrink-0 gap-2 text-muted-foreground hover:bg-muted hover:text-foreground justify-end"
          aria-label="Clear filters"
          onClick={handleClearFilter}
        >
          <X className="size-4" />
          Clear
        </Button>
      )}
    </div>
  );
}
