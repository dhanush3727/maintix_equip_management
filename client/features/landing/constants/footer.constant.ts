const getYear = (): number => {
  const date = new Date();
  return date.getFullYear();
};

export const FOOTER_CONTENT = {
  title: "Set up your organization in minutes.",
  button: "Get started",
  login: "Login",
  contact: "Contact",
  terms: "Terms",
  privacy: "Privacy Policy",
  copyright: `${getYear()} Maintix`,
};
