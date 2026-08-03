import { QUERY_KEYS } from "@/constants";
import { keepPreviousData, useQuery } from "@tanstack/react-query";
import { EquipmentParams } from "../../types/equipment.type";
import { equipmentService } from "../../services/equipment.service";

interface UseEquipmentListParams extends EquipmentParams {
  enabled?: boolean;
}

export const useEquipmentList = ({
  enabled = true,
  ...params
}: UseEquipmentListParams) => {
  return useQuery({
    queryKey: [...QUERY_KEYS.equipment.get_list, params],
    queryFn: () => equipmentService.getEquipmentList(params),
    placeholderData: keepPreviousData,
    enabled,
  });
};
