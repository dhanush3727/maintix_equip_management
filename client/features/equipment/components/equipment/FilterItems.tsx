import { Dispatch, SetStateAction } from "react";
import { EquipmentParams } from "../../types/equipment.type";
import {
  Button,
  Input,
  SearchSelect,
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui";
import { useMeta, useOrganizationDD } from "@/hooks";
import { EQUIPMENT_CONTENT } from "../../constants/equipment.constant";
import { ArrowDownUp } from "lucide-react";

interface FilterItemsProps {
  search: string;
  setSearch: Dispatch<SetStateAction<string>>;

  sortBy: EquipmentParams["sortBy"] | "";
  setSortyBy: Dispatch<SetStateAction<EquipmentParams["sortBy"] | "">>;

  order: EquipmentParams["order"];
  setOrder: Dispatch<SetStateAction<EquipmentParams["order"]>>;

  status: string;
  setStatus: Dispatch<SetStateAction<string | number>>;

  department: string;
  setDepartment: Dispatch<SetStateAction<string>>;

  location: string;
  setLocation: Dispatch<SetStateAction<string>>;

  type: string;
  setType: Dispatch<SetStateAction<string>>;
}

export function FilterItems({
  search,
  setSearch,
  sortBy,
  setSortyBy,
  order,
  setOrder,
  status,
  setStatus,
  location,
  setLocation,
  department,
  setDepartment,
  type,
  setType,
}: FilterItemsProps) {
  const { data: organization, isLoading: isOranization } = useOrganizationDD();
  const { data: meta, isLoading: isMeta } = useMeta();

  const statusDD = meta?.data?.euqipmentStatus ?? [];
  const locationDD = organization?.data?.location ?? [];
  const deparmentDD = organization?.data?.department ?? [];

  return (
    <div>
      <Input
        value={search}
        onChange={(event) => setSearch(event.target.value)}
        placeholder={EQUIPMENT_CONTENT.FILTERS.SEARCH}
        className="w-full sm:flex-1"
      />

      <SearchSelect
        options={statusDD}
        value={status}
        onValueChange={setStatus}
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
      </Button>
    </div>
  );
}
