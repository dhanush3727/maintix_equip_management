import { Button, Input, SearchSelect, Skeleton } from "@/components/ui";
import { DropdownOptions } from "@/types";
import { Dispatch, SetStateAction } from "react";
import { CHECKLIST_CONTENT } from "../constants/checklist.constant";
import { X } from "lucide-react";

interface FilterItemProps {
  search: string;
  setSearch: Dispatch<SetStateAction<string>>;

  type: number | undefined;
  setType: Dispatch<SetStateAction<number | undefined>>;

  isEquipType: boolean;
  equipTypeDD: DropdownOptions[];
}

export function FilterItem({
  search,
  setSearch,
  type,
  setType,
  isEquipType,
  equipTypeDD,
}: FilterItemProps) {
  const isClear = search || type;

  const handleClearFilter = () => {
    setSearch("");
    setType(undefined);
  };

  return (
    <div className="grid grid-cols-1 gap-3 sm:grid-cols-[1fr_1fr_auto]">
      <Input
        value={search}
        onChange={(e) => setSearch(e.target.value)}
        placeholder={CHECKLIST_CONTENT.FILTER.SEARCH}
      />

      {isEquipType ? (
        <Skeleton className="h-10" />
      ) : (
        <SearchSelect
          options={equipTypeDD}
          value={type}
          onValueChange={(val) => setType(Number(val))}
          placeholder={CHECKLIST_CONTENT.FILTER.TYPE}
          searchPlaceholder={CHECKLIST_CONTENT.FILTER.TYPE_SEARCH}
        />
      )}

      {/* For clear filter */}
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
