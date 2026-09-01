import {
  Badge,
  Card,
  CardContent,
  CardHeader,
  CardTitle,
  Field,
  FieldContent,
  FieldLabel,
  Skeleton,
  Textarea,
} from "@/components/ui";
import { BreakdownDataById } from "../types/breakdown.type";
import {
  AlertTriangle,
  CalendarDays,
  ClipboardPenLine,
  FileText,
  MessageSquareText,
  User,
  UserRound,
  Wrench,
} from "lucide-react";
import { BREAKDOWN_FORM_CONTENT } from "../constants/breakdown.constant";
import { BreakdownSeverity, BreakdownStatus } from "@/types";
import { formatDate } from "@/lib";

interface BreakdownDetailsProps {
  breakdown?: BreakdownDataById;
  isBreakdown: boolean;
}

export function BreakdownDetails({
  breakdown,
  isBreakdown,
}: BreakdownDetailsProps) {
  if (isBreakdown) {
    return <BreakdownDetailsSkeleton />;
  }

  if (!breakdown) {
    return (
      <div className="py-8 text-center text-sm text-muted-foreground">
        Failed to load breakdown details.
      </div>
    );
  }

  return (
    <div className="grid gap-5">
      {/* Basic Information */}
      <Card>
        <CardHeader>
          <div className="flex items-start justify-between gap-4">
            <div className="min-w-0 space-y-1">
              <CardTitle className="flex items-center gap-2 text-lg">
                <ClipboardPenLine
                  aria-hidden="true"
                  className="size-5 shrink-0"
                />
                <span className="truncate">{breakdown.title}</span>
              </CardTitle>

              <div className="flex items-center gap-2 text-sm text-muted-foreground">
                <Wrench aria-hidden="true" className="size-4" />
                <span>{breakdown.equipment.label}</span>
              </div>
            </div>

            <div className="flex shrink-0 flex-wrap justify-end gap-2">
              <Badge
                variant={
                  breakdown.severity === BreakdownSeverity.CRITICAL
                    ? "destructive"
                    : breakdown.severity === BreakdownSeverity.HIGH
                      ? "warning"
                      : breakdown.severity === BreakdownSeverity.MEDIUM
                        ? "info"
                        : "secondary"
                }
              >
                {breakdown.severity}
              </Badge>

              <Badge
                variant={
                  breakdown.status === BreakdownStatus.OPEN
                    ? "destructive"
                    : breakdown.status === BreakdownStatus.IN_PROGRESS
                      ? "warning"
                      : breakdown.status === BreakdownStatus.RESOLVED
                        ? "success"
                        : "secondary"
                }
              >
                {breakdown.status}
              </Badge>
            </div>
          </div>
        </CardHeader>

        <CardContent>
          <div className="grid gap-3 text-sm sm:grid-cols-2">
            <DetailItem
              icon={UserRound}
              label="Reported By"
              value={breakdown.reportedBy}
            />

            <DetailItem
              icon={User}
              label="Assigned To"
              value={breakdown.assignedTo.label ?? "Unassigned"}
            />

            <DetailItem
              icon={CalendarDays}
              label="Reported At"
              value={formatDate(breakdown.reportedAt)}
            />

            {breakdown.resolvedAt && (
              <DetailItem
                icon={CalendarDays}
                label="Resolved At"
                value={formatDate(breakdown.resolvedAt)}
              />
            )}
          </div>
        </CardContent>
      </Card>

      {/* Description */}
      {breakdown.description && (
        <DetailField
          icon={FileText}
          label={BREAKDOWN_FORM_CONTENT.DESCRIPTION_LABEL}
          value={breakdown.description}
        />
      )}

      {/* Root Cause */}
      {breakdown.rootCause && (
        <DetailField
          icon={AlertTriangle}
          label={BREAKDOWN_FORM_CONTENT.ROOTCAUSE_LABEL}
          value={breakdown.rootCause}
        />
      )}

      {/* Actions */}
      {breakdown.actions?.length > 0 &&
        breakdown.actions.map((action) => (
          <div key={action.id} className="flex flex-col gap-4">
            <DetailField
              icon={Wrench}
              label={BREAKDOWN_FORM_CONTENT.ACTION_LABEL}
              value={action.action}
            />

            {action.remarks && (
              <DetailField
                icon={MessageSquareText}
                label={BREAKDOWN_FORM_CONTENT.REMARKS_LABEL}
                value={action.remarks}
              />
            )}
          </div>
        ))}
    </div>
  );
}

interface DetailItemProps {
  icon: React.ComponentType<{ className?: string }>;
  label: string;
  value: string;
}

function DetailItem({ icon: Icon, label, value }: DetailItemProps) {
  return (
    <div className="flex items-center gap-2 text-muted-foreground">
      <Icon aria-hidden="true" className="size-4 shrink-0" />

      <span className="font-medium text-foreground">{label}:</span>

      <span className="truncate">{value}</span>
    </div>
  );
}

interface DetailFieldProps {
  icon: React.ComponentType<{ className?: string }>;
  label: string;
  value: string;
}

function DetailField({ icon: Icon, label, value }: DetailFieldProps) {
  return (
    <Field>
      <FieldContent className="gap-1">
        <FieldLabel className="gap-1">
          <Icon aria-hidden="true" className="size-4" />
          {label}
        </FieldLabel>

        <Textarea value={value} disabled readOnly className="resize-none" />
      </FieldContent>
    </Field>
  );
}

function BreakdownDetailsSkeleton() {
  return (
    <div className="grid gap-5">
      <Card>
        <CardHeader>
          <div className="flex items-start justify-between gap-4">
            <div className="space-y-2">
              <Skeleton className="h-6 w-48" />
              <Skeleton className="h-4 w-32" />
            </div>

            <div className="flex gap-2">
              <Skeleton className="h-6 w-20" />
              <Skeleton className="h-6 w-20" />
            </div>
          </div>
        </CardHeader>

        <CardContent>
          <div className="grid gap-3 sm:grid-cols-2">
            <Skeleton className="h-5 w-40" />
            <Skeleton className="h-5 w-40" />
            <Skeleton className="h-5 w-40" />
            <Skeleton className="h-5 w-40" />
          </div>
        </CardContent>
      </Card>

      <div className="space-y-2">
        <Skeleton className="h-5 w-28" />
        <Skeleton className="h-24 w-full" />
      </div>

      <div className="space-y-2">
        <Skeleton className="h-5 w-28" />
        <Skeleton className="h-24 w-full" />
      </div>
    </div>
  );
}
