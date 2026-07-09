# shadcn/ui
## Overview
`shadcn/ui` is a collection of reusable React component source code built with modern web technologies such as Tailwind CSS, Base UI/Radix UI, and Class Variance Authority (CVA).
Unlike traditional UI libraries, shadcn/ui does not provide precompiled components from `node_modules`. Instead, it copies the component source code directly into your project, allowing you to fully own and customize every component.

## Why shadcn/ui?
Traditional UI libraries (like Material UI, etc.) require importing components from external packages. Ex: `import Button from "@mui/material/Button"`;. The component implementation lives inside `node_modules`. 
But in the shadcn/ui we use `import { Button } from "@/components/ui/button";`. The component exists inside your project.
```
components/
└── ui/
    └── button.tsx
```
This means:
- Full ownership of the source code
- Easy customization
- No dependency on a large UI component library
- Easy debugging
- Easy extension
- Better long-time maintainability

## Technologies behind shadcn/ui
`shadcn/ui` combines several technologies together.
```
shadcn/ui
     │
     ▼
Tailwind CSS
     │
     ▼
Base UI / Radix UI
     │
     ▼
Class Variance Authority (CVA)
     │
     ▼
clsx
     │
     ▼
tailwind-merge
```
Each technology has a different responsibility:
1. Tailwind CSS:
It is responsible for styling.
```tsx
<Button className="bg-orange-500 text-white" />
```
Tailwind provides all utility classes used inside components.

2. Base UI (we use this UI for our project):
Base UI provides accessbility, keyboard navigation, focus management, ARIA support, component behavior.
```tsx
import { Button } from "@base-ui/react/button";
```
The `Button` is come from Base UI button. Base UI handles the behavior while Tailwind handles the appearance.

3. Class Variance Authority (CVA):
cva generates Tailwind class combinations. Instead of writing:
```tsx
if (variant === "outline") {
    ...
}
```
We write:
```tsx
buttonVariants({
    variant: "outline",
});
```
CVA returns the appropriate Tailwind classes automatically. Its main purpose is managing component variants without using large `if`, `else`, or `switch` statements.

4. clsx:
`clsx` conditionally joins class names.
Ex:
```tsx
clsx(
    active && "bg-blue-500",
    disabled && "opacity-50"
);
```

5. tailwind-merge:
Removes conflicting Tailwind classes.
Ex:
```tsx
twMerge(
    "bg-red-500",
    "bg-blue-500"
);
```
Result:
```
bg-blue-500
```
The conflicting class is removed automatically.

6. cn()
`shadcn` provides a utility function named `cn()`.
```tsx
cn(...inputs)
```

Internally:

```tsx
twMerge(clsx(inputs))
```
It's responsibility is:
- Merge conditional classes
- Remove conflicting Tailwind classes
- Produce the final class string

## Initialization and Project structure
Initialize `shadcn/ui`
```bash
npx shadcn@latest init
```
After initialization it creates 
```
components/
    ui/
        button.tsx

lib/
    utils.ts

components.json
```
- `components/ui` contains reusable UI components. Ex: `button.tsx`, `input.tsx`. Every component belongs to the application.
- `lib/utils.ts` contains the `cn()` helper.
- `components.json` configuration file used by the shadcn CLI. This file is not used by the application at runtime.

## Button component
The generated `Button` component consists of four major parts.
```
Button Component
        │
        ▼
Button Props
        │
        ▼
buttonVariants()
        │
        ▼
cn()
        │
        ▼
ButtonPrimitive
        │
        ▼
Native HTML Button
```
1. `ButtonPrimitive`:
It provides, accessibility, keyboard support, disabled behavior, focus management, native button functionality. Eventually it renders a standard HTML `<button>` element.

2. `buttonVariants()`:
```tsx
const buttonVariants = cva(...)
```
`buttonVariants` is **not** a React component.
It is a function that generates Tailwind CSS classes.
Example:
```tsx
buttonVariants({
    variant: "outline",
    size: "lg",
});
```
Returns:
```
inline-flex
border
bg-background
h-9
px-2.5
...
```

3. Base classes
The first parameter of `cva()` contains the base classes.
```tsx
cva(
    "...base classes...",
    {
        ...
    }
)
```
These classes apply to every button.

4. `data-slot`:
The component contains:
```tsx
data-slot="button"
```
Which renders:
```html
<button data-slot="button">
```
`data-slot` provides semantic identification for the component.
Benefits include:
- Easier styling
- Easier component composition
- Easier testing
- More maintainable CSS selectors
Example:
```css
[data-slot="button"] {
    ...
}
```
