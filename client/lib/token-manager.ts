/**
 * This is a accesstoken manager
 *
 * Store the accessToken in in-memory storage
 * It exists only while the application is running
 */

let accessToken: string | null = null;

// Get the current access token
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
