import { CARD_LIMIT, QUERY_KEYS } from "@/constants";
import { useInfiniteQuery } from "@tanstack/react-query";
import { checklistService } from "../service/checklist.service";
import { ChecklistParam } from "../types/checklist.type";

export const useGetChecklists = (
  params: Omit<ChecklistParam, "page" | "limit"> = {},
) => {
  return useInfiniteQuery({
    queryKey: [...QUERY_KEYS.checklist.list, params],

    queryFn: ({ pageParam }) =>
      checklistService.getChecklists({
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
  });
};
