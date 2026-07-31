"use client";

import { Button, Dialog, DialogContent, DialogTrigger } from "@/components/ui";
import { EQUIPMENT_HEADER_CONTENT } from "../constants/equipment-header.constant";
import { Plus } from "lucide-react";
import { ROUTES } from "@/constants";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { AddEquipment } from "./AddEquipment";
import { RoleType } from "@/types";
import { useAuth } from "@/hooks";
import { ROLE_IDS } from "@/constants/role.constant";
import { AddEquipmentType } from "./AddEquipmentType";

export function EquipmentHeader() {
  const pathname = usePathname();
  const { user } = useAuth();

  const isAdmin = user?.roles.some((role) => role.id === ROLE_IDS.ADMIN);

  const isEquipment = pathname === ROUTES.EQUIPMENT.LIST;
  const isEquipmentType = pathname === ROUTES.EQUIPMENT.TYPE;

  return (
    <div className="p-2 bg-background border border-border/60 shadow-sm rounded-md flex justify-center sm:justify-between">
      <div className="flex gap-3">
        <Link href={ROUTES.EQUIPMENT.LIST}>
          <Button variant={isEquipment ? "secondary" : "ghost"}>
            {EQUIPMENT_HEADER_CONTENT.EQUIPMENT_LIST_LABEL}
          </Button>
        </Link>

        <Link href={ROUTES.EQUIPMENT.TYPE}>
          <Button variant={isEquipmentType ? "secondary" : "ghost"}>
            {EQUIPMENT_HEADER_CONTENT.EQUIPMENT_TYPE_LABEL}
          </Button>
        </Link>
      </div>

      {isEquipmentType && isAdmin ? (
        <Dialog>
          <DialogTrigger
            render={
              <Button className={"hidden sm:flex"}>
                <Plus aria-hidden="true" className="size-4" />
                {EQUIPMENT_HEADER_CONTENT.ADD_EQUIIPMENT_TYPE}
              </Button>
            }
          />

          <DialogContent>
            <AddEquipmentType />
          </DialogContent>
        </Dialog>
      ) : (
        <Dialog>
          <DialogTrigger
            render={
              <Button className={"hidden sm:flex"}>
                <Plus aria-hidden="true" className="size-4" />
                {EQUIPMENT_HEADER_CONTENT.ADD_EQUIPMENT}
              </Button>
            }
          />

          <DialogContent className={"w-[90vw] max-w-6xl"}>
            <AddEquipment />
          </DialogContent>
        </Dialog>
      )}
    </div>
  );
}
