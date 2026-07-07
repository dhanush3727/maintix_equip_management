import { metaService } from "@/services/meta.service";
import { useQuery } from "@tanstack/react-query";

export function useMeta() {
  return useQuery({
    queryKey: ["meta"],
    queryFn: metaService.getMeta,
  });
}
