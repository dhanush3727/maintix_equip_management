import { ApiResponse, DropDown } from "@/types";
import api from "./api/api";
import { API_ENDPOINTS } from "@/constants";

export const equipmentService = {
  // Get Equipment type dd
  async getEquipmentTypeDropdown(): Promise<ApiResponse<DropDown[]>> {
    const { data } = await api.get<ApiResponse<DropDown[]>>(
      API_ENDPOINTS.EQUIPMENT_TYPE_DROPDOWN,
    );

    return data;
  },

  // Get equipment dropdown by type
  async getEquipmentDrodown(typeId: number): Promise<ApiResponse<DropDown[]>> {
    const { data } = await api.get<ApiResponse<DropDown[]>>(
      API_ENDPOINTS.EQUIPMENT_DROPDOWN(typeId),
    );

    return data;
  },
};
