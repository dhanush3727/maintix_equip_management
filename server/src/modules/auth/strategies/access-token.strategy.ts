// This file is used to define the AccessTokenStrategy for authentication using JWT access tokens.
import { Injectable } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { ConfigService } from '@nestjs/config';

type JwtPayload = {
  sub: number;
  email: string;
  roles: string[];
};

@Injectable()
export class AccessTokenStrategy extends PassportStrategy(
  Strategy, // It defines the strategy type, in this case, it's a JWT strategy.
  'jwt-access', // This is the name of the strategy, which will be used in the AuthGuard to specify which strategy to use for authentication.
) {
  constructor(private readonly configService: ConfigService) {
    // Get secret from .env
    const secret = configService.get<string>('jwt.accessSecret');

    if (!secret) {
      throw new Error('JWT access secret is not defined in environment');
    }

    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(), // Extract token from Authorization: Bearer <token>
      secretOrKey: secret, // this is used to verify the token signature
    });
  }

  // The validate method is called after the token is verified. It receives the decoded payload.
  validate(payload: JwtPayload): JwtPayload {
    return payload;
  }

  // The validate method is called after the token is verified. It receives the decoded payload.
  // In this case, we simply return the payload, which will be attached to the request object as req.user in the route handlers.
  // Passport automactically handles the token verification and will throw an UnauthorizedException if the token is invalid or expired, so we don't need to handle that logic here.
  // Passport automatically injects req.user after validate() function
}
