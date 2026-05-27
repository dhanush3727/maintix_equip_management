export interface LoginResponse {
  data: {
    user: {
      id: number;
      name: string;
      email: string;
    };
    accessToken: string;
  };
}

export type ApiResponse<T> = {
  success: boolean;
  message: string;
  data?: T;
};
