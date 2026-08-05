import { QUERY_KEYS } from "@/constants";
import { userService } from "@/services";
import { useQuery } from "@tanstack/react-query";

export const useUserDropdown = () => {
  return useQuery({
    queryKey: QUERY_KEYS.user_dropdown,
    queryFn: userService.getUserDropdown,
  });
};
