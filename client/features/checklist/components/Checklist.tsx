"use client";

import { Dialog, DialogContent, DialogTrigger } from "@/components/ui";
import { CHECKLIST_CONTENT } from "../constants/checklist.constant";
import { Plus } from "lucide-react";
import { useEffect, useRef, useState } from "react";
import { CreateChecklist } from "./CreateChecklist";
import { useGetChecklists } from "../hooks/useGetChecklists";
import { ChecklistList } from "./ChecklistList";
import { SkeletonList } from "./SkeletonList";
import { ErrorState } from "./ErrorState";
import { EmptyState } from "./EmptyState";
import { useDebounce } from "@/hooks";
import { FilterItem } from "./FilterItem";
import { useEquipmentTypeDD } from "@/features/equipment/hooks/equipment-type/useEquipmentTypeDD";
import { getOptionLabel } from "@/lib";
import { UpdateChecklist } from "./UpdateChecklist";

export function Checklist() {
  const { data: equipType, isLoading: isEquipType } = useEquipmentTypeDD();
  const equipTypeDD = equipType?.data ?? [];

  const [search, setSearch] = useState<string>("");
  const [type, setType] = useState<number | undefined>(undefined);
  const debouncedSearch = useDebounce(search, 500);
  const typeName = getOptionLabel(equipTypeDD, type);

  const {
    data: checklistData,
    isLoading,
    isError,
    hasNextPage,
    isFetchingNextPage,
    fetchNextPage,
  } = useGetChecklists({
    search: debouncedSearch,
    type: typeName,
  });

  const checklists =
    checklistData?.pages.flatMap((page) => page.data ?? []) ?? [];

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
      {
        rootMargin: "200px",
      },
    );

    observer.observe(element);

    return () => {
      observer.disconnect();
    };
  }, [hasNextPage, fetchNextPage, isFetchingNextPage]);

  const [createOpen, setCreateOpen] = useState<boolean>(false);
  const [updateOpen, setUpdateOpen] = useState<number | null>(null);

  return (
    <>
      <div className="space-y-6">
        <div className="space-y-1">
          <h1 className="text-2xl font-semibold tracking-tight">
            {CHECKLIST_CONTENT.HEADER.TITLE}
          </h1>
          <p className="text-sm text-muted-foreground">
            {CHECKLIST_CONTENT.HEADER.DESCRIPTION}
          </p>
        </div>

        <FilterItem
          search={search}
          setSearch={setSearch}
          type={type}
          setType={setType}
          equipTypeDD={equipTypeDD}
          isEquipType={isEquipType}
        />

        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3 2xl:grid-cols-4">
          {/* Add checklist */}
          <Dialog open={createOpen} onOpenChange={setCreateOpen}>
            <DialogTrigger
              render={
                <button
                  type="button"
                  className="flex w-full flex-col items-center justify-center rounded-md border-2 border-dashed border-border px-5 py-10 text-muted-foreground transition-colors hover:bg-muted/50"
                >
                  <Plus className="size-10" aria-hidden="true" />

                  <span>{CHECKLIST_CONTENT.CREATE.TITLE}</span>
                </button>
              }
            />

            <DialogContent className={"w-[90vw] max-w-6xl"}>
              <CreateChecklist
                onClose={() => setCreateOpen(false)}
                equipTypeDD={equipTypeDD}
                isEquipType={isEquipType}
              />
            </DialogContent>
          </Dialog>

          {isLoading ? (
            Array.from({ length: 7 }, (_, i) => <SkeletonList key={i} />)
          ) : isError ? (
            <ErrorState />
          ) : checklists.length === 0 ? (
            <EmptyState />
          ) : (
            checklists.map((item) => (
              <ChecklistList key={item.id} item={item} onEdit={setUpdateOpen} />
            ))
          )}
        </div>

        {hasNextPage && (
          <div ref={loadMoreRef} className="flex h-10 justify-center">
            <span>
              {isFetchingNextPage && CHECKLIST_CONTENT.BUTTON.LOAD_MORE}
            </span>
          </div>
        )}

        <Dialog
          open={updateOpen !== null}
          onOpenChange={(open) => {
            if (!open) {
              setUpdateOpen(null);
            }
          }}
        >
          <DialogContent className={"w-[90vw] max-w-6xl"}>
            {updateOpen !== null && (
              <UpdateChecklist
                id={updateOpen}
                equipTypeDD={equipTypeDD}
                isEquipType={isEquipType}
                onClose={() => setUpdateOpen(null)}
              />
            )}
          </DialogContent>
        </Dialog>
      </div>
    </>
  );
}
