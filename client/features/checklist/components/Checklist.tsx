"use client";

import { Button, Dialog, DialogContent, DialogTrigger } from "@/components/ui";
import { CHECKLIST_CONTENT } from "../constants/checklist.constant";
import { Plus } from "lucide-react";
import { useEffect, useRef, useState } from "react";
import { CreateChecklist } from "./CreateChecklist";
import { useGetChecklists } from "../hooks/useGetChecklists";
import { ChecklistList } from "./ChecklistList";
import { SkeletonList } from "./SkeletonList";
import { ErrorState } from "./ErrorState";
import { EmptyState } from "./EmptyState";
import { useAuth } from "@/hooks";
import { ROLE_IDS } from "@/constants/role.constant";
import { ROUTES } from "@/constants";
import { useRouter } from "next/navigation";

export function Checklist() {
  const router = useRouter();
  const {
    data: checklistData,
    isLoading,
    isError,
    hasNextPage,
    isFetchingNextPage,
    fetchNextPage,
  } = useGetChecklists();
  const { user } = useAuth();

  const checklists =
    checklistData?.pages.flatMap((page) => page.data ?? []) ?? [];

  const canAccess = user?.roles.some(
    (role) => role.id === ROLE_IDS.ADMIN || role.id === ROLE_IDS.MANAGER,
  );

  const [createOpen, setCreateOpen] = useState<boolean>(false);

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

  return (
    <>
      {!canAccess ? (
        <div className="flex flex-col gap-3 justify-center items-center min-h-50">
          <h1 className="text-muted-foreground text-xl">
            {CHECKLIST_CONTENT.ACCESS.TITLE}
          </h1>
          <Button size={"sm"} onClick={() => router.replace(ROUTES.DASHBOARD)}>
            {CHECKLIST_CONTENT.ACCESS.BUTTON}
          </Button>
        </div>
      ) : (
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
                <CreateChecklist onClose={() => setCreateOpen(false)} />
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
                <ChecklistList key={item.id} item={item} onEdit={() => {}} />
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
        </div>
      )}
    </>
  );
}
