import { keepPreviousData, useQuery } from "@tanstack/react-query";
import { ScheduleParams } from "../types/schedule.type";
import { QUERY_KEYS } from "@/constants";
import { scheduleService } from "../service/schedule.service";

interface ScheduleListParam extends ScheduleParams {
  enabled?: boolean;
}

export const useScheduleList = ({
  enabled = true,
  ...params
}: ScheduleListParam) => {
  return useQuery({
    queryKey: [...QUERY_KEYS.schedule.list, params],
    queryFn: () => scheduleService.getSchedules(params),
    placeholderData: keepPreviousData,
    enabled,
  });
};
