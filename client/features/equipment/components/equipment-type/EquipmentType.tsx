"use client";

import { Button, Dialog, DialogContent, DialogTrigger } from "@/components/ui";
import { useGetEquipmentTypes } from "../../hooks/equipment-type/useGetEquipmentTypes";
import { EQUIPMENT_TYPE_CONTENT } from "../../constants/equipment-type.constant";
import { EquipmentTypeList } from "./EquipmentTypeList";
import { EmptyState } from "./EmptyState";
import { ErrorState } from "./ErrorState";
import { SkeletonList } from "./SkeletonList";
import { useState } from "react";
import { useDebounce } from "@/hooks";
import { EquipmentTypeParams } from "../../types/equipment-type.type";
import { FilterItems } from "./FilterItems";
import { Plus } from "lucide-react";
import { AddEquipmentType } from "./AddEquipmentType";

export function EquipmentType() {
  const [search, setSearch] = useState<string>("");
  const [sortBy, setSortyBy] = useState<EquipmentTypeParams["sortBy"] | "">("");
  const [order, setOrder] = useState<EquipmentTypeParams["order"]>("desc");
  const [addTypeOpen, setAddTypeOpen] = useState<boolean>(false);

  const debouncedSearch = useDebounce(search, 500);

  const {
    data,
    isLoading,
    isError,
    hasNextPage,
    isFetchingNextPage,
    fetchNextPage,
  } = useGetEquipmentTypes({
    search: debouncedSearch,
    sortBy: sortBy || undefined,
    order,
  });

  const equipmentTypes = data?.pages.flatMap((page) => page.data ?? []) ?? [];

  return (
    <div className="space-y-6">
      <FilterItems
        search={search}
        setSearch={setSearch}
        sortBy={sortBy}
        setSortyBy={setSortyBy}
        order={order}
        setOrder={setOrder}
      />

      <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3 2xl:grid-cols-4">
        <div className="sm:hidden">
          <Dialog open={addTypeOpen} onOpenChange={setAddTypeOpen}>
            <DialogTrigger
              render={
                <button
                  type="button"
                  className="flex w-full flex-col items-center justify-center rounded-md border-2 border-dashed border-border px-5 py-8 text-muted-foreground transition-colors hover:bg-muted/50"
                >
                  <Plus className="size-10" aria-hidden="true" />

                  <span className="mt-2 text-sm font-medium">
                    {EQUIPMENT_TYPE_CONTENT.TITLE}
                  </span>
                </button>
              }
            />

            <DialogContent>
              <AddEquipmentType onClose={() => setAddTypeOpen(false)} />
            </DialogContent>
          </Dialog>
        </div>
        {isLoading ? (
          Array.from({ length: 8 }).map((_, i) => <SkeletonList key={i} />)
        ) : isError ? (
          <ErrorState />
        ) : equipmentTypes.length === 0 ? (
          <EmptyState />
        ) : (
          equipmentTypes.map((item) => (
            <EquipmentTypeList key={item.id} item={item} />
          ))
        )}
      </div>

      {hasNextPage && (
        <div className="flex justify-center">
          <Button
            type="button"
            variant="outline"
            onClick={() => fetchNextPage()}
            disabled={isFetchingNextPage}
            className="min-w-32"
          >
            {isFetchingNextPage
              ? EQUIPMENT_TYPE_CONTENT.BUTTON.LOADING_MORE
              : EQUIPMENT_TYPE_CONTENT.BUTTON.LOAD_MORE}
          </Button>
        </div>
      )}
    </div>
  );
}
