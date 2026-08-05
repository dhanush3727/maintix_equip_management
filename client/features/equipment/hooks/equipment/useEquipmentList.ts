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
    placeholderData: keepPreviousData, // This will keep the previous data while fetching new data, preventing flickering in the UI.
    enabled, // This allows you to conditionally enable or disable the query based on the `enabled` parameter. If `enabled` is false, the query will not run.
  });
};
