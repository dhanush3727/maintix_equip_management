import { useMutation, useQueryClient } from "@tanstack/react-query";
import { equipmentTypeService } from "../../services/equipment-type.service";
import { QUERY_KEYS } from "@/constants";

export const useAddEquipmentType = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: equipmentTypeService.createEquipmentType,

    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.equipment_type.get_list,
      });
    },
  });
};
