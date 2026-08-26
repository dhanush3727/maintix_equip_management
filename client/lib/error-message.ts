import { ApiErrorResponse } from "@/types/error-response.types";
import axios from "axios";

export function getErrorMessage(err: unknown): string {
  /**
   * AxiosError: Error thrown by Axios for failed HTTP requests.
   * It provides additional properties like  `response`, `request`, `config` and `code`
   * to inspect the API error.
   */
  if (axios.isAxiosError(err)) {
    if (err.code === "ECONNABORTED") {
      return "Request timed out.";
    }

    if (!err.response) {
      return "Network error. Please check your connection.";
    }

    if (err.response.status === 403) {
      return "You do not have permission for this action.";
    }

    const data = err.response.data as ApiErrorResponse;

    return data.message || "An unexpected error occured.";
  }

  /**
   * Error: It is JS Generic runtime error thrown by JS or application code.
   * Only provides standard properties like
   * `message`, `name`, and `stack`.
   */
  if (err instanceof Error) return err.message;

  return "An unexpected error occured.";
}
