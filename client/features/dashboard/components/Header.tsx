"use client";

import { useAuth } from "@/hooks";
import { getToday } from "../utils/dashboard.util";
import { DASHBOARD_CONTENT } from "../constants/dashboard.constant";
import { Skeleton } from "@/components/ui";
import { Summary } from "../types/dashboard.type";

export interface HeaderProps {
  summary: Summary;
  isDashboard: boolean;
}

export function Header({ summary, isDashboard }: HeaderProps) {
  const { user, isLoading: isUser } = useAuth();
  const { day, month_date, year } = getToday();

  const headerCount = [
    {
      title: DASHBOARD_CONTENT.HEADER_TASK_LABEL,
      count: summary?.todayDue,
    },

    {
      title: DASHBOARD_CONTENT.HEADER_OVERDUE_LABEL,
      count: summary?.overdue,
    },

    {
      title: DASHBOARD_CONTENT.HEADER_BREAKDOWN_LABEL,
      count: summary?.openBreakdown,
    },
  ];

  return (
    <div className="space-y-1">
      <div className="text-sm text-muted-foreground/50 flex gap-3">
        <p>{day.toUpperCase()}</p>
        <p>{month_date.toUpperCase()},</p>
        <p>{year}</p>
      </div>

      <div className="flex gap-1 text-xl font-semibold sm:text-2xl">
        <h1>{DASHBOARD_CONTENT.GREETINGS},</h1>
        {isUser ? (
          <Skeleton className="h-6 w-40 rounded-me" />
        ) : (
          <h1>{user?.name}</h1>
        )}
      </div>

      <div className="flex gap-1 text-xs text-muted-foreground sm:text-sm">
        {isDashboard ? (
          <>
            <Skeleton className="h-5 w-24 rounded-sm" />
            <Skeleton className="h-5 w-20 rounded-sm" />
            <Skeleton className="h-5 w-32 rounded-sm" />
          </>
        ) : (
          headerCount.map((item) => (
            <p key={item.title}>{`${item.count} ${item.title}`}</p>
          ))
        )}
      </div>
    </div>
  );
}
