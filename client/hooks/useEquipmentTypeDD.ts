import { QUERY_KEYS } from "@/constants";
import { equipmentService } from "@/services";
import { useQuery } from "@tanstack/react-query";

export const useEquipmentTypeDD = () => {
  return useQuery({
    queryKey: QUERY_KEYS.equipment_type.get_dropdown,
    queryFn: equipmentService.getEquipmentTypeDropdown,
  });
};
