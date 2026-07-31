# UseInfiniteQuery

```ts
import { QUERY_KEYS } from "@/constants";
import { useInfiniteQuery } from "@tanstack/react-query";
import { EquipmentTypeParams } from "../../types/equipment-type.type";
import { equipmentTypeService } from "../../services/equipment-type.service";

const LIMIT = 20;

export const useGetEquipmentTypes = (
  params: Omit<EquipmentTypeParams, "page" | "limit"> = {},
) => {
  return useInfiniteQuery({
    queryKey: [...QUERY_KEYS.equipment_type.get_list, params],

    queryFn: ({ pageParam }) =>
      equipmentTypeService.getEquipmentTypes({
        ...params,
        page: pageParam,
        limit: LIMIT,
      }),

    initialPageParam: 1,

    getNextPageParam: (lastPage) => {
      if (!lastPage.pagination) {
        return undefined;
      }

      const { page, totalPages } = lastPage.pagination;

      if (page >= totalPages) {
        return undefined;
      }

      return page + 1;
    },
  });
};
```
