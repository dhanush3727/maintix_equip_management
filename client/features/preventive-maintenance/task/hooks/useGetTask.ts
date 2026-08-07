import { useInfiniteQuery } from "@tanstack/react-query";
import { TaskParams } from "../types/task.type";
import { CARD_LIMIT, QUERY_KEYS } from "@/constants";
import { taskService } from "../service/task.service";

export const useGetTask = (
  params: Omit<TaskParams, "page" | " limit"> = {},
) => {
  return useInfiniteQuery({
    queryKey: [...QUERY_KEYS.task.list, params],

    queryFn: ({ pageParam }: { pageParam: string | undefined }) =>
      taskService.getAllTasks({
        ...params,
        cursor: pageParam,
        limit: CARD_LIMIT,
      }),

    initialPageParam: undefined,

    getNextPageParam: (lastPage) => {
      if (!lastPage.meta) return;

      const { hasMore, nextCursor } = lastPage.meta;

      if (!hasMore) return undefined;

      return nextCursor;
    },
  });
};
