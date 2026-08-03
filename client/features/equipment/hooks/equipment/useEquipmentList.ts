import { QUERY_KEYS } from "@/constants";
import { keepPreviousData, useQuery } from "@tanstack/react-query";
import { EquipmentParams } from "../../types/equipment.type";
import { equipmentService } from "../../services/equipment.service";

export const useEquipmentList = (params: EquipmentParams) => {
  return useQuery({
    queryKey: [...QUERY_KEYS.equipment.get_list, params],
    queryFn: () => equipmentService.getEquipmentList(params),
    placeholderData: keepPreviousData,
  });
};
