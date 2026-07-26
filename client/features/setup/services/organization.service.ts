import api from "@/services/api/api";
import { ApiResponse } from "@/types";
import { OrganizationRequest } from "../types/organization.type";
import { SETUP_ORGANIZATION_ENDPOINTS } from "../constants/organization.constant";

export const organizationService = {
  async setupOrganization(
    payload: OrganizationRequest,
  ): Promise<ApiResponse<void>> {
    const { data } = await api.post<ApiResponse<void>>(
      SETUP_ORGANIZATION_ENDPOINTS.SETUP_ORGANIZATION,
      payload,
    );

    return data;
  },
};
