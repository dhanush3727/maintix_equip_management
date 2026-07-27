import { useMutation, useQueryClient } from "@tanstack/react-query";
import { organizationService } from "../services/organization.service";
import { QUERY_KEYS } from "@/constants";

export const useSetupLocation = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: organizationService.setupLocation,

    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.organization.onboarding,
      });
    },
  });
};
