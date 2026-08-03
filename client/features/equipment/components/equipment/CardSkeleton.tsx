import { Card, CardContent, CardHeader, Skeleton } from "@/components/ui";

export function CardSkeleton() {
  return (
    <Card className="flex h-full flex-col overflow-hidden border-border/60 bg-card shadow-sm">
      <CardHeader className="space-y-0 pb-3">
        <div className="flex items-start justify-between gap-3">
          {/* Equipment name + code */}
          <div className="min-w-0 flex-1 space-y-2">
            <Skeleton className="h-5 w-32" />
            <Skeleton className="h-3 w-20" />
          </div>

          {/* Edit + status */}
          <div className="flex shrink-0 flex-col items-end gap-2">
            <Skeleton className="size-8 rounded-md" />
            <Skeleton className="h-5 w-16 rounded-full" />
          </div>
        </div>
      </CardHeader>

      <CardContent className="flex-1 pt-0">
        <div className="divide-y rounded-lg border bg-muted/20">
          {/* Equipment Type */}
          <div className="flex items-center gap-3 px-3 py-3">
            <Skeleton className="size-8 shrink-0 rounded-md" />

            <div className="min-w-0 flex-1 space-y-1.5">
              <Skeleton className="h-3 w-24" />
              <Skeleton className="h-4 w-32" />
            </div>
          </div>

          {/* Location */}
          <div className="flex items-center gap-3 px-3 py-3">
            <Skeleton className="size-8 shrink-0 rounded-md" />

            <div className="min-w-0 flex-1 space-y-1.5">
              <Skeleton className="h-3 w-16" />
              <Skeleton className="h-4 w-28" />
            </div>
          </div>

          {/* Department */}
          <div className="flex items-center gap-3 px-3 py-3">
            <Skeleton className="size-8 shrink-0 rounded-md" />

            <div className="min-w-0 flex-1 space-y-1.5">
              <Skeleton className="h-3 w-20" />
              <Skeleton className="h-4 w-32" />
            </div>
          </div>
        </div>
      </CardContent>
    </Card>
  );
}
