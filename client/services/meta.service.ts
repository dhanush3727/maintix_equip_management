import { ApiResponse, MetaData } from "@/types";
import api from "./api/api";
import { API_ENDPOINTS } from "@/constants";

export const metaService = {
  async getMeta(): Promise<ApiResponse<MetaData>> {
    const { data } = await api.get<ApiResponse<MetaData>>(API_ENDPOINTS.META);

    return data;
  },
};
