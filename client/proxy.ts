import { ROUTES } from "@/constants";
import { isAuthRoutes, isProtectedRoutes } from "@/lib/utils";
import { NextRequest, NextResponse } from "next/server";

export function proxy(req: NextRequest) {
  // Get the refresh token from cookies
  const token = req.cookies.get("refreshToken")?.value;

  // Get the pathname and search parameters from the request URL
  // The nextUrl property of the NextRequest object provides a URL object that represents the requested URL, allowing you to easily access its components like pathname and search parameters.
  const { pathname, search } = req.nextUrl;

  // If the user is trying to access the login or register page and they already have a refresh token, redirect them to the dashboard.
  if (isAuthRoutes(pathname) && token) {
    return NextResponse.redirect(new URL(ROUTES.DASHBOARD, req.url));
  }

  // If the user is trying to access a protected route and they don't have a refresh token, redirect them to the login page with a redirect query parameter.
  if (isProtectedRoutes(pathname) && !token) {
    const redirectUrl = new URL(ROUTES.LOGIN, req.url);
    redirectUrl.searchParams.set("redirect", `${pathname}${search}`);
    return NextResponse.redirect(redirectUrl);
  }

  // If none of the above conditions are met, allow the request to proceed as normal.
  return NextResponse.next();
}

// This configuration ensures that the middleware runs for all routes in the application. You can customize the matcher array to specify which routes should trigger the middleware if needed.
// export const config = {
//   matcher: ["/login"],
// };
