import { useMutation, useQueryClient } from "@tanstack/react-query";
import { organizationService } from "../services/organization.service";
import { QUERY_KEYS } from "@/constants";

export const useSetupDepartment = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: organizationService.setupDepartment,

    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.organization.onboarding,
      });

      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.organization.dropdown,
      });
    },
  });
};
