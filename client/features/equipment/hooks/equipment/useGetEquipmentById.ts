import { QUERY_KEYS } from "@/constants";
import { useQuery } from "@tanstack/react-query";
import { equipmentService } from "../../services/equipment.service";

export const useGetEquipmentById = (id: number) => {
  return useQuery({
    queryKey: [...QUERY_KEYS.equipment.by_id, id],
    queryFn: () => equipmentService.getEquipmentById(id),
  });
};
