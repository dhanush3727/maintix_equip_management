"use client";

import {
  Badge,
  Button,
  Card,
  CardContent,
  CardHeader,
  CardTitle,
  Skeleton,
} from "@/components/ui";
import { Pencil } from "lucide-react";
import { useGetEquipmentTypes } from "../../hooks/equipment-type/useGetEquipmentTypes";
import { EQUIPMENT_TYPE_CONTENT } from "../../constants/equipment-type.constant";

export function EquipmentType() {
  const { data, isLoading, isError } = useGetEquipmentTypes({
    page: 1,
    limit: 20,
  });

  const equipmentTypes = data?.data ?? [];

  return (
    <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3 2xl:grid-cols-4">
      {isLoading ? (
        Array.from({ length: 20 }).map((_, i) => (
          <Card key={i} className="flex h-full flex-col">
            <CardHeader className="pb-3">
              <div className="flex items-start justify-between gap-3">
                <div className="min-w-0 space-y-2">
                  <Skeleton className="h-5 w-32" />
                  <Skeleton className="h-3 w-20" />
                </div>

                <Skeleton className="size-8 shrink-0 rounded-md" />
              </div>

              <div className="pt-2">
                <Skeleton className="h-5 w-14 rounded-full" />
              </div>
            </CardHeader>

            {/* Description */}
            <CardContent className="flex-1">
              <div className="space-y-2">
                <Skeleton className="h-4 w-full" />
                <Skeleton className="h-4 w-[90%]" />
                <Skeleton className="h-4 w-[70%]" />
              </div>
            </CardContent>
          </Card>
        ))
      ) : isError ? (
        <div>
          <h1>{EQUIPMENT_TYPE_CONTENT.NO_DATA}</h1>
        </div>
      ) : (
        equipmentTypes.map((item) => (
          <Card
            key={item.id}
            className="flex h-full flex-col transition-shadow hover:shadow-md"
          >
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
        ))
      )}
    </div>
  );
}
