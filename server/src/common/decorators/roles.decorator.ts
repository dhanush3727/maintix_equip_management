// It attaches required roles to a route as metadata
import { SetMetadata } from '@nestjs/common';

// key used to store roles metadata
export const ROLES_KEY = 'roles';

// Roles decorator factory function
export const Roles = (...roles: string[]) => SetMetadata(ROLES_KEY, roles);

/* SetMetadata is a function that takes a key and a value and returns a decorator function that can be used to set metadata on a route handler. 
In this case, we are using it to set the required roles for a route handler. 
The ROLES_KEY is the key that we will use to retrieve the roles metadata later in our guards.
*/
