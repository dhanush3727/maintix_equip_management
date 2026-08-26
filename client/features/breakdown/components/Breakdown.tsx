"use client";

import { useEquipmentDD, useMeta } from "@/hooks";
import {
  BREAKDOWN_CONTENT,
  BREAKDOWN_FORM_CONTENT,
} from "../constants/breakdown.constant";
import { BreakdownFilters } from "./BreakdownFilters";
import { useState } from "react";
import { BreakdownSeverity, BreakdownStatus } from "@/types";
import { Dialog, DialogContent, DialogTrigger } from "@/components/ui";
import { Plus } from "lucide-react";
import { BreakdownForm } from "./BreakdownForm";

export interface BreakdownFilterItems {
  equipment?: number;
  severity?: BreakdownSeverity;
  status?: BreakdownStatus;
}

export function Breakdown() {
  const { data: equipmentDD, isLoading: isEquipment } = useEquipmentDD();
  const { data: meta, isLoading: isMeta } = useMeta();

  const equipment = equipmentDD?.data ?? [];
  const breakdownSeverity = meta?.data?.breakdownSeverity ?? [];
  const breakdownStatus = meta?.data?.breakdownStatus ?? [];
  const [filters, setFilters] = useState<BreakdownFilterItems>({});

  const [createOpen, setCreateOpen] = useState<boolean>(false);

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
        equipment={equipment}
        breakdownSeverity={breakdownSeverity}
        breakdownStatus={breakdownStatus}
      />

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
              equipments={equipment}
              breakdownSeverity={breakdownSeverity}
            />
          </DialogContent>
        </Dialog>
      </div>
    </div>
  );
}
