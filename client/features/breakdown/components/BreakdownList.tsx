import {
  Badge,
  Button,
  Card,
  CardContent,
  CardHeader,
  CardTitle,
  Popover,
  PopoverContent,
  PopoverTrigger,
} from "@/components/ui";
import {
  CalendarDays,
  CircleCheck,
  EllipsisVertical,
  Eye,
  User,
  UserRound,
  UserRoundPlus,
  Wrench,
} from "lucide-react";
import { BreakdownData } from "../types/breakdown.type";
import { BREAKDOWN_CARD_CONTENT } from "../constants/breakdown.constant";
import { BreakdownSeverity, BreakdownStatus } from "@/types";
import { formatDate } from "@/lib";

interface BreakdownListProps {
  item: BreakdownData;
  onView: (id: number) => void;
  onAssign: (id: number) => void;
  onResolve: (id: number) => void;
  isManager?: boolean;
  technicianId?: number;
}

export function BreakdownList({
  item,
  onView,
  onAssign,
  onResolve,
  isManager,
  technicianId,
}: BreakdownListProps) {
  return (
    <Card className="flex h-full flex-col transition-all hover:-translate-y-1 hover:shadow-lg">
      <CardHeader className="space-y-4">
        <div className="flex items-start justify-between gap-3">
          <div className="min-w-0 space-y-1">
            <CardTitle className="truncate text-lg">{item.title}</CardTitle>

            <div className="flex items-center gap-1.5 text-sm text-muted-foreground">
              <Wrench aria-hidden="true" className="size-4 shrink-0" />
              <span className="truncate">{item.equipment}</span>
            </div>
          </div>

          <Popover>
            <PopoverTrigger
              render={
                <button
                  type="button"
                  className="shrink-0 rounded-md p-1.5 text-muted-foreground transition-colors hover:bg-muted hover:text-foreground"
                  aria-label="More actions"
                >
                  <EllipsisVertical aria-hidden="true" className="size-5" />
                </button>
              }
            />

            <PopoverContent align="end" className={"w-48"}>
              <div className="flex flex-col">
                <Button
                  variant="ghost"
                  onClick={() => onView(item.id)}
                  className="justify-start gap-2"
                >
                  <Eye aria-hidden="true" className="size-4" />
                  {BREAKDOWN_CARD_CONTENT.VIEW}
                </Button>

                {item.status === BreakdownStatus.OPEN && isManager && (
                  <Button
                    variant="ghost"
                    onClick={() => onAssign(item.id)}
                    className="justify-start gap-2"
                  >
                    <UserRoundPlus aria-hidden="true" className="size-4" />
                    {BREAKDOWN_CARD_CONTENT.ASSIGN_TECHNICIAN}
                  </Button>
                )}

                {item.status === BreakdownStatus.IN_PROGRESS &&
                  item.assignedToById === technicianId && (
                    <Button
                      variant="ghost"
                      onClick={() => onResolve(item.id)}
                      className="justify-start gap-2"
                    >
                      <CircleCheck aria-hidden="true" className="size-4" />
                      {BREAKDOWN_CARD_CONTENT.RESOLVE}
                    </Button>
                  )}
              </div>
            </PopoverContent>
          </Popover>
        </div>
      </CardHeader>

      <CardContent className="flex-1 space-y-5">
        <div className="flex flex-wrap items-center gap-2">
          <Badge
            variant={
              item.severity === BreakdownSeverity.CRITICAL
                ? "destructive"
                : item.severity === BreakdownSeverity.HIGH
                  ? "warning"
                  : item.severity === BreakdownSeverity.MEDIUM
                    ? "info"
                    : "secondary"
            }
          >
            {item.severity}
          </Badge>

          <Badge
            variant={
              item.status === BreakdownStatus.OPEN
                ? "destructive"
                : item.status === BreakdownStatus.IN_PROGRESS
                  ? "warning"
                  : item.status === BreakdownStatus.RESOLVED
                    ? "info"
                    : "success"
            }
          >
            {item.status}
          </Badge>
        </div>

        {/* Breakdown Details */}
        <div className="grid gap-3 text-sm">
          <div className="flex items-center gap-2 text-muted-foreground">
            <UserRound aria-hidden="true" className="size-4 shrink-0" />

            <span className="font-medium text-foreground">
              {BREAKDOWN_CARD_CONTENT.REPORTED_BY}:
            </span>

            <span className="truncate">{item.reportedBy}</span>
          </div>

          <div className="flex items-center gap-2 text-muted-foreground">
            <User aria-hidden="true" className="size-4 shrink-0" />

            <span className="font-medium text-foreground">
              {BREAKDOWN_CARD_CONTENT.ASSIGNED_TO}:
            </span>

            <span className="truncate">
              {item.assignedTo ?? BREAKDOWN_CARD_CONTENT.UNASSIGNED}
            </span>
          </div>

          <div className="flex items-center gap-2 text-muted-foreground">
            <CalendarDays aria-hidden="true" className="size-4 shrink-0" />

            <span className="font-medium text-foreground">
              {BREAKDOWN_CARD_CONTENT.REPORTED_AT}:
            </span>

            <span>{formatDate(item.reportedAt)}</span>
          </div>
        </div>
      </CardContent>
    </Card>
  );
}
