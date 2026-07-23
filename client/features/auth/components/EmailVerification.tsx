"use client";

import { MailCheck } from "lucide-react";
import { VERIFY_EMAIL_CONTENT } from "../constatnts/auth.constants";
import { useRouter, useSearchParams } from "next/navigation";
import { ROUTES } from "@/constants";
import { useEffect } from "react";
import { appToast } from "@/lib/toast";
import { getErrorMessage } from "@/lib/error-message";
import { useVerifyEmail } from "../hooks/useVerifyEmail";

export function EmailVerification() {
  const router = useRouter();
  const verifyEmailMutation = useVerifyEmail();
  const searchParams = useSearchParams();

  useEffect(() => {
    const token = searchParams.get("token");

    if (!token) {
      appToast.error("Invalid or expired link. Try again");
      return;
    }

    verifyEmailMutation.mutate(
      { token },
      {
        onSuccess: (data) => {
          appToast.success(data.message);
          localStorage.removeItem("verify-email");
          setTimeout(() => {
            router.replace(ROUTES.LOGIN);
          }, 1000);
        },

        onError: (err) => {
          appToast.error(getErrorMessage(err));
        },
      },
    );
  }, [searchParams, verifyEmailMutation, router]);

  return (
    <div className="flex min-h-screen justify-center items-center flex-col">
      <div className="w-full max-w-sm sm:max-w-lg lg:max-w-xl">
        <div className="text-center mb-6 flex flex-col justify-center items-center">
          <div className="mb-6 bg-black/10 w-15 rounded-md h-15 flex justify-center items-center">
            <MailCheck aria-hidden="true" className="size-10" />
          </div>

          <h1 className="text-base font-bold mb-2 sm:text-xl lg:text-2xl">
            {VERIFY_EMAIL_CONTENT.title}
          </h1>
          <p className="text-sm text-muted-foreground sm:text-base">
            {VERIFY_EMAIL_CONTENT.description}
          </p>
        </div>
      </div>
    </div>
  );
}
