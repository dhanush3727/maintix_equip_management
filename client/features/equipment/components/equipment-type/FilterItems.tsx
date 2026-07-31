import {
  Button,
  Input,
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui";
import { EQUIPMENT_TYPE_CONTENT } from "../../constants/equipment-type.constant";
import { ArrowDownUp } from "lucide-react";
import { EquipmentTypeParams } from "../../types/equipment-type.type";
import { Dispatch, SetStateAction } from "react";

interface FilterItemsProps {
  search: string;
  setSearch: Dispatch<SetStateAction<string>>;

  sortBy: EquipmentTypeParams["sortBy"] | "";
  setSortyBy: Dispatch<SetStateAction<EquipmentTypeParams["sortBy"] | "">>;

  order: EquipmentTypeParams["order"];
  setOrder: Dispatch<SetStateAction<EquipmentTypeParams["order"]>>;
}

export function FilterItems({
  search,
  setSearch,
  sortBy,
  setSortyBy,
  order,
  setOrder,
}: FilterItemsProps) {
  return (
    <div className="flex flex-col gap-3 sm:flex-row">
      <Input
        value={search}
        onChange={(event) => setSearch(event.target.value)}
        placeholder={EQUIPMENT_TYPE_CONTENT.FILTERS.SEARCH}
        className="w-full sm:flex-1"
      />

      <Select
        value={sortBy}
        onValueChange={(value) =>
          setSortyBy(value === "name" || value === "code" ? value : "")
        }
      >
        <SelectTrigger
          className={"w-full sm:w-40 bg-card rounded-md"}
          size="lg"
        >
          <SelectValue placeholder={EQUIPMENT_TYPE_CONTENT.FILTERS.SORTBY} />
        </SelectTrigger>

        <SelectContent className={"rounded-md"}>
          <SelectItem value={EQUIPMENT_TYPE_CONTENT.SORTBY.NAME_VALUE}>
            {EQUIPMENT_TYPE_CONTENT.SORTBY.NAME_VALUE}
          </SelectItem>
          <SelectItem value={EQUIPMENT_TYPE_CONTENT.SORTBY.CODE_VALUE}>
            {EQUIPMENT_TYPE_CONTENT.SORTBY.CODE_VALUE}
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
      </Button>
    </div>
  );
}
