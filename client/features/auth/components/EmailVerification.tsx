"use client";

import {
  CircleCheckBig,
  CircleX,
  LoaderCircle,
  LogIn,
  MailCheck,
  Send,
} from "lucide-react";
import { VERIFY_EMAIL_CONTENT } from "../constatnts/auth.constants";
import { useRouter, useSearchParams } from "next/navigation";
import { useEffect, useRef, useState } from "react";
import { ROUTES } from "@/constants";
import { useVerifyEmail } from "../hooks/useVerifyEmail";
import { appToast } from "@/lib/toast";
import { Button } from "@/components/ui";
import { useSendEmail } from "../hooks/useSendEmail";
import { getErrorMessage } from "@/lib/error-message";

export function EmailVerification() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const token = searchParams.get("token");
  const email = searchParams.get("email");
  const verifyEmail = useVerifyEmail();
  const sendEmail = useSendEmail();
  const [success, setSucess] = useState<boolean>(false);
  const [fail, setFail] = useState<boolean>(false);

  // useRef stores a value that survives re-renders
  // without causing the component to re-render.
  const hasVerified = useRef(false);

  useEffect(() => {
    if (!token || !email) {
      router.replace(ROUTES.LOGIN);
    }
  }, [token, router, email]);

  useEffect(() => {
    //  We've already started the verification request.
    if (hasVerified.current) return;

    if (!token) {
      appToast.error("Your link is expired try again");
      return;
    }

    // Mark verification as started before making the API call.
    // This prevents duplicate requests (especially in React Strict Mode during development).
    hasVerified.current = true;

    verifyEmail.mutate(
      { token },
      {
        onSuccess: (data) => {
          appToast.success(data.message);
          setSucess(true);
          setTimeout(() => {
            router.replace(ROUTES.LOGIN);
          }, 1000);
        },

        onError: (err) => {
          appToast.error(getErrorMessage(err));
          setFail(true);
        },
      },
    );
  }, [token, hasVerified, verifyEmail, router]);

  const onSubmit = () => {
    if (!email) {
      appToast.error("Invalid request. Try again");
      return;
    }

    sendEmail.mutate(
      { email },
      {
        onSuccess: (data) => {
          appToast.success(data.message);
        },

        onError: (err) => {
          appToast.error(getErrorMessage(err));
        },
      },
    );
  };

  return (
    <div className="flex min-h-screen justify-center items-center flex-col">
      <div className="w-full max-w-sm sm:max-w-lg lg:max-w-xl">
        <div className="text-center mb-6 flex flex-col justify-center items-center">
          {success ? (
            <div className="mb-6 bg-success-light w-15 rounded-md h-15 flex justify-center items-center">
              <CircleCheckBig
                aria-hidden="true"
                className="size-10 text-success"
              />
            </div>
          ) : fail ? (
            <div className="mb-6 bg-danger-light w-15 rounded-md h-15 flex justify-center items-center">
              <CircleX aria-hidden="true" className="size-10 text-danger" />
            </div>
          ) : (
            <div className="mb-6 bg-black/10 w-15 rounded-md h-15 flex justify-center items-center">
              <MailCheck aria-hidden="true" className="size-10" />
            </div>
          )}

          <h1 className="text-base font-bold mb-2 sm:text-xl lg:text-2xl">
            {success
              ? VERIFY_EMAIL_CONTENT.success_title
              : fail
                ? VERIFY_EMAIL_CONTENT.fail_title
                : VERIFY_EMAIL_CONTENT.title}
          </h1>
          <p className="text-sm text-muted-foreground sm:text-base">
            {success
              ? VERIFY_EMAIL_CONTENT.success_description
              : fail
                ? VERIFY_EMAIL_CONTENT.fail_description
                : VERIFY_EMAIL_CONTENT.description}
          </p>

          {fail && (
            <div className="flex justify-center items-center gap-3 mt-6">
              <Button
                size={"sm"}
                onClick={onSubmit}
                disabled={sendEmail.isPending}
              >
                {sendEmail.isPending ? (
                  <LoaderCircle
                    aria-hidden="true"
                    className="size-4 animate-spin"
                  />
                ) : (
                  <Send aria-hidden="true" className="size-4" />
                )}
                {VERIFY_EMAIL_CONTENT.fail_resend}
              </Button>

              <Button
                variant={"ghost"}
                size={"sm"}
                disabled={sendEmail.isPending}
                // Replace the current page so users don't return to the temporary
                // "Check Email" screen when using the browser Back button.
                onClick={() => router.replace(ROUTES.LOGIN)}
              >
                <LogIn aria-hidden="true" className="size-4" />
                {VERIFY_EMAIL_CONTENT.fail_back}
              </Button>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
