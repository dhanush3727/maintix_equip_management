import {
  Badge,
  Button,
  Card,
  CardContent,
  CardFooter,
  CardHeader,
  CardTitle,
} from "@/components/ui";
import { CalendarDays, SquarePen, User, UserRound, Wrench } from "lucide-react";
import { BreakdownData } from "../types/breakdown.type";
import { BREAKDOWN_CARD_CONTENT } from "../constants/breakdown.constant";
import { BreakdownSeverity, BreakdownStatus } from "@/types";
import { formatDate } from "@/lib";

interface BreakdownListProps {
  item: BreakdownData;
  //   onEdit: (id: number) => void;
}

export function BreakdownList({ item }: BreakdownListProps) {
  return (
    <Card className="flex h-full flex-col transition-all hover:-translate-y-1 hover:shadow-lg">
      <CardHeader className="space-y-4">
        <div className="flex items-start justify-between gap-3">
          <div className="min-w-0">
            <CardTitle className="truncate text-lg">{item.title}</CardTitle>

            <div className="mt-1 flex items-center gap-1 text-sm text-muted-foreground">
              <Wrench aria-hidden="true" className="size-4" />
              <span className="truncate">{item.equipment}</span>
            </div>
          </div>

          <div className="flex flex-col items-end gap-2">
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
        </div>
      </CardHeader>

      <CardContent className="flex-1 space-y-4">
        <div className="grid gap-3 text-sm">
          <div className="flex items-center gap-2 text-muted-foreground">
            <UserRound aria-hidden="true" className="size-4" />
            <span className="font-medium text-foreground">
              {BREAKDOWN_CARD_CONTENT.REPORTED_BY}:
            </span>
            <span className="truncate">{item.reportedBy}</span>
          </div>

          <div className="flex items-center gap-2 text-muted-foreground">
            <User aria-hidden="true" className="size-4" />
            <span className="font-medium text-foreground">
              {BREAKDOWN_CARD_CONTENT.ASSIGNED_TO}:
            </span>
            <span className="truncate">
              {item.assignedTo ?? BREAKDOWN_CARD_CONTENT.UNASSIGNED}
            </span>
          </div>

          <div className="flex items-center gap-2 text-muted-foreground">
            <CalendarDays aria-hidden="true" className="size-4" />
            <span className="font-medium text-foreground">
              {BREAKDOWN_CARD_CONTENT.REPORTED_AT}:
            </span>
            <span>{formatDate(item.reportedAt)}</span>
          </div>
        </div>
      </CardContent>

      <CardFooter className="justify-end">
        <Button variant="outline">
          <SquarePen aria-hidden="true" className="size-4" />
          {BREAKDOWN_CARD_CONTENT.UPDATE}
        </Button>
      </CardFooter>
    </Card>
  );
}
