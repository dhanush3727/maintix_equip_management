"use client";

import { useGetDashboard } from "../hooks/useGetDashboard";
import {
  DEFAULT_BREAKDOWN_PRIORITY,
  DEFAULT_BREAKDOWN_TREND,
  DEFAULT_EQUIPMENT_STATUS,
  DEFAULT_PM_TASK_COMPLETION,
  DEFAULT_SUMMARY,
  DEFAULT_TODAY_TASK,
} from "../constants/dashboard.constant";
import { Separator } from "@/components/ui";
import { Header } from "./Header";
import { SummaryCounts } from "./SummayCounts";
import { EquipmentStatusChart } from "./EquipmentStatusChart";
import { BreakdownTrendChart } from "./BreakdownTrendChart";
import { PmCompletionChart } from "./PmCompletionChart";
import { BreakdownPriorityChart } from "./BreakdownPriorityChart";
import { TodayTasksList } from "./TodayTasksList";

export function Dashboard() {
  const { data: dashboard, isLoading: isDashboard } = useGetDashboard();

  const summary = dashboard?.data?.summary ?? DEFAULT_SUMMARY;
  const equipmentStatus =
    dashboard?.data?.equipmentStatus ?? DEFAULT_EQUIPMENT_STATUS;

  const breakdownTrend =
    dashboard?.data?.breakdownTrend ?? DEFAULT_BREAKDOWN_TREND;

  const pmTaskCompletion =
    dashboard?.data?.pmTaskCompletion ?? DEFAULT_PM_TASK_COMPLETION;

  const breakdownPriority =
    dashboard?.data?.breakdownPriority ?? DEFAULT_BREAKDOWN_PRIORITY;

  const todayTasks = dashboard?.data?.todayTasks ?? DEFAULT_TODAY_TASK;

  return (
    <div className="space-y-6">
      <Header summary={summary} isDashboard={isDashboard} />

      <Separator className={"border"} />

      <SummaryCounts summary={summary} isDashboard={isDashboard} />

      <Separator className={"border"} />

      <div className="flex flex-col gap-6 lg:flex-row">
        <TodayTasksList pmTasks={todayTasks} isDashboard={isDashboard} />
        <div className="flex-1"></div>
      </div>

      <div className="flex flex-col gap-6 lg:flex-row">
        <EquipmentStatusChart
          equipmentStatus={equipmentStatus}
          isDashboard={isDashboard}
        />

        <BreakdownTrendChart
          breakdown={breakdownTrend}
          isDashboard={isDashboard}
        />
      </div>

      <div className="flex flex-col gap-6 lg:flex-row">
        <PmCompletionChart
          pmTasks={pmTaskCompletion}
          isDashboard={isDashboard}
        />

        <BreakdownPriorityChart
          breakdowns={breakdownPriority}
          isDashboard={isDashboard}
        />
      </div>
    </div>
  );
}
