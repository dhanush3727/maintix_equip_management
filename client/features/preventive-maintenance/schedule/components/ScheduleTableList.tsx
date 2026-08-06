import { Badge, Button, TableCell, TableRow } from "@/components/ui";
import { ScheduleData } from "../types/schedule.type";
import { SquarePen } from "lucide-react";
import { FrequencyType } from "@/types";
import { formatDate } from "../util/schedule.util";

interface ScheduleTableListProps {
  item: ScheduleData;
  onEdit: (id: number) => void;
}

export function ScheduleTableList({ item, onEdit }: ScheduleTableListProps) {
  return (
    <TableRow className="group border-none bg-card shadow-sm transition-colors hover:bg-muted/50">
      <TableCell className="rounded-l-lg px-4 py-4">
        <div className="truncate" title={item.equipmentName}>
          {item.equipmentName}
        </div>
      </TableCell>

      <TableCell className="px-4 py-4">
        <div className="truncate" title={item.template}>
          {item.template}
        </div>
      </TableCell>

      <TableCell className="px-4 py-4">
        <div className="truncate" title={item.assignedTo}>
          {item.assignedTo}
        </div>
      </TableCell>

      <TableCell className="px-4 py-4">
        <Badge
          variant={
            item.frequencyType === FrequencyType.WEEKLY
              ? "info"
              : item.frequencyType === FrequencyType.MONTHLY
                ? "warning"
                : item.frequencyType === FrequencyType.YEARLY
                  ? "destructive"
                  : "success"
          }
        >
          {item.frequencyType}
        </Badge>
      </TableCell>

      {/* <TableCell className="px-4 py-4">{item.interval}</TableCell> */}

      <TableCell className="px-4 py-4">{formatDate(item.startDate)}</TableCell>

      <TableCell className="px-4 py-4">
        {formatDate(item.nextDueDate)}
      </TableCell>

      <TableCell className="px-4 py-4">
        <Badge variant={item.isActive ? "success" : "destructive"}>
          {item.isActive ? "Active" : "Inactive"}
        </Badge>
      </TableCell>
      <TableCell className="px-4 py-4">
        <Button
          variant="ghost"
          size="icon"
          className="size-8 opacity-70 transition-opacity group-hover:opacity-100"
          onClick={() => onEdit(item.id)}
        >
          <SquarePen className="size-4" />
        </Button>
      </TableCell>
    </TableRow>
  );
}
