import { Dispatch, SetStateAction } from "react";
import { TaskFilters } from "./Task";
import { DropDown, TaskStatusType } from "@/types";
import {
  Button,
  Field,
  FieldContent,
  FieldLabel,
  Input,
  SearchSelect,
  Skeleton,
} from "@/components/ui";
import { TASK_CONTENT } from "../constant/task.constant";
import { TaskParams } from "../types/task.type";
import { X } from "lucide-react";

interface FilterItemsParams {
  params: TaskFilters;
  setParams: Dispatch<SetStateAction<TaskFilters>>;

  equipments: DropDown[];
  isEquipment: boolean;

  status: TaskStatusType[];
  isMeta: boolean;

  users: DropDown[];
  isUsers: boolean;
}

export function FilterItems(props: FilterItemsParams) {
  const {
    params,
    setParams,
    equipments,
    isEquipment,
    status,
    isMeta,
    users,
    isUsers,
  } = props;

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

              // SearchSelect callback is typed as `string | number`.
              // Even if this dropdown currently returns a number,
              // TypeScript only knows it could be either.
              // Convert it explicitly to ensure `equipment` is always a number.
              equipment: Number(value),
            }));
          }}
          placeholder={TASK_CONTENT.FILTERS.EQUIPMENT_PLACEHOLDER}
          searchPlaceholder={TASK_CONTENT.FILTERS.EQUIPMENT_SEARCH_PLACEHOLDER}
        />
      )}

      {isMeta ? (
        <Skeleton className="h-10" />
      ) : (
        <SearchSelect
          options={status}
          value={params.status}
          onValueChange={(value) => {
            setParams((prev) => ({
              ...prev,
              status: value as TaskParams["status"],
            }));
          }}
          placeholder={TASK_CONTENT.FILTERS.STATUS_PLACEHOLDER}
          searchPlaceholder={TASK_CONTENT.FILTERS.STATUS_SEARCH_PLACEHOLDER}
        />
      )}

      {isUsers ? (
        <Skeleton className="h-10" />
      ) : (
        <SearchSelect
          options={users}
          value={params.assignedTo}
          onValueChange={(value) => {
            setParams((prev) => ({
              ...prev,
              assignedTo: Number(value),
            }));
          }}
          placeholder={TASK_CONTENT.FILTERS.USERS_PLACEHOLDER}
          searchPlaceholder={TASK_CONTENT.FILTERS.USERS_SEARCH_PLACEHOLDER}
        />
      )}

      <Field className="relative">
        <FieldLabel
          htmlFor="from-date"
          className="absolute -top-2 left-3 px-1 text-xs text-muted-foreground"
        >
          {TASK_CONTENT.FILTERS.FROM_DATE_LABEL}
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
          />
        </FieldContent>
      </Field>

      <Field className="relative">
        <FieldLabel
          htmlFor="from-date"
          className="absolute -top-2 left-3 px-1 text-xs text-muted-foreground"
        >
          {TASK_CONTENT.FILTERS.TO_DATE_LABEL}
        </FieldLabel>

        <FieldContent>
          <Input
            id="from-date"
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
