import {
  Badge,
  Button,
  Card,
  CardContent,
  CardHeader,
  CardTitle,
} from "@/components/ui";
import { GetChecklistsData } from "../types/checklist.type";
import { Pencil } from "lucide-react";

interface ChecklistListProps {
  item: GetChecklistsData;
  onEdit: (id: number) => void;
}

export function ChecklistList({ item, onEdit }: ChecklistListProps) {
  return (
    <>
      <Card className="flex h-full flex-col transition-shadow hover:shadow-md">
        <CardHeader className="pb-3">
          <div className="flex items-start justify-between gap-3">
            <div className="min-w-0 space-y-1">
              <CardTitle className="truncate text-base font-semibold">
                {item.name}
              </CardTitle>

              <p className="text-xs font-medium uppercase tracking-wide text-muted-foreground">
                {item.equipmentType}
              </p>
            </div>

            <div className="flex items-center justify-end gap-2">
              <span className="rounded-md border border-border bg-muted px-2 py-1 text-xs font-medium text-muted-foreground">
                V{item.version}
              </span>
              <Button
                type="button"
                variant="ghost"
                size="icon"
                className="size-8 shrink-0 bg-info-light text-info hover:bg-info-light/80"
                onClick={() => onEdit(item.id)}
                aria-label={`Edit ${item.name}`}
              >
                <Pencil aria-hidden="true" className="size-4" />
              </Button>
            </div>
          </div>

          <div className="pt-2">
            <Badge variant={item.isActive ? "success" : "destructive"}>
              {item.isActive ? "Active" : "Inactive"}
            </Badge>
          </div>
        </CardHeader>

        <CardContent className="flex-1">
          <p className="line-clamp-3 text-sm leading-6 text-muted-foreground">
            {item.description}
          </p>
        </CardContent>
      </Card>
    </>
  );
}
