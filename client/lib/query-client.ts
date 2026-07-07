import { QueryClient } from "@tanstack/react-query";

export const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      // Data is considered fresh for 1 minute
      staleTime: 60 * 1000,

      // Keep inactive queries in memeory for 10 minutes
      gcTime: 10 * 60 * 1000,

      // Retry failed requests only once
      retry: 1,

      // Don't refetch when switching back to the browser tab. It prevents if user switch tab frequently
      refetchOnWindowFocus: false,

      // Refetch stale queries when internet reconnects
      refetchOnReconnect: true,

      // Refetch stale queries when the component mounts again
      refetchOnMount: true,
    },
  },
});
