import { QUERY_KEYS } from "@/constants";
import { useQuery } from "@tanstack/react-query";
import { breakdownService } from "../service/breakdown.service";

export const useBreakdownById = (id: number) => {
  return useQuery({
    queryKey: [...QUERY_KEYS.breakdown.id, id],
    queryFn: () => breakdownService.getBreakdownById(id),
  });
};
