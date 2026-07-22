# LoginForm Component
This component is a React functional component that renders a login form using React Hook Form and Zod for validation. It allows users to input their email and password, and handles form submission with validation.

## Flow
```text
User
   │
   ▼
Fill Email & Password
   │
   ▼
React Hook Form
   │
   ▼
Zod Validation
   │
   ├── Invalid
   │      │
   │      ▼
   │ Show Validation Errors
   │
   └── Valid
          │
          ▼
useLogin Mutation
          │
          ▼
authService.login()
          │
          ▼
Backend
          │
          ▼
Success / Error
```

## Create a service for authentication
To handle the login process, we will create an `authService` that will manage the authentication logic. This service will include a `login` method that takes the user's email and password, sends a request to the backend, and returns the response. Example implementation of the `authService`:
```typescript
// authService.ts
import authApi from "@/services/api/authApi";
import {
  LoginData,
  LoginRequest,
} from "../types/auth.type";
import { AUTH_ENDPOINTS } from "../constatnts/auth.constants";
import { ApiResponse } from "@/types/api-response.types";

export const authService = {
  // Login
  async login(payload: LoginRequest): Promise<ApiResponse<LoginData>> {
    const { data } = await authApi.post<ApiResponse<LoginData>>(
      AUTH_ENDPOINTS.LOGIN,
      payload,
    );

    return data;
  },
};
```
In this example,
- The `authService` uses an `authApi` instance to send a POST request to the login endpoint defined in `AUTH_ENDPOINTS.LOGIN`.
- The `login` method takes a `LoginRequest` payload, which includes the user's email and password, and returns a promise that resolves to an `ApiResponse<LoginData>`.
- The `ApiResponse` type is a generic type that represents the structure of the response from the backend, which includes the login data.
- The `LoginData` type represents the data returned from the backend upon successful login, which may include user information and authentication tokens.
- The `LoginRequest` type represents the structure of the request payload sent to the backend for login, which includes the user's email and password.
- The `AUTH_ENDPOINTS` constant contains the endpoint URLs for authentication-related API calls, including the login endpoint.
- Returning the `data` from the response allows the calling function to access the login data directly without needing to handle the entire response object.

## Create a hook for the login mutation
To handle the login process in a React component, we will create a mutation using React Query. This mutation will call the `authService.login` method and handle the response.
We will create a custom hook called `useLogin` that encapsulates the mutation logic. Example implementation of the `useLogin` hook:
```ts
import { useMutation } from "@tanstack/react-query";
import { authService } from "../services/auth.service";

export const useLogin = () => {
  return useMutation({
    mutationFn: authService.login,
  });
};
```
In this example,
- The `useLogin` hook uses the `useMutation` hook from React Query to create a mutation for the login process.
- The `mutationFn` property is set to the `authService.login` method, which will be called when the mutation is triggered.
- The `useLogin` hook can be used in a React component to trigger the login mutation and handle the response, including success and error states.

## Create login schema for validation
To validate the login form inputs, we will create a Zod schema that defines the validation rules for the email and password fields. Example implementation of the login schema:
```ts
import { z } from "zod";

export const loginSchema = z.object({
  email: z.email("Please enter a valid email address").trim().toLowerCase(),
  password: z.string().min(8, "Password must contain 8 characters"),
  deviceInfo: z.string().trim(),
});

export type LoginFormValues = z.infer<typeof loginSchema>;
```
In this example,
- The `loginSchema` is defined using Zod's `z.object` method, which creates a schema for an object with specific properties.
- The `email` field is validated to ensure it is a valid email address, and it is trimmed and converted to lowercase.
- The `password` field is validated to ensure it is a string with a minimum length of 8 characters.
- The `deviceInfo` field is validated to ensure it is a string and is trimmed.
- The `LoginFormValues` type is inferred from the `loginSchema`, which allows us to use this type for the form values in our React component, ensuring type safety and consistency with the validation rules defined in the schema. So the `LoginFormValues` type will have the same structure as the `loginSchema`, with properties for `email`, `password`, and `deviceInfo`.
```ts
type LoginFormValues = {
  email: string;
  password: string;
  deviceInfo: string;
};
```
Instead of manually defining the `LoginFormValues` type, we can use Zod's `z.infer` utility to automatically infer the type from the `loginSchema`. This ensures that the type is always in sync with the validation rules defined in the schema, reducing the risk of inconsistencies and making it easier to maintain the code.

## Create the form for the login component
To create the login form component, we will use React Hook Form to manage the form state and handle validation using the Zod schema we defined earlier. The form will include input fields for email, password, and device information, along with a submit button. Example implementation of the `LoginForm` component:
```tsx
  const form = useForm<LoginFormValues>({
    // zodResolver integrates Zod schema validation with React Hook Form.
    resolver: zodResolver(loginSchema),
    defaultValues: {
      email: "",
      password: "",
      deviceInfo: getDeviceInfo(),
    },
  });
```
In this example,
- We use the `useForm` hook from React Hook Form to create a form instance, specifying the `LoginFormValues` type for type safety.
- The `resolver` option is set to `zodResolver(loginSchema)`, which integrates the Zod schema validation with React Hook Form. This allows us to validate the form inputs against the rules defined in the `loginSchema`.
- The `defaultValues` option is used to set the initial values for the form fields.
- The `email` and `password` fields are initialized as empty strings, while the `deviceInfo` field is set to the value returned by the `getDeviceInfo()` function, which retrieves information about the user's device. This ensures that the form has the necessary default values when it is rendered.
- The `form` instance returned by `useForm` provides various methods and properties that can be used to manage the form state, handle input changes, and perform validation.

