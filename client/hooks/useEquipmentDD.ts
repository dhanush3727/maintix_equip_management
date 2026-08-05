import { QUERY_KEYS } from "@/constants";
import { equipmentService } from "@/services";
import { useQuery } from "@tanstack/react-query";

export const useEquipmentDD = () => {
  return useQuery({
    queryKey: QUERY_KEYS.equipment.dropdown,
    queryFn: equipmentService.getEquipmentDropdown,
  });
};
