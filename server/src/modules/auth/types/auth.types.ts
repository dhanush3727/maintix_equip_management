import { User, UserSession } from '@prisma/client';

export type JwtPayloadType = {
  sub: number;
  email: string;
  organizationId: number;
  roles: string[];
  jti: string;
};

export type GenereateTokensType = {
  userId: number;
  email: string;
  organizationId: number;
  roles: string[];
};

export type RequestUser = {
  userId: number;
  email: string;
  organizationId: number;
  roles: string[];
  jti: string; // The unique ID for the token, used for tracking and control in the database
};

export type AuthenticateRequest = Request & { user: RequestUser };

export type MetaType = {
  deviceInfo?: string;
  ipAddress?: string;
  userAgent?: string;
};

export type UserSessionType = UserSession & { user: User };

export type RequestWithCookies = Request & {
  cookies: { refreshToken?: string };
};
