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