import {
  Field,
  FieldContent,
  FieldError,
  FieldLabel,
  SearchSelect,
  Skeleton,
} from "@/components/ui";
import { DropDown } from "@/types";
import { UserRound } from "lucide-react";
import { Controller, UseFormReturn } from "react-hook-form";
import { AssignTechnicianValue } from "../schema/assign-technician.schema";
import { BREAKDOWN_FORM_CONTENT } from "../constants/breakdown.constant";

interface AssignTechnicianProps {
  users: DropDown[];
  isUsers: boolean;

  form: UseFormReturn<AssignTechnicianValue>;
}

export function AssignTechnician({
  users,
  isUsers,
  form,
}: AssignTechnicianProps) {
  return (
    <div>
      <Field>
        <FieldContent className="gap-1">
          <FieldLabel className="gap-1">
            <UserRound aria-hidden="true" className="size-4" />
            {BREAKDOWN_FORM_CONTENT.ASSIGN_TECHNICIAN_LABEL}
          </FieldLabel>

          {isUsers ? (
            <Skeleton className="h-10" />
          ) : (
            <Controller
              control={form.control}
              name="assignedTo"
              render={({ field }) => (
                <SearchSelect
                  options={users}
                  value={field.value}
                  onValueChange={field.onChange}
                  placeholder={
                    BREAKDOWN_FORM_CONTENT.ASSIGN_TECHNICIAN_PLACEHOLDER
                  }
                  searchPlaceholder={
                    BREAKDOWN_FORM_CONTENT.ASSIGN_TECHNICIAN_SEARCH
                  }
                />
              )}
            />
          )}

          <FieldError errors={[form.formState.errors.assignedTo]} />
        </FieldContent>
      </Field>
    </div>
  );
}
