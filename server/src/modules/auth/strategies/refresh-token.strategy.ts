// This file is used to define the RefreshTokenStrategy for authentication using JWT refresh tokens.
import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { ConfigService } from '@nestjs/config';

type JwtPayload = {
  sub: number;
  email: string;
};

@Injectable()
export class RefreshTokenStrategy extends PassportStrategy(
  Strategy,
  'jwt-refresh',
) {
  constructor(private readonly configService: ConfigService) {
    // Get secret from env
    const secret = configService.get<string>('jwt.secret');

    if (!secret) {
      throw new Error('JWT secret is not defined in environment');
    }

    super({
      jwtFromRequest: ExtractJwt.fromBodyField('refreshToken'), // extract refresh token from request body
      secretOrKey: secret,
      passReqToCallback: true,
    });
  }

  validate(req: Request, payload: JwtPayload) {
    const refreshToken = (req.body as { refreshToken?: string }).refreshToken;

    if (!refreshToken) {
      throw new UnauthorizedException('Refresh token missing');
    }

    return {
      ...payload,
      refreshToken,
    };
  }
}
