import { ApiResponse } from "@/types";
import {
  AddEquipmentRequest,
  EquipmentData,
  EquipmentParams,
} from "../types/equipment.type";
import api from "@/services/api/api";
import { EQUIPMENT_ENDPOINT } from "../constants/equipment.constant";

export const equipmentService = {
  // Add new equipment
  async createEquipment(
    payload: AddEquipmentRequest,
  ): Promise<ApiResponse<void>> {
    const { data } = await api.post<ApiResponse<void>>(
      EQUIPMENT_ENDPOINT.CREATE,
      payload,
    );

    return data;
  },

  // Get equipment list
  async getEquipmentList(
    params: EquipmentParams,
  ): Promise<ApiResponse<EquipmentData[]>> {
    const { data } = await api.get<ApiResponse<EquipmentData[]>>(
      EQUIPMENT_ENDPOINT.LIST,
      {
        params,
      },
    );

    return data;
  },
};
