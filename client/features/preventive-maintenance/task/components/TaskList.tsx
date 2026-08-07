import {
  Badge,
  Button,
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from "@/components/ui";
import { TaskData } from "../types/task.type";
import { TaskStatus } from "@/types";
import {
  CalendarDays,
  CheckCircle2,
  ClipboardList,
  SquarePen,
  User,
  Wrench,
} from "lucide-react";
import { TASK_CONTENT } from "../constant/task.constant";
import { formatStartDate } from "../../schedule/util/schedule.util";

interface TaskListProps {
  item: TaskData;
  onEdit: (id: number) => void;
}

export function TaskList({ item, onEdit }: TaskListProps) {
  return (
    <Card className="flex h-full flex-col transition-all hover:-translate-y-1 hover:shadow-lg">
      <CardHeader className="space-y-4">
        <div className="flex items-start justify-between gap-3">
          <div className="min-w-0">
            <CardTitle className="truncate text-lg">{item.title}</CardTitle>

            <CardDescription className="mt-1 flex items-center gap-1">
              <Wrench className="size-4" />
              {item.equipment}
            </CardDescription>
          </div>

          <div className="flex flex-col items-end gap-2">
            {item.isOverdue && (
              <Badge variant="destructive">{TASK_CONTENT.CARD.OVERDUE}</Badge>
            )}

            <Badge
              variant={
                item.status === TaskStatus.PENDING
                  ? "warning"
                  : item.status === TaskStatus.IN_PROGRESS
                    ? "info"
                    : item.status === TaskStatus.SKIPPED
                      ? "secondary"
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
          <div className="min-w-0 flex items-center gap-2 text-muted-foreground">
            <ClipboardList className="size-4" />
            <span className="font-medium text-foreground">{`${TASK_CONTENT.CARD.TEMPLATE}:`}</span>
            <span className="truncate">{item.template}</span>
          </div>

          <div className="flex items-center gap-2 text-muted-foreground">
            <User className="size-4" />
            <span className="font-medium text-foreground">{`${TASK_CONTENT.CARD.ASSIGNED}:`}</span>
            <span>{item.assignedTo}</span>
          </div>

          <div className="flex items-center gap-2 text-muted-foreground">
            <CalendarDays className="size-4" />
            <span className="font-medium text-foreground">{`${TASK_CONTENT.CARD.DUE}:`}</span>
            <span>{formatStartDate(item.dueDate)}</span>
          </div>

          {item.status === TaskStatus.COMPLETED && item.completedAt && (
            <div className="flex items-center gap-2 text-muted-foreground">
              <CalendarDays className="size-4" />
              <span className="font-medium text-foreground">{`${TASK_CONTENT.CARD.COMPLETED}:`}</span>
              <span>{formatStartDate(item.completedAt)}</span>
            </div>
          )}
        </div>
      </CardContent>

      <CardFooter className="justify-end">
        {item.status === TaskStatus.COMPLETED ? (
          <Button variant="outline" onClick={() => onEdit(item.id)}>
            <SquarePen className="size-4" />
            {TASK_CONTENT.BUTTONS.VIEW}
          </Button>
        ) : item.isComplete ? (
          <Button>
            <CheckCircle2 className="size-4" />
            {TASK_CONTENT.BUTTONS.COMPLETE}
          </Button>
        ) : (
          <Button variant="outline" onClick={() => onEdit(item.id)}>
            <SquarePen className="size-4" />
            {TASK_CONTENT.BUTTONS.EDIT}
          </Button>
        )}
      </CardFooter>
    </Card>
  );
}
