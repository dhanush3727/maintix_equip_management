"use client";

import { useAuth, useEquipmentDD, useMeta } from "@/hooks";
import {
  BREAKDOWN_CONTENT,
  BREAKDOWN_FORM_CONTENT,
} from "../constants/breakdown.constant";
import { BreakdownFilters } from "./BreakdownFilters";
import { useEffect, useRef, useState } from "react";
import { BreakdownSeverity, BreakdownStatus } from "@/types";
import { Dialog, DialogContent, DialogTrigger } from "@/components/ui";
import { Plus } from "lucide-react";
import { BreakdownForm } from "./BreakdownForm";
import { useBreakdowns } from "../hooks/useBreakdowns";
import { BreakdownList } from "./BreakdownList";
import { BreakdownListSkeleton } from "./BreakdownListSkeleton";
import { BreakdownListError } from "./BreakdownListError";
import { BreakdownListEmpty } from "./BreakdownListEmpty";
import { getOptionLabel } from "@/lib";
import { ROLE_IDS } from "@/constants/role.constant";

export interface BreakdownFilterItems {
  equipment?: number;
  severity?: BreakdownSeverity;
  status?: BreakdownStatus;
}

export function Breakdown() {
  const { data: equipmentDD, isLoading: isEquipment } = useEquipmentDD();
  const { data: meta, isLoading: isMeta } = useMeta();
  const { user } = useAuth();

  const equipments = equipmentDD?.data ?? [];
  const breakdownSeverity = meta?.data?.breakdownSeverity ?? [];
  const breakdownStatus = meta?.data?.breakdownStatus ?? [];
  const [filters, setFilters] = useState<BreakdownFilterItems>({});
  const equipment = getOptionLabel(equipments, filters.equipment);
  const isManager = user?.roles.some((role) => role.id === ROLE_IDS.MANAGER);

  const {
    data: breakdownData,
    isLoading: isBreakdownLoading,
    isError: isBreakdownError,
    hasNextPage,
    isFetchingNextPage,
    fetchNextPage,
  } = useBreakdowns({
    ...filters,
    equipment,
  });
  const breakdowns =
    breakdownData?.pages.flatMap((page) => page.data ?? []) ?? [];

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
      { rootMargin: "200px" },
    );

    observer.observe(element);

    return () => {
      observer.disconnect();
    };
  }, [hasNextPage, fetchNextPage, isFetchingNextPage]);

  const [createOpen, setCreateOpen] = useState<boolean>(false);
  const [viewOpen, setViewOpen] = useState<number | null>(null);
  const [assignOpen, setAssignOpen] = useState<number | null>(null);
  const [resolveOpen, setResolveOpen] = useState<number | null>(null);

  return (
    <div className="space-y-6">
      <div className="space-y-1">
        <h1 className="text-2xl font-semibold tracking-tight">
          {BREAKDOWN_CONTENT.TITLE}
        </h1>

        <p className="text-sm text-muted-foreground">
          {BREAKDOWN_CONTENT.DESCRIPTION}
        </p>
      </div>

      <BreakdownFilters
        filters={filters}
        onFilterChange={setFilters}
        isEquipment={isEquipment}
        isMeta={isMeta}
        equipment={equipments}
        breakdownSeverity={breakdownSeverity}
        breakdownStatus={breakdownStatus}
      />

      {isBreakdownError ? (
        <BreakdownListError />
      ) : !isBreakdownLoading && breakdowns.length === 0 ? (
        <BreakdownListEmpty />
      ) : null}

      <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3 2xl:grid-cols-4">
        {/* Create Breakdown */}
        <Dialog open={createOpen} onOpenChange={setCreateOpen}>
          <DialogTrigger
            render={
              <button
                type="button"
                className="flex w-full flex-col items-center justify-center rounded-md border-2 border-dashed border-border px-5 py-10 text-muted-foreground transition-colors hover:bg-muted/50"
              >
                <Plus className="size-10" aria-hidden="true" />

                <span>{BREAKDOWN_FORM_CONTENT.CREATE_TITLE}</span>
              </button>
            }
          />

          <DialogContent className={"w-[90vw] max-w-6xl"}>
            <BreakdownForm
              mode="create"
              onClose={() => setCreateOpen(false)}
              equipments={equipments}
              breakdownSeverity={breakdownSeverity}
              isEquipment={isEquipment}
              isMeta={isMeta}
            />
          </DialogContent>
        </Dialog>

        {isBreakdownLoading
          ? Array.from({ length: 11 }, (_, i) => (
              <BreakdownListSkeleton key={i} />
            ))
          : !isBreakdownError &&
            breakdowns.length > 0 &&
            breakdowns.map((item) => (
              <BreakdownList
                item={item}
                key={item.id}
                onView={setViewOpen}
                onAssign={setAssignOpen}
                onResolve={setResolveOpen}
                isManager={isManager}
                technicianId={user?.id}
              />
            ))}
      </div>

      {hasNextPage && (
        <div ref={loadMoreRef} className="flex h-10 justify-center">
          <span>{isFetchingNextPage && BREAKDOWN_CONTENT.LOAD_MORE}</span>
        </div>
      )}

      <Dialog
        open={viewOpen !== null}
        onOpenChange={(open) => {
          if (!open) setViewOpen(null);
        }}
      >
        <DialogContent className={"w-[90vw] max-w-6xl"}>
          {viewOpen !== null && (
            <BreakdownForm
              mode="view"
              id={viewOpen}
              equipments={equipments}
              breakdownSeverity={breakdownSeverity}
              isEquipment={isEquipment}
              isMeta={isMeta}
            />
          )}
        </DialogContent>
      </Dialog>

      <Dialog
        open={assignOpen !== null}
        onOpenChange={(open) => {
          if (!open) setAssignOpen(null);
        }}
      >
        <DialogContent className={"w-[90vw] max-w-6xl"}>
          {assignOpen !== null && (
            <BreakdownForm
              mode="assign"
              id={assignOpen}
              equipments={equipments}
              breakdownSeverity={breakdownSeverity}
              isEquipment={isEquipment}
              isMeta={isMeta}
              onClose={() => setAssignOpen(null)}
            />
          )}
        </DialogContent>
      </Dialog>

      <Dialog
        open={resolveOpen !== null}
        onOpenChange={(open) => {
          if (!open) setResolveOpen(null);
        }}
      >
        <DialogContent className={"w-[90vw] max-w-6xl"}>
          {resolveOpen !== null && (
            <BreakdownForm
              mode="resolve"
              id={resolveOpen}
              equipments={equipments}
              breakdownSeverity={breakdownSeverity}
              isEquipment={isEquipment}
              isMeta={isMeta}
              onClose={() => setAssignOpen(null)}
            />
          )}
        </DialogContent>
      </Dialog>
    </div>
  );
}
