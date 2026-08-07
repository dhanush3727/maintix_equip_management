import { Skeleton } from "@/components/ui";

export function TaskChecklistSkeleton() {
  return (
    <div className="space-y-4 rounded-lg border bg-card p-4">
      <div className="flex items-start justify-between gap-4">
        <div className="flex-1 space-y-2">
          <Skeleton className="h-5 w-2/3" />
          <Skeleton className="h-4 w-40" />
        </div>
      </div>

      <div className="space-y-2">
        <Skeleton className="h-4 w-24" />
        <Skeleton className="h-10 w-full rounded-md" />
      </div>
    </div>
  );
}
