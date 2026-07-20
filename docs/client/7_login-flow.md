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
