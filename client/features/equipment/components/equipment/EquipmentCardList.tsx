import {
  Badge,
  Button,
  Card,
  CardContent,
  CardHeader,
  CardTitle,
  Dialog,
  DialogContent,
  DialogTrigger,
} from "@/components/ui";
import { EquipmentData } from "../../types/equipment.type";
import { Building2, MapPin, Pencil, Wrench } from "lucide-react";
import { EquipmentStatus } from "@/types";
import { EQUIPMENT_CONTENT } from "../../constants/equipment.constant";

interface EquipmentCardListProps {
  item: EquipmentData;
}

export function EquipmentCardList({ item }: EquipmentCardListProps) {
  return (
    <Card className="group flex h-full flex-col overflow-hidden border-border/60 bg-card shadow-sm transition-all duration-200 hover:-translate-y-0.5 hover:shadow-md">
      <CardHeader className="space-y-0 pb-3">
        {/* Header */}
        <div className="flex items-start justify-between gap-3">
          <div className="min-w-0 flex-1">
            <CardTitle className="truncate text-base font-semibold">
              {item.name}
            </CardTitle>

            <p className="mt-1 truncate text-xs font-medium tracking-wide text-muted-foreground">
              {item.code}
            </p>
          </div>

          <div className="flex shrink-0 flex-col items-end gap-2">
            <Dialog>
              <DialogTrigger
                render={
                  <Button
                    type="button"
                    variant="ghost"
                    size="icon"
                    className="size-8 text-muted-foreground opacity-70 transition-all hover:bg-info-light hover:text-info group-hover:opacity-100"
                    aria-label={`Edit ${item.name}`}
                  >
                    <Pencil aria-hidden="true" className="size-4" />
                  </Button>
                }
              />

              <DialogContent>{/* EditEquipment */}</DialogContent>
            </Dialog>

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
          </div>
        </div>
      </CardHeader>

      <CardContent className="flex-1 pt-0">
        <div className="divide-y rounded-lg border bg-muted/20">
          <div className="flex items-center gap-3 px-3 py-3">
            <div className="flex size-8 shrink-0 items-center justify-center rounded-md bg-background text-muted-foreground shadow-sm">
              <Wrench aria-hidden="true" className="size-4" />
            </div>

            <div className="min-w-0 flex-1">
              <p className="text-[11px] font-medium uppercase tracking-wide text-muted-foreground">
                {EQUIPMENT_CONTENT.FIELD.EQUIPMENT_TYPE_LABEL}
              </p>

              <p className="truncate text-sm font-medium">
                {item.equipmentType}
              </p>
            </div>
          </div>

          <div className="flex items-center gap-3 px-3 py-3">
            <div className="flex size-8 shrink-0 items-center justify-center rounded-md bg-background text-muted-foreground shadow-sm">
              <MapPin aria-hidden="true" className="size-4" />
            </div>

            <div className="min-w-0 flex-1">
              <p className="text-[11px] font-medium uppercase tracking-wide text-muted-foreground">
                {EQUIPMENT_CONTENT.FIELD.LOCATION_LABEL}
              </p>

              <p className="truncate text-sm font-medium">{item.location}</p>
            </div>
          </div>

          <div className="flex items-center gap-3 px-3 py-3">
            <div className="flex size-8 shrink-0 items-center justify-center rounded-md bg-background text-muted-foreground shadow-sm">
              <Building2 aria-hidden="true" className="size-4" />
            </div>

            <div className="min-w-0 flex-1">
              <p className="text-[11px] font-medium uppercase tracking-wide text-muted-foreground">
                {EQUIPMENT_CONTENT.FIELD.DEPARTMENT_LABEL}
              </p>

              <p className="truncate text-sm font-medium">{item.department}</p>
            </div>
          </div>
        </div>
      </CardContent>
    </Card>
  );
}
