import { MailCheck } from "lucide-react";
import { VERIFY_EMAIL_CONTENT } from "../constatnts/auth.constants";
import { Button } from "@/components/ui";

export function EmailVerification() {
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

        <div className="flex justify-center items-center gap-3">
          <Button size={"sm"}>{VERIFY_EMAIL_CONTENT.resend}</Button>
          <Button variant={"ghost"} size={"sm"}>
            {VERIFY_EMAIL_CONTENT.back}
          </Button>
        </div>
      </div>
    </div>
  );
}
