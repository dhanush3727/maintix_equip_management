import {
  Button,
  DialogClose,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from "@/components/ui";
import { EQUIPMENT_CONTENT } from "../../constants/equipment.constant";

export function AddEquipment() {
  return (
    <form>
      <DialogHeader>
        <DialogTitle>{EQUIPMENT_CONTENT.TITLE}</DialogTitle>
      </DialogHeader>

      <DialogFooter>
        <DialogClose className={"mr-3"}>
          {EQUIPMENT_CONTENT.BUTTON.CANCEL}
        </DialogClose>
        <Button type="submit">{EQUIPMENT_CONTENT.BUTTON.SUBMIT}</Button>
      </DialogFooter>
    </form>
  );
}
