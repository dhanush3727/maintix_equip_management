import { useMutation, useQueryClient } from "@tanstack/react-query";
import { BreakdownRequest } from "../types/breakdown.type";
import { breakdownService } from "../service/breakdown.service";
import { QUERY_KEYS } from "@/constants";

interface UpdateBreakdownVariables {
  id: number;
  payload: BreakdownRequest;
}

export const useUpdateBreakdown = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id, payload }: UpdateBreakdownVariables) =>
      breakdownService.updateBreakdown(id, payload),

    onSuccess: (_, variables) => {
      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.breakdown.list,
      });

      queryClient.invalidateQueries({
        queryKey: [...QUERY_KEYS.breakdown.id, variables.id],
      });
    },
  });
};
