import { useMutation, useQueryClient } from "@tanstack/react-query";
import { BreakdownActionRequest } from "../types/breakdown.type";
import { breakdownService } from "../service/breakdown.service";
import { QUERY_KEYS } from "@/constants";

interface CreateBreakdownAction {
  id: number;
  payload: BreakdownActionRequest;
}

export const useCreateBreakdownAction = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id, payload }: CreateBreakdownAction) =>
      breakdownService.createBreakdownAction(id, payload),

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
