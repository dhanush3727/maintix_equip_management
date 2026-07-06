import { clearToken, getToken } from "@/lib/token-manager";
import axios, { AxiosError, InternalAxiosRequestConfig } from "axios";
import { refreshTokenRotation } from "../auth.service";

/**
 * Shared Axios instance used throughout the application.
 *
 * Configuration:
 * - Base URL from environment variables
 * - Automatically includes HttpOnly cookies
 * - JSON request/response handling
 */

const api = axios.create({
  baseURL: process.env.NEXT_PUBLIC_API_URL,
  withCredentials: true,
  headers: {
    "Content-Type": "application/json",
  },
});

/**
 * Request interceptors
 *
 * It runs before every HTTP request
 *
 * Component -> Axios Request -> Request Interceptor -> Back-end
 *
 * Internally if user send request with accessToken, it will automatically add the accessToken to the request header
 * Back-end will check the accessToken and return the response accordingly
 */
api.interceptors.request.use(
  (config: InternalAxiosRequestConfig) => {
    const accessToken = getToken();

    if (accessToken) {
      config.headers.Authorization = `Bearer ${accessToken}`;
    }

    return config;
  },
  (error) => Promise.reject(error),
);

/**
 * Indicate whether refresh function is currently running
 */
let isRefreshing: boolean = false;

/**
 * Stores pending request while the token is being refreshed
 */
let refreshPromise: Promise<string> | null = null;

/**
 * Response interceptors
 *
 * It runs after every HTTP response that the server responds
 *
 * Component -> Axios Request -> Back-end -> Response Interceptor -> Component
 *
 * Internally if the accessToken is expired, the back-end will return 401 Unauthorized error
 * The response interceptor will catch the error and try to refresh the accesstoken using the refreshToken stored in the HttpOnly cookie.
 */
api.interceptors.response.use(
  (response) => response,
  async (error: AxiosError) => {
    const originalRequest = error.config;

    if (!originalRequest) {
      return Promise.reject(error);
    }

    if (error.status === 401 && !originalRequest._retry) {
      try {
        if (isRefreshing && refreshPromise) {
          await refreshPromise;
        } else {
          isRefreshing = true;

          refreshPromise = refreshTokenRotation();

          await refreshPromise;
        }

        return api(originalRequest);
      } catch (refreshErr) {
        clearToken();

        return Promise.reject(refreshErr);
      } finally {
        isRefreshing = false;
        refreshPromise = null;
      }
    }

    return Promise.reject(error);
  },
);

export default api;
