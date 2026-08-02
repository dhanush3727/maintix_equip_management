import {
  Badge,
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

interface EquipmentListProps {
  equipmentList: EquipmentData[];
}

export function EquipmentList({ equipmentList }: EquipmentListProps) {
  return (
    <Table className="border-separate border-spacing-y-2">
      <TableHeader>
        <TableRow>
          {EQUIPMENT_TABLE_COLUMNS.map((column) => (
            <TableHead key={column.key}>{column.label}</TableHead>
          ))}
        </TableRow>
      </TableHeader>

      <TableBody>
        {equipmentList.map((item) => (
          <TableRow key={item.id}>
            <TableCell>{item.name}</TableCell>
            <TableCell>{item.code}</TableCell>
            <TableCell>{item.equipmentType}</TableCell>
            <TableCell>{item.location}</TableCell>
            <TableCell>{item.department}</TableCell>
            <TableCell>
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
            <TableCell className="cursor-pointer">
              <SquarePen className="size-4" />
            </TableCell>
          </TableRow>
        ))}
      </TableBody>
    </Table>
  );
}
