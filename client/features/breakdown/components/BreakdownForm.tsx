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
import {
  CircleAlert,
  CircleCheck,
  LoaderCircle,
  UserRoundPlus,
} from "lucide-react";
import { appToast, getErrorMessage } from "@/lib";
import { useBreakdownById } from "../hooks/useBreakdownById";
import { useEffect } from "react";
import { useUserDropdown } from "@/hooks";
import { AssignTechnician } from "./AssignTechnician";
import {
  assignTechnicianSchema,
  AssignTechnicianValue,
} from "../schema/assign-technician.schema";
import { useAssignTechnician } from "../hooks/useAssignTechnician";
import { ResolveBreakdown } from "./ResolveBreakdown";
import { resolveSchema, ResolveValues } from "../schema/resolve.schema";
import { useResolveBreakdown } from "../hooks/useResolveBreakdown";
import { useCreateBreakdownAction } from "../hooks/useCreateBreakdownAction";

interface BreakdownBaseProps {
  equipments: DropDown[];
  breakdownSeverity: BreakdownSeverityType[];
  isEquipment: boolean;
  isMeta: boolean;
}

interface CreateBreakdownProps extends BreakdownBaseProps {
  mode: "create";
  onClose: () => void;
}

interface ViewBreakdownProps extends BreakdownBaseProps {
  mode: "view";
  id: number;
}

interface AssignTechnicianProps extends BreakdownBaseProps {
  mode: "assign";
  id: number;
  onClose: () => void;
}

interface ResolveBreakdownProps extends BreakdownBaseProps {
  mode: "resolve";
  id: number;
  onClose: () => void;
}

type BreakdownProps =
  | CreateBreakdownProps
  | ViewBreakdownProps
  | AssignTechnicianProps
  | ResolveBreakdownProps;

