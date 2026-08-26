import { useMutation, useQueryClient } from "@tanstack/react-query";
import { breakdownService } from "../service/breakdown.service";
import { QUERY_KEYS } from "@/constants";

interface closeBreakdownVariable {
  id: number;
}

export const useCloseBreakdown = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id }: closeBreakdownVariable) =>
      breakdownService.closeBreakdown(id),

    onSuccess: (_, variable) => {
      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.breakdown.list,
      });

      queryClient.invalidateQueries({
        queryKey: [...QUERY_KEYS.breakdown.id, variable.id],
      });
    },
  });
};
