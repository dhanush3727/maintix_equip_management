import {
  Button,
  DialogClose,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  FieldGroup,
} from "@/components/ui";
import { BREAKDOWN_FORM_CONTENT } from "../constants/breakdown.constant";
import { BreakdownFields } from "./BreakdownFields";
import { BreakdownSeverityType, DropDown } from "@/types";

interface BreakdownFormProps {
  mode: "create" | "update";
  onClose: () => void;
  equipments: DropDown[];
  breakdownSeverity: BreakdownSeverityType[];
}

export function BreakdownForm({
  mode,
  onClose,
  equipments,
  breakdownSeverity,
}: BreakdownFormProps) {
  const isEditMode = mode === "update";

  const title = isEditMode
    ? BREAKDOWN_FORM_CONTENT.UPDATE_TITLE
    : BREAKDOWN_FORM_CONTENT.CREATE_TITLE;

  const description = isEditMode
    ? BREAKDOWN_FORM_CONTENT.UPDATE_DESCRIPTION
    : BREAKDOWN_FORM_CONTENT.CREATE_DESCRIPTION;

  const buttonText = isEditMode
    ? BREAKDOWN_FORM_CONTENT.UPDATE_BUTTON
    : BREAKDOWN_FORM_CONTENT.CREATE_BUTTON;

  return (
    <form noValidate className="flex flex-col max-h-[90vh]">
      <DialogHeader>
        <DialogTitle>{title}</DialogTitle>

        <DialogDescription>{description}</DialogDescription>
      </DialogHeader>

      <FieldGroup className="flex-1 overflow-y-auto p-5">
        <BreakdownFields />
      </FieldGroup>

      <DialogFooter>
        <DialogClose className={"mr-3"}>
          {BREAKDOWN_FORM_CONTENT.CANCEL_BUTTON}
        </DialogClose>

        <Button type="submit">{buttonText}</Button>
      </DialogFooter>
    </form>
  );
}
