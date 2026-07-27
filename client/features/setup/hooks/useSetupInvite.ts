import { useMutation, useQueryClient } from "@tanstack/react-query";
import { organizationService } from "../services/organization.service";
import { QUERY_KEYS } from "@/constants";

export const useSetupInvite = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: organizationService.setupSendInvitation,

    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.organization.onboarding,
      });
    },
  });
};
