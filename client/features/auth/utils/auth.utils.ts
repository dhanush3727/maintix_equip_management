import { DEFAULT_REDIRECT_PATH } from "../constatnts/auth.constants";

export const getRedirectPath = (
  redirect: string | null | undefined,
): string => {
  if (!redirect || !redirect.startsWith("/") || redirect.startsWith("//"))
    return DEFAULT_REDIRECT_PATH;

  return redirect;
};
