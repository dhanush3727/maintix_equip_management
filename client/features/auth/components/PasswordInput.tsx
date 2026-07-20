"use client";

import { Button, Input } from "@/components/ui";
import { cn } from "@/lib/utils";
import { Eye, EyeOff } from "lucide-react";
import React, { useState } from "react";

// Accept every prop that the shadcn Input component accepts.
type PasswordInputProps = React.ComponentProps<typeof Input>;

export function PasswordInput({ className, ...props }: PasswordInputProps) {
  const [showPassword, setShowPassword] = useState(false);

  const togglePasswordVisibility = () => {
    setShowPassword((prev) => !prev);
  };

  return (
    <div className="relative">
      <Input
        type={showPassword ? "text" : "password"}
        {...props}
        className={cn("pr-10", className)}
      />
      <Button
        type="button"
        variant={"ghost"}
        size={"icon"}
        className="absolute right-0 to-0 h-full px-3 hover:bg-transparent"
        onClick={togglePasswordVisibility}
      >
        {showPassword ? (
          <EyeOff className="size-5" />
        ) : (
          <Eye className="size-5" />
        )}
      </Button>
    </div>
  );
}
