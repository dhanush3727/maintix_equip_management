import { User, UserSession } from '@prisma/client';

export type RequestUser = {
  userId: number;
  email: string;
  roles: string[];
};

export type AuthenticateRequest = Request & { user: RequestUser };

export type JwtPayloadType = {
  sub: number;
  email: string;
  roles: string[];
};

export type MetaType = {
  deviceInfo?: string;
  ipAddress?: string;
  userAgent?: string;
};

export type UserSessionType = UserSession & { user: User };

export type RequestWithCookies = Request & {
  cookies: { refreshToken?: string };
};
