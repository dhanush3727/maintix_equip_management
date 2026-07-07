# Tanstack Query
Tanstack Query is a library that helps you fetch, cache, synchronize, and update server data efficiently in your frontend application. It handle server state that is manages all data that comes from your backend.

## Intall and config tanstack query
1. Install the packages
```bash
npm install @tanstack/react-query @tanstack/react-query-devtools
```
2. Create the Query Client
Query client manage cached data, api requests, query states etc. We centralize this Query client and wrap it in our application.
```ts
// lib/query-client.ts
import { QueryClient } from "@tanstack/react-query";

export const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: 60 * 1000,

      gcTime: 10 * 60 * 1000,

      retry: 1,

      refetchOnWindowFocus: false,

      refetchOnReconnect: true,

      refetchOnMount: true,
    },
  },
});
```
In this code,
- Import the query client from the library.
- create a `queryClient` with defaultOptions.
- `staleTime` controls how long data is considered fresh.
- `gcTime` controls how long inactive cache stays in memory.
- `retry` retries only once if failed.
- `refetchOnWindowFocus` checks stale queries when returning to the broser tab. It prevents refetch when user switch tab frequently.
- `refetchOnReconnect` checks stale queries after the internet reconnectss.
- `refetchOnMount` checks stale queries when a component mounts again.
- It is global defaults it can be overridden for individual queries.

3. Create a provider and wrap it in the App
```tsx
// providers/QueryProvider.tsx
"use client";

import { QueryClientProvider } from "@tanstack/react-query";
import { ReactQueryDevtools } from "@tanstack/react-query-devtools";

import { queryClient } from "@/lib/query-client";

type QueryProviderProps = {
  children: React.ReactNode;
};

export default function QueryProvider({
  children,
}: QueryProviderProps) {
  return (
    <QueryClientProvider client={queryClient}>
      {children}

      <ReactQueryDevtools initialIsOpen={false} />
    </QueryClientProvider>
  );
}

// app/layout.tsx
import QueryProvider from "@/providers/QueryProvider";

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body>
        <QueryProvider>{children}</QueryProvider>
      </body>
    </html>
  );
}
```
- `QueryClientProvider` makes the `QueryClient` available to every component.
- Wrap the `QueryProvider` in app layout.

## Use tanstack query
`useQuery` is a React hook used to fetch, cache, synchronize, and manage server data. Whenever you want to read data from server then use `useQuery`. Ex: Get current user, Get equipment list, etc.
```ts
// hooks/queries/useMeta.ts
const result = useQuery({
    queryKey: ["meta"],
    queryFn: metaService.getMeta,
  });
```
- `queryKey` is the unique identifier for a piece of cached data.
- `queryFn` the function that fetches the data.