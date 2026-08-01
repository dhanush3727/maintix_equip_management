# UseInfiniteQuery

This hook is used to fetch data in an infinite scrolling manner. It allows you to fetch more data as the user scrolls down, making it ideal for scenarios like loading a list of items or paginated content.
Ex:

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

In this example,

- We create a custom hook `useGetEquipmentTypes` that uses `useInfiniteQuery` to fetch equipment types.
- The `queryKey` is constructed using a constant and the parameters passed to the hook.
- The `queryFn` is responsible for fetching the data from the service, using the `pageParam` to determine which page of data to fetch.
- The `initialPageParam` is set to 1, indicating that the first page of data should be fetched initially.
- The `getNextPageParam` function determines the next page to fetch based on the pagination information returned from the last page of data. If there are no more pages to fetch, it returns `undefined`, signaling that there is no more data to load.
- The `LIMIT` constant defines how many items to fetch per page, which can be adjusted based on your needs.
