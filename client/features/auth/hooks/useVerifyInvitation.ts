import { QUERY_KEYS } from "@/constants";
import { useQuery } from "@tanstack/react-query";
import { authService } from "../services/auth.service";

/**
 * Verify an invitation token.
 *
 * This hook is used on the Accept Invitation page to validate the
 * invitation token before allowing the user to create an account.
 *
 * Why is the token included in the query key?
 * - Each invitation token should have its own cache entry.
 * - This prevents React Query from returning cached data for a different token.
 *
 * Why is `enabled` used?
 * - The query should only execute when a valid token exists.
 * - This prevents unnecessary API requests when the token is empty or undefined.
 *
 * Why using !! used?
 * The !! is a JavaScript way of converting any value into a boolean.
 * Only run this query if token is a non-empty string.
 */
export const useVerifyInvitation = (token: string) => {
  return useQuery({
    // Unique cache key for each invitation token.
    queryKey: [QUERY_KEYS.invitations.verify_invitation, token],

    // Calls the API to verify the invitation.
    queryFn: () => authService.verifyInvitation(token),

    // Only execute the query when a token is available.
    enabled: !!token,
  });
};
