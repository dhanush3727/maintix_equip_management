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
import { useForm } from "react-hook-form";
import { breakdownSchema, BreakdownValues } from "../schema/breakdown.schema";
import { zodResolver } from "@hookform/resolvers/zod";
import { useCreateBreakdown } from "../hooks/useCreateBreakdown";
import { CircleAlert, LoaderCircle, Pencil } from "lucide-react";
import { appToast, getErrorMessage } from "@/lib";

interface BreakdownFormProps {
  mode: "create" | "update";
  onClose: () => void;
  equipments: DropDown[];
  breakdownSeverity: BreakdownSeverityType[];
  isEquipment: boolean;
  isMeta: boolean;
}

export function BreakdownForm({
  mode,
  onClose,
  equipments,
  breakdownSeverity,
  isEquipment,
  isMeta,
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

  const createBreakdown = useCreateBreakdown();

  const form = useForm<BreakdownValues>({
    resolver: zodResolver(breakdownSchema),
    defaultValues: {
      title: "",
      description: "",
      severity: undefined,
      equipmentId: undefined,
    },
  });

  const onSubmit = (payload: BreakdownValues) => {
    createBreakdown.mutate(payload, {
      onSuccess: (data) => {
        appToast.success(data.message);
        form.reset();
        onClose();
      },

      onError: (err) => {
        appToast.error(getErrorMessage(err));
      },
    });
  };

  return (
    <form
      noValidate
      className="flex flex-col max-h-[90vh]"
      onSubmit={form.handleSubmit(onSubmit)}
    >
      <DialogHeader className="shrink-0">
        <DialogTitle>{title}</DialogTitle>

        <DialogDescription>{description}</DialogDescription>
      </DialogHeader>

      <FieldGroup className="flex-1 overflow-y-auto p-5">
        <BreakdownFields
          form={form}
          equipments={equipments}
          breakdownSeverity={breakdownSeverity}
          isEquipment={isEquipment}
          isMeta={isMeta}
          isDisabled={createBreakdown.isPending}
        />
      </FieldGroup>

      <DialogFooter>
        <DialogClose className={"mr-3"} disabled={createBreakdown.isPending}>
          {BREAKDOWN_FORM_CONTENT.CANCEL_BUTTON}
        </DialogClose>

        <Button type="submit" disabled={createBreakdown.isPending}>
          {createBreakdown.isPending ? (
            <LoaderCircle aria-hidden="true" className="size-4 animate-spin" />
          ) : isEditMode ? (
            <Pencil aria-hidden="true" className="size-4" />
          ) : (
            <CircleAlert aria-hidden="true" className="size-4" />
          )}
          {buttonText}
        </Button>
      </DialogFooter>
    </form>
  );
}
