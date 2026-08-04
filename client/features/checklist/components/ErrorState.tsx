import { CHECKLIST_CONTENT } from "../constants/checklist.constant";

export function ErrorState() {
  return (
    <div className="flex col-span-full items-center p-3 justify-center">
      <div className="text-center">
        <h2 className="text-base font-semibold text-destructive">
          {CHECKLIST_CONTENT.ERROR.TITLE}
        </h2>
        <p className="mt-1 text-sm text-muted-foreground">
          {CHECKLIST_CONTENT.ERROR.DESCRIPTION}
        </p>
      </div>
    </div>
  );
}
