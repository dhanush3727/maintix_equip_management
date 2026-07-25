"use client";

import { Bell, LoaderCircle, LogOut, User } from "lucide-react";
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
  Avatar,
  AvatarFallback,
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
  Separator,
  SidebarTrigger,
  Skeleton,
  Tooltip,
  TooltipContent,
  TooltipTrigger,
} from "../ui";
import Link from "next/link";
import { ROUTES } from "@/constants";
import { useLogout } from "@/features/auth";
import { useState } from "react";
import { appToast } from "@/lib/toast";
import { getErrorMessage } from "@/lib/error-message";
import { useRouter } from "next/navigation";
import { useQueryClient } from "@tanstack/react-query";
import { useAuth } from "@/hooks";

export function AppHeader() {
  const logoutMutation = useLogout();
  const router = useRouter();
  const queryClient = useQueryClient();

  const { user, clearUser, isLoading } = useAuth();

  const [isLogout, setIsLogout] = useState<boolean>(false);

  const handleLogout = () => {
    logoutMutation.mutate(undefined, {
      onSuccess: (data) => {
        appToast.success(data.message);
        clearUser();
        queryClient.removeQueries();
        router.replace(ROUTES.LOGIN);
      },

      onError: (err) => {
        appToast.error(getErrorMessage(err));
      },

      onSettled: () => {
        setIsLogout(false);
      },
    });
  };

  return (
    <div className="bg-background shadow-xs sticky top-0">
      <div className="flex py-2 px-4 justify-between items-center">
        <div>
          <SidebarTrigger />
        </div>

        <div className="flex gap-2">
          <Tooltip>
            <TooltipTrigger>
              <div className="p-2 rounded-md hover:bg-secondary">
                <Bell />
              </div>
            </TooltipTrigger>
            <TooltipContent>
              <p>Notification</p>
            </TooltipContent>
          </Tooltip>

          <DropdownMenu>
            <DropdownMenuTrigger>
              <div className="flex gap-2 items-center cursor-pointer p-2 rounded-md hover:bg-secondary">
                {isLoading ? (
                  <Skeleton className="h-8 w-8 rounded-full" />
                ) : (
                  <Avatar size="sm">
                    <AvatarFallback className={"bg-card"}>
                      {user?.name.charAt(0).toUpperCase()}
                    </AvatarFallback>
                  </Avatar>
                )}
              </div>
            </DropdownMenuTrigger>

            <DropdownMenuContent className={"w-56"}>
              <DropdownMenuItem
                className={
                  "p-3 cursor-pointer flex justify-between items-center mb-1"
                }
                render={<Link href={ROUTES.ACCOUNT} />}
              >
                {isLoading ? (
                  <Skeleton className="h-8 w-full" />
                ) : (
                  <>
                    <span className="text-base font-medium">{user?.name}</span>
                    <User size={25} />
                  </>
                )}
              </DropdownMenuItem>

              <DropdownMenuItem
                variant="destructive"
                className={
                  "p-3 cursor-pointer flex justify-between items-center"
                }
                onClick={() => setIsLogout(true)}
              >
                <span className="text-base font-medium">Logout</span>
                <LogOut size={25} />
              </DropdownMenuItem>
            </DropdownMenuContent>
          </DropdownMenu>

          <AlertDialog open={isLogout} onOpenChange={setIsLogout}>
            <AlertDialogContent>
              <AlertDialogHeader>
                <AlertDialogTitle>Log out</AlertDialogTitle>
                <AlertDialogDescription>
                  Are you sure you want to sign out? You&apos;ll need to sign in
                  again to access your account.
                </AlertDialogDescription>
              </AlertDialogHeader>

              <AlertDialogFooter className="border-none">
                <AlertDialogCancel disabled={logoutMutation.isPending}>
                  Cancel
                </AlertDialogCancel>
                <AlertDialogAction
                  variant={"destructive"}
                  onClick={handleLogout}
                  disabled={logoutMutation.isPending}
                >
                  {logoutMutation.isPending && (
                    <LoaderCircle
                      aria-hidden="true"
                      className="size-4 animate-spin"
                    />
                  )}
                  Logout
                </AlertDialogAction>
              </AlertDialogFooter>
            </AlertDialogContent>
          </AlertDialog>
        </div>
      </div>
      <Separator />
    </div>
  );
}
