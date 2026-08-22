export const metadata = {
  title: "Forgot Password | Maintix",
  description: "Check the email",
};

import { CheckEmail } from "@/features/auth";
import { Suspense } from "react";

export default function CheckEmailPage() {
  return (
    <Suspense fallback={null}>
      {/* We use the useSearchParams() it take some time to load so we use suspense */}
      <CheckEmail />
    </Suspense>
  );
}
