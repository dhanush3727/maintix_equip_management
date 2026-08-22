export const metadata = {
  title: "Reset Password | Maintix",
  description: "Reset the password",
};

import { ResetPassword } from "@/features/auth";
import { Suspense } from "react";

export default function ResetPasswordPage() {
  return (
    <Suspense fallback={null}>
      <ResetPassword />
    </Suspense>
  );
}
