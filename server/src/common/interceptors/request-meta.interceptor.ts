import {
  Injectable,
  NestInterceptor,
  ExecutionContext,
  CallHandler,
} from '@nestjs/common';
import type { Request } from 'express';
import { Observable } from 'rxjs';
import { ReqMetaType } from '../../modules/auth/types/auth.types';

@Injectable()
// The `RequestMetaInterceptor` is a NestJS interceptor that runs before the request reaches the controller.
// It extracts the client's IP address and user-agent from the request and attaches this metadata to the request object,
// making it easily accessible in any controller method that uses the `ReqMeta` decorator.
export class RequestMetaInterceptor implements NestInterceptor {
  // The `intercept` method is called for every incoming request. It takes the execution context and a call handler as parameters.
  intercept(
    context: ExecutionContext, // The execution context provides access to the request and response objects, among other things.
    next: CallHandler<any>, // The call handler allows us to pass control to the next interceptor or the controller method after we're done processing the request.
  ): Observable<any> | Promise<Observable<any>> {
    const request = context.switchToHttp().getRequest<Request>();

    // Extract IP
    const forwarded = request.headers['x-forwarded-for']; // This is used when your app is behind a proxy (like nginx) to get the original client's IP address
    // If x-forwarded-for is present, it may contain multiple IPs (client, proxy1, proxy2), so we take the first one. Otherwise, we use req.ip which gives us the remote address of the request.
    const ipAddress =
      typeof forwarded === 'string'
        ? forwarded.split(',')[0].trim()
        : (request.ip ?? '0.0.0.0');
    const userAgent = request.headers['user-agent'] ?? 'unknown'; // Fallback to 'unknown' if user-agent header is missing

    (request as Request & { meta: ReqMetaType }).meta = {
      ipAddress,
      userAgent,
    };

    return next.handle();
  }
}
