import { QUERY_KEYS } from "@/constants";
import { organizationService } from "@/services";
import { useQuery } from "@tanstack/react-query";

export const useOrganizationDD = () => {
  return useQuery({
    queryKey: QUERY_KEYS.organization.dropdown,
    queryFn: organizationService.getOrganizationDD,
  });
};
