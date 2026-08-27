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
  // headers: {
  //   "Content-Type": "application/json",
  // },
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
  /**
   * For successful responses, simply return the response.
   */
  (response) => response,

  /**
   * Handles all failed responses
   */
  async (error: AxiosError) => {
    // The original request that caused the error.
    // It will be retried ater the access token is refreshed.
    const originalRequest: InternalAxiosRequestConfig | undefined =
      error.config;

    // If there is no request configuration,
    // the request cannot be retried.
    if (!originalRequest) {
      return Promise.reject(error);
    }

    // Handle only 401 Unauthorized errors.
    // Also ensure that the same request is refreshed only once
    // to prevent an infinite refresh loop.
    if (error.response?.status === 401 && !originalRequest._retry) {
      // Mark this request as already retried.
      originalRequest._retry = true;

      try {
        /**
         * If no refresh operation is currently running,
         * start a new refresh request.
         *
         * Otherwise, other requests will simply wait
         * for the existing refresh operation to complete.
         */
        if (!isRefreshing) {
          isRefreshing = true;

          refreshPromise = refreshTokenRotation().finally(() => {
            /**
             * Cleanup after the refresh request finishes,
             * regardless of whether it succeeds or fails.
             *
             * This allows future 401 response to start
             * a new refresh operation
             */
            isRefreshing = false;
            refreshPromise = null;
          });
        }

        // Extra safety check.
        // refreshPromise should always exist at this point.
        if (!refreshPromise) {
          return Promise.reject(error);
        }

        // Wait until the access token has been refreshed.
        await refreshPromise;

        /**
         * Retry the original request
         *
         * The request interceptor will automatically attach
         * the newly refreshed access token to the Authorization header.
         */
        return api(originalRequest);
      } catch (refreshErr) {
        /**
         * Refresh failed
         *
         * Clear the stored access token.
         * The application can then redirect the user to the login page.
         */
        clearToken();

        // if (typeof window !== "undefined") {
        //   window.location.href = "/login";
        // }

        return Promise.reject(refreshErr);
      }
    }

    // For all other errors, simply return the original error.
    return Promise.reject(error);
  },
);

export default api;
