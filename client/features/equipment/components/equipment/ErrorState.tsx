import { TableCell, TableRow } from "@/components/ui";
import { EQUIPMENT_CONTENT } from "../../constants/equipment.constant";

export function ErrorState() {
  return (
    <TableRow className="text-center h-50">
      <TableCell colSpan={7}>
        <h2 className="text-base font-semibold text-destructive">
          {EQUIPMENT_CONTENT.ERROR.TITLE}
        </h2>
        <p className="mt-1 text-sm text-muted-foreground">
          {EQUIPMENT_CONTENT.ERROR.DESCRIPTION}
        </p>
      </TableCell>
    </TableRow>
  );
}
