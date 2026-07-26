import { metaService } from "@/services";
import { useQuery } from "@tanstack/react-query";

export const useMeta = () => {
  return useQuery({
    queryKey: ["meta"],
    queryFn: metaService.getMeta,
  });
};
