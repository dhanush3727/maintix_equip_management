"use client";

import { Button, Dialog, DialogContent, DialogTrigger } from "@/components/ui";
import {
  EQUIPMENT_DIALOG,
  EQUIPMENT_HEADER_CONTENT,
  EQUIPMENT_NAVIGATION,
  EquipmentDialog,
} from "../constants/equipment-header.constant";
import { Plus } from "lucide-react";
import { ROUTES } from "@/constants";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { AddEquipment } from "./equipment/AddEquipment";
import { useAuth } from "@/hooks";
import { ROLE_IDS } from "@/constants/role.constant";
import { AddEquipmentType } from "./equipment-type/AddEquipmentType";
import { useState } from "react";
import { cn } from "@/lib";

export function EquipmentHeader() {
  const pathname = usePathname();
  const { user } = useAuth();

  const [openDialog, setOpenDialog] = useState<EquipmentDialog>(null);

  const canAccess = user?.roles.some(
    (role) => role.id === ROLE_IDS.ADMIN || role.id === ROLE_IDS.MANAGER,
  );

  const visibleNavigation = EQUIPMENT_NAVIGATION.filter((item) => {
    const isEquipType = item.url === ROUTES.EQUIPMENT.TYPE;

    return !isEquipType || canAccess;
  });

  const isEquipment = pathname === ROUTES.EQUIPMENT.LIST;
  const isEquipmentType = pathname === ROUTES.EQUIPMENT.TYPE;

  const linkClassName =
    "inline-flex items-center justify-center rounded-md px-4 py-2 text-sm font-medium transition-colors outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2";

  const isEquipmentDialogOpen = openDialog === EQUIPMENT_DIALOG.EQUIPMENT;
  const isEquipmentTypeDialogOpen =
    openDialog === EQUIPMENT_DIALOG.EQUIPMENT_TYPE;

  return (
    <div className="p-2 mb-3 bg-background border border-border/60 shadow-sm rounded-md flex justify-start sm:justify-between">
      <div className="flex gap-3">
        {visibleNavigation.map((item) => {
          const isActive = pathname === item.url;

          return (
            <Link
              key={item.url}
              href={item.url}
              className={cn(
                linkClassName,
                isActive
                  ? "bg-secondary text-secondary-foreground shadow-sm hover:bg-secondary/80"
                  : "hover:bg-accent hover:text-accent-foreground",
              )}
            >
              {item.title}
            </Link>
          );
        })}
      </div>

      {isEquipmentType && canAccess && (
        <Dialog
          open={isEquipmentTypeDialogOpen}
          onOpenChange={(open) =>
            setOpenDialog(open ? EQUIPMENT_DIALOG.EQUIPMENT_TYPE : null)
          }
        >
          <DialogTrigger
            render={
              <Button className={"hidden md:flex"}>
                <Plus aria-hidden="true" className="size-4" />
                {EQUIPMENT_HEADER_CONTENT.ADD_EQUIIPMENT_TYPE}
              </Button>
            }
          />

          <DialogContent>
            <AddEquipmentType onClose={() => setOpenDialog(null)} />
          </DialogContent>
        </Dialog>
      )}

      {isEquipment && (
        <Dialog
          open={isEquipmentDialogOpen}
          onOpenChange={(open) =>
            setOpenDialog(open ? EQUIPMENT_DIALOG.EQUIPMENT : null)
          }
        >
          <DialogTrigger
            render={
              <Button className={"hidden md:flex"}>
                <Plus aria-hidden="true" className="size-4" />
                {EQUIPMENT_HEADER_CONTENT.ADD_EQUIPMENT}
              </Button>
            }
          />

          <DialogContent className={"w-[90vw] max-w-6xl"}>
            <AddEquipment onClose={() => setOpenDialog(null)} />
          </DialogContent>
        </Dialog>
      )}
    </div>
  );
}
