"use client";

import { useUserStore } from "@/stores";
import { Avatar, AvatarFallback } from "../ui";

export function NavUser() {
  const user = useUserStore((state) => state.user);

  return (
    <>
      <div className="flex gap-3 items-center cursor-pointer p-2 rounded-md hover:bg-secondary group-data-[collapsible=icon]:justify-center">
        <Avatar
          size="sm"
          className="group-data-[collapsible=icon]:data-[size=sm]:size-7"
        >
          <AvatarFallback>
            {user?.organizationName.charAt(0).toUpperCase()}
          </AvatarFallback>
        </Avatar>

        <div className="flex flex-col group-data-[collapsible=icon]:hidden">
          <span className="text-sm font-bold">{user?.organizationName}</span>
          <span className="text-xs text-muted-foreground">Organization</span>
        </div>
      </div>
    </>
  );
}
