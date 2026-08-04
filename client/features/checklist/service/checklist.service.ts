import { ApiResponse, DropDown } from "@/types";
import {
  ChecklistParam,
  ChecklistRequest,
  GetChecklistByIdData,
  GetChecklistsData,
} from "../types/checklist.type";
import api from "@/services/api/api";
import { CHECKLIST_ENDPOINTS } from "../constants/checklist.constant";

export const checklistService = {
  // Create Checklist
  async createChecklist(payload: ChecklistRequest): Promise<ApiResponse<void>> {
    const { data } = await api.post<ApiResponse<void>>(
      CHECKLIST_ENDPOINTS.CREATE,
      payload,
    );

    return data;
  },

  // Get checklist list
  async getChecklists(
    params: ChecklistParam,
  ): Promise<ApiResponse<GetChecklistsData>> {
    const { data } = await api.get<ApiResponse<GetChecklistsData>>(
      CHECKLIST_ENDPOINTS.LIST,
      {
        params,
      },
    );

    return data;
  },

  // Get checklist dropdown
  async getChecklistDropdown(id: number): Promise<ApiResponse<DropDown[]>> {
    const { data } = await api.get<ApiResponse<DropDown[]>>(
      CHECKLIST_ENDPOINTS.DROPDOWN(id),
    );

    return data;
  },

  // Get checklist by id
  async getChecklistById(
    id: number,
  ): Promise<ApiResponse<GetChecklistByIdData>> {
    const { data } = await api.get<ApiResponse<GetChecklistByIdData>>(
      CHECKLIST_ENDPOINTS.BY_ID(id),
    );

    return data;
  },

  // Update checklist
  async updateChecklist(
    id: number,
    payload: ChecklistRequest,
  ): Promise<ApiResponse<void>> {
    const { data } = await api.patch<ApiResponse<void>>(
      CHECKLIST_ENDPOINTS.UPDATE(id),
      payload,
    );

    return data;
  },
};
