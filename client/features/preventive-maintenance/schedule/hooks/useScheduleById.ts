import { QUERY_KEYS } from "@/constants";
import { useQuery } from "@tanstack/react-query";
import { scheduleService } from "../service/schedule.service";

export const useScheduleById = (id: number) => {
  return useQuery({
    queryKey: [...QUERY_KEYS.schedule.id, id],
    queryFn: () => scheduleService.getScheduleById(id),
  });
};
