import { Link2Off } from "lucide-react";

export interface EmptyStateProp {
  title: string;
  description: string;
}

export function EmptyState({ title, description }: EmptyStateProp) {
  return (
    <div className="min-h-screen flex items-center justify-center flex-col">
      <div className="w-15 h-15 mb-6 bg-warning-light rounded-md flex justify-center items-center">
        <Link2Off aria-hidden="true" className="size-10 text-warning" />
      </div>

      <div className="text-center max-w-xs sm:max-w-lg">
        <h1 className="text-lg font-bold mb-2 sm:text-xl lg:text-2xl">
          {title}
        </h1>

        <p className="text-sm text-muted-foreground sm:text-base">
          {description}
        </p>
      </div>
    </div>
  );
}
