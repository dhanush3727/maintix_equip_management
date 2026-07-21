"use client";

import { Button } from "@/components/ui";
import { CHECK_EMAIL_CONTENT } from "../constatnts/auth.constants";
import { CircleCheckBig, LoaderCircle, LogIn, Send } from "lucide-react";
import { ROUTES } from "@/constants";
import { useForgotPassword } from "../hooks/useForgotPassword";
import { useState } from "react";
import { toast } from "sonner";
import { useRouter } from "next/navigation";

export function CheckEmail() {
  const router = useRouter();
  const forgotPasswordMutation = useForgotPassword();
  const [error, setError] = useState<string>("");

  const onSubmit = () => {
    setError("");

    const email: string | null = sessionStorage.getItem("resend-link");

    if (!email) {
      setError(
        "Your reset request has expired. Please enter your email address again to receive a new password reset link.,",
      );
      return;
    }

    forgotPasswordMutation.mutate(
      { email },
      {
        onSuccess: (data) => {
          toast.success(data.message);
        },

        onError: () => {
          setError("Something went wrong. Please try again.");
        },
      },
    );
  };

  return (
    <div className="flex min-h-screen justify-center items-center flex-col">
      <div className="w-full max-w-sm sm:max-w-lg lg:max-w-xl">
        <div className="text-center mb-6">
          <h1 className="text-base font-bold flex justify-center items-center gap-1 mb-2 sm:text-xl lg:text-2xl">
            <CircleCheckBig aria-hidden="true" className="size-5" />
            {CHECK_EMAIL_CONTENT.head}
          </h1>
          <p className="text-sm text-muted-foreground sm:text-base">
            {CHECK_EMAIL_CONTENT.subHead}
          </p>
        </div>

        {error && (
          <div
            role="alert" // Announces login/register errors to screen readers immediately.
            className="border border-danger text-danger text-center text-sm mb-6 p-3"
          >
            {error}
          </div>
        )}

        <div className="flex justify-center items-center gap-3">
          <Button
            size={"sm"}
            onClick={onSubmit}
            disabled={forgotPasswordMutation.isPending}
          >
            {forgotPasswordMutation.isPending ? (
              <LoaderCircle
                aria-hidden="true"
                className="size-4 animate-spin"
              />
            ) : (
              <Send aria-hidden="true" className="size-4" />
            )}
            {CHECK_EMAIL_CONTENT.buttons.resend}
          </Button>

          <Button
            variant={"ghost"}
            size={"sm"}
            disabled={forgotPasswordMutation.isPending}
            // Replaces the current page instead of adding a new history entry.
            onClick={() => router.replace(ROUTES.LOGIN)}
          >
            <LogIn aria-hidden="true" className="size-4" />
            {CHECK_EMAIL_CONTENT.buttons.back}
          </Button>
        </div>
      </div>
    </div>
  );
}
