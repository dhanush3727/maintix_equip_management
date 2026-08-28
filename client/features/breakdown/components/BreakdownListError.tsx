import { BREAKDOWN_CONTENT } from "../constants/breakdown.constant";

export function BreakdownListError() {
  return (
    <div className="flex col-span-full items-center p-3 justify-center">
      <div className="text-center">
        <h2 className="text-base font-semibold">
          {BREAKDOWN_CONTENT.ERROR.TITLE}
        </h2>
        <p className="mt-1 text-sm text-muted-foreground">
          {BREAKDOWN_CONTENT.ERROR.DESCRIPTION}
        </p>
      </div>
    </div>
  );
}
