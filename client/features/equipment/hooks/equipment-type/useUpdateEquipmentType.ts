import { useMutation, useQueryClient } from "@tanstack/react-query";
import { equipmentTypeService } from "../../services/equipment-type.service";
import { QUERY_KEYS } from "@/constants";
import { EditEquipmentTypeRequest } from "../../types/equipment-type.type";

interface EditEquipmentTypeVariable {
  id: number;
  payload: EditEquipmentTypeRequest;
}

export const useUpdateEquipmentType = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id, payload }: EditEquipmentTypeVariable) =>
      equipmentTypeService.updateEquipmentType(id, payload),

    onSuccess: (_, variables) => {
      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.equipment_type.get_list,
      });

      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.equipment_type.get_dropdown,
      });

      queryClient.invalidateQueries({
        queryKey: [...QUERY_KEYS.equipment_type.get_by_id, variables.id],
      });
    },
  });
};
