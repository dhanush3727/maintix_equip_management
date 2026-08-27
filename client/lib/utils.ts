import { AUTH_ROUTES, PROTECTED_ROUTES } from "@/constants";
import { DropdownOptions } from "@/types";
import { clsx, type ClassValue } from "clsx";
import { twMerge } from "tailwind-merge";
import { UAParser } from "ua-parser-js";

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

// Protect routes
export function isProtectedRoutes(pathName: string): boolean {
  return PROTECTED_ROUTES.some(
    (route) => pathName === route || pathName.startsWith(`${route}/`),
  );
}

// Auth routes check
export function isAuthRoutes(pathName: string): boolean {
  return AUTH_ROUTES.some(
    (route) => pathName === route || pathName.startsWith(`${route}/`),
  );
}

// Get the device information
export function getDeviceInfo(): string {
  const parser = new UAParser();

  const result = parser.getResult();

  return `${result.browser.name} on ${result.os}`;
}

// Dropdowns store the selected option ID.
// The equipment API expects location, department, and type names,
// so convert the selected IDs to their corresponding labels.
export const getOptionLabel = (
  options: DropdownOptions[],
  value: number | undefined,
): string => {
  const label =
    options.find((option) => String(option.value) === String(value))?.label ||
    "";

  return label;
};

export function formatDate(dateStr: string): string {
  const date = dateStr.split("T")[0].split("-");

  const [year, month, day] = date;

  return `${day}/${month}/${year}`;
}
