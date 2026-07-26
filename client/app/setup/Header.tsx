"use client";

import { Separator } from "@/components/ui";
import { HEADER_CONTENT } from "./constant";
import { useOnboarding } from "@/hooks";
import { cn } from "@/lib/utils";
import { Check } from "lucide-react";

export function Header() {
  const { data } = useOnboarding();

  const currentStep = data?.data?.onboardingStep;

  return (
    <>
      <header className="flex flex-col p-[2%] sm:px-[5%] gap-10">
        <div>
          <h1 className="text-sm font-bold md:text-lg">
            {HEADER_CONTENT.title}
          </h1>
          <p className="text-sm text-muted-foreground hidden sm:block">
            {HEADER_CONTENT.description}
          </p>
        </div>

        <div className="relative flex w-full justify-between">
          <div className="absolute left-[5%] right-[5%] top-5 h-0.5 bg-border sm:top-10" />

          {HEADER_CONTENT.steps.map((step, index) => {
            const currentIndex = HEADER_CONTENT.steps.findIndex(
              (item) => item.key === currentStep,
            );

            const completed = currentIndex > index;
            const active = currentIndex === index;

            return (
              <div
                key={step.step}
                className="z-10 flex flex-col gap-3 items-center"
              >
                <div
                  className={cn(
                    "bg-background w-10 h-10 rounded-full border flex justify-center items-center sm:w-20 sm:h-20 sm:font-bold sm:text-xl",
                    completed && "bg-success text-card",
                    active && "bg-primary text-card",
                  )}
                >
                  {completed ? <Check /> : step.step}
                </div>
                <h2 className="text-xs sm:text-base">{step.title}</h2>
              </div>
            );
          })}
        </div>
      </header>
      <Separator />
    </>
  );
}
