import { setToken } from "@/lib/token-manager";
import authApi from "./api/authApi";

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
