// Login Request
export interface LoginRequest {
  email: string;
  password: string;
}

// User data
export interface User {
  id: number;
  name: string;
  email: string;
}

// Login data
export interface LoginData {
  user: User;
  accessToken: string;
}

export type LoginProps = {
  redirect?: string | null;
};
