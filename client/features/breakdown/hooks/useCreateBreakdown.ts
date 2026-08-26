import { useMutation, useQueryClient } from "@tanstack/react-query";
import { breakdownService } from "../service/breakdown.service";
import { QUERY_KEYS } from "@/constants";

export const useCreateBreakdown = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: breakdownService.createBreakdown,

    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.breakdown.list,
      });
    },
  });
};
