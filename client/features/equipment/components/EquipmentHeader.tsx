"use client";

import { Button } from "@/components/ui";
import { EQUIPMENT_HEADER_CONTENT } from "../constants/equipment-header.constant";
import { Plus } from "lucide-react";
import { usePathname, useRouter } from "next/navigation";
import { ROUTES } from "@/constants";
import { cn } from "@/lib";

export function EquipmentHeader() {
  const router = useRouter();
  const pathName = usePathname();

  return (
    <div className="p-2 bg-background border border-border/60 shadow-sm rounded-md flex justify-center sm:justify-between">
      <div className="flex gap-3">
        <Button
          variant="ghost"
          className={cn(
            pathName === ROUTES.EQUIPMENT_LIST
              ? "bg-muted text-foreground hover:bg-muted"
              : "text-muted-foreground hover:bg-muted hover:text-foreground",
          )}
          onClick={() => router.push(ROUTES.EQUIPMENT_LIST)}
        >
          {EQUIPMENT_HEADER_CONTENT.EQUIPMENT_LIST_LABEL}
        </Button>

        <Button
          variant="ghost"
          className={cn(
            pathName === ROUTES.EQUIPMENT_TYPE
              ? "bg-muted text-foreground hover:bg-muted"
              : "text-muted-foreground hover:bg-muted hover:text-foreground",
          )}
          onClick={() => router.push(ROUTES.EQUIPMENT_TYPE)}
        >
          {EQUIPMENT_HEADER_CONTENT.EQUIPMENT_TYPE_LABEL}
        </Button>
      </div>

      <Button className={"hidden sm:flex"}>
        <Plus aria-hidden="true" className="size-4" />
        {EQUIPMENT_HEADER_CONTENT.ADD_EQUIPMENT}
      </Button>
    </div>
  );
}
