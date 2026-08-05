import { useMutation, useQueryClient } from "@tanstack/react-query";
import { scheduleService } from "../service/schedule.service";
import { QUERY_KEYS } from "@/constants";

export const useCreateSchedule = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: scheduleService.createSchedule,

    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.schedule.list,
      });
    },
  });
};
