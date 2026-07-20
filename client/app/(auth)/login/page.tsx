export const metadata = {
  title: "Login | Maintix",
  description: "This is a login page",
};

import { LoginForm } from "@/features/auth";

interface LoginProps {
  searchParams?: Promise<{
    redirect?: string;
  }>;
}

export default async function LoginPage({ searchParams }: LoginProps) {
  const resolvedSearchParams = await searchParams;

  return <LoginForm redirect={resolvedSearchParams?.redirect ?? null} />;
}
