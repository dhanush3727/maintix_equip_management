import api from "@/services/api/api";
import { ApiResponse } from "@/types";
import { OrganizationRequest } from "../types/organization.type";
import { SETUP_ORGANIZATION_ENDPOINTS } from "../constants/organization.constant";

export const organizationService = {
  async setupOrganization(
    payload: OrganizationRequest,
  ): Promise<ApiResponse<void>> {
    const formData = new FormData();

    formData.append("industryType", payload.industryType);
    formData.append("companySize", payload.companySize);
    formData.append("country", payload.country);
    formData.append("city", payload.city);
    formData.append("logo", payload.logo);

    for (const [key, value] of formData.entries()) {
      console.log("key", key, "value", value);
    }

    const { data } = await api.post<ApiResponse<void>>(
      SETUP_ORGANIZATION_ENDPOINTS.SETUP_ORGANIZATION,
      formData,
    );

    return data;
  },
};
