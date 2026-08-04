"use client";

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
  Textarea,
} from "@/components/ui";
import {
  BOOLEAN_VALUES,
  CHECKLIST_CONTENT,
} from "../constants/checklist.constant";
import { useEquipmentTypeDD } from "@/features/equipment/hooks/equipment-type/useEquipmentTypeDD";
import { Controller, useForm, useWatch } from "react-hook-form";
import { checklistSchema, ChecklistValues } from "../schema/checklist.schema";
import { zodResolver } from "@hookform/resolvers/zod";
import { useCreateChecklist } from "../hooks/useCreateChecklist";
import { appToast, getErrorMessage } from "@/lib";
import {
  AlignLeft,
  ArrowDownToLine,
  ArrowUpToLine,
  CircleCheck,
  ClipboardList,
  FileText,
  ListChecks,
  ListFilter,
  ListPlus,
  ListTodo,
  LoaderCircle,
  Plus,
  Wrench,
  X,
} from "lucide-react";
import { useMeta } from "@/hooks";
import { ChecklistItemType } from "@/types";
import { useState } from "react";

interface CreateChecklistProps {
  onClose: () => void;
}

export function CreateChecklist({ onClose }: CreateChecklistProps) {
  const { data: equipType, isLoading: isEquipType } = useEquipmentTypeDD();
  const { data: meta, isLoading: isMeta } = useMeta();
  const createChecklist = useCreateChecklist();

  const equipTypeDD = equipType?.data ?? [];
  const checklistItemType = meta?.data?.checklistItemType ?? [];

  const [optionInput, setOptionInput] = useState<string>("");

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

  const itemType = useWatch({
    control: form.control,
    name: "items.0.type",
  });

  const options = useWatch({
    control: form.control,
    name: "items.0.options",
  });

  const handleAddOption = () => {
    const value = optionInput.trim();

    if (!value) return;

    const currentOptions = form.getValues("items.0.options") ?? [];

    if (currentOptions.includes(value)) return;

    form.setValue("items.0.options", [...currentOptions, value], {
      shouldValidate: true,
    });

    setOptionInput("");
  };

  const handleRemoveOption = (id: number) => {
    const currentOptions = form.getValues("items.0.options") ?? [];

    form.setValue(
      "items.0.options",
      currentOptions.filter((_, index) => index !== id),
      {
        shouldValidate: true,
      },
    );
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
        <div className="flex gap-1 items-center">
          <ClipboardList aria-hidden="true" className="size-4" />

          <h1 className="font-medium">
            {CHECKLIST_CONTENT.INFORMATION_FIELD.TITLE}
          </h1>
        </div>

        {/* Basic information */}
        <div className="grid gap-3 sm:grid-cols-2">
          <Field>
            <FieldLabel htmlFor="name">
              <FileText aria-hidden="true" className="size-4" />
              {CHECKLIST_CONTENT.INFORMATION_FIELD.NAME_LABEL}
            </FieldLabel>

            <FieldContent>
              <Input
                type="text"
                id="name"
                autoComplete="off"
                placeholder={
                  CHECKLIST_CONTENT.INFORMATION_FIELD.NAME_PLACEHOLDER
                }
                {...form.register("name")}
              />
            </FieldContent>

            <FieldError errors={[form.formState.errors.name]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="type">
              <Wrench aria-hidden="true" className="size-4" />
              {CHECKLIST_CONTENT.INFORMATION_FIELD.TYPE_LABEL}
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
                        CHECKLIST_CONTENT.INFORMATION_FIELD.TYPE_PLACEHOLDER
                      }
                      searchPlaceholder={
                        CHECKLIST_CONTENT.INFORMATION_FIELD.TYPE_SEARCH
                      }
                    />
                  )}
                />
              )}
            </FieldContent>

            <FieldError errors={[form.formState.errors.equipmentTypeId]} />
          </Field>

          <Field className="col-span-full">
            <FieldLabel htmlFor="description">
              <AlignLeft aria-hidden="true" className="size-4" />
              {CHECKLIST_CONTENT.INFORMATION_FIELD.DESCRIPTION_LABEL}
            </FieldLabel>

            <FieldContent>
              <Textarea
                id="description"
                placeholder={
                  CHECKLIST_CONTENT.INFORMATION_FIELD.DESCRIPTION_PLACEHOLDER
                }
                {...form.register("description")}
              />
            </FieldContent>

            <FieldError errors={[form.formState.errors.description]} />
          </Field>
        </div>

        <div className="flex gap-3 items-center">
          <div className="flex gap-1 items-center">
            <ListChecks aria-hidden="true" className="size-4" />
            <h1 className="font-medium">
              {CHECKLIST_CONTENT.ITEM_FIELD.TITLE}
            </h1>
          </div>

          <Button size={"icon"} className={"h-6 w-6 rounded-sm"}>
            <Plus className="size-4" />
          </Button>
        </div>

        <FieldError errors={[form.formState.errors.items]} />

        {/* Checklist items */}
        <div className="grid gap-3 sm:grid-cols-2">
          <Field>
            <FieldLabel htmlFor="item-name">
              <ListTodo aria-hidden="true" className="size-4" />
              {CHECKLIST_CONTENT.ITEM_FIELD.NAME_LABEL}
            </FieldLabel>

            <FieldContent>
              <Input
                id="item-name"
                type="text"
                autoComplete="off"
                placeholder={CHECKLIST_CONTENT.ITEM_FIELD.NAME_PLACEHOLDER}
                {...form.register("items.0.name")}
              />
            </FieldContent>

            <FieldError errors={[form.formState.errors.items?.[0]?.name]} />
          </Field>

          <Field>
            <FieldLabel htmlFor="item-name">
              <ListFilter aria-hidden="true" className="size-4" />
              {CHECKLIST_CONTENT.ITEM_FIELD.TYPE_LABEL}
            </FieldLabel>

            <FieldContent>
              {isMeta ? (
                <Skeleton className="h-10" />
              ) : (
                <Controller
                  control={form.control}
                  name="items.0.type"
                  render={({ field }) => (
                    <SearchSelect
                      options={checklistItemType}
                      value={field.value}
                      onValueChange={field.onChange}
                      placeholder={
                        CHECKLIST_CONTENT.ITEM_FIELD.TYPE_PLACEHOLDER
                      }
                    />
                  )}
                />
              )}
            </FieldContent>

            <FieldError errors={[form.formState.errors.items?.[0]?.type]} />
          </Field>

          {itemType === ChecklistItemType.NUMBER && (
            <>
              <Field>
                <FieldLabel htmlFor="min-value">
                  <ArrowDownToLine aria-hidden="true" className="size-4" />
                  {CHECKLIST_CONTENT.ITEM_FIELD.MIN_VALUE_LABEL}
                </FieldLabel>

                <FieldContent>
                  <Input
                    id="min-value"
                    type="number"
                    autoComplete="off"
                    placeholder={
                      CHECKLIST_CONTENT.ITEM_FIELD.MIN_VALUE_PLACEHOLDER
                    }
                    {...form.register("items.0.minValue", {
                      // Convert the input string to a number while keeping
                      // an empty input as undefined instead of NaN.
                      setValueAs: (value) =>
                        value === "" ? undefined : Number(value),
                    })}
                  />
                </FieldContent>

                <FieldError
                  errors={[form.formState.errors.items?.[0]?.minValue]}
                />
              </Field>

              <Field>
                <FieldLabel htmlFor="max-value">
                  <ArrowUpToLine aria-hidden="true" className="size-4" />
                  {CHECKLIST_CONTENT.ITEM_FIELD.MAX_VALUE_LABEL}
                </FieldLabel>

                <FieldContent>
                  <Input
                    id="max-value"
                    type="number"
                    autoComplete="off"
                    placeholder={
                      CHECKLIST_CONTENT.ITEM_FIELD.MAX_VALUE_PLACEHOLDER
                    }
                    {...form.register("items.0.maxValue", {
                      // Convert the input string to a number while keeping
                      // an empty input as undefined instead of NaN.
                      setValueAs: (value) =>
                        value === "" || value === undefined || value === null
                          ? undefined
                          : Number(value),
                    })}
                  />
                </FieldContent>

                <FieldError
                  errors={[form.formState.errors.items?.[0]?.maxValue]}
                />
              </Field>
            </>
          )}

          {itemType === ChecklistItemType.BOOLEAN && (
            <Field className="col-span-full">
              <FieldLabel htmlFor="expected-value">
                <CircleCheck aria-hidden="true" className="size-4" />
                {CHECKLIST_CONTENT.ITEM_FIELD.EXPECTED_VALUE_LABEL}
              </FieldLabel>

              <FieldContent>
                <Controller
                  control={form.control}
                  name="items.0.expectedValue"
                  render={({ field }) => (
                    <SearchSelect
                      options={BOOLEAN_VALUES}
                      value={field.value}
                      onValueChange={field.onChange}
                    />
                  )}
                />
              </FieldContent>

              <FieldError
                errors={[form.formState.errors.items?.[0]?.expectedValue]}
              />
            </Field>
          )}

          {itemType === ChecklistItemType.SELECT && (
            <>
              <Field className="col-span-full">
                <FieldLabel htmlFor="options">
                  <ListPlus aria-hidden="true" className="size-4" />
                  {CHECKLIST_CONTENT.ITEM_FIELD.OPTIONS_LABEL}
                </FieldLabel>

                <FieldContent>
                  <div className="flex gap-2">
                    <Input
                      id="options"
                      type="text"
                      autoComplete="off"
                      value={optionInput}
                      onChange={(event) => setOptionInput(event.target.value)}
                      placeholder={
                        CHECKLIST_CONTENT.ITEM_FIELD.OPTIONS_PLACEHOLDER
                      }
                    />

                    <Button
                      type="button"
                      onClick={handleAddOption}
                      disabled={optionInput === ""}
                    >
                      <Plus aria-hidden="true" className="size-4" />
                      Add
                    </Button>
                  </div>

                  <FieldError
                    errors={[form.formState.errors.items?.[0]?.options]}
                  />

                  <div className="mt-2 space-y-2">
                    {(options ?? []).map((option, index) => (
                      <div
                        key={`${option}-${index}`}
                        className="flex items-center justify-between rounded-md border px-3 py-2"
                      >
                        <span>{option}</span>

                        <Button
                          type="button"
                          variant="ghost"
                          size="icon"
                          onClick={() => handleRemoveOption(index)}
                        >
                          <X aria-hidden="true" className="size-4" />
                        </Button>
                      </div>
                    ))}
                  </div>
                </FieldContent>
              </Field>

              <Field className="col-span-full">
                <FieldLabel htmlFor="expected-value">
                  <CircleCheck aria-hidden="true" className="size-4" />
                  {CHECKLIST_CONTENT.ITEM_FIELD.EXPECTED_VALUE_LABEL}
                </FieldLabel>

                <FieldContent>
                  <Input
                    type="text"
                    id="expected-value"
                    autoComplete="off"
                    placeholder={
                      CHECKLIST_CONTENT.ITEM_FIELD.EXPECTED_VALUE_PLACEHOLDER
                    }
                  />
                </FieldContent>

                <FieldError
                  errors={[form.formState.errors.items?.[0]?.expectedValue]}
                />
              </Field>
            </>
          )}
        </div>
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
