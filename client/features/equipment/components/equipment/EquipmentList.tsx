import {
  Badge,
  Button,
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui";
import { EquipmentData } from "../../types/equipment.type";
import { EQUIPMENT_TABLE_COLUMNS } from "../../constants/equipment.constant";
import { SquarePen } from "lucide-react";
import { EquipmentStatus } from "@/types";
import { SkeletonList } from "./SkeletonList";
import { ErrorState } from "./ErrorState";
import { EmptyState } from "./EmptyState";

interface EquipmentListProps {
  equipmentList: EquipmentData[];
  isLoading: boolean;
  isError: boolean;
  onEdit: (id: number) => void;
}

export function EquipmentList({
  equipmentList,
  isLoading,
  isError,
  onEdit,
}: EquipmentListProps) {
  return (
    <Table className="border-separate border-spacing-y-2">
      <TableHeader>
        <TableRow className="hover:bg-transparent">
          {EQUIPMENT_TABLE_COLUMNS.map((column) => (
            <TableHead
              key={column.key}
              className="h-10 px-4 text-xs font-medium uppercase tracking-wide text-muted-foreground"
            >
              {column.label}
            </TableHead>
          ))}
        </TableRow>
      </TableHeader>

      <TableBody>
        {isLoading ? (
          Array.from({ length: 5 }, (_, i) => <SkeletonList key={i} />)
        ) : isError ? (
          <ErrorState />
        ) : equipmentList.length === 0 ? (
          <EmptyState />
        ) : (
          equipmentList.map((item) => (
            <TableRow
              key={item.id}
              className="group border-none bg-card shadow-sm transition-colors hover:bg-muted/50"
            >
              <TableCell className="rounded-l-lg px-4 py-4 font-medium">
                {item.name}
              </TableCell>

              <TableCell className="px-4 py-4 text-muted-foreground">
                {item.code}
              </TableCell>

              <TableCell className="px-4 py-4">{item.equipmentType}</TableCell>

              <TableCell className="px-4 py-4">{item.location}</TableCell>

              <TableCell className="px-4 py-4">{item.department}</TableCell>

              <TableCell className="px-4 py-4">
                <Badge
                  variant={
                    item.status === EquipmentStatus.INACTIVE
                      ? "destructive"
                      : item.status === EquipmentStatus.UNDER_MAINTENANCE
                        ? "info"
                        : item.status === EquipmentStatus.BREAKDOWN
                          ? "warning"
                          : item.status === EquipmentStatus.DECOMMISSIONED
                            ? "default"
                            : "success"
                  }
                >
                  {item.status}
                </Badge>
              </TableCell>

              <TableCell className="rounded-r-lg px-4 py-4">
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
          ))
        )}
      </TableBody>
    </Table>
  );
}
