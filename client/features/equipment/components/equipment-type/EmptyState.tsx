import { EQUIPMENT_TYPE_CONTENT } from "../../constants/equipment-type.constant";

export function EmptyState() {
  return (
    <div className="flex col-span-full items-center p-3 justify-center">
      <div className="text-center">
        <h2 className="text-base font-semibold">
          {EQUIPMENT_TYPE_CONTENT.NO_DATA.TITLE}
        </h2>
        <p className="mt-1 text-sm text-muted-foreground">
          {EQUIPMENT_TYPE_CONTENT.NO_DATA.DESCRIPTION}
        </p>
      </div>
    </div>
  );
}
