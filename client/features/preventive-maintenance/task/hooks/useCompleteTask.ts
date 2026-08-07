import { useMutation, useQueryClient } from "@tanstack/react-query";
import { taskService } from "../service/task.service";
import { QUERY_KEYS } from "@/constants";

interface CompleteTaskVariables {
  id: number;
}

export const useCompleteTask = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id }: CompleteTaskVariables) =>
      taskService.completTaskItem(id),

    onSuccess: (_, variables) => {
      queryClient.invalidateQueries({
        queryKey: [...QUERY_KEYS.task.id, variables.id],
      });

      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.task.list,
      });
    },
  });
};
