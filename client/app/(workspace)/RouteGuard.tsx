"use client";

import { ROUTES } from "@/constants";
import { ROLE_IDS } from "@/constants/role.constant";
import { useAuth } from "@/hooks";
import { usePathname, useRouter } from "next/navigation";
import React, { useEffect } from "react";

interface RouteGuardProps {
  children: React.ReactNode;
}

export function RouteGuard({ children }: RouteGuardProps): React.ReactNode {
  const { user } = useAuth();
  const pathName = usePathname();
  const router = useRouter();

  const canAccess = user?.roles.some(
    (role) => role.id === ROLE_IDS.ADMIN || role.id === ROLE_IDS.MANAGER,
  );

  const isAdmin = user?.roles.some((role) => role.id === ROLE_IDS.ADMIN);

  const isChecklist = pathName === ROUTES.CHECKLIST;
  const isUsers = pathName === ROUTES.USERS;
  const isUnAuthorized = (isChecklist && !canAccess) || (isUsers && !isAdmin);

  useEffect(() => {
    if (isUnAuthorized) {
      router.push(ROUTES.DASHBOARD);
    }
  }, [isUnAuthorized, router]);

  if (isUnAuthorized) return null;

  return children;
}
