import { QUERY_KEYS } from "@/constants";
import { roleService } from "@/services";
import { useQuery } from "@tanstack/react-query";

export const useRoleDD = () => {
  return useQuery({
    queryKey: QUERY_KEYS.role.dropdown,
    queryFn: roleService.getRolesDropdown,
  });
};
