"use client";

import { useCurrentUser } from "@/hooks";
import { useUserStore } from "@/stores";
import { useEffect } from "react";

export function AuthInitializer() {
  const setUser = useUserStore((state) => state.setUser);

  const { data } = useCurrentUser();

  useEffect(() => {
    if (data) {
      setUser(data.data ?? null);
    }
  }, [data, setUser]);

  return null;
}
