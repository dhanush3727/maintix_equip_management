import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';
import * as bcrypt from 'bcrypt';
import { PrismaService } from '../../prisma/prisma.service';
import { UserSession, User } from '@prisma/client';

type MetaType = {
  deviceInfo?: string;
  ipAddress?: string;
  userAgent?: string;
};

type UserSessionType = UserSession & { user: User };

@Injectable()
export class AuthService {
  constructor(
    private readonly jwtService: JwtService,
    private readonly configService: ConfigService,
    private prisma: PrismaService,
  ) {}

  //Generate access token and refresh token
  async generateTokens(userId: number, email: string) {
    const payload = { sub: userId, email };

    const accessToken = await this.jwtService.signAsync(payload, {
      secret: this.configService.get<string>('jwt.secret'),
      expiresIn: '15m',
    });

    const refreshToken = await this.jwtService.signAsync(payload, {
      secret: this.configService.get<string>('jwt.secret'),
      expiresIn: '7d',
    });

    return { accessToken, refreshToken };
  }

  // Store Refresh Token
  async saveRefreshToekn(
    userId: number,
    refreshToken: string,
    meta?: MetaType,
  ) {
    const hashed = await bcrypt.hash(refreshToken, 10);

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
      const isMatch = await bcrypt.compare(refreshToken, session.refreshToken);

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
    const tokens = await this.generateTokens(userId, matchedSession.user.email);

    // Save new refresh token
    await this.saveRefreshToekn(userId, tokens.refreshToken);

    return tokens;
  }
}
