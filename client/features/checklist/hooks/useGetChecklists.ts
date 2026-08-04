import { QUERY_KEYS } from "@/constants";
import { useQuery } from "@tanstack/react-query";
import { checklistService } from "../service/checklist.service";

export const useGetChecklists = () => {
  return useQuery({
    queryKey: QUERY_KEYS.checklist.list,
    queryFn: checklistService.getChecklists,
  });
};
