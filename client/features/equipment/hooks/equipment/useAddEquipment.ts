import { useMutation, useQueryClient } from "@tanstack/react-query";
import { equipmentService } from "../../services/equipment.service";
import { QUERY_KEYS } from "@/constants";

export const useAddEquipment = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: equipmentService.createEquipment,

    onSuccess: (_, variables) => {
      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.equipment.get_list,
      });

      queryClient.invalidateQueries({
        queryKey: [...QUERY_KEYS.equipment.dropdown, variables.equipmentTypeId],
      });
    },
  });
};
