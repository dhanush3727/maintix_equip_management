import { TableCell, TableRow } from "@/components/ui";
import { SCHEDULE_CONTENT } from "../constant/schedule.constant";

export function TableErrorState() {
  return (
    <TableRow className="text-center h-50">
      <TableCell colSpan={7}>
        <h2 className="text-base font-semibold text-destructive">
          {SCHEDULE_CONTENT.ERROR.TITLE}
        </h2>
        <p className="mt-1 text-sm text-muted-foreground">
          {SCHEDULE_CONTENT.ERROR.DESCRIPTION}
        </p>
      </TableCell>
    </TableRow>
  );
}
