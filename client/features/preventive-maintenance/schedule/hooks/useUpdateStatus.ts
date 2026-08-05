import { useMutation, useQueryClient } from "@tanstack/react-query";
import { scheduleService } from "../service/schedule.service";
import { QUERY_KEYS } from "@/constants";

interface UpdateStatusVariable {
  id: number;
  isActive: boolean;
}

export const useUpdateStatus = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id, isActive }: UpdateStatusVariable) =>
      isActive
        ? scheduleService.activateSchedule(id)
        : scheduleService.deactivateSchedule(id),

    onSuccess: (_, variables) => {
      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.schedule.list,
      });

      queryClient.invalidateQueries({
        queryKey: [...QUERY_KEYS.schedule.id, variables.id],
      });
    },
  });
};
