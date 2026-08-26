import { useMutation, useQueryClient } from "@tanstack/react-query";
import { breakdownService } from "../service/breakdown.service";
import { QUERY_KEYS } from "@/constants";

interface DeleteBreakdownAction {
  id: number;
  actionId: number;
}

export const useDeleteBreakdownAction = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id, actionId }: DeleteBreakdownAction) =>
      breakdownService.deleteBreakdownAction(id, actionId),

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
