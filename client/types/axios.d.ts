import "axios";

declare module "axios" {
  export interface InternalAxiosRequestConfig {
    /**
     * Prevents infinite refresh loop
     * Try only once
     */
    _retry: boolean;
  }
}
