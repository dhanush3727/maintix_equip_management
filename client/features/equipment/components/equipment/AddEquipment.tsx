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
  SearchSelect,
  Skeleton,
} from "@/components/ui";
import { EQUIPMENT_CONTENT } from "../../constants/equipment.constant";
import { useEquipmentTypeDD } from "../../hooks/equipment-type/useEquipmentTypeDD";
import { useOrganizationDD } from "@/hooks";
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
import { useAddEquipment } from "../../hooks/equipment/useAddEquipment";
import { appToast, getErrorMessage } from "@/lib";

interface AddEquipmentProps {
  onClose: () => void;
}

export function AddEquipment({ onClose }: AddEquipmentProps) {
  const { data: equipmentType, isLoading: isEquipType } = useEquipmentTypeDD();
  const { data: organization, isLoading: isOrganization } = useOrganizationDD();
  const addEquipmentMutation = useAddEquipment();

  const equipTypeDD = equipmentType?.data ?? [];
  const locationDD = organization?.data?.location ?? [];
  const departmentDD = organization?.data?.department ?? [];

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

  const onSubmit = () => {
    const values = form.getValues();

    const payload: EquipmentValues = {
      ...values,
      installedDate: values.installedDate || undefined,
      warrantyExpiry: values.warrantyExpiry || undefined,
    };

    addEquipmentMutation.mutate(payload, {
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
        <DialogTitle>{EQUIPMENT_CONTENT.CREATE.TITLE}</DialogTitle>
        <DialogDescription>
          {EQUIPMENT_CONTENT.CREATE.DESCRIPTION}
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
              <Input
                id="name"
                type="text"
                autoComplete="off"
                placeholder={EQUIPMENT_CONTENT.FIELD.NAME_PLACEHOLDER}
                {...form.register("name")}
              />
            </FieldContent>

            <FieldError errors={[form.formState.errors.name]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="code">
              <Barcode aria-hidden="true" className="size-4" />
              {EQUIPMENT_CONTENT.FIELD.CODE_LABEL}
            </FieldLabel>

            <FieldContent>
              <Input
                id="code"
                type="text"
                autoComplete="off"
                placeholder={EQUIPMENT_CONTENT.FIELD.CODE_PLACEHOLDER}
                {...form.register("code")}
              />
            </FieldContent>

            <FieldError errors={[form.formState.errors.code]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="equipment-type">
              <Cog aria-hidden="true" className="size-4" />
              {EQUIPMENT_CONTENT.FIELD.EQUIPMENT_TYPE_LABEL}
            </FieldLabel>

            <FieldContent>
              {isEquipType ? (
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
              {isOrganization ? (
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
              {isOrganization ? (
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
              <Input
                id="serial-number"
                type="text"
                autoComplete="off"
                placeholder={EQUIPMENT_CONTENT.FIELD.SERIAL_NUMBER_PLACEHOLDER}
                {...form.register("serialNumber")}
              />
            </FieldContent>

            <FieldError errors={[form.formState.errors.serialNumber]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="installed-date">
              <CalendarDays aria-hidden="true" className="size-4" />
              {EQUIPMENT_CONTENT.FIELD.INSTALLED_DATE_LABEL}
            </FieldLabel>

            <FieldContent>
              <Input
                id="installed-date"
                type="date"
                autoComplete="off"
                placeholder={EQUIPMENT_CONTENT.FIELD.INSTALLED_DATE_PLACEHOLDER}
                {...form.register("installedDate")}
              />
            </FieldContent>

            <FieldError errors={[form.formState.errors.installedDate]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="warranty-expiry">
              <ShieldCheck aria-hidden="true" className="size-4" />
              {EQUIPMENT_CONTENT.FIELD.WARRANTY_EXPIRY_LABEL}
            </FieldLabel>

            <FieldContent>
              <Input
                id="warranty-expiry"
                type="date"
                autoComplete="off"
                placeholder={
                  EQUIPMENT_CONTENT.FIELD.WARRANTY_EXPIRY_PLACEHOLDER
                }
                {...form.register("warrantyExpiry")}
              />
            </FieldContent>

            <FieldError errors={[form.formState.errors.warrantyExpiry]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="manufacturer">
              <Factory aria-hidden="true" className="size-4" />
              {EQUIPMENT_CONTENT.FIELD.MANUFACTURER_LABEL}
            </FieldLabel>

            <FieldContent>
              <Input
                id="manufacturer"
                type="text"
                autoComplete="off"
                placeholder={EQUIPMENT_CONTENT.FIELD.MANUFACTURER_PLACEHOLDER}
                {...form.register("manufacturer")}
              />
            </FieldContent>

            <FieldError errors={[form.formState.errors.manufacturer]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="model">
              <Box aria-hidden="true" className="size-4" />
              {EQUIPMENT_CONTENT.FIELD.MODEL_LABEL}
            </FieldLabel>

            <FieldContent>
              <Input
                id="model"
                type="text"
                autoComplete="off"
                placeholder={EQUIPMENT_CONTENT.FIELD.MODEL_PLACEHOLDER}
                {...form.register("model")}
              />
            </FieldContent>

            <FieldError errors={[form.formState.errors.model]} />
          </Field>
        </div>
      </FieldGroup>

      <DialogFooter>
        <DialogClose
          className={"mr-3"}
          disabled={addEquipmentMutation.isPending}
        >
          {EQUIPMENT_CONTENT.BUTTON.CANCEL}
        </DialogClose>

        <Button type="submit" disabled={addEquipmentMutation.isPending}>
          {addEquipmentMutation.isPending ? (
            <LoaderCircle aria-hidden="true" className="size-4 animate-spin" />
          ) : (
            <Send aria-hidden="true" className="size-4" />
          )}
          {EQUIPMENT_CONTENT.BUTTON.SUBMIT}
        </Button>
      </DialogFooter>
    </form>
  );
}
