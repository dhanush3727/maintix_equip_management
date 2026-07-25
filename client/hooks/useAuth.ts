import { useUserStore } from "@/stores";
import { useCurrentUser } from "./useCurrentUser";

export const useAuth = () => {
  const user = useUserStore((state) => state.user);
  const clearUser = useUserStore((state) => state.clearUser);
  const setUser = useUserStore((state) => state.setUser);

  const { isLoading } = useCurrentUser();

  return {
    user,
    clearUser,
    setUser,
    isLoading,
  };
};
