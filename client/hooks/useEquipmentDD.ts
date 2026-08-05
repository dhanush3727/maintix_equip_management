import { QUERY_KEYS } from "@/constants";
import { equipmentService } from "@/services";
import { useQuery } from "@tanstack/react-query";

export const useEquipmentDD = (typeId?: number) => {
  return useQuery({
    queryKey: [...QUERY_KEYS.equipment.dropdown, typeId],
    queryFn: () => {
      if (typeId === undefined) {
        throw new Error("Equipment type is required");
      }

      equipmentService.getEquipmentDrodown(typeId);
    },
    enabled: typeId !== undefined,
  });
};
