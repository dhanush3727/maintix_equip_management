import { useAuth } from "./useAuth";

export function useSlug() {
  const { user } = useAuth();

  const slug = user?.slug;

  const getSlugUrl = (url: string): string => {
    if (!slug) return url;

    return `/${slug}${url}`;
  };

  return {
    slug,
    getSlugUrl,
  };
}
