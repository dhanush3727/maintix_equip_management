import { QUERY_KEYS } from "@/constants";
import { useQuery } from "@tanstack/react-query";
import { organizationService } from "../services/organization.service";

export const useGetInvitations = () => {
  return useQuery({
    queryKey: QUERY_KEYS.invitations.get_invitations,
    queryFn: organizationService.getInvitations,
  });
};
