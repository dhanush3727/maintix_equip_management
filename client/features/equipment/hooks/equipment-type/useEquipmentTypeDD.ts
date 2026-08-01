import { QUERY_KEYS } from "@/constants";
import { useQuery } from "@tanstack/react-query";
import { equipmentTypeService } from "../../services/equipment-type.service";

export const useEquipmentTypeDD = () => {
  return useQuery({
    queryKey: QUERY_KEYS.equipment_type.get_dropdown,
    queryFn: equipmentTypeService.getEquipmentTypeDropdown,
  });
};
