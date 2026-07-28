# create UserStore
Create a UserStore to manage user data in your application. The UserStore will handle user profile information, that after user login, can be accessed and updated throughout the application. To handle this state we use `zustand` state management library.

## Installation
To install `zustand`, run the following command in your project directory:
```bash
npm install zustand
```
This will add `zustand` to your project's dependencies, allowing you to create and manage state in a simple and efficient way.

## Create the UserStore
To create a UserStore, you can follow these steps:
1. Create a new directory called `stores` in your project root if it doesn't already exist.
2. Inside the `stores` directory, create a new file called `user.store.ts`.

```ts
import { User } from "@/types";
import { create } from "zustand";

interface UserStore {
  user: User | null;

  setUser: (user: User | null) => void;

  clearUser: () => void;
}

export const useUserStore = create<UserStore>((set) => ({
  user: null,

  setUser: (data) =>
    set({
      user: data,
    }),

  clearUser: () => set({ user: null }),
}));
```
In this code,
- We define a `UserStore` interface that describes the shape of our store, including the `user` state and methods to set and clear the user data.
- We use the `create` function from `zustand` to create the store, initializing the `user` state to `null` and providing methods to update it.
- The `set` function is used to update the state of the store.
- The `setUser` method allows us to set the user data, while the `clearUser` method resets the user state to `null`.
- The `useUserStore` hook can be used in your components to access and manipulate the user state.
- The `clearUser` method is useful for logging out the user or clearing their data from the store.

## Create AuthInitializer
`AuthInitializer` is responsible for synchronizing the authenticated user between **TanStack Query** (server state) and **Zustand** (client state).
It does not render any UI. Its only responsibility is to initialize the global authenticated user after login.

## Why do we need this?
The application uses two different state management systems:
### TanStack Query
- Fetches data from the backend.
- Caches server responses.
- Acts as the source of truth for server data.
```ts
const { data } = useCurrentUser();
```

### Zustand
- Stores client-side global state.
- Allows any component to access the current user instantly.
```ts
const user = useUserStore((state) => state.user);
```
These two libraries are completely independent.
Updating the TanStack Query cache **does not automatically update** the Zustand store.
Without `AuthInitializer`, the API may successfully return the authenticated user, but the Zustand store would still contain `null`.

## How it works
1. `WorkspaceLayout` mounts.
2. `AuthInitializer` executes.
3. `useCurrentUser()` fetches (or reads the cached) authenticated user.
4. Once the request succeeds, the user is copied into Zustand using `setUser()`.
5. Every component can now access the current user from the global store.

```
Backend
    │
    ▼
GET /users/me
    │
    ▼
TanStack Query Cache
    │
    ▼
AuthInitializer
    │
    ▼
setUser(user)
    │
    ▼
Zustand Store
    │
    ▼
Entire Application
```

## Responsibilities
Fetch the authenticated user through `useCurrentUser()`.
Synchronize the authenticated user into the Zustand store.
Initialize the global user state for the authenticated application.

## Benefits
- Single source for user initialization.
- Keeps TanStack Query and Zustand synchronized.
- Prevents every page from fetching or initializing the user separately.
- Allows any component to access the current user synchronously through Zustand.
- Centralizes authenticated user initialization in one place.

## Architecture
```
Backend
      │
      ▼
useCurrentUser()
      │
      ▼
TanStack Query Cache
      │
      ▼
AuthInitializer
      │
      ▼
Zustand Store
      │
      ▼
Components
```

## Summary
`AuthInitializer` acts as a bridge between **TanStack Query** and **Zustand**. It ensures that once the authenticated user has been fetched from the backend, the user is also available in the application's global client state, allowing all components to access it efficiently without performing additional API requests.