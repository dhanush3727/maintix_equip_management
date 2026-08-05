import { QUERY_KEYS } from "@/constants";
import { checklistService } from "@/services";
import { useQuery } from "@tanstack/react-query";

export const useChecklistDD = () => {
  return useQuery({
    queryKey: QUERY_KEYS.checklist.dropdown,
    queryFn: checklistService.getChecklistDropdown,
  });
};
