import authApi from "@/services/api/authApi";
import { LoginData, LoginRequest } from "../types/auth.type";
import { AUTH_ENDPOINTS } from "../constatnts/auth.constants";
import { ApiResponse } from "@/types/api-response.types";

export const authService = {
  // Login
  async login(payload: LoginRequest) {
    const { data } = await authApi.post<ApiResponse<LoginData>>(
      AUTH_ENDPOINTS.LOGIN,
      payload,
    );

    return data;
  },
};
