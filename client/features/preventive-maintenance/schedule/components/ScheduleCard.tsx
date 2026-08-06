import { useEffect, useRef, useState } from "react";
import { ScheduleData } from "../types/schedule.type";
import { Dialog, DialogContent, DialogTrigger } from "@/components/ui";
import { Plus } from "lucide-react";
import { SCHEDULE_CONTENT } from "../constant/schedule.constant";
import { CreateSchedule } from "./CreateSchedule";
import { CardSkeletionList } from "./CardSkeletonList";
import { CardErrorState } from "./CardErrorState";
import { CardEmptyState } from "./CardEmptyState";
import { ScheduleCardList } from "./ScheduleCardList";

interface ScheduleCardProps {
  scheduleList: ScheduleData[];
  isLoading: boolean;
  isError: boolean;
  hasNextPage: boolean;
  isFetchingNextPage: boolean;
  fetchNextPage: () => void;
  onEdit: (id: number) => void;
}

export function ScheduleCard({
  scheduleList,
  isError,
  isLoading,
  hasNextPage,
  isFetchingNextPage,
  fetchNextPage,
  onEdit,
}: ScheduleCardProps) {
  const [addOpen, setAddOpen] = useState<boolean>(false);

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
  }, [hasNextPage, isFetchingNextPage, fetchNextPage]);

  return (
    <div className="grid grid-cols-1 gap-4 lg:grid-cols-2">
      {/* Add Equipment field for mobile view */}
      <div className="sm:hidden">
        <Dialog open={addOpen} onOpenChange={setAddOpen}>
          <DialogTrigger
            render={
              <button
                type="button"
                className="flex w-full h-full flex-col items-center justify-center rounded-md border-2 border-dashed border-border px-5 py-10 text-muted-foreground transition-colors hover:bg-muted/50"
              >
                <Plus className="size-10" aria-hidden="true" />

                <span className="mt-2 text-sm font-medium">
                  {SCHEDULE_CONTENT.CREATE.TITLE}
                </span>
              </button>
            }
          />

          <DialogContent>
            <CreateSchedule onClose={() => setAddOpen(false)} />
          </DialogContent>
        </Dialog>
      </div>

      {isLoading ? (
        Array.from({ length: 6 }, (_, i) => <CardSkeletionList key={i} />)
      ) : isError ? (
        <CardErrorState />
      ) : scheduleList.length === 0 ? (
        <CardEmptyState />
      ) : (
        scheduleList.map((item) => (
          <ScheduleCardList key={item.id} item={item} onEdit={onEdit} />
        ))
      )}

      {hasNextPage && (
        <div ref={loadMoreRef} className="col-span-full text-center">
          <span>
            {isFetchingNextPage && SCHEDULE_CONTENT.BUTTONS.LOADING_MORE}
          </span>
        </div>
      )}
    </div>
  );
}
