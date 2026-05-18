import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { JwtPayloadType, MetaType, UserSessionType } from './types/auth.types';
import { compareToken, hashToken } from './utils/auth.utils';
import { TokenService } from './services/tokens.service';

@Injectable()
export class AuthService {
  constructor(
    private prisma: PrismaService,
    private readonly tokenService: TokenService,
  ) {}

  // Fetch roles for a user
  async getUserRoles(userId: number) {
    const userRoles = await this.prisma.userRole.findMany({
      where: { userId },
      include: { role: true }, // join Role table
    });

    return userRoles.map((userRole) => userRole.role.name);
  }

  //Generate access token and refresh token
  async generateAuthTokens(userId: number, email: string) {
    // Get roles from DB
    const roles = await this.getUserRoles(userId);

    // payload
    const payload: JwtPayloadType = { sub: userId, email, roles };

    return this.tokenService.generateTokens(payload);
  }

  // Store Refresh Token
  async saveRefreshToekn(
    userId: number,
    refreshToken: string,
    meta?: MetaType,
  ) {
    const hashed = await hashToken(refreshToken);

    const expiresAt = new Date();
    expiresAt.setDate(expiresAt.getDate() + 7); // match JWT expiry

    await this.prisma.userSession.create({
      data: {
        userId,
        refreshToken: hashed,
        expiresAt,
        deviceInfo: meta?.deviceInfo,
        ipAddress: meta?.ipAddress,
        userAgent: meta?.userAgent,
      },
    });
  }

  // Refresh token rotation
  async refreshTokens(userId: number, refreshToken: string) {
    // Get all active sessions for user
    const sessions = await this.prisma.userSession.findMany({
      where: { userId, isActive: true },
      include: {
        user: true,
      },
    });

    if (!sessions.length) {
      throw new UnauthorizedException('No active sessions');
    }

    let matchedSession: UserSessionType | null = null;

    // Find matching session
    for (const session of sessions) {
      const isMatch = await compareToken(refreshToken, session.refreshToken);

      if (isMatch) {
        matchedSession = session;
        break;
      }
    }

    if (!matchedSession) {
      throw new UnauthorizedException('Invalid refresh token');
    }

    // Check expiry
    if (matchedSession.expiresAt < new Date()) {
      // Deactivate expired session
      await this.prisma.userSession.update({
        where: { id: matchedSession.id },
        data: { isActive: false },
      });

      throw new UnauthorizedException('Refresh token expired');
    }

    // deactivate old session
    await this.prisma.userSession.update({
      where: { id: matchedSession.id },
      data: { isActive: false },
    });

    // generate new tokens
    const tokens = await this.generateAuthTokens(
      userId,
      matchedSession.user.email,
    );

    // Save new refresh token
    await this.saveRefreshToekn(userId, tokens.refreshToken);

    return tokens;
  }
}
