import { TableCell, TableRow } from "@/components/ui";
import { EQUIPMENT_CONTENT } from "../../constants/equipment.constant";

export function EmptyState() {
  return (
    <TableRow className="text-center h-50">
      <TableCell colSpan={7}>
        <h2 className="text-base font-semibold">
          {EQUIPMENT_CONTENT.NO_DATA.TITLE}
        </h2>
        <p className="mt-1 text-sm text-muted-foreground">
          {EQUIPMENT_CONTENT.NO_DATA.DESCRIPTION}
        </p>
      </TableCell>
    </TableRow>
  );
}
