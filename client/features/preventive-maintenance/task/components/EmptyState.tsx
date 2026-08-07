import { TASK_CONTENT } from "../constant/task.constant";

export function EmptyState() {
  return (
    <div className="flex col-span-full items-center p-3 justify-center">
      <div className="text-center">
        <h2 className="text-base font-semibold">{TASK_CONTENT.EMPTY.TITLE}</h2>
        <p className="mt-1 text-sm text-muted-foreground">
          {TASK_CONTENT.EMPTY.DESCRIPTION}
        </p>
      </div>
    </div>
  );
}
