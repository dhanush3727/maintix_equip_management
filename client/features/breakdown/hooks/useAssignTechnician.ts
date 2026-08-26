import { useMutation, useQueryClient } from "@tanstack/react-query";
import { AssignTechnicianRequest } from "../types/breakdown.type";
import { breakdownService } from "../service/breakdown.service";
import { QUERY_KEYS } from "@/constants";

interface AssignTechnicianVariable {
  id: number;
  payload: AssignTechnicianRequest;
}

export const useAssignTechnician = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id, payload }: AssignTechnicianVariable) =>
      breakdownService.assignTechnician(id, payload),

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
