import {
  Button,
  Loading,
  Separator,
  Tooltip,
  TooltipContent,
  TooltipTrigger,
} from "@/components/ui";
import { DASHBOARD_CONTENT } from "../constants/dashboard.constant";
import { RecentBreakdowns } from "../types/dashboard.type";
import { ArrowRight } from "lucide-react";
import { useRouter } from "next/navigation";
import { ROUTES } from "@/constants";
import { cn } from "@/lib";
import { BreakdownSeverity, BreakdownStatus } from "@/types";

export interface RecentBreakdownListProps {
  breakdowns: RecentBreakdowns[];
  isDashboard: boolean;
}

export function RecentBreakdownList({
  breakdowns,
  isDashboard,
}: RecentBreakdownListProps) {
  const router = useRouter();

  const hasData = breakdowns.length !== 0;

  return (
    <div className="flex-1 space-y-2">
      <div className="flex justify-between items-center">
        <p className="text-sm font-semibold text-muted-foreground/50">
          {DASHBOARD_CONTENT.RECENT_BREAKDOWN_TITLE}
        </p>

        <Button
          variant={"ghost"}
          className={"text-primary"}
          onClick={() => router.push(ROUTES.BREAKDOWN)}
        >
          {DASHBOARD_CONTENT.RECENT_BREAKDOWN_BUTTON}
          <ArrowRight className="size-4" />
        </Button>
      </div>

      {isDashboard ? (
        <div className="flex justify-center">
          <Loading />
        </div>
      ) : hasData ? (
        <div className="space-y-4">
          {breakdowns.slice(0, 3).map((breakdown) => (
            <div key={breakdown.id}>
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-2">
                  <Tooltip>
                    <TooltipTrigger>
                      <div
                        className={cn(
                          "w-3 h-3 rounded-full",
                          breakdown.severity === BreakdownSeverity.CRITICAL
                            ? "bg-danger"
                            : breakdown.severity === BreakdownSeverity.HIGH
                              ? "bg-primary"
                              : breakdown.severity === BreakdownSeverity.MEDIUM
                                ? "bg-warning"
                                : "bg-info",
                        )}
                      />
                    </TooltipTrigger>

                    <TooltipContent>{breakdown.severity}</TooltipContent>
                  </Tooltip>

                  <p className="text-sm font-medium">{breakdown.equipment}</p>
                </div>

                <p
                  className={cn(
                    "text-xs",
                    breakdown.status === BreakdownStatus.OPEN
                      ? "text-danger"
                      : breakdown.status === BreakdownStatus.IN_PROGRESS
                        ? "text-primary"
                        : breakdown.status === BreakdownStatus.RESOLVED
                          ? "text-info"
                          : "text-success",
                  )}
                >
                  {breakdown.status}
                </p>
              </div>

              <Separator className="mt-4" />
            </div>
          ))}
        </div>
      ) : (
        <div className="flex h-full items-center justify-center text-sm text-muted-foreground pb-6">
          {DASHBOARD_CONTENT.NO_DATA}
        </div>
      )}
    </div>
  );
}
