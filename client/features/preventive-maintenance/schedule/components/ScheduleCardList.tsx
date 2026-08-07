import {
  Badge,
  Button,
  Card,
  CardContent,
  CardFooter,
  CardHeader,
  CardTitle,
} from "@/components/ui";
import { ScheduleData } from "../types/schedule.type";
import {
  CalendarDays,
  ClipboardList,
  Repeat2,
  SquarePen,
  User,
} from "lucide-react";
import { FrequencyType } from "@/types";
import { formatDate } from "../util/schedule.util";
import { SCHEDULE_CONTENT } from "../constant/schedule.constant";

interface ScheduleCardListProps {
  item: ScheduleData;
  onEdit: (id: number) => void;
}

export function ScheduleCardList({ item, onEdit }: ScheduleCardListProps) {
  return (
    <Card className="transition-shadow hover:shadow-md">
      <CardHeader className="flex flex-row items-start justify-between space-y-0">
        <CardTitle className="line-clamp-2 text-base">
          {item.equipmentName}
        </CardTitle>

        <Badge variant={item.isActive ? "success" : "destructive"}>
          {item.isActive ? "Active" : "Inactive"}
        </Badge>
      </CardHeader>

      <CardContent className="space-y-3">
        <div className="flex items-center gap-2 text-sm text-muted-foreground">
          <ClipboardList className="size-4 shrink-0" />
          <span>{item.template}</span>
        </div>

        <div className="flex items-center gap-2 text-sm text-muted-foreground">
          <User className="size-4 shrink-0" />
          <span>{item.assignedTo}</span>
        </div>

        <div className="flex items-center justify-between gap-3">
          <div className="flex items-center gap-2">
            <Repeat2 className="size-4 text-muted-foreground" />

            <Badge
              variant={
                item.frequencyType === FrequencyType.WEEKLY
                  ? "info"
                  : item.frequencyType === FrequencyType.MONTHLY
                    ? "warning"
                    : item.frequencyType === FrequencyType.YEARLY
                      ? "destructive"
                      : "success"
              }
            >
              {item.frequencyType}
            </Badge>
          </div>
        </div>

        <div className="flex items-center justify-between text-sm">
          <div className="flex items-center gap-2 text-muted-foreground">
            <CalendarDays className="size-4" />
            <span>{SCHEDULE_CONTENT.CARD.START}</span>
          </div>

          <span>{formatDate(item.startDate)}</span>
        </div>

        <div className="flex items-center justify-between text-sm">
          <div className="flex items-center gap-2 text-muted-foreground">
            <CalendarDays className="size-4" />
            <span>{SCHEDULE_CONTENT.CARD.NEXT_DUE}</span>
          </div>

          <span className="font-medium">{formatDate(item.nextDueDate)}</span>
        </div>
      </CardContent>

      <CardFooter className="justify-end border-t pt-4">
        <Button size="sm" variant="outline" onClick={() => onEdit(item.id)}>
          <SquarePen className="mr-2 size-4" />
          {SCHEDULE_CONTENT.BUTTONS.EDIT}
        </Button>
      </CardFooter>
    </Card>
  );
}
