import {
  Button,
  DialogClose,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from "@/components/ui";
import { SCHEDULE_CONTENT } from "../constant/schedule.constant";
import { useEquipmentDD, useEquipmentTypeDD } from "@/hooks";
import { useState } from "react";

interface CreateScheduleProps {
  onClose: () => void;
}

export function CreateSchedule({ onClose }: CreateScheduleProps) {
  const { data: equipTypeData, isLoading: isEquipType } = useEquipmentTypeDD();

  const [typeValue, setTypeValue] = useState<number | undefined>(undefined);
  const {} = useEquipmentDD(typeValue);

  return (
    <form noValidate className="flex flex-col max-h-[90vh]">
      <DialogHeader>
        <DialogTitle>{SCHEDULE_CONTENT.CREATE.TITLE}</DialogTitle>
        <DialogDescription>
          {SCHEDULE_CONTENT.CREATE.DESCRIPTION}
        </DialogDescription>
      </DialogHeader>

      <DialogFooter>
        <DialogClose className={"mr-3"}>
          {SCHEDULE_CONTENT.BUTTONS.CANCEL}
        </DialogClose>
        <Button>{SCHEDULE_CONTENT.BUTTONS.CREATE}</Button>
      </DialogFooter>
    </form>
  );
}
