import { useInfiniteQuery } from "@tanstack/react-query";
import { ScheduleParams } from "../types/schedule.type";
import { CARD_LIMIT, QUERY_KEYS } from "@/constants";
import { scheduleService } from "../service/schedule.service";

interface ScheduleInfiniteList extends Omit<ScheduleParams, "page" | "limit"> {
  enabled?: boolean;
}

export const useScheduleInfiniteList = ({
  enabled = true,
  ...params
}: ScheduleInfiniteList) => {
  return useInfiniteQuery({
    queryKey: [...QUERY_KEYS.schedule.list, "card", params],

    queryFn: ({ pageParam }) =>
      scheduleService.getSchedules({
        ...params,
        page: pageParam,
        limit: CARD_LIMIT,
      }),
    initialPageParam: 1,

    getNextPageParam: (lastPage) => {
      if (!lastPage.pagination) return undefined;

      const { page, totalPages } = lastPage.pagination;

      if (page >= totalPages) return undefined;

      return page + 1;
    },

    enabled,
  });
};
