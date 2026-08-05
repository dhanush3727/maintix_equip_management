import { ApiResponse, DropDown } from "@/types";
import api from "./api/api";
import { API_ENDPOINTS } from "@/constants";

export const userService = {
  // Get user dropdown
  async getUserDropdown(): Promise<ApiResponse<DropDown[]>> {
    const { data } = await api.get<ApiResponse<DropDown[]>>(
      API_ENDPOINTS.USER_DROPDOWN,
    );

    return data;
  },
};
