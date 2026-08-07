import { Hammer } from "lucide-react";
import { UNDER_DEVELOPMENT_CONTENT } from "../constant";

export default function Breakdown() {
  return (
    <div className="flex min-h-[70vh] items-center justify-center px-6">
      <div className="max-w-lg text-center">
        <div className="mx-auto mb-6 flex h-16 w-16 items-center justify-center rounded-full bg-primary/10 text-primary">
          <Hammer className="h-8 w-8" />
        </div>

        <h1 className="text-3xl font-semibold">
          {UNDER_DEVELOPMENT_CONTENT.title}
        </h1>

        <p className="mt-4 text-muted-foreground">
          {UNDER_DEVELOPMENT_CONTENT.description}
        </p>

        <p className="mt-2 text-sm text-muted-foreground">
          {UNDER_DEVELOPMENT_CONTENT.footer}
        </p>
      </div>
    </div>
  );
}
