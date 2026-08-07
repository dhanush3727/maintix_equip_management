import { DialogHeader, Skeleton } from "@/components/ui";

export function UpdateTaskHeaderSkeleton() {
  return (
    <DialogHeader className="space-y-4">
      <div className="space-y-2">
        <Skeleton className="h-6 w-3/4" />

        <Skeleton className="h-4 w-1/3" />
      </div>

      <div className="grid grid-cols-2 gap-3 rounded-lg border p-4">
        <div className="flex items-center gap-3">
          <Skeleton className="size-4 rounded-full" />

          <div className="space-y-2">
            <Skeleton className="h-3 w-16" />
            <Skeleton className="h-4 w-24" />
          </div>
        </div>

        <div className="flex items-center gap-3">
          <Skeleton className="size-4 rounded-full" />

          <div className="space-y-2">
            <Skeleton className="h-3 w-16" />
            <Skeleton className="h-4 w-28" />
          </div>
        </div>

        <Skeleton className="col-span-2 h-9 rounded-md" />
      </div>
    </DialogHeader>
  );
}
