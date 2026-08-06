import {
  Table,
  TableBody,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui";
import { ScheduleData } from "../types/schedule.type";
import { SCHEDULE_TABLE_COLUMN } from "../constant/schedule.constant";
import { TableSkeletonList } from "./TableSkeletionList";
import { TableErrorState } from "./TableErrorState";
import { TableEmptyState } from "./TableEmptyState";
import { ScheduleTableList } from "./ScheduleTableList";

interface ScheduleTableListProps {
  scheduleList: ScheduleData[];
  isLoading: boolean;
  isError: boolean;
  onEdit: (id: number) => void;
}

export function ScheduleTable({
  isError,
  isLoading,
  scheduleList,
  onEdit,
}: ScheduleTableListProps) {
  return (
    <Table className="w-full table-fixed border-separate border-spacing-y-2">
      <TableHeader>
        <TableRow>
          {SCHEDULE_TABLE_COLUMN.map((column) => (
            <TableHead
              key={column.key}
              className="h-10 bg-balck px-4 text-xs font-medium uppercase tracking-wide text-muted-foreground"
            >
              {column.label}
            </TableHead>
          ))}
        </TableRow>
      </TableHeader>

      <TableBody>
        {isLoading ? (
          Array.from({ length: 8 }, (_, i) => <TableSkeletonList key={i} />)
        ) : isError ? (
          <TableErrorState />
        ) : scheduleList.length === 0 ? (
          <TableEmptyState />
        ) : (
          scheduleList.map((item) => (
            <ScheduleTableList key={item.id} item={item} onEdit={onEdit} />
          ))
        )}
      </TableBody>
    </Table>
  );
}
