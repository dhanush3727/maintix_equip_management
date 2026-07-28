import { useMutation, useQueryClient } from "@tanstack/react-query";
import { organizationService } from "../services/organization.service";
import { QUERY_KEYS } from "@/constants";

export const useCompleteSetup = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: organizationService.completeSetup,

    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.organization.onboarding,
      });
    },
  });
};
