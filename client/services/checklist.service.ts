import { ApiResponse, DropDown } from "@/types";
import api from "./api/api";
import { API_ENDPOINTS } from "@/constants";

export const checklistService = {
  // Get Checklist dropdown
  async getChecklistDropdown(): Promise<ApiResponse<DropDown[]>> {
    const { data } = await api.get<ApiResponse<DropDown[]>>(
      API_ENDPOINTS.CHECKLIST_DROPDOWN,
    );

    return data;
  },
};