export function BreakdownForm(props: BreakdownProps) {
  const { equipments, breakdownSeverity, isEquipment, isMeta, mode } = props;

  const isCreateMode = mode === "create";
  const isViewMode = mode === "view";
  const isAssignMode = mode === "assign";
  const isResolveMode = mode === "resolve";
  const breakdownId = mode !== "create" ? props.id : undefined;

  const title = isViewMode
    ? BREAKDOWN_FORM_CONTENT.VIEW_TITLE
    : isAssignMode
      ? BREAKDOWN_FORM_CONTENT.ASSIGN_TITLE
      : isResolveMode
        ? BREAKDOWN_FORM_CONTENT.RESOLVE_TITLE
        : BREAKDOWN_FORM_CONTENT.CREATE_TITLE;

  const description = isViewMode
    ? BREAKDOWN_FORM_CONTENT.VIEW_DESCRIPTION
    : isAssignMode
      ? BREAKDOWN_FORM_CONTENT.ASSIGN_DESCRIPTION
      : isResolveMode
        ? BREAKDOWN_FORM_CONTENT.RESOLVE_DESCRIPTION
        : BREAKDOWN_FORM_CONTENT.CREATE_DESCRIPTION;

  const createBreakdown = useCreateBreakdown();
  const assignTechnician = useAssignTechnician();
  const resolveBreakdown = useResolveBreakdown();
  const createAction = useCreateBreakdownAction();
  const { data: breakdownData, isLoading: isBreakdown } =
    useBreakdownById(breakdownId);
  const { data: usersData, isLoading: isUsers } = useUserDropdown();
  const breakdown = breakdownData?.data;
  const users = usersData?.data ?? [];

  const form = useForm<BreakdownValues>({
    resolver: zodResolver(breakdownSchema),
    defaultValues: {
      title: "",
      description: "",
      severity: undefined,
      equipmentId: undefined,
    },
  });

  const assignForm = useForm<AssignTechnicianValue>({
    resolver: zodResolver(assignTechnicianSchema),
    defaultValues: {
      assignedTo: undefined,
    },
  });

  const resolveForm = useForm<ResolveValues>({
    resolver: zodResolver(resolveSchema),
    defaultValues: {
      rootCause: "",
    },
  });

  useEffect(() => {
    if (!breakdown) return;

    form.reset({
      equipmentId: breakdown.equipment.value,
      title: breakdown.title,
      severity: breakdown.severity,
      description: breakdown.description,
    });
  }, [breakdown, form]);

  const handleCreate = (payload: BreakdownValues) => {
    createBreakdown.mutate(payload, {
      onSuccess: (data) => {
        appToast.success(data.message);
        form.reset();
        if (mode === "create") props.onClose();
      },

      onError: (err) => {
        appToast.error(getErrorMessage(err));
      },
    });
  };

  const handleAssign = (payload: AssignTechnicianValue) => {
    if (mode !== "assign") return;

    assignTechnician.mutate(
      { id: props.id, payload },
      {
        onSuccess: (data) => {
          appToast.success(data.message);
          if (mode === "assign") props.onClose();
        },

        onError: (err) => {
          appToast.error(getErrorMessage(err));
        },
      },
    );
  };

  const handleResolve = async (payload: ResolveValues) => {
    if (mode !== "resolve") return;
    const { rootCause, action, remarks } = payload;

    try {
      await createAction.mutateAsync({
        id: props.id,
        payload: {
          action,
          remarks,
        },
      });

      await resolveBreakdown.mutateAsync({
        id: props.id,
        payload: {
          rootCause,
        },
      });

      appToast.success("Breakdown resolved successfully");
      props.onClose();
    } catch (err) {
      appToast.error(getErrorMessage(err));
    }
  };

  const isResolving = resolveBreakdown.isPending || createAction.isPending;

  return (
    <form
      noValidate
      className="flex flex-col max-h-[90vh]"
      onSubmit={
        isCreateMode
          ? form.handleSubmit(handleCreate)
          : isAssignMode
            ? assignForm.handleSubmit(handleAssign)
            : isResolveMode
              ? resolveForm.handleSubmit(handleResolve)
              : undefined
      }
    >
      <DialogHeader className="shrink-0">
        <DialogTitle>{title}</DialogTitle>

        <DialogDescription>{description}</DialogDescription>
      </DialogHeader>

      <FieldGroup className="flex-1 overflow-y-auto p-5">
        {mode === "view" ? (
          <>View Mode</>
        ) : mode === "assign" ? (
          <AssignTechnician users={users} isUsers={isUsers} form={assignForm} />
        ) : mode === "resolve" ? (
          <ResolveBreakdown form={resolveForm} />
        ) : (
          <BreakdownFields
            form={form}
            equipments={equipments}
            breakdownSeverity={breakdownSeverity}
            isEquipment={isEquipment}
            isMeta={isMeta}
            isDisabled={createBreakdown.isPending}
          />
        )}
      </FieldGroup>

      <DialogFooter>
        <DialogClose
          className={"mr-3"}
          disabled={
            createBreakdown.isPending ||
            assignTechnician.isPending ||
            !isResolving
          }
        >
          {BREAKDOWN_FORM_CONTENT.CANCEL_BUTTON}
        </DialogClose>

        {isCreateMode ? (
          <Button type="submit" disabled={createBreakdown.isPending}>
            {createBreakdown.isPending ? (
              <LoaderCircle
                aria-hidden="true"
                className="size-4 animate-spin"
              />
            ) : (
              <CircleAlert aria-hidden="true" className="size-4" />
            )}
            {BREAKDOWN_FORM_CONTENT.CREATE_BUTTON}
          </Button>
        ) : isAssignMode ? (
          <Button type="submit" disabled={assignTechnician.isPending}>
            {assignTechnician.isPending ? (
              <LoaderCircle
                aria-hidden="true"
                className="size-4 animate-spin"
              />
            ) : (
              <UserRoundPlus aria-hidden="true" className="size-4" />
            )}
            {BREAKDOWN_FORM_CONTENT.ASSIGN_BUTTON}
          </Button>
        ) : isResolveMode ? (
          <Button
            type="submit"
            disabled={isResolving}
            className={"bg-success hover:bg-success"}
          >
            {isResolving ? (
              <LoaderCircle
                aria-hidden="true"
                className="size-4 animate-spin"
              />
            ) : (
              <CircleCheck aria-hidden="true" className="size-4" />
            )}
            {BREAKDOWN_FORM_CONTENT.RESOLVE_BUTTON}
          </Button>
        ) : null}
      </DialogFooter>
    </form>
  );
}
