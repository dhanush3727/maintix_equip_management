export const metadata = {
  title: "Email Verification | Maintix",
};

import { EmailVerification } from "@/features/auth";
import { Suspense } from "react";

export default function EmailVerificationPage() {
  return (
    <Suspense fallback={null}>
      <EmailVerification />
    </Suspense>
  );
}
