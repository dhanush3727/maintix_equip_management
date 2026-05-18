import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import { JwtPayloadType } from '../types/auth.types';

@Injectable()
export class TokenService {
  constructor(
    private readonly configService: ConfigService,
    private readonly jwtService: JwtService,
  ) {}

  async generateTokens(payload: JwtPayloadType) {
    const accessToken = await this.jwtService.signAsync(payload, {
      secret: this.configService.get<string>('jwt.accessSecret'),
      expiresIn: '15m',
    });

    const refreshToken = await this.jwtService.signAsync(payload, {
      secret: this.configService.get<string>('jwt.refreshSecret'),
      expiresIn: '7d',
    });

    return { accessToken, refreshToken };
  }
}
