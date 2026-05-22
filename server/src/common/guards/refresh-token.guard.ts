// This is used to define the RefreshTokenGuard for protecting routes that require JWT refresh token authentication.
import { Injectable } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';

@Injectable()
export class RefreshTokenGuard extends AuthGuard('jwt-refresh') {}
