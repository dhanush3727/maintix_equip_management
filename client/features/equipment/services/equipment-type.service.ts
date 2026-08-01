import api from "@/services/api/api";
import { ApiResponse } from "@/types";
import { EQUIPMENT_TYPE_ENDPOINTS } from "../constants/equipment-type.constant";
import {
  AddEquipmentTypeRequest,
  EditEquipmentTypeRequest,
  EquipmentTypeData,
  EquipmentTypeDropdownData,
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

  // Get equiment type dropdown
  async getEquipmentTypeDropdown(): Promise<
    ApiResponse<EquipmentTypeDropdownData[]>
  > {
    const { data } = await api.get<ApiResponse<EquipmentTypeDropdownData[]>>(
      EQUIPMENT_TYPE_ENDPOINTS.GET_DROPDOWN,
    );

    return data;
  },

  // Get equipment type by id
  async getEquipmentTypeById(
    id: number,
  ): Promise<ApiResponse<EquipmentTypeData>> {
    const { data } = await api.get<ApiResponse<EquipmentTypeData>>(
      EQUIPMENT_TYPE_ENDPOINTS.GET_BY_ID(id),
    );

    return data;
  },

  // Update equipment type
  async updateEquipmentType(
    id: number,
    payload: EditEquipmentTypeRequest,
  ): Promise<ApiResponse<void>> {
    const { data } = await api.patch<ApiResponse<void>>(
      EQUIPMENT_TYPE_ENDPOINTS.UPDATE(id),
      payload,
    );

    return data;
  },

  // activate equiment type
  async activateEquipmentType(id: number): Promise<ApiResponse<void>> {
    const { data } = await api.patch<ApiResponse<void>>(
      EQUIPMENT_TYPE_ENDPOINTS.ACTIVATE(id),
    );

    return data;
  },

  // deactivate equipment type
  async deactivateEquipmentType(id: number): Promise<ApiResponse<void>> {
    const { data } = await api.patch<ApiResponse<void>>(
      EQUIPMENT_TYPE_ENDPOINTS.DEACTIVATE(id),
    );

    return data;
  },
};
