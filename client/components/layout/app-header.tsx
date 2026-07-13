import { Bell } from "lucide-react";
import {
  Separator,
  SidebarTrigger,
  Tooltip,
  TooltipContent,
  TooltipTrigger,
} from "../ui";

export function AppHeader() {
  return (
    <div className="bg-background shadow-xs sticky top-0">
      <div className="flex p-2 justify-between">
        <div>
          <SidebarTrigger />
        </div>

        <Tooltip>
          <TooltipTrigger>
            <div className="p-2 rounded-md hover:bg-secondary">
              <Bell />
            </div>
          </TooltipTrigger>
          <TooltipContent>
            <p>Notification</p>
          </TooltipContent>
        </Tooltip>
      </div>
      <Separator />
    </div>
  );
}
