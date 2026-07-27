import { QUERY_KEYS } from "@/constants";
import { organizationService } from "@/services";
import { useQuery } from "@tanstack/react-query";

export const useGetOrg = () => {
  return useQuery({
    queryKey: QUERY_KEYS.organization.details,
    queryFn: organizationService.getOrganization,
  });
};
