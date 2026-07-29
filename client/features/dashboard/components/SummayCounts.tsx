"use client";

import { Skeleton } from "@/components/ui";
import { Summary } from "../types/dashboard.type";
import { cn } from "@/lib";
import { DASHBOARD_CONTENT } from "../constants/dashboard.constant";

export interface SummaryCountsProps {
  summary: Summary;
  isDashboard: boolean;
}

export function SummaryCounts({ summary, isDashboard }: SummaryCountsProps) {
  const summaryCount = [
    {
      title: DASHBOARD_CONTENT.SUMMARY_EQUIPMENT_LABEL,
      count: summary?.totalEquipment,
    },
    {
      title: DASHBOARD_CONTENT.SUMMARY_TASK_LABEL,
      count: summary?.todayDue,
    },
    {
      title: DASHBOARD_CONTENT.SUMMARY_OVERDUE_LABEL,
      count: summary?.overdue,
    },
    {
      title: DASHBOARD_CONTENT.SUMMARY_BREAKDOWN_LABEL,
      count: summary?.openBreakdown,
    },
  ];

  return (
    <div className="grid grid-cols-2 md:grid-cols-4">
      {isDashboard
        ? Array.from({ length: 4 }).map((_, i) => (
            <div key={i} className="space-y-1">
              <Skeleton className="size-10" />
              <Skeleton className="h-5 w-24" />
            </div>
          ))
        : summaryCount.map((item) => (
            <div
              key={item.title}
              className={cn(
                item.title === DASHBOARD_CONTENT.SUMMARY_OVERDUE_LABEL &&
                  "text-danger",
              )}
            >
              <p className="text-3xl font-bold">{item.count}</p>

              <p className="text-xs font-medium">{item.title}</p>
            </div>
          ))}
    </div>
  );
}
