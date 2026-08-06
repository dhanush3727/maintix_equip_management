import { Skeleton, TableCell, TableRow } from "@/components/ui";

export function TableSkeletonList() {
  return (
    <TableRow className="border-none">
      <TableCell colSpan={8} className="px-0">
        <Skeleton className="h-14 w-full rounded-lg" />
      </TableCell>
    </TableRow>
  );
}
