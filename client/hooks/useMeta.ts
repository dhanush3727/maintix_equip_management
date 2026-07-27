import { QUERY_KEYS } from "@/constants";
import { metaService } from "@/services";
import { useQuery } from "@tanstack/react-query";

export const useMeta = () => {
  return useQuery({
    queryKey: QUERY_KEYS.metaData.meta,
    queryFn: metaService.getMeta,
  });
};
