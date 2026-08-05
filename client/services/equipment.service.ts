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

  // Get equipment dropdown
  async getEquipmentDropdown(): Promise<ApiResponse<DropDown[]>> {
    const { data } = await api.get<ApiResponse<DropDown[]>>(
      API_ENDPOINTS.EQUIPMENT_DROPDOWN,
    );

    return data;
  },

  // Get equipment dropdown by type
  async getEquipmentDrodownByType(
    typeId: number,
  ): Promise<ApiResponse<DropDown[]>> {
    const { data } = await api.get<ApiResponse<DropDown[]>>(
      API_ENDPOINTS.EQUIPMENT_DROPDOWN_BY_ID(typeId),
    );

    return data;
  },
};
