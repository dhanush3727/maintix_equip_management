# Middleware for Client
## Introduction
For client we use the middleware to handle the authentication. If one user access the page without login, the middleware will redirect the user to the login page. If the user is already logged in, the middleware will allow the user to access the page. In the next.js we can easily implement the middleware by creating a file named `proxy.ts` in the root directory of the project. The `proxy.ts` file will contain the middleware logic. The middleware will check if the user is logged in or not. If the user is not logged in, the middleware will redirect the user to the login page. If the user is logged in, the middleware will allow the user to access the page.

## Implementation
1. Create a file named `proxy.ts` in the root directory of the project.
2. Add the following code to the `proxy.ts` file:
```ts
// proxy.ts
import { ROUTES } from "@/constants";
import { isProtectedRoutes } from "@/lib/utils";
import { NextRequest, NextResponse } from "next/server";

export function proxy(req: NextRequest) {
  const token = req.cookies.get("refreshToken")?.value;
  const { pathname, search } = req.nextUrl;

  if ((pathname === ROUTES.LOGIN || pathname === ROUTES.REGISTER) && token) {
    return NextResponse.redirect(new URL(ROUTES.DASHBOARD, req.url));
  }

  if (isProtectedRoutes(pathname) && !token) {
    const redirectUrl = new URL(ROUTES.LOGIN, req.url);
    redirectUrl.searchParams.set("redirect", `${pathname}${search}`);
    return NextResponse.redirect(redirectUrl);
  }

  return NextResponse.next();
}

// lib/utils.ts
export function isProtectedRoutes(pathName: string): boolean {
  return PROTECTED_ROUTES.some(
    (route) => pathName === route || pathName.startsWith(`${route}/`),
  );
}
```
In this code,
- We import the `ROUTES` and `isProtectedRoutes` function from the `constants` and `utils` files respectively.
- We import the `NextRequest` and `NextResponse` from the `next/server` module.
- We define the `proxy` function which takes the `NextRequest` object as a parameter.
- We define the `token` variable which gets the refresh token from the cookies.
- `req.nextUrl` provides a URL object that represents the requested URL, allowing you to easily access its components like pathname and search parameters.
- We check if the user is trying to access the login or register page and they already have a refresh token, we redirect them to the dashboard.
- `new URL(ROUTES.DASHBOARD, req.url)` creates a new URL object for the dashboard route based on the current request URL.
- We check if the user is trying to access a protected route and they don't have a refresh token, we redirect them to the login page with a redirect query parameter.
- `new URL(ROUTES.LOGIN, req.url)` creates a new URL object for the login route based on the current request URL.
- `redirectUrl.searchParams.set("redirect", `${pathname}${search}`)` sets the redirect query parameter to the current pathname and search parameters, so that after login, the user can be redirected back to the page they were trying to access.
- Finally, we return `NextResponse.next()` to allow the request to continue if none of the above conditions are met.