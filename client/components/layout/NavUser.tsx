"use client";

import { Avatar, AvatarFallback, Skeleton } from "../ui";
import { useAuth } from "@/hooks";

export function NavUser() {
  const { user, isLoading } = useAuth();

  return (
    <>
      <div className="flex gap-3 items-center cursor-pointer p-2 rounded-md hover:bg-secondary group-data-[collapsible=icon]:justify-center">
        {isLoading ? (
          <>
            <Skeleton className="h-8 w-8 rounded-full group-data-[collapsible=icon]:h-7 group-data-[collapsible=icon]:w-7" />
            <div className="flex flex-col gap-1 group-data-[collapsible=icon]:hidden">
              <Skeleton className="h-4 w-28" />
              <Skeleton className="h-3 w-20" />
            </div>
          </>
        ) : (
          <>
            <Avatar
              size="sm"
              className="group-data-[collapsible=icon]:data-[size=sm]:size-7"
            >
              <AvatarFallback>
                {user?.organizationName.charAt(0).toUpperCase()}
              </AvatarFallback>
            </Avatar>

            <div className="flex flex-col group-data-[collapsible=icon]:hidden">
              <span className="text-sm font-bold">
                {user?.organizationName}
              </span>
              <span className="text-xs text-muted-foreground">
                Organization
              </span>
            </div>
          </>
        )}
      </div>
    </>
  );
}
