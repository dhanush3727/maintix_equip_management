// This is used to define the AccessTokenGuard for protecting routes that require JWT access token authentication.
import { Injectable } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';

@Injectable()
export class AccessTokenGuard extends AuthGuard('jwt-access') {}
