<!--  Frontend -->

# Project Name: Maintix Equipment Management

1. Project setup for Maintix Equipment Management application. This project is built using Next.js and TypeScript.
   Install next.js

```bash
npx create-next-app@latest client
```
Select Yes, use recommended defaults option

2. Tailwind CSS
   Install the clsx and tailwind-merge for conditional class names and merging tailwind classes

```bash
npm install clsx tailwind-merge
```

And create tailwind conditional function in `utils.ts` file

```ts
import clsx, { ClassValue } from "clsx";
import { twMerge } from "tailwind-merge";

export function cn(...inputs: ClassValue[]): string {
  return twMerge(clsx(inputs));
}
```

It helps to conditionally apply class names and merge Tailwind CSS classes in a clean and efficient way.
the `clsx` is used to conditionally join class names together like `isActive && 'bg-orange-500'`, if `isActive` is true, then the class name `bg-orange-500` will be included in the final class string. If `isActive` is false, it will be ignored.
The `twMerge` is used to merge Tailwind CSS classes, ensuring that conflicting classes are resolved correctly. For example, if you have two classes like `bg-red-500` and `bg-blue-500`, the last one will take precedence.
ex:

```tsx
import { cn } from "@/lib/utils";

<div
  className={cn(
    "rounded-lg p-4",
    isActive && "bg-orange-500",
    isDisabled && "opacity-50 cursor-not-allowed",
  )}
>
  Maintix
</div>;
```
