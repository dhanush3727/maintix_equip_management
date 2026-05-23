// This interceptor updates the last activity timestamp of the user's session in the database.
import {
  Injectable,
  NestInterceptor,
  ExecutionContext,
  CallHandler,
} from '@nestjs/common';
import type { Request } from 'express';
import { PrismaService } from '../../prisma/prisma.service';
import { Observable, tap } from 'rxjs';
import { Reflector } from '@nestjs/core';
import { SKIP_ACTIVITY } from '../decorators/skip-interceptor.decorator';

interface AuthenticateRequest extends Request {
  user?: {
    userId: number;
    email: string;
    organizationId: number;
    roles: string[];
    jti: string;
  };
}

@Injectable()
export class UpdateLastActiveInterceptor implements NestInterceptor {
  constructor(
    private prisma: PrismaService,
    private reflector: Reflector, // reflector is used to read metadata set by decorators, in this case to check if the SKIP_ACTIVITY metadata is set for the current route or controller
  ) {}

  intercept(
    context: ExecutionContext,
    next: CallHandler<any>,
  ): Observable<any> | Promise<Observable<any>> {
    // Check if the SKIP_ACTIVITY metadata is set for the current route or controller. If it is set, we skip updating the last activity timestamp and just proceed with the request handling.
    const skip = this.reflector.getAllAndOverride<boolean>(SKIP_ACTIVITY, [
      context.getHandler(),
      context.getClass(),
    ]);

    // If skip is true, it means the route or controller has the SkipActivity decorator, so we skip the last activity update and just return the next.handle() to continue processing the request without any side effects.
    if (skip) return next.handle();

    const request = context.switchToHttp().getRequest<AuthenticateRequest>(); // Assuming the user information is attached to the request object by an authentication guard

    // next.handle() returns an Observable, we can use the tap operator to perform a side effect (updating the last activity) without affecting the response flow
    // here pipe() is used to chain the tap operator to the Observable returned by next.handle()
    return next.handle().pipe(
      // tap() is allows us to perform a side effect (do something don't change the response)
      // here tap() is used to update the last activity timestamp in the database after the controller has processed the request but before the response is sent back to the client
      tap(() => {
        if (!request.user) return;

        const { userId, jti } = request.user;

        const now = new Date(); // Current timestamp to update the last activity time

        const threshold = new Date(now.getTime() - 60 * 1000); // Get the timestamp for 1 minute ago to avoid updating last activity too frequently

        // Update the lastActiveAt field
        void this.prisma.userSession
          .updateMany({
            where: {
              userId,
              jti,
              isActive: true,
              lastActiveAt: {
                lt: threshold, // Only update if the last activity was more than 1 minute ago to reduce database writes
              },
            },
            data: {
              lastActiveAt: now,
            },
          })
          .catch(() => {}); // Catch and ignore any errors to avoid affecting the response flow, as this is a non-critical update
      }),
    );
  }
}

// Flow:
// Request
//   ↓
// Authentication Guard (attaches user info to request)
//   ↓
// UpdateLastActiveInterceptor (updates last activity timestamp in the database)
//   ↓
// Controller (handles the request and returns a response)
//   ↓
// Response sent back to the client
