import {
  BreakdownSeverity,
  BreakdownSeverityType,
  BreakdownStatus,
  BreakdownStatusType,
  DropDown,
} from "@/types";
import { BreakdownFilterItems } from "./Breakdown";
import { Button, SearchSelect, Skeleton } from "@/components/ui";
import { BREAKDOWN_CONTENT } from "../constants/breakdown.constant";
import { X } from "lucide-react";

export interface BreakdownFiltersProps {
  filters: BreakdownFilterItems;
  onFilterChange: (value: BreakdownFilterItems) => void;

  isEquipment: boolean;
  isMeta: boolean;

  equipment: DropDown[];
  breakdownSeverity: BreakdownSeverityType[];
  breakdownStatus: BreakdownStatusType[];
}

export function BreakdownFilters({
  filters,
  onFilterChange,
  isEquipment,
  isMeta,
  equipment,
  breakdownSeverity,
  breakdownStatus,
}: BreakdownFiltersProps) {
  const isClear = Object.values(filters).length !== 0;

  const handleClearFilter = () => {
    onFilterChange({});
  };
  return (
    <div className="grid grid-cols-1 gap-3 sm:grid-cols-2 md:grid-cols-3 2xl:grid-cols-[repeat(5,minmax(0,1fr))_auto]">
      {isEquipment ? (
        <Skeleton className="h-10" />
      ) : (
        <SearchSelect
          options={equipment}
          value={filters.equipment}
          onValueChange={(val) =>
            onFilterChange({
              ...filters,
              equipment: Number(val),
            })
          }
          placeholder={BREAKDOWN_CONTENT.EQUIPMENT_PLACEHOLDER}
          searchPlaceholder={BREAKDOWN_CONTENT.EQUIPMENT_SEARCH}
        />
      )}

      {isMeta ? (
        <Skeleton className="h-10" />
      ) : (
        <SearchSelect
          options={breakdownSeverity}
          value={filters.severity}
          onValueChange={(val) =>
            onFilterChange({
              ...filters,
              severity: String(val) as BreakdownSeverity,
            })
          }
          placeholder={BREAKDOWN_CONTENT.SEVERITY_PLACEHOLDER}
          searchPlaceholder={BREAKDOWN_CONTENT.SEVERITY_SEARCH}
        />
      )}

      {isMeta ? (
        <Skeleton className="h-10" />
      ) : (
        <SearchSelect
          options={breakdownStatus}
          value={filters.status}
          onValueChange={(val) =>
            onFilterChange({
              ...filters,
              status: String(val) as BreakdownStatus,
            })
          }
          placeholder={BREAKDOWN_CONTENT.STATUS_PLACEHOLDER}
          searchPlaceholder={BREAKDOWN_CONTENT.STATUS_SEARCH}
        />
      )}

      {isClear && (
        <div>
          <Button
            type="button"
            variant={"ghost"}
            aria-label="Clear filters"
            onClick={handleClearFilter}
            className="w-fit justify-self-end shrink-0 gap-2 text-muted-foreground hover:bg-muted hover:text-foreground justify-end"
          >
            <X className="size-4" />
            {BREAKDOWN_CONTENT.CLEAR_BUTTON}
          </Button>
        </div>
      )}
    </div>
  );
}
