import { useMutation, useQueryClient } from "@tanstack/react-query";
import { equipmentTypeService } from "../../services/equipment-type.service";
import { QUERY_KEYS } from "@/constants";

interface UpdateStatusVariables {
  id: number;
  isActive: boolean;
}

export const useUpdateStatus = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id, isActive }: UpdateStatusVariables) =>
      // Here the mutation function checks the isActive flag and calls the appropriate service method to either activate or deactivate the equipment type based on the provided id.
      // The isActive refers to the current status of the equipment type, and based on its value, the corresponding service method is invoked to update the status in the backend.
      isActive
        ? equipmentTypeService.activateEquipmentType(id)
        : equipmentTypeService.deactivateEquipmentType(id),

    onSuccess: (_, variables) => {
      queryClient.invalidateQueries({
        queryKey: [...QUERY_KEYS.equipment_type.get_by_id, variables.id],
      });

      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.equipment_type.get_dropdown,
      });

      queryClient.invalidateQueries({
        queryKey: QUERY_KEYS.equipment_type.get_list,
      });
    },
  });
};
