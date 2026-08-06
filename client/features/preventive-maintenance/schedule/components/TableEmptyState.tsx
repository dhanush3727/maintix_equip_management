import { TableCell, TableRow } from "@/components/ui";
import { SCHEDULE_CONTENT } from "../constant/schedule.constant";

export function TableEmptyState() {
  return (
    <TableRow className="text-center h-50">
      <TableCell colSpan={7}>
        <h2 className="text-base font-semibold">
          {SCHEDULE_CONTENT.NO_DATA.TITLE}
        </h2>
        <p className="mt-1 text-sm text-muted-foreground">
          {SCHEDULE_CONTENT.NO_DATA.DESCRIPTION}
        </p>
      </TableCell>
    </TableRow>
  );
}
