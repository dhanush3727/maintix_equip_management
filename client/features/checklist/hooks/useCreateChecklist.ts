import { useMutation, useQueryClient } from "@tanstack/react-query";
import { checklistService } from "../service/checklist.service";
import { QUERY_KEYS } from "@/constants";

export const useCreateChecklist = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: checklistService.createChecklist,

    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.checklist.list,
      });

      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.checklist.dropdown,
      });
    },
  });
};
