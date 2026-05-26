import { User, UserSession } from '@prisma/client';
import { Request } from 'express';

export type JwtPayloadType = {
  userId: number;
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
  ipAddress?: string;
  userAgent?: string;
  deviceInfo?: string;
};

export type UserSessionType = UserSession & { user: User };

export type RequestWithCookies = Request & {
  cookies: { refreshToken?: string };
};

export type ReqMetaType = {
  ipAddress: string;
  userAgent: string;
};
