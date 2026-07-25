import { organizationService } from "@/services";
import { useQuery } from "@tanstack/react-query";

export const useOnboarding = () => {
  return useQuery({
    queryKey: ["org-onboarding"],
    queryFn: organizationService.onboarding,
  });
};
