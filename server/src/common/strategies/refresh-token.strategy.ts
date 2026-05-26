// This file is used to define the RefreshTokenStrategy for authentication using JWT refresh tokens.
import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { ConfigService } from '@nestjs/config';
import { JwtPayloadType, RequestWithCookies } from '../types/auth.types';

@Injectable()
export class RefreshTokenStrategy extends PassportStrategy(
  Strategy,
  'jwt-refresh',
) {
  constructor(private readonly configService: ConfigService) {
    // Get secret from env
    const secret = configService.get<string>('jwt.refreshSecret');

    if (!secret) {
      throw new Error('JWT refresh secret is not defined in environment');
    }

    super({
      jwtFromRequest: ExtractJwt.fromExtractors([
        (req: RequestWithCookies) => req?.cookies?.refreshToken || null, // extract refresh token from cookies
      ]), // extract refresh token from request body
      secretOrKey: secret, // use the refresh token secret
      passReqToCallback: true, // It allows us to access the request object in the validate method, which is necessary to extract the refresh token from the request body.
    });
  }

  validate(
    req: RequestWithCookies,
    payload: JwtPayloadType,
  ): JwtPayloadType & { refreshToken: string } {
    const refreshToken = req.cookies?.refreshToken;

    if (!refreshToken) {
      throw new UnauthorizedException('Refresh token missing');
    }

    // returning the payload along with the refresh token, so that it can be used in the AuthService to validate and rotate the refresh token.
    return {
      ...payload,
      refreshToken,
    };
  }
}
