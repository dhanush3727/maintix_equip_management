import { ApiResponse } from "@/types";
import {
  EquipmentByIdData,
  EquipmentData,
  EquipmentParams,
  EquipmentRequest,
} from "../types/equipment.type";
import api from "@/services/api/api";
import { EQUIPMENT_ENDPOINT } from "../constants/equipment.constant";

export const equipmentService = {
  // Add new equipment
  async createEquipment(payload: EquipmentRequest): Promise<ApiResponse<void>> {
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

  // Get by id
  async getEquipmentById(id: number): Promise<ApiResponse<EquipmentByIdData>> {
    const { data } = await api.get(EQUIPMENT_ENDPOINT.GET_BY_ID(id));

    return data;
  },

  // Update equipment
  async updateEquipment(
    payload: EquipmentRequest,
    id: number,
  ): Promise<ApiResponse<void>> {
    const { data } = await api.patch(EQUIPMENT_ENDPOINT.UPDATE(id), payload);

    return data;
  },

  // Activate equipment
  async activateEquipment(id: number): Promise<ApiResponse<void>> {
    const { data } = await api.patch<ApiResponse<void>>(
      EQUIPMENT_ENDPOINT.ACTIVATE(id),
    );

    return data;
  },

  // Deactivate equipment
  async deactivateEquipment(id: number): Promise<ApiResponse<void>> {
    const { data } = await api.patch<ApiResponse<void>>(
      EQUIPMENT_ENDPOINT.DEACTIVATE(id),
    );

    return data;
  },
};
