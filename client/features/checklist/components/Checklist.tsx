"use client";

import { Dialog, DialogContent, DialogTrigger } from "@/components/ui";
import { CHECKLIST_CONTENT } from "../constants/checklist.constant";
import { Plus } from "lucide-react";
import { useState } from "react";
import { CreateChecklist } from "./CreateChecklist";

export function Checklist() {
  const [createOpen, setCreateOpen] = useState<boolean>(false);

  return (
    <div className="space-y-6">
      <div className="space-y-1">
        <h1 className="text-2xl font-semibold tracking-tight">
          {CHECKLIST_CONTENT.HEADER.TITLE}
        </h1>
        <p className="text-sm text-muted-foreground">
          {CHECKLIST_CONTENT.HEADER.DESCRIPTION}
        </p>
      </div>

      <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3 2xl:grid-cols-4">
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
            <CreateChecklist onClose={() => setCreateOpen(false)} />
          </DialogContent>
        </Dialog>
      </div>
    </div>
  );
}
