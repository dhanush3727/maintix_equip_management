import { useMutation, useQueryClient } from "@tanstack/react-query";
import { ScheduleRequest } from "../types/schedule.type";
import { scheduleService } from "../service/schedule.service";
import { QUERY_KEYS } from "@/constants";

interface UpdateScheduleVariable {
  id: number;
  payload: ScheduleRequest;
}

export const useUpdateSchedule = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id, payload }: UpdateScheduleVariable) =>
      scheduleService.updateSchedule(id, payload),

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
