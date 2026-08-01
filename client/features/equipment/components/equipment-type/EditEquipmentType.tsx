import {
  Button,
  DialogClose,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogDescription,
  Field,
  FieldContent,
  FieldGroup,
  FieldLabel,
  Input,
  Skeleton,
  Switch,
  Textarea,
} from "@/components/ui";
import { EQUIPMENT_TYPE_CONTENT } from "../../constants/equipment-type.constant";
import { ClipboardType, LoaderCircle, Send } from "lucide-react";
import { useGetEquipmentTypeById } from "../../hooks/equipment-type/useGetEquipmentTypeById";
import { useForm } from "react-hook-form";
import {
  updateEquipmentTypeSchema,
  UpdateEquipmentTypeValues,
} from "../../schemas/equipment-type/update-equipment-type.schema";
import { zodResolver } from "@hookform/resolvers/zod";
import { useEffect } from "react";
import { useUpdateEquipmentType } from "../../hooks/equipment-type/useUpdateEquipmentType";
import { appToast, getErrorMessage } from "@/lib";
import { useUpdateStatus } from "../../hooks/equipment-type/useUpdateStatus";

interface EditEquipmentTypeProps {
  id: number;
  onClose: () => void;
}

export function EditEquipmentType({ id, onClose }: EditEquipmentTypeProps) {
  const { data: equipmentTypeData, isLoading: isEquipType } =
    useGetEquipmentTypeById(id);
  const updateEquipmentType = useUpdateEquipmentType();
  const updateStatusMutation = useUpdateStatus();

  const equipmentType = equipmentTypeData?.data;

  const form = useForm<UpdateEquipmentTypeValues>({
    resolver: zodResolver(updateEquipmentTypeSchema),
    defaultValues: {
      name: "",
      code: "",
      description: "",
    },
  });

  useEffect(() => {
    if (!equipmentType) return;

    form.reset({
      name: equipmentType.name,
      code: equipmentType.code,
      description: equipmentType.description,
    });
  }, [equipmentType, form]);

  const onSubmit = (payload: UpdateEquipmentTypeValues) => {
    if (!equipmentType) return;

    updateEquipmentType.mutate(
      {
        id: equipmentType?.id,
        payload,
      },
      {
        onSuccess: (data) => {
          appToast.success(data.message);
          onClose();
        },
        onError: (err) => {
          appToast.error(getErrorMessage(err));
        },
      },
    );
  };

  const updateStatus = (id: number, isActive: boolean) => {
    updateStatusMutation.mutate(
      {
        id,
        isActive,
      },
      {
        onError: (err) => {
          appToast.error(getErrorMessage(err));
        },
      },
    );
  };

  return (
    <form
      noValidate
      className="max-h-[90vh] flex flex-col"
      onSubmit={form.handleSubmit(onSubmit)}
    >
      <DialogHeader className="shrink-0">
        <DialogTitle>{EQUIPMENT_TYPE_CONTENT.UPDATE.TITLE}</DialogTitle>
        <DialogDescription>
          {EQUIPMENT_TYPE_CONTENT.UPDATE.DESCRIPITON}
        </DialogDescription>
      </DialogHeader>

      <FieldGroup className="min-h-0 flex-1 overflow-y-auto p-5">
        <Field>
          <FieldLabel htmlFor="name">
            <ClipboardType aria-hidden="true" className="size-4" />
            {EQUIPMENT_TYPE_CONTENT.FIELD.NAME_LABEL}
          </FieldLabel>

          <FieldContent>
            {isEquipType ? (
              <Skeleton className="h-10" />
            ) : (
              <Input
                id="name"
                type="text"
                autoComplete="off"
                placeholder={EQUIPMENT_TYPE_CONTENT.FIELD.NAME_PLACEHOLDER}
                disabled={!equipmentType?.isActive}
                {...form.register("name")}
              />
            )}
          </FieldContent>
        </Field>

        <Field>
          <FieldLabel htmlFor="code">
            <ClipboardType aria-hidden="true" className="size-4" />
            {EQUIPMENT_TYPE_CONTENT.FIELD.CODE_LABEL}
          </FieldLabel>

          <FieldContent>
            {isEquipType ? (
              <Skeleton className="h-10" />
            ) : (
              <Input
                id="code"
                type="text"
                autoComplete="off"
                placeholder={EQUIPMENT_TYPE_CONTENT.FIELD.CODE_PLACEHOLDER}
                disabled={!equipmentType?.isActive}
                {...form.register("code")}
              />
            )}
          </FieldContent>
        </Field>

        <Field>
          <FieldLabel htmlFor="description">
            <ClipboardType aria-hidden="true" className="size-4" />
            {EQUIPMENT_TYPE_CONTENT.FIELD.DESCRIPTION_LABEL}
          </FieldLabel>

          <FieldContent>
            {isEquipType ? (
              <Skeleton className="h-10" />
            ) : (
              <Textarea
                id="description"
                placeholder={
                  EQUIPMENT_TYPE_CONTENT.FIELD.DESCRIPTION_PLACEHOLDER
                }
                disabled={!equipmentType?.isActive}
                {...form.register("description")}
              />
            )}
          </FieldContent>
        </Field>

        {isEquipType ? (
          <Skeleton className="h-10" />
        ) : equipmentType ? (
          <div className="flex justify-between items-center border px-5 py-3 rounded-md border-border">
            <span className="text-base text-muted-foreground">
              {equipmentType.isActive
                ? EQUIPMENT_TYPE_CONTENT.TOGGLE.ACTIVE
                : EQUIPMENT_TYPE_CONTENT.TOGGLE.INACTIVE}
            </span>

            <Switch
              checked={equipmentType.isActive}
              disabled={updateStatusMutation.isPending}
              onCheckedChange={(checked) =>
                updateStatus(equipmentType.id, checked)
              }
            />
          </div>
        ) : null}
      </FieldGroup>

      <DialogFooter className="shrink-0">
        <DialogClose
          className={"mr-3"}
          disabled={
            updateEquipmentType.isPending || updateStatusMutation.isPending
          }
        >
          {EQUIPMENT_TYPE_CONTENT.BUTTON.CANCEL}
        </DialogClose>

        <Button
          type="submit"
          disabled={
            updateEquipmentType.isPending ||
            updateStatusMutation.isPending ||
            !equipmentType?.isActive
          }
        >
          {updateEquipmentType.isPending ? (
            <LoaderCircle aria-hidden="true" className="size-4 animate-spin" />
          ) : (
            <Send aria-hidden="true" className="size-4" />
          )}
          {EQUIPMENT_TYPE_CONTENT.BUTTON.UPDATE}
        </Button>
      </DialogFooter>
    </form>
  );
}
