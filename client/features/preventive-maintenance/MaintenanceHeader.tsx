"use client";

import { ROLE_IDS } from "@/constants/role.constant";
import { useAuth } from "@/hooks";
import { usePathname } from "next/navigation";
import {
  MAINTENANCE_CONTENT,
  MAINTENANCE_NAVIGATION,
} from "./maintenance.constant";
import { useState } from "react";
import Link from "next/link";
import { cn } from "@/lib";
import { Button, Dialog, DialogContent, DialogTrigger } from "@/components/ui";
import { Plus } from "lucide-react";
import { ROUTES } from "@/constants";
import { CreateSchedule } from "./schedule";

export function MaintenanceHeader() {
  const pathname = usePathname();
  const { user } = useAuth();

  const isSchedule = pathname === ROUTES.PREVENTIVE_MAINTENANCE.SCHEDULE;
  const canAccess = user?.roles.some((role) => role.id !== ROLE_IDS.TECHNICIAN);

  const [openSchedule, setOpenSchedule] = useState<boolean>(false);

  const linkClassName =
    "inline-flex items-center justify-center rounded-md px-4 py-2 text-sm font-medium transition-colors outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2";

  return (
    <div className="p-2 mb-3 bg-background border border-border/60 shadow-sm rounded-md flex justify-start sm:justify-between">
      <div className="flex gap-3">
        {MAINTENANCE_NAVIGATION.map((item) => {
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

      {canAccess && isSchedule && (
        <Dialog open={openSchedule} onOpenChange={setOpenSchedule}>
          <DialogTrigger
            render={
              <Button className={"hidden sm:flex"}>
                <Plus aria-hidden="true" className="size-4" />
                {MAINTENANCE_CONTENT.ADD_SCHEDULE}
              </Button>
            }
          />

          <DialogContent className={"w-[90vw] max-w-6xl"}>
            <CreateSchedule onClose={() => setOpenSchedule(false)} />
          </DialogContent>
        </Dialog>
      )}
    </div>
  );
}
