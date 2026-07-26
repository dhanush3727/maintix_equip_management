import { ApiResponse, Onboarding } from "@/types";
import api from "./api/api";
import { API_ENDPOINTS } from "@/constants";

export const organizationService = {
  async onboarding(): Promise<ApiResponse<Onboarding>> {
    const { data } = await api.get<ApiResponse<Onboarding>>(
      API_ENDPOINTS.ONBOARDING,
    );

    return data;
  },
};
