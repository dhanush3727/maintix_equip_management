import { ChecklistItemType } from "@/types";
import z from "zod";

const checklistItemSchema = z
  .object({
    name: z.string().trim().min(1, "Item name is required"),
    order: z.number().int().min(1),
    type: z.enum(ChecklistItemType, "Select item type"),
    expectedValue: z.string().optional(),
    minValue: z.number().optional(),
    maxValue: z.number().optional(),
    options: z.array(z.string().trim().min(1)).optional(),
  })
  .superRefine((item, ctx) => {
    if (item.type === ChecklistItemType.NUMBER) {
      if (item.minValue === undefined) {
        ctx.addIssue({
          code: "custom",
          path: ["minValue"],
          message: `Minimum value is required for ${item.name}`,
        });
      }

      if (item.maxValue === undefined) {
        ctx.addIssue({
          code: "custom",
          path: ["maxValue"],
          message: `Maximum value is required for ${item.name}`,
        });
      }

      if (
        item.minValue !== undefined &&
        item.maxValue !== undefined &&
        item.minValue > item.maxValue
      ) {
        ctx.addIssue({
          code: "custom",
          path: ["maxValue"],
          message: `Invalid range for item: ${item.name}`,
        });
      }
    }

    if (item.type === ChecklistItemType.SELECT) {
      if (!item.options || item.options.length === 0) {
        ctx.addIssue({
          code: "custom",
          path: ["options"],
          message: `At least one option is required ${item.name}`,
        });
      }

      if (item.expectedValue === undefined) {
        ctx.addIssue({
          code: "custom",
          path: ["expectedValue"],
          message: `Expected value required for ${item.name}`,
        });
      }

      if (item.expectedValue && !item.options?.includes(item.expectedValue)) {
        ctx.addIssue({
          code: "custom",
          path: ["expectedValue"],
          message: `The expected value must have one of the options for item: ${item.name}`,
        });
      }
    }

    if (item.type === ChecklistItemType.BOOLEAN) {
      if (item.expectedValue === undefined) {
        ctx.addIssue({
          code: "custom",
          path: ["expectedValue"],
          message: `Expected value required for ${item.name}`,
        });
      }

      if (
        item.expectedValue &&
        !["true", "false"].includes(item.expectedValue)
      ) {
        ctx.addIssue({
          code: "custom",
          path: ["expectedValue"],
          message: `Invalid expected value for ${item.name}`,
        });
      }
    }
  });

export const checklistSchema = z.object({
  name: z.string().trim().min(1, "name is required"),
  equipmentTypeId: z.number().int().min(1, "Select Equipment type"),
  description: z.string().trim().optional(),
  items: z
    .array(checklistItemSchema)
    .min(1, "At least one checklist item is required"),
});

export type ChecklistValues = z.infer<typeof checklistSchema>;
