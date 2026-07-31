"use client";

import {
  Badge,
  Button,
  Card,
  CardContent,
  CardHeader,
  CardTitle,
} from "@/components/ui";
import { Pencil } from "lucide-react";
import { EquipmentTypeData } from "../../types/equipment-type.type";

export interface EquipmentTypeListProps {
  item: EquipmentTypeData;
}

export function EquipmentTypeList({ item }: EquipmentTypeListProps) {
  return (
    <>
      <Card className="flex h-full flex-col transition-shadow hover:shadow-md">
        <CardHeader className="pb-3">
          <div className="flex items-start justify-between gap-3">
            <div className="min-w-0 space-y-1">
              <CardTitle className="truncate text-base font-semibold">
                {item.name}
              </CardTitle>

              <p className="text-xs font-medium uppercase tracking-wide text-muted-foreground">
                {item.code}
              </p>
            </div>

            <Button
              type="button"
              variant="ghost"
              size="icon"
              className="size-8 shrink-0 bg-info-light text-info hover:bg-info-light/80"
              aria-label="Edit Motor equipment type"
            >
              <Pencil aria-hidden="true" className="size-4" />
            </Button>
          </div>

          <div className="pt-2">
            <Badge variant={item.isActive ? "success" : "destructive"}>
              {item.isActive ? "Active" : "Inactive"}
            </Badge>
          </div>
        </CardHeader>

        <CardContent className="flex-1">
          <p className="line-clamp-3 text-sm leading-6 text-muted-foreground">
            {item.description}
          </p>
        </CardContent>
      </Card>
    </>
  );
}
