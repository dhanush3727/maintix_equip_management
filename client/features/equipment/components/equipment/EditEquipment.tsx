import {
  Badge,
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
  SearchSelect,
  Skeleton,
  Switch,
} from "@/components/ui";
import { EQUIPMENT_CONTENT } from "../../constants/equipment.constant";
import { useGetEquipmentById } from "../../hooks/equipment/useGetEquipmentById";
import {
  Barcode,
  Box,
  Building2,
  CalendarDays,
  Cog,
  Factory,
  LoaderCircle,
  MapPin,
  ScanBarcode,
  Send,
  ShieldCheck,
  Tag,
} from "lucide-react";
import { Controller, useForm } from "react-hook-form";
import {
  equipmentSchema,
  EquipmentValues,
} from "../../schemas/equipment/equipment.schema";
import { zodResolver } from "@hookform/resolvers/zod";
import { useEffect } from "react";
import { EquipmentTypeDropdownData } from "../../types/equipment-type.type";
import { DropDown } from "@/types/organization.types";
import { formatDate } from "../../utils/equipment.utils";
import { useUpdateEquipment } from "../../hooks/equipment/useUpdateEquipment";
import { EquipmentStatus } from "@/types";
import { appToast, getErrorMessage } from "@/lib";
import { useUpdateStatus } from "../../hooks/equipment/useUpdateStatus";

interface EditEquipmentProps {
  id: number;
  onClose: () => void;
  equipTypeDD: EquipmentTypeDropdownData[];
  locationDD: DropDown[];
  departmentDD: DropDown[];
  isOrganization: boolean;
  isEquipType: boolean;
}

