import { useMutation, useQueryClient } from "@tanstack/react-query";
import { breakdownService } from "../service/breakdown.service";
import { QUERY_KEYS } from "@/constants";
import { ResolveRequest } from "../types/breakdown.type";

interface ResolveBreakdownVariable {
  id: number;
  payload: ResolveRequest;
}

export const useResolveBreakdown = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id, payload }: ResolveBreakdownVariable) =>
      breakdownService.resolveBreakdown(id, payload),

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
