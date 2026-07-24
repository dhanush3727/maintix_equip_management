import { setToken } from "@/lib/token-manager";
import authApi from "./api/authApi";
import { ApiResponse, User } from "@/types";
import api from "./api/api";

interface RefreshTokenResponse {
  message: string;
  data: {
    accessToken: string;
  };
}

/**
 * Request a new accessToken using the refreshToken stored in the cookie
 *
 * if the refresh token is valid it return the new access token
 *
 * we store the token in-memory
 *
 */
export async function refreshTokenRotation(): Promise<string> {
  const res = await authApi.post<RefreshTokenResponse>("auth/refresh");

  const accessToken = res.data.data.accessToken;

  setToken(accessToken);

  return accessToken;
}

export async function getCurrentUser(): Promise<ApiResponse<User>> {
  const { data } = await api.get<ApiResponse<User>>("auth/me");

  return data;
}
