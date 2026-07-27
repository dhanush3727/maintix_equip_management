import { CompanySize, IndustryType } from "@/types";
import z from "zod";

export const organizationSchema = z.object({
  industryType: z.enum(IndustryType, "Select industry type"),
  companySize: z.enum(CompanySize, "Select organization type"),
  country: z.string().min(1, "Enter country").trim(),
  city: z.string().min(1, "Enter city").trim(),
  logo: z
    .instanceof(File, {
      message: "Please upload an organization logo",
    })
    .refine(
      (file) => ["image/png", "image/jpg", "image/svg+xml"].includes(file.type),
      "Only PNG, JPG, and SVG files are allowed.",
    ),
});

export type OrganizationFormValues = z.infer<typeof organizationSchema>;
