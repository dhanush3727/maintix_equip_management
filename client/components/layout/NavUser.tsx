"use client";

import Link from "next/link";
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
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
import { useState } from "react";
import { useLogout } from "@/features/auth";
import { useRouter } from "next/navigation";
import { appToast } from "@/lib/toast";
import { getErrorMessage } from "@/lib/error-message";

export function NavUser() {
  const logoutMutation = useLogout();
  const { isMobile, setOpenMobile } = useSidebar();
  const router = useRouter();

  const [isLogout, setIsLogout] = useState<boolean>(false);

  const handleLogout = () => {
    if (isMobile) {
      setOpenMobile(false);
    }

    setIsLogout(false);

    logoutMutation.mutate(undefined, {
      onSuccess: (data) => {
        appToast.success(data.message);

        router.replace(ROUTES.LOGIN);
      },

      onError: (err) => {
        appToast.error(getErrorMessage(err));
      },
    });
  };

  return (
    <div>
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
            onClick={() => setIsLogout(true)}
          >
            <LogOut size={25} />
            <span className="text-base font-medium">Logout</span>
          </DropdownMenuItem>
        </DropdownMenuContent>
      </DropdownMenu>

      <AlertDialog open={isLogout} onOpenChange={setIsLogout}>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>
              Are you sure you want to logout?
            </AlertDialogTitle>
          </AlertDialogHeader>

          <AlertDialogFooter className="border-none">
            <AlertDialogCancel>Cancel</AlertDialogCancel>
            <AlertDialogAction
              variant={"destructive"}
              onClick={handleLogout}
              disabled={logoutMutation.isPending}
            >
              Logout
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
    </div>
  );
}
