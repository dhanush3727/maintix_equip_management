import {
  Button,
  Field,
  FieldContent,
  FieldError,
  FieldLabel,
  Input,
  SearchSelect,
  Skeleton,
} from "@/components/ui";
import { CircleCheck, ListPlus, Plus, X } from "lucide-react";
import { CHECKLIST_CONTENT } from "../constants/checklist.constant";
import { Controller, UseFormReturn, useWatch } from "react-hook-form";
import { ChecklistValues } from "../schema/checklist.schema";
import { useState } from "react";

interface SelectTypeProps {
  form: UseFormReturn<ChecklistValues>;
  index: number;
  isChecklist?: boolean;
  disabled?: boolean;
}

export function SelectType({
  form,
  index,
  isChecklist = false,
  disabled = false,
}: SelectTypeProps) {
  const [optionInput, setOptionInput] = useState<string>("");

  const options =
    useWatch({
      control: form.control,
      name: `items.${index}.options`,
    }) || [];

  const handleAddOption = () => {
    const value = optionInput.trim();

    if (!value) return;

    const currentOptions = form.getValues(`items.${index}.options`) ?? [];

    if (currentOptions.includes(value)) return;

    form.setValue(`items.${index}.options`, [...currentOptions, value], {
      shouldValidate: true,
    });

    setOptionInput("");
  };

  const handleRemoveOption = (id: number) => {
    const currentOptions = form.getValues(`items.${index}.options`) ?? [];

    form.setValue(
      `items.${index}.options`,
      currentOptions.filter((_, index) => index !== id),
      {
        shouldValidate: true,
      },
    );
  };
  return (
    <>
      <Field className="col-span-full">
        <FieldLabel htmlFor={`options-${index}`}>
          <ListPlus aria-hidden="true" className="size-4" />
          {CHECKLIST_CONTENT.ITEM_FIELD.OPTIONS_LABEL}
        </FieldLabel>

        <FieldContent>
          {isChecklist ? (
            <Skeleton className="h-10" />
          ) : (
            <div className="flex gap-2">
              <Input
                id={`options-${index}`}
                type="text"
                autoComplete="off"
                value={optionInput}
                disabled={disabled}
                onChange={(e) => setOptionInput(e.target.value)}
                placeholder={CHECKLIST_CONTENT.ITEM_FIELD.OPTIONS_PLACEHOLDER}
              />

              {!disabled && (
                <Button
                  type="button"
                  onClick={handleAddOption}
                  disabled={optionInput === ""}
                >
                  <Plus aria-hidden="true" className="size-4" />
                  {CHECKLIST_CONTENT.ITEM_FIELD.OPTIONS_ADD}
                </Button>
              )}
            </div>
          )}

          <FieldError
            errors={[form.formState.errors.items?.[index]?.options]}
          />

          {isChecklist ? (
            <Skeleton className="h-10" />
          ) : (
            <div className="mt-2 space-y-2">
              {options.map((option, index) => (
                <div
                  key={`${option}-${index}`}
                  className="flex items-center justify-between rounded-md border px-3 py-2"
                >
                  <span>{option}</span>

                  {!disabled && (
                    <Button
                      type="button"
                      variant="ghost"
                      size="icon"
                      onClick={() => handleRemoveOption(index)}
                    >
                      <X aria-hidden="true" className="size-4" />
                    </Button>
                  )}
                </div>
              ))}
            </div>
          )}
        </FieldContent>
      </Field>

      <Field className="col-span-full">
        <FieldLabel htmlFor="expected-value">
          <CircleCheck aria-hidden="true" className="size-4" />
          {CHECKLIST_CONTENT.ITEM_FIELD.EXPECTED_VALUE_LABEL}
        </FieldLabel>

        <FieldContent>
          {options.length > 0 ? (
            <Controller
              control={form.control}
              name={`items.${index}.expectedValue`}
              render={({ field }) => (
                <SearchSelect
                  options={options.map((option) => ({
                    value: option,
                    label: option,
                  }))}
                  value={field.value}
                  onValueChange={field.onChange}
                  disabled={disabled}
                />
              )}
            />
          ) : (
            <Input
              type="text"
              id="expected-value"
              disabled
              placeholder={CHECKLIST_CONTENT.ITEM_FIELD.EXPECTED_VALUE_EMPTY}
            />
          )}
        </FieldContent>

        <FieldError
          errors={[form.formState.errors.items?.[index]?.expectedValue]}
        />
      </Field>
    </>
  );
}
