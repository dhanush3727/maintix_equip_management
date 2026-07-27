import { ApiResponse, Onboarding, Organization } from "@/types";
import api from "./api/api";
import { API_ENDPOINTS } from "@/constants";
import { OrganizationDD } from "../types/organization.types";

export const organizationService = {
  // Get onboarding
  async onboarding(): Promise<ApiResponse<Onboarding>> {
    const { data } = await api.get<ApiResponse<Onboarding>>(
      API_ENDPOINTS.ONBOARDING,
    );

    return data;
  },

  // Get organization details
  async getOrganization(): Promise<ApiResponse<Organization>> {
    const { data } = await api.get<ApiResponse<Organization>>(
      API_ENDPOINTS.ORGANIZATION,
    );

    return data;
  },

  // Get organization dropdown
  async getOrganizationDD(): Promise<ApiResponse<OrganizationDD>> {
    const { data } = await api.get<ApiResponse<OrganizationDD>>(
      API_ENDPOINTS.ORGANIZATION_DROPDOWN,
    );

    return data;
  },
};
