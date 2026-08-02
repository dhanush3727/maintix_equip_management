import { useMutation } from "@tanstack/react-query";
import { equipmentService } from "../../services/equipment.service";

export const useAddEquipment = () => {
  return useMutation({
    mutationFn: equipmentService.createEquipment,
  });
};
