"use client";

import Link from "next/link";
import {
  Avatar,
  AvatarFallback,
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
  useSidebar,
} from "../ui";
import { LogOut, User } from "lucide-react";
import { ROUTES } from "@/constants";

export function NavUser() {
  const { isMobile, setOpenMobile } = useSidebar();

  return (
    <DropdownMenu>
      <DropdownMenuTrigger>
        <div className="flex gap-2 items-center cursor-pointer p-2 rounded-md hover:bg-secondary group-data-[collapsible=icon]:justify-center">
          <Avatar
            size="sm"
            className="group-data-[collapsible=icon]:data-[size=sm]:size-7"
          >
            <AvatarFallback>D</AvatarFallback>
          </Avatar>
          <span className="text-lg group-data-[collapsible=icon]:hidden">
            Dhanush
          </span>
        </div>
      </DropdownMenuTrigger>
      <DropdownMenuContent className={"p-3"}>
        <DropdownMenuItem
          className={"p-3 cursor-pointer"}
          render={
            <Link
              href={ROUTES.ACCOUNT}
              onClick={() => {
                if (isMobile) setOpenMobile(false);
              }}
            />
          }
        >
          <User size={25} />
          <span className="text-base font-medium group-data-[collapsible=icon]:hidden">
            Account
          </span>
        </DropdownMenuItem>

        <DropdownMenuItem
          variant="destructive"
          className={"p-3 cursor-pointer"}
        >
          <LogOut size={25} />
          <span className="text-base font-medium">Logout</span>
        </DropdownMenuItem>
      </DropdownMenuContent>
    </DropdownMenu>
  );
}
