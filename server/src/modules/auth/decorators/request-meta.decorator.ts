// This is a custom parameter decorator for NestJS that allows us to easily extract request metadata (like IP address and user-agent) in our controller methods.
import { createParamDecorator, ExecutionContext } from '@nestjs/common';
import type { Request } from 'express';
import { ReqMetaType } from '../types/auth.types';

// The `ReqMeta` decorator can be used in any controller method to access the request metadata without having to manually extract it from the request object each time.
export const ReqMeta = createParamDecorator(
  // The first parameter is the data passed to the decorator, which we don't use in this case, so we can ignore it with an underscore.
  // The second parameter is the execution context, which gives us access to the request object.
  (_data: unknown, context: ExecutionContext): ReqMetaType => {
    const request = context
      .switchToHttp()
      .getRequest<Request & { meta?: ReqMetaType }>();

    return request.meta!;
  },
);
