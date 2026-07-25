import { ROUTES } from "@/constants";
import { redirect } from "next/navigation";

export default function SetupPage() {
  return redirect(ROUTES.SETUP_ORGANIZATION);
}
