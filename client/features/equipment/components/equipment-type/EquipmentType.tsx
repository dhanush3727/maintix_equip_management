"use client";

import { Dialog, DialogContent, DialogTrigger } from "@/components/ui";
import { useGetEquipmentTypes } from "../../hooks/equipment-type/useGetEquipmentTypes";
import { EQUIPMENT_TYPE_CONTENT } from "../../constants/equipment-type.constant";
import { EquipmentTypeList } from "./EquipmentTypeList";
import { EmptyState } from "./EmptyState";
import { ErrorState } from "./ErrorState";
import { SkeletonList } from "./SkeletonList";
import { useEffect, useRef, useState } from "react";
import { useAuth, useDebounce } from "@/hooks";
import { EquipmentTypeParams } from "../../types/equipment-type.type";
import { FilterItems } from "./FilterItems";
import { Plus } from "lucide-react";
import { AddEquipmentType } from "./AddEquipmentType";
import { EditEquipmentType } from "./EditEquipmentType";
import { ROLE_IDS } from "@/constants/role.constant";

export function EquipmentType() {
  const { user } = useAuth();

  const [search, setSearch] = useState<string>("");
  const [sortBy, setSortyBy] = useState<EquipmentTypeParams["sortBy"] | "">("");
  const [order, setOrder] = useState<EquipmentTypeParams["order"]>("desc");
  const [addTypeOpen, setAddTypeOpen] = useState<boolean>(false);
  const [editTypeId, setEditTypeId] = useState<number | null>(null);

  const debouncedSearch = useDebounce(search, 500);

  const canAccess = user?.roles.some(
    (role) => role.id === ROLE_IDS.ADMIN || role.id === ROLE_IDS.MANAGER,
  );

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

  const loadMoreRef = useRef<HTMLDivElement | null>(null);

  useEffect(() => {
    const element = loadMoreRef.current;

    if (!element || !hasNextPage || isFetchingNextPage) return;

    const observer = new IntersectionObserver(
      (entries) => {
        const [entry] = entries;

        if (entry.isIntersecting) {
          fetchNextPage();
        }
      },

      // Start loading slightly before the user actually reaches the bottom.
      {
        rootMargin: "200px",
      },
    );

    observer.observe(element);

    return () => {
      observer.disconnect();
    };
  }, [hasNextPage, isFetchingNextPage, fetchNextPage]);

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
        {/* Add Equipment field for mobile view */}
        {canAccess && (
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
        )}

        {isLoading ? (
          Array.from({ length: 8 }).map((_, i) => <SkeletonList key={i} />)
        ) : isError ? (
          <ErrorState />
        ) : equipmentTypes.length === 0 ? (
          <EmptyState />
        ) : (
          equipmentTypes.map((item) => (
            <EquipmentTypeList
              key={item.id}
              item={item}
              onEdit={setEditTypeId}
            />
          ))
        )}
      </div>

      {hasNextPage && (
        <div ref={loadMoreRef} className="flex h-10 justify-center">
          <span>
            {isFetchingNextPage && EQUIPMENT_TYPE_CONTENT.BUTTON.LOADING_MORE}
          </span>
        </div>
      )}

      <Dialog
        open={editTypeId !== null}
        onOpenChange={(open) => {
          if (!open) {
            setEditTypeId(null);
          }
        }}
      >
        <DialogContent>
          {editTypeId !== null && (
            <EditEquipmentType
              id={editTypeId}
              onClose={() => setEditTypeId(null)}
            />
          )}
        </DialogContent>
      </Dialog>
    </div>
  );
}
