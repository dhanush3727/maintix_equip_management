import api from "@/services/api/api";
import { ApiResponse } from "@/types";
import { EQUIPMENT_TYPE_ENDPOINTS } from "../constants/equipment-type.constant";
import {
  AddEquipmentTypeRequest,
  EquipmentTypeData,
  EquipmentTypeParams,
} from "../types/equipment-type.type";

export const equipmentTypeService = {
  // Create equipment type
  async createEquipmentType(
    payload: AddEquipmentTypeRequest,
  ): Promise<ApiResponse<void>> {
    const { data } = await api.post<ApiResponse<void>>(
      EQUIPMENT_TYPE_ENDPOINTS.CREATE,
      payload,
    );

    return data;
  },

  // Get Equipment types
  async getEquipmentTypes(
    params: EquipmentTypeParams,
  ): Promise<ApiResponse<EquipmentTypeData[]>> {
    const { data } = await api.get<ApiResponse<EquipmentTypeData[]>>(
      EQUIPMENT_TYPE_ENDPOINTS.GET_LIST,
      {
        params,
      },
    );

    return data;
  },
};
