import { useInfiniteQuery } from "@tanstack/react-query";
import { EquipmentParams } from "../../types/equipment.type";
import { CARD_LIMIT, QUERY_KEYS } from "@/constants";
import { equipmentService } from "../../services/equipment.service";

interface UseEquipmentInfiniteListParams extends Omit<
  EquipmentParams,
  "page" | "limit"
> {
  enabled?: boolean;
}

export const useEquipmentInfiniteList = ({
  enabled = true,
  ...params
}: UseEquipmentInfiniteListParams) => {
  return useInfiniteQuery({
    queryKey: [...QUERY_KEYS.equipment.get_list, params],
    queryFn: ({ pageParam }) =>
      equipmentService.getEquipmentList({
        ...params,
        page: pageParam,
        limit: CARD_LIMIT,
      }),

    initialPageParam: 1,

    getNextPageParam: (lasPage) => {
      if (!lasPage.pagination) return;

      const { page, totalPages } = lasPage.pagination;

      if (page >= totalPages) return undefined;

      return page + 1;
    },
    enabled,
  });
};
