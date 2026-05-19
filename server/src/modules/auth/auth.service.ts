import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { GenereateTokensType, MetaType } from './types/auth.types';
import { compareToken, hashToken } from './utils/auth.utils';
import { TokenService } from './services/tokens.service';

@Injectable()
export class AuthService {
  constructor(
    private prisma: PrismaService,
    private readonly tokenService: TokenService,
  ) {}

  //Generate access token and refresh token
  async generateAuthTokens(userId: number) {
    // Get organizationId for payload
    const user = await this.prisma.user.findUnique({
      where: { id: userId },
      include: {
        roles: {
          include: {
            role: true, // Include - Also fetch related data from another table
          },
        },
      },
    });

    if (!user) throw new UnauthorizedException('User not found');

    // Get roles from DB
    const roles = user.roles.map((userRole) => userRole.role.name);

    const payload: GenereateTokensType = {
      userId,
      email: user.email,
      organizationId: user.organizationId,
      roles,
    };

    return this.tokenService.generateTokens(payload);
  }

  // Store Refresh Token in DB with hashed value
  async saveRefreshToken(
    userId: number,
    refreshToken: string,
    jti: string,
    meta?: MetaType,
  ) {
    const hashed = await hashToken(refreshToken);

    const expiresAt = new Date();
    expiresAt.setDate(expiresAt.getDate() + 7); // match JWT expiry

    await this.prisma.userSession.create({
      data: {
        userId,
        jti,
        refreshToken: hashed,
        expiresAt,
        deviceInfo: meta?.deviceInfo,
        ipAddress: meta?.ipAddress,
        userAgent: meta?.userAgent,
      },
    });
  }

  // Refresh token rotation
  async refreshTokens(userId: number, refreshToken: string, jti: string) {
    // Get session from DB
    const session = await this.prisma.userSession.findUnique({
      where: { jti },
      include: {
        user: true, // Join User table
      },
    });

    if (!session || !session.isActive) {
      throw new UnauthorizedException('Invalid session');
    }

    const isMatch = await compareToken(refreshToken, session.refreshToken);

    // Deactivate session if token doesn't match
    if (!isMatch) {
      throw new UnauthorizedException('Invalid refresh token');
    }

    // Check expiry
    if (session.expiresAt < new Date()) {
      // Deactivate expired session
      await this.prisma.userSession.update({
        where: { id: session.id },
        data: { isActive: false },
      });

      throw new UnauthorizedException('Refresh token expired');
    }

    // deactivate old session
    await this.prisma.userSession.update({
      where: { id: session.id },
      data: { isActive: false },
    });

    // generate new tokens
    const tokens = await this.generateAuthTokens(userId);

    // Save new refresh token
    await this.saveRefreshToken(userId, tokens.refreshToken, tokens.jti);

    return tokens;
  }
}
