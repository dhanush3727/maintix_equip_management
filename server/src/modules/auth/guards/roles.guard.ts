// This is a guard that checks if the user has the required roles to access a route
import {
  Injectable,
  CanActivate,
  ExecutionContext,
  ForbiddenException,
  UnauthorizedException,
} from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { ROLES_KEY } from '../decorators/roles.decorator';
import { Observable } from 'rxjs';
import { AuthenticateRequest, RequestUser } from '../types/auth.types';

@Injectable()
export class RolesGuard implements CanActivate {
  constructor(private readonly reflector: Reflector) {} // reflector is a tool to read metadata

  // This method runs before controller execution. It checks if the user has required roles
  canActivate(
    context: ExecutionContext,
  ): boolean | Promise<boolean> | Observable<boolean> {
    // Get required roles from decorator
    const requiredRoles = this.reflector.get<string[]>(
      ROLES_KEY,
      context.getHandler(), // Get the handler (method) being accessed and retrieve the roles metadata attached to it
    );

    // If no roles defined don't allow access
    if (!requiredRoles || requiredRoles.length === 0) return false;

    const request = context.switchToHttp().getRequest<AuthenticateRequest>(); // Get the request object and type it as AuthenticateRequest which includes user info

    const user: RequestUser = request.user; //Extract User from request

    if (!user) throw new UnauthorizedException('User not found in request');

    const hasRole = requiredRoles.some((role) => user.roles.includes(role));

    if (!hasRole) throw new ForbiddenException('Access denied');

    return true;
  }
}
