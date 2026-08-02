import { QUERY_KEYS } from "@/constants";
import { useInfiniteQuery } from "@tanstack/react-query";
import { EquipmentParams } from "../../types/equipment.type";
import { equipmentService } from "../../services/equipment.service";

const LIMIT = 10;

export const useEquipmentList = (
  params: Omit<EquipmentParams, "page" | "limit"> = {},
) => {
  return useInfiniteQuery({
    queryKey: [...QUERY_KEYS.equipment.get_list, params],

    queryFn: ({ pageParam }) =>
      equipmentService.getEquipmentList({
        ...params,
        page: pageParam,
        limit: LIMIT,
      }),

    initialPageParam: 1,

    getNextPageParam: (lastPage) => {
      if (!lastPage.pagination) return;

      const { page, totalPages } = lastPage.pagination;

      if (page >= totalPages) return undefined;

      return page + 1;
    },
  });
};
