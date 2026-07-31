import { QUERY_KEYS } from "@/constants";
import { useInfiniteQuery } from "@tanstack/react-query";
import { EquipmentTypeParams } from "../../types/equipment-type.type";
import { equipmentTypeService } from "../../services/equipment-type.service";

// Number of records requested on each API call.
const LIMIT = 20;

export const useGetEquipmentTypes = (
  // Search/sort parameters are passed from the component.
  // page and limit are excluded because useInfiniteQuery manages them.
  params: Omit<EquipmentTypeParams, "page" | "limit"> = {},
) => {
  return useInfiniteQuery({
    // TanStack Query uses this key for caching.
    //
    // Example:
    // ["get-equipment-type", { search: "motor" }]
    //
    // If search/sort parameters change, a new query is created.
    queryKey: [...QUERY_KEYS.equipment_type.get_list, params],

    // This function runs whenever TanStack Query needs another page.
    //
    // pageParam comes from:
    // - initialPageParam for the first request
    // - getNextPageParam for subsequent requests
    queryFn: ({ pageParam }) =>
      equipmentTypeService.getEquipmentTypes({
        ...params,

        // First request:  page = 1
        // Load More:      page = 2
        // Load More:      page = 3
        page: pageParam,

        // Every request gets 10 records.
        limit: LIMIT,
      }),

    // The first API request will use page = 1.
    initialPageParam: 1,

    // This determines which page should be loaded next.
    getNextPageParam: (lastPage) => {
      // Your ApiResponse type says pagination is optional.
      //
      // If the API doesn't return pagination, we cannot determine
      // whether another page exists, so stop pagination.
      if (!lastPage.pagination) {
        return undefined;
      }

      const { page, totalPages } = lastPage.pagination;

      // Example:
      //
      // page = 1
      // totalPages = 3
      //
      // 1 >= 3 → false → return 2
      //
      // page = 3
      // totalPages = 3
      //
      // 3 >= 3 → true → return undefined
      if (page >= totalPages) {
        return undefined;
      }

      // Tell TanStack Query which page to request next.
      return page + 1;
    },
  });
};