export function EditEquipment({
  id,
  onClose,
  equipTypeDD,
  locationDD,
  departmentDD,
  isEquipType,
  isOrganization,
}: EditEquipmentProps) {
  const { data: equipmentData, isLoading: isEquipment } =
    useGetEquipmentById(id);

  const updateStatusMutation = useUpdateStatus();

  const updateEquipment = useUpdateEquipment();

  const equipment = equipmentData?.data;

  const form = useForm<EquipmentValues>({
    resolver: zodResolver(equipmentSchema),
    defaultValues: {
      name: "",
      code: "",
      equipmentTypeId: 0,
      locationId: 0,
      departmentId: 0,
      serialNumber: "",
      installedDate: "",
      warrantyExpiry: "",
      manufacturer: "",
      model: "",
    },
  });

  useEffect(() => {
    if (!equipment) return;

    form.reset({
      name: equipment.name,
      code: equipment.code,
      equipmentTypeId: equipment.equipmentType.value,
      locationId: equipment.location.value,
      departmentId: equipment.department.value,
      serialNumber: equipment.serialNumber,
      installedDate: formatDate(equipment.installedDate) || undefined,
      warrantyExpiry: formatDate(equipment.warrantyExpiry) || undefined,
      manufacturer: equipment.manufacturer,
      model: equipment.model,
    });
  }, [equipment, form]);

  const canToggle =
    equipment?.status === EquipmentStatus.ACTIVE ||
    equipment?.status === EquipmentStatus.INACTIVE;

  const onSubmit = () => {
    if (!equipment) return;

    const values = form.getValues();

    const payload: EquipmentValues = {
      ...values,
      installedDate: values.installedDate || undefined,
      warrantyExpiry: values.warrantyExpiry || undefined,
    };

    updateEquipment.mutate(
      { id: equipment.id, payload },
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
      { id, isActive },
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
        <DialogTitle>{EQUIPMENT_CONTENT.UPDATE.TITLE}</DialogTitle>
        <DialogDescription>
          {EQUIPMENT_CONTENT.UPDATE.DESCRIPTION}
        </DialogDescription>
      </DialogHeader>

      <FieldGroup className="flex-1 overflow-y-auto p-5">
        <div className="grid gap-3 sm:grid-cols-2">
          <Field>
            <FieldLabel htmlFor="name">
              <Tag aria-hidden="true" className="size-4" />
              {EQUIPMENT_CONTENT.FIELD.NAME_LABEL}
            </FieldLabel>

            <FieldContent>
              {isEquipment ? (
                <Skeleton className="h-10" />
              ) : (
                <Input
                  id="name"
                  type="text"
                  autoComplete="off"
                  placeholder={EQUIPMENT_CONTENT.FIELD.NAME_PLACEHOLDER}
                  disabled={equipment?.status === EquipmentStatus.INACTIVE}
                  {...form.register("name")}
                />
              )}
            </FieldContent>

            <FieldError errors={[form.formState.errors.name]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="code">
              <Barcode aria-hidden="true" className="size-4" />
              {EQUIPMENT_CONTENT.FIELD.CODE_LABEL}
            </FieldLabel>

            <FieldContent>
              {isEquipment ? (
                <Skeleton className="h-10" />
              ) : (
                <Input
                  id="code"
                  type="text"
                  autoComplete="off"
                  placeholder={EQUIPMENT_CONTENT.FIELD.CODE_PLACEHOLDER}
                  disabled={equipment?.status === EquipmentStatus.INACTIVE}
                  {...form.register("code")}
                />
              )}
            </FieldContent>

            <FieldError errors={[form.formState.errors.code]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="equipment-type">
              <Cog aria-hidden="true" className="size-4" />
              {EQUIPMENT_CONTENT.FIELD.EQUIPMENT_TYPE_LABEL}
            </FieldLabel>

            <FieldContent>
              {isEquipType || isEquipment ? (
                <Skeleton className="h-10" />
              ) : (
                <Controller
                  control={form.control}
                  name="equipmentTypeId"
                  render={({ field }) => (
                    <SearchSelect
                      options={equipTypeDD}
                      value={field.value}
                      onValueChange={field.onChange}
                      placeholder={
                        EQUIPMENT_CONTENT.FIELD.EQUIPMENT_TYPE_PLACEHOLDER
                      }
                      searchPlaceholder={
                        EQUIPMENT_CONTENT.FIELD.EQUIPMENT_TYPE_SEARCH
                      }
                      disabled={equipment?.status === EquipmentStatus.INACTIVE}
                    />
                  )}
                />
              )}
            </FieldContent>

            <FieldError errors={[form.formState.errors.equipmentTypeId]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="location">
              <MapPin aria-hidden="true" className="size-4" />
              {EQUIPMENT_CONTENT.FIELD.LOCATION_LABEL}
            </FieldLabel>

            <FieldContent>
              {isOrganization || isEquipment ? (
                <Skeleton className="h-10" />
              ) : (
                <Controller
                  control={form.control}
                  name="locationId"
                  render={({ field }) => (
                    <SearchSelect
                      options={locationDD}
                      value={field.value}
                      onValueChange={field.onChange}
                      placeholder={EQUIPMENT_CONTENT.FIELD.LOCATION_PLACEHOLDER}
                      searchPlaceholder={
                        EQUIPMENT_CONTENT.FIELD.LOCATION_SEARCH
                      }
                      disabled={equipment?.status === EquipmentStatus.INACTIVE}
                    />
                  )}
                />
              )}
            </FieldContent>

            <FieldError errors={[form.formState.errors.locationId]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="department">
              <Building2 aria-hidden="true" className="size-4" />
              {EQUIPMENT_CONTENT.FIELD.DEPARTMENT_LABEL}
            </FieldLabel>

            <FieldContent>
              {isOrganization || isEquipment ? (
                <Skeleton className="h-10" />
              ) : (
                <Controller
                  control={form.control}
                  name="departmentId"
                  render={({ field }) => (
                    <SearchSelect
                      options={departmentDD}
                      value={field.value}
                      onValueChange={field.onChange}
                      placeholder={
                        EQUIPMENT_CONTENT.FIELD.DEPARTMENT_PLACEHOLDER
                      }
                      searchPlaceholder={
                        EQUIPMENT_CONTENT.FIELD.DEPARTMENT_SEARCH
                      }
                      disabled={equipment?.status === EquipmentStatus.INACTIVE}
                    />
                  )}
                />
              )}
            </FieldContent>

            <FieldError errors={[form.formState.errors.departmentId]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="serial-number">
              <ScanBarcode aria-hidden="true" className="size-4" />
              {EQUIPMENT_CONTENT.FIELD.SERIAL_NUMBER_LABEL}
            </FieldLabel>

            <FieldContent>
              {isEquipment ? (
                <Skeleton className="h-10" />
              ) : (
                <Input
                  id="serial-number"
                  type="text"
                  autoComplete="off"
                  placeholder={
                    EQUIPMENT_CONTENT.FIELD.SERIAL_NUMBER_PLACEHOLDER
                  }
                  disabled={equipment?.status === EquipmentStatus.INACTIVE}
                  {...form.register("serialNumber")}
                />
              )}
            </FieldContent>

            <FieldError errors={[form.formState.errors.serialNumber]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="installed-date">
              <CalendarDays aria-hidden="true" className="size-4" />
              {EQUIPMENT_CONTENT.FIELD.INSTALLED_DATE_LABEL}
            </FieldLabel>

            <FieldContent>
              {isEquipment ? (
                <Skeleton className="h-10" />
              ) : (
                <Input
                  id="installed-date"
                  type="date"
                  autoComplete="off"
                  placeholder={
                    EQUIPMENT_CONTENT.FIELD.INSTALLED_DATE_PLACEHOLDER
                  }
                  disabled={equipment?.status === EquipmentStatus.INACTIVE}
                  {...form.register("installedDate")}
                />
              )}
            </FieldContent>

            <FieldError errors={[form.formState.errors.installedDate]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="warranty-expiry">
              <ShieldCheck aria-hidden="true" className="size-4" />
              {EQUIPMENT_CONTENT.FIELD.WARRANTY_EXPIRY_LABEL}
            </FieldLabel>

            <FieldContent>
              {isEquipment ? (
                <Skeleton className="h-10" />
              ) : (
                <Input
                  id="warranty-expiry"
                  type="date"
                  autoComplete="off"
                  placeholder={
                    EQUIPMENT_CONTENT.FIELD.WARRANTY_EXPIRY_PLACEHOLDER
                  }
                  disabled={equipment?.status === EquipmentStatus.INACTIVE}
                  {...form.register("warrantyExpiry")}
                />
              )}
            </FieldContent>

            <FieldError errors={[form.formState.errors.warrantyExpiry]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="manufacturer">
              <Factory aria-hidden="true" className="size-4" />
              {EQUIPMENT_CONTENT.FIELD.MANUFACTURER_LABEL}
            </FieldLabel>

            <FieldContent>
              {isEquipment ? (
                <Skeleton className="h-10" />
              ) : (
                <Input
                  id="manufacturer"
                  type="text"
                  autoComplete="off"
                  placeholder={EQUIPMENT_CONTENT.FIELD.MANUFACTURER_PLACEHOLDER}
                  disabled={equipment?.status === EquipmentStatus.INACTIVE}
                  {...form.register("manufacturer")}
                />
              )}
            </FieldContent>

            <FieldError errors={[form.formState.errors.manufacturer]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="model">
              <Box aria-hidden="true" className="size-4" />
              {EQUIPMENT_CONTENT.FIELD.MODEL_LABEL}
            </FieldLabel>

            <FieldContent>
              {isEquipment ? (
                <Skeleton className="h-10" />
              ) : (
                <Input
                  id="model"
                  type="text"
                  autoComplete="off"
                  placeholder={EQUIPMENT_CONTENT.FIELD.MODEL_PLACEHOLDER}
                  disabled={equipment?.status === EquipmentStatus.INACTIVE}
                  {...form.register("model")}
                />
              )}
            </FieldContent>

            <FieldError errors={[form.formState.errors.model]} />
          </Field>
        </div>

        {isEquipment ? (
          <Skeleton className="h-10" />
        ) : equipment ? (
          <div className="flex items-center justify-between rounded-md border border-border px-5 py-3">
            <div className="flex items-center gap-3">
              <span className="text-base text-muted-foreground">
                {EQUIPMENT_CONTENT.FIELD.STATUS_LABEL}
              </span>

              <Badge
                variant={
                  equipment.status === EquipmentStatus.ACTIVE
                    ? "success"
                    : equipment.status === EquipmentStatus.INACTIVE
                      ? "destructive"
                      : equipment.status === EquipmentStatus.BREAKDOWN
                        ? "warning"
                        : "info"
                }
              >
                {equipment.status}
              </Badge>
            </div>

            <Switch
              checked={equipment.status !== EquipmentStatus.INACTIVE}
              disabled={
                updateEquipment.isPending ||
                !canToggle ||
                updateStatusMutation.isPending
              }
              onCheckedChange={(checked) => updateStatus(equipment.id, checked)}
            />
          </div>
        ) : null}
      </FieldGroup>

      <DialogFooter>
        <DialogClose
          className={"mr-3"}
          disabled={updateEquipment.isPending || updateStatusMutation.isPending}
        >
          {EQUIPMENT_CONTENT.BUTTON.CANCEL}
        </DialogClose>

        <Button
          type="submit"
          disabled={
            updateEquipment.isPending ||
            updateStatusMutation.isPending ||
            equipment?.status === EquipmentStatus.INACTIVE
          }
        >
          {updateEquipment.isPending ? (
            <LoaderCircle aria-hidden="true" className="size-4 animate-spin" />
          ) : (
            <Send aria-hidden="true" className="size-4" />
          )}
          {EQUIPMENT_CONTENT.BUTTON.UPDATE}
        </Button>
      </DialogFooter>
    </form>
  );
}
