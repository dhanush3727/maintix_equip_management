import clsx, { ClassValue } from "clsx";
import { twMerge } from "tailwind-merge";

/**
 * Combines conditional class names using clsx
 * and resolves conflicting Tailwind classes using tailwind-merge.
 *
 * example
 * cn("p-4", isActive && "bg-blue-500", "p-6")
 * // Result: "bg-blue-500 p-6"
 */

export function cn(...inputs: ClassValue[]): string {
  return twMerge(clsx(inputs));
}
