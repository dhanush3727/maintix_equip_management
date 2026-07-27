import { useMutation, useQueryClient } from "@tanstack/react-query";
import { organizationService } from "../services/organization.service";

export const useSetupOrg = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: organizationService.setupOrganization,

    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["org-onboarding"] });
    },
  });
};
