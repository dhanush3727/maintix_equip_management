import { useInfiniteQuery } from "@tanstack/react-query";
import { BreakdownParams } from "../types/breakdown.type";
import { CARD_LIMIT, QUERY_KEYS } from "@/constants";
import { breakdownService } from "../service/breakdown.service";

export const useBreakdowns = (
  params: Omit<BreakdownParams, "page" | "limit"> = {},
) => {
  return useInfiniteQuery({
    queryKey: [...QUERY_KEYS.breakdown.list, params],

    queryFn: ({ pageParam }: { pageParam: string | undefined }) =>
      breakdownService.getBreakdowns({
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
