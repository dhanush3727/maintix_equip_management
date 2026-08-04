import { QUERY_KEYS } from "@/constants";
import { useQuery } from "@tanstack/react-query";
import { checklistService } from "../service/checklist.service";

export const useGetChecklistById = (id: number) => {
  return useQuery({
    queryKey: [...QUERY_KEYS.checklist.id, id],
    queryFn: () => checklistService.getChecklistById(id),
  });
};
