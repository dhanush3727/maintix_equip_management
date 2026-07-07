# Axios instance setup
We create a axios instance to centralize the configuration and make it easier to manage API requests. This instance will handle the base URL, headers, and any other common settings for all requests.

## 1. Install Axios and create an instance
1. Install Axios
To install Axios, run the following command in your project directory:
```bash
npm install axios
```

2. Create an Axios instance
For our application, we creates two axios instances files inside the `/services/api` directory:
- `api.ts`: for main API requests that which require authentication that send the access token in the request headers, like `Authorization: Bearer <access_token>`. Ex: `/dashboard`, `/equipment`, etc.
- `authApi.ts`: for authentication requests that do not require an access token in the request headers. Ex: `/auth/login`, `/auth/register`, etc.

3. Interceptors
Interceptors are functions that Axios calls for every request or response. They allow us to modify requests or responses before they are handled by `then` or `catch`. In our case, we will use interceptors to automatically attach the access token to the request headers for authenticated requests, and to handle token refresh when the access token expires. Before we create the interceptors, we need to do some setup for managing the access token.

4. Declaration file for Axios
Declaration files are used to describe the shape of variables, functions, classes, interfaces, and modules in TypeScript. They provide type information to the TypeScript compiler, allowing it to perform type checking and provide better autocompletion and error checking during development. In our case, we will create a declaration file for Axios to extend its `InternalAxiosRequestConfig`, it does not exist `_retry` property, so we will add it to the interface. Create a file named `axios.d.ts` in the `/types` directory,
```ts
import "axios";

declare module "axios" {
  export interface InternalAxiosRequestConfig {
    _retry: boolean;
  }
}
```
In this code,
- We import the `axios` module to extend its types.
- `declare module` is module augmentation, which allows us to add new properties or methods to an exisiting module without modifying its original source code.
- We extend the `InternalAxiosRequestConfig` interface to include a new property `_retry` of type `boolean`.
- The `_retry` property is used to track whether a request has already been retried after a token refresh. This helps prevent infinite retry loops in case of repeated failures.

5. `token-manager.ts` file
We create a `token-manager.ts` file for managing the access token. This file will contain functions to get, set, and clear the access token.
```ts
// lib/token-manager.ts
let accessToken: string | null = null;

// Get the current accessToken
export function getToken(): string | null {
  return accessToken;
}

//  Stores or replaces the current access token.
export function setToken(token: string): void {
  accessToken = token;
}

// Clear the current accessToken
export function clearToken(): void {
  accessToken = null;
}
```

6. Create a refresh token function
We create a `refreshTokenRotation` function that will be used to refresh the access token when it expires. This function will make a request to the `/auth/refresh` endpoint and update the access token in the `token-manager.ts` file.
```ts
// services/auth.service.ts
import { setToken } from "@/lib/token-manager";
import authApi from "./api/authApi";

interface RefreshTokenResponse {
  message: string;
  data: {
    accessToken: string;
  };
}

export async function refreshTokenRotation(): Promise<string> {
  const res = await authApi.post<RefreshTokenResponse>("auth/refresh");

  const accessToken = res.data.data.accessToken;

  setToken(accessToken);

  return accessToken;
}
```

## 2. Request interceptor
Request interceptors are functions that are runs before every HTTP request is sent. 
In our case, we will use a request interceptor to automatically attach the access token to the request headers.
Eqiupment page -> /equipments -> request interceptor -> attach access token -> backend server.
```ts
api.interceptors.request.use(
  (config: InternalAxiosRequestConfig) => {
    const accessToken = getToken();

    if (accessToken) {
      config.headers.Authorization = `Bearer ${accessToken}`;
    }

    return config;
  },
  (error) => Promise.reject(error),
);
```
In this code,
- We use the `interceptors.request.user` method to add a request interceptor to the `api` instance.
- The interceptor function takes a `config` object as an argument, which represents the Axios request configuration.
- We retrieve the current access token using the `getToken` function from the `token-manager.ts` file.
- If an access token is available, we add it to the `Authorization` header of the request in the format `Bearer <access_token>`.
- Then we return the modified `config` object, which will be used to send the HTTP request.

## 3. Response interceptor
Response interceptors are functions that are runs after every HTTP response is received.
In our case, we will use a response interceptor to handle token refresh when the access token expires. If a request fails with a 401 Unauthorized error, we will attempt to refresh the access token and retry the original request.
Eqiupment page -> /equipments -> request interceptor -> attach access token -> backend server -> response interceptor -> Equipment page.

1. Handling multiple requests with 401 error
Before move to response interceptor, we need to create a `isRefreshing` and `refreshPromise` for handling multiple requests that fail with a 401 error at the same time. This will prevent multiple tokens refresh requests from being sent simultaneously, which could lead to race conditions and inconsistent state. 
```ts
let isRefreshing = false;
let refreshPromise: Promise<string> | null = null;
```

