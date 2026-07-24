"use client";

import { Avatar, AvatarFallback } from "../ui";

export function NavUser() {
  return (
    <>
      <div className="flex gap-3 items-center cursor-pointer p-2 rounded-md hover:bg-secondary group-data-[collapsible=icon]:justify-center">
        <Avatar
          size="sm"
          className="group-data-[collapsible=icon]:data-[size=sm]:size-7"
        >
          <AvatarFallback>O</AvatarFallback>
        </Avatar>

        <div className="flex flex-col group-data-[collapsible=icon]:hidden">
          <span className="text-base ">Your Oranization</span>
          <span className="text-sm text-muted-foreground">Organization</span>
        </div>
      </div>
    </>
  );
}
