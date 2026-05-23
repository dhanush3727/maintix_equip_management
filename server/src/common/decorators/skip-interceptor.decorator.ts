import { SetMetadata } from '@nestjs/common';

// This decorator is used to mark certain routes or controllers to skip the last activity update in the UpdateLastActiveInterceptor
export const SKIP_ACTIVITY = 'skipActivity';

// This is a custom decorator that sets metadata to indicate that the UpdateLastActiveInterceptor should skip updating the last activity for the decorated route or controller
export const SkipActivity = () => SetMetadata(SKIP_ACTIVITY, true);
