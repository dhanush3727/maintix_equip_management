import {
  Card,
  CardContent,
  CardFooter,
  CardHeader,
  Skeleton,
} from "@/components/ui";

export function SkeletionList() {
  return (
    <Card className="flex h-full flex-col">
      <CardHeader className="space-y-4">
        <div className="flex items-start justify-between gap-3">
          <div className="flex-1 space-y-2">
            <Skeleton className="h-6 w-3/4" />
            <Skeleton className="h-4 w-1/3" />
          </div>

          <div className="space-y-2">
            <Skeleton className="h-6 w-20 rounded-full" />
            <Skeleton className="h-6 w-16 rounded-full" />
          </div>
        </div>
      </CardHeader>

      <CardContent className="flex-1 space-y-4">
        <div className="space-y-3">
          <div className="flex items-center gap-2">
            <Skeleton className="size-4 rounded-full" />
            <Skeleton className="h-4 w-40" />
          </div>

          <div className="flex items-center gap-2">
            <Skeleton className="size-4 rounded-full" />
            <Skeleton className="h-4 w-32" />
          </div>

          <div className="flex items-center gap-2">
            <Skeleton className="size-4 rounded-full" />
            <Skeleton className="h-4 w-36" />
          </div>

          <div className="flex items-center gap-2">
            <Skeleton className="size-4 rounded-full" />
            <Skeleton className="h-4 w-28" />
          </div>
        </div>
      </CardContent>

      <CardFooter className="grid grid-cols-2 gap-3 border-t pt-4">
        <Skeleton className="h-10 w-full rounded-md" />
        <Skeleton className="h-10 w-full rounded-md" />
      </CardFooter>
    </Card>
  );
}
