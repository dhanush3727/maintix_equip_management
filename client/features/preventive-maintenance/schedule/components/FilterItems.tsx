import { Button, Input, SearchSelect, Skeleton } from "@/components/ui";
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

  onFilterChange: () => void;
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
  onFilterChange,
}: FilterItemsProps) {
  const isClear = Object.keys(params).length > 0;

  const handleClearFilter = () => {
    setParams({});
  };

  return (
    <div className="grid grid-cols-1 gap-3 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-[repeat(5,minmax(0,1fr))_auto]">
      {isEquipment ? (
        <Skeleton className="h-10" />
      ) : (
        <SearchSelect
          options={equipments}
          value={params?.equipment}
          onValueChange={(value) => {
            setParams((prev) => ({
              ...prev,

              // SearchSelect callback is typed as `string | number`.
              // Even if this dropdown currently returns a number,
              // TypeScript only knows it could be either.
              // Convert it explicitly to ensure `equipment` is always a number.
              equipment: Number(value),
            }));
            onFilterChange();
          }}
          placeholder={SCHEDULE_CONTENT.FILTER.EQUIPMENT}
        />
      )}

      {isChecklist ? (
        <Skeleton className="h-10" />
      ) : (
        <SearchSelect
          options={checklists}
          value={params?.template}
          onValueChange={(value) => {
            setParams((prev) => ({
              ...prev,
              template: Number(value),
            }));
            onFilterChange();
          }}
          placeholder={SCHEDULE_CONTENT.FILTER.TEMPLATE}
        />
      )}

      {isMeta ? (
        <Skeleton className="h-10" />
      ) : (
        <SearchSelect
          options={frequencyType}
          value={params?.frequencyType}
          onValueChange={(value) => {
            setParams((prev) => ({
              ...prev,
              frequencyType: value as ScheduleParams["frequencyType"],
            }));
            onFilterChange();
          }}
          placeholder={SCHEDULE_CONTENT.FILTER.FREQUENCY_TYPE}
        />
      )}

      <Input
        type="date"
        value={params?.from}
        onChange={(e) => {
          setParams((prev) => ({
            ...prev,
            from: e.target.value,
          }));
          onFilterChange();
        }}
      />

      <Input
        type="date"
        value={params?.to}
        onChange={(e) => {
          setParams((prev) => ({
            ...prev,
            to: e.target.value,
          }));
          onFilterChange();
        }}
      />

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
