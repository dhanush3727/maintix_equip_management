// Base UI provides the button behavior and it evventually renders a native <button> element
import { Button as ButtonPrimitive } from "@base-ui/react/button";

// cva() is used to create reusable tailwind class variants.
// VariantPops extracts the typescript types from cva automatically
import { cva, type VariantProps } from "class-variance-authority";

import { cn } from "@/lib/utils";

// buttonVariants is not a react component. It is simply a function that generates Tailwind class names.
const buttonVariants = cva(
  // Base style apply to every button regardless of variant or size
  "inline-flex items-center justify-center gap-2 rounded-md font-medium transition-colors transition-shadow active:scale-[0.98] duration-200 cursor-pointer select-none whitespace-nowrap focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50",
  {
    // Variants change the appearance of the button
    variants: {
      variant: {
        default:
          "bg-primary text-primary-foreground shadow-xs hover:bg-primary-hover hover:shadow-sm",
        outline:
          "border border-border bg-card text-foreground hover:bg-secondary",
        secondary:
          "bg-secondary text-secondary-foreground border border-border hover:bg-muted",
        ghost: "bg-transparent text-foreground hover:bg-secondary",
        destructive:
          "bg-destructive text-destructive-foreground hover:opacity-90",
        link: "text-primary underline-offset-4 hover:underline",
      },

      // Sizes controls the button heights, padding and icon spacing.
      size: {
        default: "h-10 px-4 text-sm",
        sm: "h-9 px-3 text-sm",
        lg: "h-11 px-6 text-base",
        icon: "size-10",
      },
    },

    // Default values, if no variant or size is passedm these values are used.
    defaultVariants: {
      variant: "default",
      size: "default",
    },
  },
);

function Button({
  className,
  variant = "default",
  size = "default",
  ...props
}: ButtonPrimitive.Props & VariantProps<typeof buttonVariants>) {
  return (
    <ButtonPrimitive
      data-slot="button" // Useful for styling and targeting this component
      className={cn(buttonVariants({ variant, size, className }))}
      {...props}
    />
  );
}

export { Button, buttonVariants };
// Export buttonVariants so other components can reuse the same styles.
