export const NAV_ITEMS = [
  {
    label: "Features",
    href: "#features",
  },
  {
    label: "How it works",
    href: "#how-it-work",
  },
] as const;

export const NAV_BUTTON = [
  {
    label: "Login",
    href: "/login",
  },
  {
    label: "Register",
    href: "/register",
  },
] as const; // Treat this value as completely immutable and infer the most specific types possible

/**
 * For using as const it becomes readonly property
 * So we can't change it valueS.
 */
