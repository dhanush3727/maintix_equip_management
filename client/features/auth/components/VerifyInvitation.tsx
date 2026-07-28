"use client";

import { useRouter, useSearchParams } from "next/navigation";
import { useVerifyInvitation } from "../hooks/useVerifyInvitation";
import { VERIFY_INVITATION_CONTENT } from "../constatnts/verify-invite.constants";
import {
  Button,
  Field,
  FieldContent,
  FieldLabel,
  Input,
  Skeleton,
} from "@/components/ui";
import { Building, Building2, Mail, ShieldCheck, User } from "lucide-react";
import { useEffect, useState } from "react";
import { appToast } from "@/lib";
import { ROUTES } from "@/constants";

export function VerifyInvitation() {
  const searchParam = useSearchParams();
  const token = searchParam.get("token") ?? "";

  const [error, setError] = useState(false);

  const { data, isLoading } = useVerifyInvitation(token);

  const organizationName = data?.data?.organizationName;
  const roleName = data?.data?.roleName;
  const departmentName = data?.data?.departmentName;
  const email = data?.data?.email;

  useEffect(() => {
    if (!token || token === "") {
      appToast.error("Invalid or expired link");
    }
  }, [token]);

  return (
    <div>
      <div>
        <h1>{VERIFY_INVITATION_CONTENT.TITLE}</h1>

        <p>{VERIFY_INVITATION_CONTENT.DESCRIPTION}</p>
      </div>

      <div>
        <h2>{VERIFY_INVITATION_CONTENT.INVITATION_DETAILS}</h2>

        <div>
          <Field>
            <FieldLabel>
              <Building2 />
              {VERIFY_INVITATION_CONTENT.ORGANIZATION_LABEL}
            </FieldLabel>

            <FieldContent>
              {isLoading ? (
                <Skeleton className="h-10" />
              ) : (
                <Input value={organizationName} disabled />
              )}
            </FieldContent>
          </Field>

          <Field>
            <FieldLabel>
              <ShieldCheck />
              {VERIFY_INVITATION_CONTENT.ROLE_LABEL}
            </FieldLabel>

            <FieldContent>
              {isLoading ? (
                <Skeleton className="h-10" />
              ) : (
                <Input value={roleName} disabled />
              )}
            </FieldContent>
          </Field>

          <Field>
            <FieldLabel>
              <Building />
              {VERIFY_INVITATION_CONTENT.DEPARTMENT_LABEL}
            </FieldLabel>

            <FieldContent>
              {isLoading ? (
                <Skeleton className="h-10" />
              ) : (
                <Input value={departmentName} disabled />
              )}
            </FieldContent>
          </Field>

          <Field>
            <FieldLabel>
              <Mail />
              {VERIFY_INVITATION_CONTENT.EMAIL_LABEL}
            </FieldLabel>

            <FieldContent>
              {isLoading ? (
                <Skeleton className="h-10" />
              ) : (
                <Input value={email} disabled />
              )}
            </FieldContent>
          </Field>
        </div>
      </div>

      <form>
        <h2>{VERIFY_INVITATION_CONTENT.ACCOUNT_TITLE}</h2>

        <p>{VERIFY_INVITATION_CONTENT.ACCOUNT_DESCRIPTION}</p>

        <Field>
          <FieldLabel htmlFor="name">
            <User />
            {VERIFY_INVITATION_CONTENT.NAME_LABEL}
          </FieldLabel>

          <FieldContent>
            <Input
              id="name"
              type="text"
              autoComplete="name"
              placeholder="Ex: Your name"
            />
          </FieldContent>
        </Field>

        <Field>
          <FieldLabel htmlFor="password">
            <User />
            {VERIFY_INVITATION_CONTENT.PASSWORD_LABEL}
          </FieldLabel>

          <FieldContent>
            <Input
              id="password"
              type="text"
              autoComplete="new-password"
              placeholder="Ex: Your password"
            />
          </FieldContent>
        </Field>

        <Button>{VERIFY_INVITATION_CONTENT.JOIN_BUTTON}</Button>
      </form>
    </div>
  );
}
