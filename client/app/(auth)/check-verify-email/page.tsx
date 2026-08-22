export const metadata = {
  title: "Email Verification | Maintix",
};

import { CheckVerifyEmail } from "@/features/auth";
import { Suspense } from "react";

export default function CheckVerifyEmailPage() {
  return (
    <Suspense fallback={null}>
      <CheckVerifyEmail />
    </Suspense>
  );
}
