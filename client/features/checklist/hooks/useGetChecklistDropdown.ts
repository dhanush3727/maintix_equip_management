import { QUERY_KEYS } from "@/constants";
import { useQuery } from "@tanstack/react-query";
import { checklistService } from "../service/checklist.service";

export const useGetChecklistDropdown = (id: number) => {
  return useQuery({
    queryKey: [...QUERY_KEYS.checklist.dropdown_by_type, id],
    queryFn: () => checklistService.getChecklistDropdown(id),
    enabled: id > 0, // fetch only the id is true
  });
};
