import { Card, CardContent, CardHeader, Skeleton } from "@/components/ui";

export function SkeletonList() {
  return (
    <Card className="flex h-full flex-col">
      <CardHeader className="pb-3">
        <div className="flex items-start justify-between gap-3">
          <div className="min-w-0 space-y-2">
            <Skeleton className="h-5 w-32" />
            <Skeleton className="h-3 w-20" />
          </div>

          <Skeleton className="size-8 shrink-0 rounded-md" />
        </div>

        <div className="pt-2">
          <Skeleton className="h-5 w-14 rounded-full" />
        </div>
      </CardHeader>

      <CardContent className="flex-1">
        <div className="space-y-2">
          <Skeleton className="h-4 w-full" />
          <Skeleton className="h-4 w-[90%]" />
          <Skeleton className="h-4 w-[70%]" />
        </div>
      </CardContent>
    </Card>
  );
}
