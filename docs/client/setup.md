# Project Setup
## 1. Create the Next.js Project
Maintix frontend is built using Next.js, React, and TypeScript.

Create the project by running the following command:
```bash
npx create-next-app@latest client
```
During the setup, choose the recommended configuration or accept the default options. This command creates a new `client` directory containig the initial Next.js project structure and all required configuration files.

## 2. Install Tailwind CSS Utilities
Tailwind CSS is installed automatically when the project is created with the appropriate Next.js configuration. However, to simmplify conditional styling and resolve conflicting Tailwind classes, install the following packages:
```bash
npm install clsx tailwind-merge
```

## 3. Create the cn utility function
Create a utils.ts file (for example, src/lib/utils.ts) and add the following utility function:
```ts
import clsx, { ClassValue } from "clsx";
import { twMerge } from "tailwind-merge";

export function cn(...inputs: ClassValue[]): string {
  return twMerge(clsx(inputs));
}
```
This helper combines the functionality of clsx and tailwind-merge into a single utility, making it easier to write clean, maintainable, and conflict-free Tailwind CSS class names throughout the application.

### How clsx work
`clsx` is used to conditionally combine class names into a single string.
For example:
```ts
clsx( "p-4", isActive && "bg-orange-500", isDisabled && "opacity-50" );
```
- If `isActive` is `true` , the `bg-orange-500` class is included.
- If `isActive` is `false`, the class is ignored.
This eliminates the need to manually concatenate class strings.

### How tailwind-merge works
`tailwind-merge` removes conflicting Tailwind CSS utility classes by keeping only the final applicable class.
For example:
```ts
twMerge("bg-red-500 bg-blue-500");

// Output
"bg-blue-500"
```
Since both classes modify the background color, tailwind-merge preserves only the last one.

### Using the cn utility
Instead of calling `clsx` and `tailwind-merge` separately, use the `cn` helper throughout the project.
```tsx
<div
className={cn(
"rounded-lg p-4",
isActive && "bg-orange-500",
isDisabled && "cursor-not-allowed opacity-50",
)}
>
  Maintix
</div>
```
Result:
- Always applies the base classes `(rounded-lg p-4)`.
- Adds `bg-orange-500` only when `isActive` is `true`.
- Adds `cursor-not-allowed opacity-50` only when `isDisabled` is `true`.
- Automatically removes conflicting Tailwind utility classes when necessary.
Using the `cn` utility improves code readability, reduces duplicate class names, and ensures consistent Tailwind CSS class merging across the project.