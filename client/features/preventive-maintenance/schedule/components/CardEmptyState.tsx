import { SCHEDULE_CONTENT } from "../constant/schedule.constant";

export function CardEmptyState() {
  return (
    <div className="flex col-span-full items-center p-3 justify-center">
      <div className="text-center">
        <h2 className="text-base font-semibold">
          {SCHEDULE_CONTENT.NO_DATA.TITLE}
        </h2>
        <p className="mt-1 text-sm text-muted-foreground">
          {SCHEDULE_CONTENT.NO_DATA.DESCRIPTION}
        </p>
      </div>
    </div>
  );
}
