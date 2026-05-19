import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import { JwtPayloadType, GenereateTokensType } from '../types/auth.types';
import { randomUUID } from 'crypto';

@Injectable()
export class TokenService {
  constructor(
    private readonly configService: ConfigService,
    private readonly jwtService: JwtService,
  ) {}

  async generateTokens(payload: GenereateTokensType) {
    // Generate jti for tracking and control in the database
    const jti = randomUUID();

    const jwtPayload: JwtPayloadType = {
      sub: payload.userId,
      email: payload.email,
      organizationId: payload.organizationId,
      roles: payload.roles,
      jti,
    };

    const accessToken = await this.jwtService.signAsync(jwtPayload, {
      secret: this.configService.get<string>('jwt.accessSecret'),
      expiresIn: '15m',
    });

    const refreshToken = await this.jwtService.signAsync(jwtPayload, {
      secret: this.configService.get<string>('jwt.refreshSecret'),
      expiresIn: '7d',
    });

    return { accessToken, refreshToken, jti };
  }
}
