import {
  Button,
  DialogClose,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from "@/components/ui";
import { EQUIPMENT_TYPE_CONTENT } from "../constants/equipment-type.constant";

export function AddEquipmentType() {
  return (
    <form>
      <DialogHeader>
        <DialogTitle>{EQUIPMENT_TYPE_CONTENT.TITLE}</DialogTitle>
      </DialogHeader>

      <DialogFooter>
        <DialogClose className={"mr-3"}>
          {EQUIPMENT_TYPE_CONTENT.BUTTON.CANCEL}
        </DialogClose>
        <Button type="submit">{EQUIPMENT_TYPE_CONTENT.BUTTON.SUBMIT}</Button>
      </DialogFooter>
    </form>
  );
}
