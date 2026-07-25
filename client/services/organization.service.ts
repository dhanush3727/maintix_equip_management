import { ApiResponse, Onboarding } from "@/types";
import api from "./api/api";

export const organizationService = {
  async onboarding(): Promise<ApiResponse<Onboarding>> {
    const { data } = await api.get<ApiResponse<Onboarding>>(
      "organization/onboarding",
    );

    return data;
  },
};
