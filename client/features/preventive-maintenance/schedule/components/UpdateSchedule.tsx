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
import {
  useChecklistDD,
  useEquipmentDD,
  useMeta,
  useUserDropdown,
} from "@/hooks";
import { useScheduleById } from "../hooks/useScheduleById";
import { useUpdateSchedule } from "../hooks/useUpdateSchedule";
import { useForm } from "react-hook-form";
import { scheduleSchema, ScheduleValues } from "../schema/schedule.schema";
import { zodResolver } from "@hookform/resolvers/zod";
import { useEffect } from "react";
import { formatStartDate } from "../util/schedule.util";
import { appToast, getErrorMessage } from "@/lib";
import { LoaderCircle, Send } from "lucide-react";
import { ScheduleFields } from "./ScheduleFields";

interface UpdateScheduleProps {
  id: number;
  onClose: () => void;
}

export function UpdateSchedule({ id, onClose }: UpdateScheduleProps) {
  const { data: scheduleData } = useScheduleById(id);
  const { data: meta, isLoading: isMeta } = useMeta();
  const { data: userData, isLoading: isUser } = useUserDropdown();
  const { data: equipmentData, isLoading: isEquipment } = useEquipmentDD();
  const { data: checklistData, isLoading: isChecklist } = useChecklistDD();

  const updateSchedule = useUpdateSchedule();

  const schedule = scheduleData?.data;
  const frequencyType = meta?.data?.frequencyType ?? [];
  const users = userData?.data ?? [];
  const equipment = equipmentData?.data ?? [];
  const checklist = checklistData?.data ?? [];

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

  useEffect(() => {
    if (!schedule) return;

    form.reset({
      equipmentId: schedule.equipment.value,
      templateId: schedule.template.value,
      frequencyType: schedule.frequencyType,
      interval: schedule.interval,
      startDate: formatStartDate(schedule.startDate),
      assignedTo: schedule.assignedTo.value,
    });
  }, [schedule, form]);

  const onSubmit = (values: ScheduleValues) => {
    const payload = {
      frequencyType: values.frequencyType,
      interval: values.interval,
      startDate: values.startDate,
      assignedTo: values.assignedTo,
    };

    updateSchedule.mutate(
      { id, payload },
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

  return (
    <form
      noValidate
      className="flex flex-col max-h-[90vh]"
      onSubmit={form.handleSubmit(onSubmit)}
    >
      <DialogHeader>
        <DialogTitle>{SCHEDULE_CONTENT.UPDATE.TITLE}</DialogTitle>
        <DialogDescription>
          {SCHEDULE_CONTENT.UPDATE.DESCRIPTION}
        </DialogDescription>
      </DialogHeader>

      <FieldGroup className="flex-1 overflow-y-auto p-5">
        <ScheduleFields
          mode="update"
          form={form}
          equipment={equipment}
          isEquipment={isEquipment}
          checklist={checklist}
          isChecklist={isChecklist}
          isMeta={isMeta}
          frequencyType={frequencyType}
          isUser={isUser}
          users={users}
        />
      </FieldGroup>

      <DialogFooter>
        <DialogClose className={"mr-3"} disabled={updateSchedule.isPending}>
          {SCHEDULE_CONTENT.BUTTONS.CANCEL}
        </DialogClose>

        <Button type="submit" disabled={updateSchedule.isPending}>
          {updateSchedule.isPending ? (
            <LoaderCircle aria-hidden="true" className="size-4 animate-spin" />
          ) : (
            <Send aria-hidden="true" className="size-4" />
          )}
          {SCHEDULE_CONTENT.BUTTONS.UPDATE}
        </Button>
      </DialogFooter>
    </form>
  );
}
