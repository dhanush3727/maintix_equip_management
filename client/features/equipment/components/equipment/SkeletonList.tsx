import { Skeleton, TableCell, TableRow } from "@/components/ui";

export function SkeletonList() {
  return (
    <TableRow className="border-none">
      <TableCell colSpan={7} className="px-0">
        <Skeleton className="h-14 w-full rounded-lg" />
      </TableCell>
    </TableRow>
  );
}
