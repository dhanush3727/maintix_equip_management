"use client";

import { useAuth } from "@/hooks";
import { useGetDashboard } from "../hooks/useGetDashboard";
import { getToday } from "../utils/dashboard.util";
import { DASHBOARD_CONTENT } from "../constants/dashboard.constant";
import { Separator, Skeleton } from "@/components/ui";

export function Dashboard() {
  const { data: dashboard, isLoading: isDashboard } = useGetDashboard();
  const { user, isLoading: isUser } = useAuth();
  const { day, month_date, year } = getToday();

  const summary = dashboard?.data?.summary;

  const headerCount = [
    {
      title:
        summary?.todayDue === 0
          ? DASHBOARD_CONTENT.HEADER_NO_TASK_LABEL
          : DASHBOARD_CONTENT.HEADER_TASK_LABEL,
      count: summary?.todayDue,
    },

    {
      title:
        summary?.overdue === 0
          ? DASHBOARD_CONTENT.HEADER_NO_OVERDUE_LABEL
          : DASHBOARD_CONTENT.HEADER_OVERDUE_LABEL,
      count: summary?.overdue,
    },

    {
      title:
        summary?.openBreakdown === 0
          ? DASHBOARD_CONTENT.HEADER_NO_BREAKDOWN_LABEL
          : DASHBOARD_CONTENT.HEADER_BREAKDOWN_LABEL,
      count: summary?.openBreakdown,
    },
  ];

  const summaryCount = [
    {
      title: 
    }
  ]

  return (
    <div className="space-y-6">
      <div>
        <div className="space-y-1">
          <div className="text-sm text-muted-foreground/50 flex gap-3">
            <p>{day.toUpperCase()}</p>
            <p>{month_date.toUpperCase()},</p>
            <p>{year}</p>
          </div>

          <div className="flex gap-1 text-2xl font-semibold">
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
                <p key={item.title}>
                  {item.count === 0
                    ? item.title
                    : `${item.count} ${item.title}`}
                </p>
              ))
            )}
          </div>
        </div>
      </div>
      <Separator className={"border"} />
    </div>
  );
}
