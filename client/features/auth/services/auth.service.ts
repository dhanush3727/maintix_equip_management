import authApi from "@/services/api/authApi";
import {
  AcceptInvitationRequest,
  ForgotPasswordRequest,
  LoginData,
  LoginRequest,
  RegisterData,
  RegisterRequest,
  ResetPasswordRequest,
  SendEmailRequest,
  VerifyEmailRequest,
  VerifyInvitationData,
} from "../types/auth.type";
import { AUTH_ENDPOINTS } from "../constatnts/auth.constants";
import { ApiResponse } from "@/types";

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

  // Send email verification
  async sendEmailVerification(
    payload: SendEmailRequest,
  ): Promise<ApiResponse<void>> {
    const { data } = await authApi.post<ApiResponse<void>>(
      AUTH_ENDPOINTS.SEND_EMAIL_VERIFICATION,
      payload,
    );

    return data;
  },

  // Verify email
  async verifyEmail(payload: VerifyEmailRequest): Promise<ApiResponse<void>> {
    const { data } = await authApi.post<ApiResponse<void>>(
      AUTH_ENDPOINTS.VERIFY_EMAIL,
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

  // Logout current session
  async logout(): Promise<ApiResponse<void>> {
    const { data } = await authApi.post<ApiResponse<void>>(
      AUTH_ENDPOINTS.LOGOUT,
    );

    return data;
  },

  // Verify invitation
  async verifyInvitation(
    token: string,
  ): Promise<ApiResponse<VerifyInvitationData>> {
    const { data } = await authApi.get<ApiResponse<VerifyInvitationData>>(
      `${AUTH_ENDPOINTS.VERIFY_INVITE}?token=${token}`,
    );

    return data;
  },

  // Accept invitation
  async acceptInvitation(
    payload: AcceptInvitationRequest,
  ): Promise<ApiResponse<void>> {
    const { data } = await authApi.post<ApiResponse<void>>(
      AUTH_ENDPOINTS.ACCEPT_INVITE,
      payload,
    );

    return data;
  },
};
