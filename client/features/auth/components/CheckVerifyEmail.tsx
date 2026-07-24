"use client";

import { CircleCheckBig, LoaderCircle, Send } from "lucide-react";
import { ErrorMessage } from "@/components/common/ErrorMessage";
import { Button } from "@/components/ui";
import { useEffect, useState } from "react";
import { useSendEmail } from "../hooks/useSendEmail";
import { useRouter, useSearchParams } from "next/navigation";
import { appToast } from "@/lib/toast";
import { getErrorMessage } from "@/lib/error-message";
import { ROUTES } from "@/constants";
import { CHECK_VERIFY_EMAIL_CONTENT } from "../constatnts/auth.constants";

export function CheckVerifyEmail() {
  const router = useRouter();
  const sendEmailMutation = useSendEmail();
  const searchParams = useSearchParams();
  const email = searchParams.get("email");
  const [error, setError] = useState<string>("");

  useEffect(() => {
    if (!email) {
      router.replace(ROUTES.LOGIN);
    }
  }, [email, router]);

  const onSubmit = () => {
    setError("");

    if (!email) {
      setError("Invalid request. Please try again later");

      return;
    }

    sendEmailMutation.mutate(
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
          <div className="mb-6 bg-success-light w-15 rounded-md h-15 flex justify-center items-center">
            <CircleCheckBig aria-hidden="true" className="size-10 text-success" />
          </div>

          <h1 className="text-base font-bold mb-2 sm:text-xl lg:text-2xl">
            {CHECK_VERIFY_EMAIL_CONTENT.title}
          </h1>
          <p className="text-sm text-muted-foreground sm:text-base">
            {CHECK_VERIFY_EMAIL_CONTENT.description}
          </p>
        </div>

        {error && <ErrorMessage error={error} />}

        <div className="flex justify-center items-center gap-3">
          <Button
            size={"sm"}
            onClick={onSubmit}
            disabled={sendEmailMutation.isPending}
          >
            {sendEmailMutation.isPending ? (
              <LoaderCircle
                aria-hidden="true"
                className="size-4 animate-spin"
              />
            ) : (
              <Send aria-hidden="true" className="size-4" />
            )}
            {CHECK_VERIFY_EMAIL_CONTENT.resend}
          </Button>

          <Button
            variant={"ghost"}
            size={"sm"}
            onClick={() => router.replace(ROUTES.LOGIN)}
            disabled={sendEmailMutation.isPending}
          >
            {CHECK_VERIFY_EMAIL_CONTENT.back}
          </Button>
        </div>
      </div>
    </div>
  );
}
