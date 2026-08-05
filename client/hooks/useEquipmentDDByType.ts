import { QUERY_KEYS } from "@/constants";
import { equipmentService } from "@/services";
import { useQuery } from "@tanstack/react-query";

export const useEquipmentDDByType = (typeId: number) => {
  return useQuery({
    queryKey: [...QUERY_KEYS.equipment.dropdown_by_type, typeId],
    queryFn: () => equipmentService.getEquipmentDrodownByType(typeId),
    enabled: typeId > 0,
  });
};
