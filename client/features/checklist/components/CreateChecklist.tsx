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
import { CHECKLIST_CONTENT } from "../constants/checklist.constant";
import { useEquipmentTypeDD } from "@/features/equipment/hooks/equipment-type/useEquipmentTypeDD";
import { useFieldArray, useForm } from "react-hook-form";
import { checklistSchema, ChecklistValues } from "../schema/checklist.schema";
import { zodResolver } from "@hookform/resolvers/zod";
import { useCreateChecklist } from "../hooks/useCreateChecklist";
import { appToast, getErrorMessage } from "@/lib";
import { ListChecks, LoaderCircle, Plus } from "lucide-react";
import { useMeta } from "@/hooks";
import { ChecklistInformation } from "./ChecklistInformation";
import { ChecklistItem } from "./ChecklistItem";
import { ChecklistItemType } from "@/types";

interface CreateChecklistProps {
  onClose: () => void;
}

export function CreateChecklist({ onClose }: CreateChecklistProps) {
  const { data: equipType, isLoading: isEquipType } = useEquipmentTypeDD();
  const { data: meta, isLoading: isMeta } = useMeta();
  const createChecklist = useCreateChecklist();

  const equipTypeDD = equipType?.data ?? [];
  const checklistItemType = meta?.data?.checklistItemType ?? [];

  const form = useForm<ChecklistValues>({
    resolver: zodResolver(checklistSchema),
    defaultValues: {
      name: "",
      equipmentTypeId: 0,
      description: "",
      items: [
        {
          name: "",
          order: 1,
          type: undefined,
          expectedValue: undefined,
          minValue: undefined,
          maxValue: undefined,
          options: undefined,
        },
      ],
    },
  });

  const {
    fields: itemFields,
    append: appendItem,
    remove: removeItem,
  } = useFieldArray({
    control: form.control,
    name: "items",
  });

  const onAddItem = () => {
    appendItem({
      name: "",
      order: itemFields.length + 1,
      type: ChecklistItemType.TEXT,
      expectedValue: undefined,
      minValue: undefined,
      maxValue: undefined,
      options: undefined,
    });
  };

  // To create a different sequencial order based on index
  const handleRemoveItem = (index: number) => {
    removeItem(index);

    const reminingItem = form.getValues("items");

    reminingItem.forEach((_, i) => {
      form.setValue(`items.${index}.order`, i + 1);
    });
  };

  const onSubmit = (payload: ChecklistValues) => {
    console.log(payload);
    createChecklist.mutate(payload, {
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
        <DialogTitle>{CHECKLIST_CONTENT.CREATE.TITLE}</DialogTitle>
        <DialogDescription>
          {CHECKLIST_CONTENT.CREATE.DESCRIPTION}
        </DialogDescription>
      </DialogHeader>

      <FieldGroup className="flex-1 overflow-y-auto p-5">
        {/* Basic information */}
        <ChecklistInformation
          form={form}
          isEquipType={isEquipType}
          equipTypeDD={equipTypeDD}
        />

        <div className="flex gap-3 items-center">
          <div className="flex gap-1 items-center">
            <ListChecks aria-hidden="true" className="size-4" />
            <h1 className="font-medium">
              {CHECKLIST_CONTENT.ITEM_FIELD.TITLE}
            </h1>
          </div>

          <Button
            size={"icon"}
            className={"h-6 w-6 rounded-sm"}
            onClick={onAddItem}
          >
            <Plus className="size-4" />
          </Button>
        </div>

        {/* Checklist items */}
        {itemFields.map((item, index) => (
          <ChecklistItem
            key={item.id}
            form={form}
            isMeta={isMeta}
            checklistItemType={checklistItemType}
            index={index}
            canRemove={itemFields.length > 1}
            onRemoveItem={handleRemoveItem}
          />
        ))}
      </FieldGroup>

      <DialogFooter>
        <DialogClose className={"mr-3"} disabled={createChecklist.isPending}>
          {CHECKLIST_CONTENT.BUTTON.CANCEL}
        </DialogClose>

        <Button type="submit" disabled={createChecklist.isPending}>
          {createChecklist.isPending ? (
            <LoaderCircle aria-hidden="true" className="size-4 animate-spin" />
          ) : (
            <Plus aria-hidden="true" className="size-4" />
          )}
          {CHECKLIST_CONTENT.BUTTON.CREATE}
        </Button>
      </DialogFooter>
    </form>
  );
}
