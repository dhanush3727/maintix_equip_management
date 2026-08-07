import {
  Dialog,
  DialogContent,
  DialogTrigger,
  useSidebar,
} from "@/components/ui";
import { EquipmentData } from "../../types/equipment.type";
import { EquipmentCardList } from "./EquipmentCardList";
import { Plus } from "lucide-react";
import { EQUIPMENT_CONTENT } from "../../constants/equipment.constant";
import { AddEquipment } from "./AddEquipment";
import { useEffect, useRef, useState } from "react";
import { CardSkeleton } from "./CardSkeleton";
import { CardErrorState } from "./CardErrorState";
import { CardEmptyState } from "./CardEmptyState";
import { cn } from "@/lib";

interface EquipmentCardProps {
  equipmentList: EquipmentData[];
  isLoading: boolean;
  isError: boolean;
  hasNextPage: boolean;
  isFetchingNextPage: boolean;
  fetchNextPage: () => void;
  onEdit: (id: number) => void;
}

export function EquipmentCard({
  equipmentList,
  isLoading,
  isError,
  hasNextPage,
  isFetchingNextPage,
  fetchNextPage,
  onEdit,
}: EquipmentCardProps) {
  const { open } = useSidebar();
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
    <div
      className={cn(
        "grid grid-cols-1 gap-4 md:grid-cols-2",
        open && "md:grid-cols-1",
      )}
    >
      {/* Add Equipment field for mobile view */}
      <div className="md:hidden">
        <Dialog open={addOpen} onOpenChange={setAddOpen}>
          <DialogTrigger
            render={
              <button
                type="button"
                className="flex w-full h-full flex-col items-center justify-center rounded-md border-2 border-dashed border-border px-5 py-8 text-muted-foreground transition-colors hover:bg-muted/50"
              >
                <Plus className="size-10" aria-hidden="true" />

                <span className="mt-2 text-sm font-medium">
                  {EQUIPMENT_CONTENT.CREATE.TITLE}
                </span>
              </button>
            }
          />

          <DialogContent>
            <AddEquipment onClose={() => setAddOpen(false)} />
          </DialogContent>
        </Dialog>
      </div>

      {isLoading ? (
        Array.from({ length: 6 }, (_, i) => <CardSkeleton key={i} />)
      ) : isError ? (
        <CardErrorState />
      ) : equipmentList.length === 0 ? (
        <CardEmptyState />
      ) : (
        equipmentList.map((item) => (
          <EquipmentCardList key={item.id} item={item} onEdit={onEdit} />
        ))
      )}

      {hasNextPage && (
        <div ref={loadMoreRef} className="col-span-full text-center">
          <span>
            {isFetchingNextPage && EQUIPMENT_CONTENT.BUTTON.LOADING_MORE}
          </span>
        </div>
      )}
    </div>
  );
}
