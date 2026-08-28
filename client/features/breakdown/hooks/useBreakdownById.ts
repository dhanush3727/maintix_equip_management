import { QUERY_KEYS } from "@/constants";
import { useQuery } from "@tanstack/react-query";
import { breakdownService } from "../service/breakdown.service";

export const useBreakdownById = (id?: number) => {
  return useQuery({
    queryKey: [...QUERY_KEYS.breakdown.id, id],
    queryFn: () => {
      if (id === undefined) throw new Error("Breakdown id is required");

      return breakdownService.getBreakdownById(id);
    },
    enabled: id !== undefined,
  });
};
