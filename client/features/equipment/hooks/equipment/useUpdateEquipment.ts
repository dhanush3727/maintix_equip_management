import { useMutation, useQueryClient } from "@tanstack/react-query";
import { equipmentService } from "../../services/equipment.service";
import { EquipmentRequest } from "../../types/equipment.type";
import { QUERY_KEYS } from "@/constants";

interface UpdateEquipmentVariables {
  id: number;
  payload: EquipmentRequest;
}

export const useUpdateEquipment = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id, payload }: UpdateEquipmentVariables) =>
      equipmentService.updateEquipment(payload, id),

    onSuccess: (_, variables) => {
      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.equipment.get_list,
      });

      queryClient.invalidateQueries({
        queryKey: [...QUERY_KEYS.equipment.by_id, variables.id],
      });

      queryClient.invalidateQueries({
        queryKey: [
          ...QUERY_KEYS.equipment.dropdown,
          variables.payload.equipmentTypeId,
        ],
      });
    },
  });
};