2. Implementing the response interceptor
```ts
api.interceptors.response.use(
  (response) => response,

  async (error: AxiosError) => {
    const originalRequest: InternalAxiosRequestConfig | undefined =
      error.config;

    if (!originalRequest) {
      return Promise.reject(error);
    }

    if (error.response?.status === 401 && !originalRequest._retry) {
      originalRequest._retry = true;

      try {
        if (!isRefreshing) {
          isRefreshing = true;

          refreshPromise = refreshTokenRotation().finally(() => {
            isRefreshing = false;
            refreshPromise = null;
          });
        }

        if (!refreshPromise) {
          return Promise.reject(error);
        }

        await refreshPromise;

        return api(originalRequest);
      } catch (refreshErr) {
        clearToken();

        if (typeof window !== "undefined") {
          window.location.href = "/login";
        }

        return Promise.reject(refreshErr);
      }
    }

    return Promise.reject(error);
  },
);
```
In this code,
- We use the `interceptors.response.use` method to add a response interceptor to the `api` instance.
- The interceptor function takes two arguments: a success handler and an error handler. The success handler simply returns the response, while the error handler handles any errors that occur during the request.
- We take the `error.config` object and assign it to the `originalRequest` variable. This object contains the configuration of the original request that failed.
- We check if the error response status is 401 and if the `_retry` property of the `originalRequest` is `false` or `undefined`. If both condigitions are met, we proceed to refresh the access token.
- We set the `_retry` property of the `originalRequest` to `true` to indicate that we are retrying the request after refreshing the token.
- We check if `isRefreshing` is `false`, which means that no token refresh request is currently in progress. If so, we set `isRefreshing` to `true` and call the `refreshTokenRotation` function to refresh the access token. We also set the `refreshPromise` variable to the promise returned by the `refreshTokenRotation` function, and use the `finally` method to reset `isRefreshing` and `refreshPromise` when the refresh request is complete.
- If `isRefreshing` is `true`, we wait for the existing `refreshPromise` to resolve before retrying the original request.
- After the access token is refreshed, we retry the original request by calling `api(originalRequest)`, which sends the request again with the new access token attached to the headers.
- If the token refresh fails, we clear the access token using the `clearToken` function and redirect the user to the login page.
- Finally, if the error is not a 401 or if the request has already been retried, we simply reject the error and propagate it to the caller.

3. Why using `Promise.reject`?
If we directly return the error without using `Promise.reject`, the error will be treated as a successful response, and the calling code will not be able to handle it properly. By using `Promise.reject`, we ensure that the error is propagated correctly and can be caught by the calling code's `catch` block.

4. Can we use `throw error` instead of `Promise.reject(error)`?
Yes, we can use `throw error` instead of `Promise.reject(error)` in the response interceptor. Both approaches will propagate the error to the calling code's `catch` block. However, using `Promise.reject(error)` is more explicit and aligns with the promise-based nature of Axios, making it clearer that we are returning a rejected promise.

5. Flow for multiple requests with 401 error
```text
User opens Dashboard
        │
        ▼
──────────────────────────────────────────────
GET /dashboard
GET /equipment
GET /notifications
──────────────────────────────────────────────
        │
        ▼
All requests are sent with the expired Access Token
        │
        ▼
──────────────────────────────────────────────
401 Unauthorized
401 Unauthorized
401 Unauthorized
──────────────────────────────────────────────
        │
        ▼
────────────── Without isRefreshing ──────────────

Request A → POST /auth/refresh (RT1) → 200

Request B → POST /auth/refresh (RT1) → 401
            (RT1 already invalidated)

Request C → POST /auth/refresh (RT1) → 401
            (RT1 already invalidated)

Result:
Only the first refresh succeeds.
The remaining refresh requests fail.
Because the 3 requests use the same refresh token, the first refresh request invalidates the refresh token, so the remaining refresh requests fail.

══════════════════════════════════════════════════

────────────── With isRefreshing ──────────────

Request A → 401
          ↓
          POST /auth/refresh (RT1)
          ↓
          Waiting for response...

Request B → 401
          ↓
          Wait (await refreshPromise)

Request C → 401
          ↓
          Wait (await refreshPromise)

          ↓
POST /auth/refresh → 200
(New Access Token + New Refresh Token)

          ↓
Retry GET /dashboard      → 200
Retry GET /equipment      → 200
Retry GET /notifications  → 200

Result:
✔ Only one refresh request is sent.
✔ All original requests wait.
✔ After refresh succeeds, all requests retry successfully.
```
