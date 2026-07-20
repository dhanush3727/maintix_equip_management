# React Hook Form and Zod
## React Hook Form
React Hook Form is a library that helps you manage form state and validation in React applications. It provides a simple API to handle form inputs, validation, and submission. To install the react hook form library, run the following command:
```bash
npm install react-hook-form
```
To use React Hook Form, you can create a form component and use the `useForm` hook to manage the form state. Here's an example of a simple login form using React Hook Form:
```tsx
import React from "react";
import { useForm } from "react-hook-form";

export interface LoginFormValues {
  email: string;
  password: string;
}

export function Login() {
    const form = useForm<LoginFormValues>({
        defaultValues: {
            email: "",
            password: "",
        },
    });

    const onSubmit = (values: LoginFormValues) => {
        console.log(values);
    };

    return (
        <form onSubmit={form.handleSubmit(onSubmit)}>
            <div>
                <label htmlFor="email">Email</label>
                <input
                    id="email"
                    type="email"
                    {...form.register("email", { required: "Email is required" })}
                />
                {form.formState.errors.email && (
                    <span>{form.formState.errors.email.message}</span>
                )}
            </div>
            <div>
                <label htmlFor="password">Password</label>
                <input
                    id="password"
                    type="password"
                    {...form.register("password", { required: "Password is required" })}
                />
                {form.formState.errors.password && (
                    <span>{form.formState.errors.password.message}</span>
                )}
            </div>
            <button type="submit">Login</button>
        </form>
    );
}
```
In this example,
- We define a `LoginFormValues` interface to specify the shape of the form data.
- We use the `useForm` hook to create a form instance and specify default values for the form fields.
- The `form` object contains methods and properties to manage the form state, such as `register`, `handleSubmit`, and `formState`.
- We define an `onSubmit` function that will be called when the form is submitted. This function receives the form values as an argument.
- `form.register` is used to register the input fields with React Hook Form, and we can specify validation rules for each field.
- We display error messages for each field if the validation fails.
- Finally, we render the form with input fields for email and password, along with a submit button.

## Zod
Zod is a TypeScript-first schema declaration and validation library. It allows you to define schemas for your data and validate them at runtime. To install Zod, run the following command:
```bash
npm install zod
```
To use Zod for form validation, you can define a schema for your form data and integrate it with React Hook Form using the `zodResolver`. Here's an example of how to use Zod with the login form:
```tsx
import { z } from "zod";

export const loginSchema = z.object({
    email: z.string().email("Invalid email address"),
    password: z.string().min(6, "Password must be at least 6 characters long"),
});
```
In this example,
- We define a `loginSchema` using Zod's `z.object` method, which specifies the shape of the form data.
- We use Zod's built-in validation methods, such as `z.string()`, `z.email()`, and `z.min()`, to define validation rules for each field.

Use the `zodResolver` from `@hookform/resolvers/zod` to integrate Zod validation with React Hook Form. Here's how to update the login form component to use Zod for validation:
```tsx
import { zodResolver } from "@hookform/resolvers/zod";
const form = useForm<LoginFormValues>({
    resolver: zodResolver(loginSchema),
});
```
In this updated example,
- We import the `zodResolver` from `@hookform/resolvers/zod`.
- We pass the `zodResolver` with the `loginSchema` to the `useForm` hook, which enables Zod validation for the form.
