import { Dispatch, SetStateAction } from "react";
import { EquipmentParams } from "../../types/equipment.type";
import { Button, Input, SearchSelect, Skeleton } from "@/components/ui";
import { EQUIPMENT_CONTENT } from "../../constants/equipment.constant";
import { X } from "lucide-react";
import { DropdownOptions } from "./Equipment";

interface FilterItemsProps {
  search: string;
  setSearch: Dispatch<SetStateAction<string>>;

  sortBy: EquipmentParams["sortBy"] | "";
  setSortyBy: Dispatch<SetStateAction<EquipmentParams["sortBy"] | "">>;

  order: EquipmentParams["order"];
  setOrder: Dispatch<SetStateAction<EquipmentParams["order"]>>;

  status: EquipmentParams["status"] | "";
  setStatus: Dispatch<SetStateAction<EquipmentParams["status"] | "">>;

  department: number | undefined;
  setDepartment: Dispatch<SetStateAction<number | undefined>>;

  location: number | undefined;
  setLocation: Dispatch<SetStateAction<number | undefined>>;

  type: number | undefined;
  setType: Dispatch<SetStateAction<number | undefined>>;

  statusDD: DropdownOptions[];

  locationDD: DropdownOptions[];

  departmentDD: DropdownOptions[];

  equipTypeDD: DropdownOptions[];

  isOrganization: boolean;

  isMeta: boolean;

  isEquipType: boolean;
}

export function FilterItems({
  search,
  setSearch,
  // sortBy,
  setSortyBy,
  // order,
  setOrder,
  status,
  setStatus,
  location,
  setLocation,
  department,
  setDepartment,
  type,
  setType,
  statusDD,
  locationDD,
  departmentDD,
  equipTypeDD,
  isOrganization,
  isMeta,
  isEquipType,
}: FilterItemsProps) {
  const isClear = search || status || department || location || type;

  const handleClearFilter = () => {
    setSearch("");
    setSortyBy("");
    setOrder("desc");
    setStatus("");
    setLocation(undefined);
    setDepartment(undefined);
    setType(undefined);
  };

  return (
    <div className="grid grid-cols-1 gap-3 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-[repeat(5,minmax(0,1fr))_auto]">
      <Input
        value={search}
        onChange={(event) => setSearch(event.target.value)}
        placeholder={EQUIPMENT_CONTENT.FILTERS.SEARCH}
      />

      {isEquipType ? (
        <Skeleton className="h-10 w-full" />
      ) : (
        <SearchSelect
          options={equipTypeDD}
          value={type}
          onValueChange={(val) => setType(Number(val))}
          placeholder={EQUIPMENT_CONTENT.FILTERS.TYPE}
          searchPlaceholder={EQUIPMENT_CONTENT.FILTERS.SEARCH_TYPE}
        />
      )}

      {isOrganization ? (
        <Skeleton className="h-10 w-full" />
      ) : (
        <SearchSelect
          options={locationDD}
          value={location}
          onValueChange={(val) => setLocation(Number(val))}
          placeholder={EQUIPMENT_CONTENT.FILTERS.LOCATION}
          searchPlaceholder={EQUIPMENT_CONTENT.FILTERS.SEARCH_LOCATION}
        />
      )}

      {isOrganization ? (
        <Skeleton className="h-10 w-full" />
      ) : (
        <SearchSelect
          options={departmentDD}
          value={department}
          onValueChange={(val) => setDepartment(Number(val))}
          placeholder={EQUIPMENT_CONTENT.FILTERS.DEPARTMENT}
          searchPlaceholder={EQUIPMENT_CONTENT.FILTERS.SEARCH_DEPARTMENT}
        />
      )}

      {isMeta ? (
        <Skeleton className="h-10 w-full" />
      ) : (
        <SearchSelect
          options={statusDD}
          value={status}
          onValueChange={(val) => {
            setStatus(val as EquipmentParams["status"]);
          }}
          placeholder={EQUIPMENT_CONTENT.FILTERS.STATUS}
          searchPlaceholder={EQUIPMENT_CONTENT.FILTERS.SEARCH_STATUS}
        />
      )}

      {/* <Select
        value={sortBy}
        onValueChange={(value) =>
          setSortyBy(value === "name" || value === "code" ? value : "")
        }
      >
        <SelectTrigger
          className={"w-full sm:w-30 bg-card rounded-md"}
          size="lg"
        >
          <SelectValue placeholder={EQUIPMENT_CONTENT.FILTERS.SORTBY} />
        </SelectTrigger>

        <SelectContent className={"rounded-md"}>
          <SelectItem value={EQUIPMENT_CONTENT.SORTBY.NAME_VALUE}>
            {EQUIPMENT_CONTENT.SORTBY.NAME_VALUE}
          </SelectItem>
          <SelectItem value={EQUIPMENT_CONTENT.SORTBY.CODE_VALUE}>
            {EQUIPMENT_CONTENT.SORTBY.CODE_VALUE}
          </SelectItem>
        </SelectContent>
      </Select>

      <Button
        variant={"outline"}
        className={"w-full justify-between text-muted-foreground sm:w-35"}
        onClick={() => setOrder((prev) => (prev === "asc" ? "desc" : "asc"))}
      >
        {order === "asc" ? "Asc" : "Desc"}
        <ArrowDownUp className="size-4" aria-hidden="true" />
      </Button> */}

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
