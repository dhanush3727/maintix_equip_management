import {
  Button,
  DialogClose,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  Field,
  FieldContent,
  FieldError,
  FieldGroup,
  FieldLabel,
  Input,
  Textarea,
} from "@/components/ui";
import { EQUIPMENT_TYPE_CONTENT } from "../../constants/equipment-type.constant";
import {
  AlignLeft,
  ClipboardType,
  Hash,
  LoaderCircle,
  Send,
} from "lucide-react";
import { useForm } from "react-hook-form";
import {
  addEquipmentTypeSchema,
  AddEquipmentTypeValues,
} from "../../schemas/add-equipment-type.schema";
import { zodResolver } from "@hookform/resolvers/zod";
import { useAddEquipmentType } from "../../hooks/equipment-type/useAddEquipmentType";
import { appToast, getErrorMessage } from "@/lib";

export interface AddEquipmentTypeProp {
  onClose: () => void;
}

export function AddEquipmentType({ onClose }: AddEquipmentTypeProp) {
  const equipmentType = useAddEquipmentType();

  const form = useForm<AddEquipmentTypeValues>({
    resolver: zodResolver(addEquipmentTypeSchema),
    defaultValues: {
      name: "",
      code: "",
      description: "",
    },
  });

  const onSubmit = (payload: AddEquipmentTypeValues) => {
    equipmentType.mutate(payload, {
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
      className="max-h-[90vh] flex flex-col"
      onSubmit={form.handleSubmit(onSubmit)}
    >
      <DialogHeader className="shrink-0">
        <DialogTitle>{EQUIPMENT_TYPE_CONTENT.TITLE}</DialogTitle>
        <DialogDescription>
          {EQUIPMENT_TYPE_CONTENT.DESCRIPTION}
        </DialogDescription>
      </DialogHeader>

      <FieldGroup className="min-h-0 flex-1 overflow-y-auto p-5">
        <Field>
          <FieldLabel htmlFor="name">
            <ClipboardType aria-hidden="true" className="size-4" />
            {EQUIPMENT_TYPE_CONTENT.FIELD.NAME_LABEL}
          </FieldLabel>

          <FieldContent>
            <Input
              id="name"
              type="text"
              autoComplete="off"
              placeholder={EQUIPMENT_TYPE_CONTENT.FIELD.NAME_PLACEHOLDER}
              {...form.register("name")}
            />
          </FieldContent>

          <FieldError errors={[form.formState.errors.name]} />
        </Field>

        <Field>
          <FieldLabel htmlFor="code">
            <Hash aria-hidden="true" className="size-4" />
            {EQUIPMENT_TYPE_CONTENT.FIELD.CODE_LABEL}
          </FieldLabel>

          <FieldContent>
            <Input
              id="code"
              type="text"
              autoComplete="off"
              placeholder={EQUIPMENT_TYPE_CONTENT.FIELD.CODE_PLACEHOLDER}
              {...form.register("code")}
            />
          </FieldContent>

          <FieldError errors={[form.formState.errors.code]} />
        </Field>

        <Field>
          <FieldLabel htmlFor="description">
            <AlignLeft aria-hidden="true" className="size-4" />
            {EQUIPMENT_TYPE_CONTENT.FIELD.DESCRIPTION_LABEL}
          </FieldLabel>

          <FieldContent>
            <Textarea
              id="description"
              placeholder={EQUIPMENT_TYPE_CONTENT.FIELD.DESCRIPTION_PLACEHOLDER}
              {...form.register("description")}
            />
          </FieldContent>
        </Field>
      </FieldGroup>

      <DialogFooter className="shrink-0">
        <DialogClose className={"mr-3"} disabled={equipmentType.isPending}>
          {EQUIPMENT_TYPE_CONTENT.BUTTON.CANCEL}
        </DialogClose>

        <Button type="submit" disabled={equipmentType.isPending}>
          {equipmentType.isPending ? (
            <LoaderCircle aria-hidden="true" className="size-4 animate-spin" />
          ) : (
            <Send aria-hidden="true" className="size-4" />
          )}
          {EQUIPMENT_TYPE_CONTENT.BUTTON.SUBMIT}
        </Button>
      </DialogFooter>
    </form>
  );
}
