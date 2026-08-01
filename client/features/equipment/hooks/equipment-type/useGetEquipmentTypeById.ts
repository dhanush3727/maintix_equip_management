import { QUERY_KEYS } from "@/constants";
import { useQuery } from "@tanstack/react-query";
import { equipmentTypeService } from "../../services/equipment-type.service";

export const useGetEquipmentTypeById = (id: number) => {
  return useQuery({
    queryKey: [...QUERY_KEYS.equipment_type.get_by_id, id],
    queryFn: () => equipmentTypeService.getEquipmentTypeById(id),
  });
};
