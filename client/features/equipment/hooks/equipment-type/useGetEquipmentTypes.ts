import { QUERY_KEYS } from "@/constants";
import { useQuery } from "@tanstack/react-query";
import { EquipmentTypeParams } from "../../types/equipment-type.type";
import { equipmentTypeService } from "../../services/equipment-type.service";

export const useGetEquipmentTypes = (params: EquipmentTypeParams) => {
  return useQuery({
    queryKey: [...QUERY_KEYS.equipment_type.get_list, params],
    queryFn: () => equipmentTypeService.getEquipmentTypes(params),
  });
};
