import authApi from "@/services/api/authApi";
import {
  ForgotPasswordRequest,
  LoginData,
  LoginRequest,
  RegisterData,
  RegisterRequest,
  ResetPasswordRequest,
} from "../types/auth.type";
import { AUTH_ENDPOINTS } from "../constatnts/auth.constants";
import { ApiResponse } from "@/types/api-response.types";

export const authService = {
  // Login
  async login(payload: LoginRequest): Promise<ApiResponse<LoginData>> {
    const { data } = await authApi.post<ApiResponse<LoginData>>(
      AUTH_ENDPOINTS.LOGIN,
      payload,
    );

    return data;
  },

  // Register
  async register(payload: RegisterRequest): Promise<ApiResponse<RegisterData>> {
    const { data } = await authApi.post<ApiResponse<RegisterData>>(
      AUTH_ENDPOINTS.REGISTER,
      payload,
    );

    return data;
  },

  // Forgot Password
  async forgotPassword(
    payload: ForgotPasswordRequest,
  ): Promise<ApiResponse<void>> {
    const { data } = await authApi.post<ApiResponse<void>>(
      AUTH_ENDPOINTS.FORGOT_PASSWORD,
      payload,
    );

    return data;
  },

  // Reset Password
  async resetPassword(
    payload: ResetPasswordRequest,
  ): Promise<ApiResponse<void>> {
    const { data } = await authApi.post<ApiResponse<void>>(
      AUTH_ENDPOINTS.RESET_PASSWORD,
      payload,
    );

    return data;
  },
};
