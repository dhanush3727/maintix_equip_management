"use client";

import {
  Button,
  DialogClose,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  FieldGroup,
} from "@/components/ui";
import { SCHEDULE_CONTENT } from "../constant/schedule.constant";
import { useEquipmentDDByType, useEquipmentTypeDD, useMeta, useUserDropdown } from "@/hooks";
import { useState } from "react";
import { useGetChecklistDropdown } from "@/features/checklist/hooks/useGetChecklistDropdown";
import { useForm } from "react-hook-form";
import { scheduleSchema, ScheduleValues } from "../schema/schedule.schema";
import { zodResolver } from "@hookform/resolvers/zod";
import { useCreateSchedule } from "../hooks/useCreateSchedule";
import { appToast, getErrorMessage } from "@/lib";
import { LoaderCircle, Plus } from "lucide-react";
import { ScheduleFields } from "./ScheduleFields";

interface CreateScheduleProps {
  onClose: () => void;
}

export function CreateSchedule({ onClose }: CreateScheduleProps) {
  const { data: equipTypeData, isLoading: isEquipType } = useEquipmentTypeDD();
  const { data: meta, isLoading: isMeta } = useMeta();
  const { data: userData, isLoading: isUser } = useUserDropdown();

  const scheduleMutation = useCreateSchedule();

  const [typeValue, setTypeValue] = useState<number>(0);
  const { data: equipmentData, isLoading: isEquipment } =
    useEquipmentDDByType(typeValue);

  const { data: checklistData, isLoading: isChecklist } =
    useGetChecklistDropdown(typeValue);

  const equipmentType = equipTypeData?.data ?? [];
  const equipment = equipmentData?.data ?? [];
  const checklist = checklistData?.data ?? [];
  const frequencyType = meta?.data?.frequencyType ?? [];
  const users = userData?.data ?? [];

  const form = useForm<ScheduleValues>({
    resolver: zodResolver(scheduleSchema),
    defaultValues: {
      equipmentId: undefined,
      templateId: undefined,
      frequencyType: undefined,
      interval: undefined,
      startDate: "",
      assignedTo: undefined,
    },
  });

  const handleTypeValue = (value: number) => {
    setTypeValue(value);

    form.resetField("equipmentId");
    form.resetField("templateId");
  };

  const onSubmit = (payload: ScheduleValues) => {
    scheduleMutation.mutate(payload, {
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
      <DialogHeader>
        <DialogTitle>{SCHEDULE_CONTENT.CREATE.TITLE}</DialogTitle>
        <DialogDescription>
          {SCHEDULE_CONTENT.CREATE.DESCRIPTION}
        </DialogDescription>
      </DialogHeader>

      <FieldGroup className="fle-1 overflow-y-auto p-5">
        <ScheduleFields
          form={form}
          typeValue={typeValue}
          setTypeValue={handleTypeValue}
          isEquipType={isEquipType}
          equipmentType={equipmentType}
          isEquipment={isEquipment}
          equipment={equipment}
          isChecklist={isChecklist}
          checklist={checklist}
          isMeta={isMeta}
          frequencyType={frequencyType}
          isUser={isUser}
          users={users}
        />
      </FieldGroup>

      <DialogFooter>
        <DialogClose className={"mr-3"} disabled={scheduleMutation.isPending}>
          {SCHEDULE_CONTENT.BUTTONS.CANCEL}
        </DialogClose>
        <Button type="submit" disabled={scheduleMutation.isPending}>
          {scheduleMutation.isPending ? (
            <LoaderCircle aria-hidden="true" className="size-4 animate-spin" />
          ) : (
            <Plus aria-hidden="true" className="size-4" />
          )}
          {SCHEDULE_CONTENT.BUTTONS.CREATE}
        </Button>
      </DialogFooter>
    </form>
  );
}
