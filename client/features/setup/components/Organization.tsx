"use client";

import {
  Button,
  Field,
  FieldContent,
  FieldLabel,
  Input,
  SearchSelect,
} from "@/components/ui";
import { ORGANIZATION_CONTENT } from "../constants/organization.constant";
import { useState } from "react";
import { UploadCloud } from "lucide-react";

export function Organization() {
  const options = [
    { label: "Google", value: "GOOGLE" },
    { label: "Meta", value: "META" },
    { label: "Apple", value: "APPLE" },
  ];

  const [value, setValue] = useState("");

  return (
    <div className="flex justify-center items-center">
      <form className="w-full max-w-md mx-2 bg-background px-6 py-10 space-y-6 sm:max-w-2xl md:max-w-3xl">
        <div className="space-y-1">
          <h1 className="text-xl font-semibold md:text-2xl">
            {ORGANIZATION_CONTENT.title}
          </h1>

          <p className="text-muted-foreground text-xs md:text-sm">
            {ORGANIZATION_CONTENT.description}
          </p>
        </div>

        <Field>
          <FieldLabel>{ORGANIZATION_CONTENT.organization_name}</FieldLabel>
          <FieldContent>
            <Input
              id="name"
              value={"DC Equipment"}
              disabled
              className="disabled:opacity-100"
            />
          </FieldContent>
        </Field>

        <Field>
          <FieldLabel htmlFor="logo">
            {ORGANIZATION_CONTENT.organization_logo}
          </FieldLabel>

          <FieldContent>
            <label
              htmlFor="logo"
              className="flex flex-col items-center justify-center gap-3 cursor-pointer rounded-xl border-2 border-dashed border-border px-6 py-10 text-center"
            >
              <UploadCloud className="size-10 text-muted-foreground" />

              <div>
                <p className="font-medium">{ORGANIZATION_CONTENT.logo_title}</p>
                <p className="text-sm text-muted-foreground">
                  {ORGANIZATION_CONTENT.logo_description}
                </p>
              </div>
            </label>

            <Input id="logo" type="file" accept="image/*" className="hidden" />
          </FieldContent>
        </Field>

        <div className="grid gap-5 sm:grid-cols-2">
          <Field>
            <FieldLabel htmlFor="industry_type">
              {ORGANIZATION_CONTENT.industry_type}
            </FieldLabel>

            <FieldContent>
              <SearchSelect
                options={options}
                value={value}
                onValueChange={setValue}
              />
            </FieldContent>
          </Field>

          <Field>
            <FieldLabel htmlFor="company_size">
              {ORGANIZATION_CONTENT.company_size}
            </FieldLabel>

            <FieldContent>
              <SearchSelect
                options={options}
                value={value}
                onValueChange={setValue}
              />
            </FieldContent>
          </Field>
        </div>

        <div className="grid gap-5 sm:grid-cols-2">
          <Field>
            <FieldLabel htmlFor="country">
              {ORGANIZATION_CONTENT.country}
            </FieldLabel>

            <FieldContent>
              <Input id="country" />
            </FieldContent>
          </Field>

          <Field>
            <FieldLabel htmlFor="city">{ORGANIZATION_CONTENT.city}</FieldLabel>

            <FieldContent>
              <Input id="city" />
            </FieldContent>
          </Field>
        </div>

        <Button type="submit" className={"w-full"}>
          {ORGANIZATION_CONTENT.submit}
        </Button>
      </form>
    </div>
  );
}
