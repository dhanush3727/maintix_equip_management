import { useMutation, useQueryClient } from "@tanstack/react-query";
import { ChecklistRequest } from "../types/checklist.type";
import { checklistService } from "../service/checklist.service";
import { QUERY_KEYS } from "@/constants";

interface UpdateChecklistVariables {
  id: number;
  payload: ChecklistRequest;
}

export const useUpdateChecklist = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id, payload }: UpdateChecklistVariables) =>
      checklistService.updateChecklist(id, payload),

    onSuccess: (_, variables) => {
      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.checklist.list,
      });

      queryClient.invalidateQueries({
        queryKey: [...QUERY_KEYS.checklist.id, variables.id],
      });

      queryClient.invalidateQueries({
        queryKey: [
          ...QUERY_KEYS.checklist.dropdown_by_type,
          variables.payload.equipmentTypeId,
        ],
      });
    },
  });
};
