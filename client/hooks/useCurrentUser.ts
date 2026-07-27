import { QUERY_KEYS } from "@/constants";
import { getCurrentUser } from "@/services";
import { useQuery } from "@tanstack/react-query";

export const useCurrentUser = () => {
  return useQuery({
    queryKey: QUERY_KEYS.auth.me,
    queryFn: getCurrentUser,
  });
};
