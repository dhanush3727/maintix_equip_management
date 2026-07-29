import { ApiResponse } from "@/types";
import { DashboardData } from "../types/dashboard.type";
import api from "@/services/api/api";
import { DASHBOARD_ENDPOINT } from "../constants/dashboard.constant";

export const dashboardService = {
  // Get dashboard
  async getDashboard(): Promise<ApiResponse<DashboardData>> {
    const { data } = await api.get<ApiResponse<DashboardData>>(
      DASHBOARD_ENDPOINT.GET_DASHBOARD,
    );

    return data;
  },
};
