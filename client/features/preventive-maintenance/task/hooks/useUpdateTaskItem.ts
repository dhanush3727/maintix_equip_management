import { useMutation, useQueryClient } from "@tanstack/react-query";
import { taskService } from "../service/task.service";
import { UpdateTaskItemRequest } from "../types/task.type";
import { QUERY_KEYS } from "@/constants";

interface UpdateTaskItemVariables {
  id: number;
  itemId: number;
  payload: UpdateTaskItemRequest;
}

export const useUpdateTaskItem = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id, itemId, payload }: UpdateTaskItemVariables) =>
      taskService.updateTaskItem(id, itemId, payload),

    onSuccess: (_, variables) => {
      queryClient.invalidateQueries({
        queryKey: [...QUERY_KEYS.task.id, variables.id],
      });
    },
  });
};
