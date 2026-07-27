import { ApiResponse, RoleDD } from "@/types";
import api from "./api/api";
import { API_ENDPOINTS } from "@/constants";

export const roleService = {
  // Get roles dropdown
  async getRolesDropdown(): Promise<ApiResponse<RoleDD>> {
    const { data } = await api.get<ApiResponse<RoleDD>>(
      API_ENDPOINTS.ROLE_DROPDOWN,
    );

    return data;
  },
};
