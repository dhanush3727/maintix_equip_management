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
        <div className="text-center mb-6 flex flex-col justify-center items-center">
          <div className="mb-6 bg-success-light w-15 rounded-md h-15 flex justify-center items-center">
            <CircleCheckBig
              aria-hidden="true"
              className="size-10 text-success"
            />
          </div>
          <h1 className="text-base font-bold mb-2 sm:text-xl lg:text-2xl">
            {CHECK_EMAIL_CONTENT.HEAD}
          </h1>
          <p className="text-sm text-muted-foreground sm:text-base">
            {CHECK_EMAIL_CONTENT.SUB_HEAD}
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
            {CHECK_EMAIL_CONTENT.BUTTONS.RESEND}
          </Button>

          <Button
            variant={"ghost"}
            size={"sm"}
            disabled={forgotPasswordMutation.isPending}
            // Replace the current page so users don't return to the temporary
            // "Check Email" screen when using the browser Back button.
            onClick={() => router.replace(ROUTES.LOGIN)}
          >
            <LogIn aria-hidden="true" className="size-4" />
            {CHECK_EMAIL_CONTENT.BUTTONS.BACK}
          </Button>
        </div>
      </div>
    </div>
  );
}
