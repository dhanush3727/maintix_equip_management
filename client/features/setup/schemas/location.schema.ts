import { LocationType } from "@/types";
import z from "zod";

export const locationSchema = z.object({
  name: z.string().min(1, "Enter location name").trim(),
  type: z.enum(LocationType, "Select location tye"),
  address: z.string().min(1, "Enter location address"),
});

export type LocationValues = z.infer<typeof locationSchema>;
