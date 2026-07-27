import api from "@/services/api/api";
import { ApiResponse } from "@/types";
import {
  LocationRequest,
  OrganizationRequest,
} from "../types/organization.type";
import { SETUP_ORGANIZATION_ENDPOINTS } from "../constants/organization.constant";
import { SETUP_LOCATION_ENDPOINT } from "../constants/location.constant";

export const organizationService = {
  // Setup Organization profile
  async setupOrganization(
    payload: OrganizationRequest,
  ): Promise<ApiResponse<void>> {
    const formData = new FormData();

    formData.append("industryType", payload.industryType);
    formData.append("companySize", payload.companySize);
    formData.append("country", payload.country);
    formData.append("city", payload.city);
    formData.append("logo", payload.logo);

    const { data } = await api.post<ApiResponse<void>>(
      SETUP_ORGANIZATION_ENDPOINTS.SETUP_ORGANIZATION,
      formData,
    );

    return data;
  },

  // Create location
  async setupLocation(payload: LocationRequest): Promise<ApiResponse<void>> {
    const { data } = await api.post<ApiResponse<void>>(
      SETUP_LOCATION_ENDPOINT.SETUP_LOCATION,
      payload,
    );

    return data;
  },
};
