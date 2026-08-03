import { useMutation, useQueryClient } from "@tanstack/react-query";
import { equipmentService } from "../../services/equipment.service";
import { QUERY_KEYS } from "@/constants";

interface UpdateStatusVariables {
  id: number;
  isActive: boolean;
}

export const useUpdateStatus = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id, isActive }: UpdateStatusVariables) =>
      isActive
        ? equipmentService.activateEquipment(id)
        : equipmentService.deactivateEquipment(id),

    onSuccess: (_, variables) => {
      queryClient.invalidateQueries({
        queryKey: [...QUERY_KEYS.equipment.by_id, variables.id],
      });

      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.equipment.get_list,
      });
    },
  });
};
