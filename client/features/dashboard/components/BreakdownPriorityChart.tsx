import { Loading } from "@/components/ui";
import { BreakdownPriority } from "../types/dashboard.type";
import { BREAKDOWN_PRIORITY_CHART_COLORS } from "../constants/dashboard.constant";
import { Legend, Pie, PieChart, ResponsiveContainer, Tooltip } from "recharts";

export interface BreakdownPriorityProps {
  breakdowns: BreakdownPriority[];
  isDashboard: boolean;
}

export function BreakdownPriorityChart({
  breakdowns,
  isDashboard,
}: BreakdownPriorityProps) {
  const chartData = breakdowns.map((item) => ({
    ...item,
    fill: BREAKDOWN_PRIORITY_CHART_COLORS[item.priority],
  }));

  const hasData = chartData.some((item) => item.count > 0);
  return (
    <div className="h-80 shadow-sm rounded-md bg-background flex flex-col lg:flex-1 justify-center items-center">
      <p className="text-base font-semibold pt-2">Breakdown Priority</p>
      {isDashboard ? (
        <Loading />
      ) : hasData ? (
        <ResponsiveContainer width="100%" height="100%">
          <PieChart>
            <Pie
              data={chartData}
              dataKey="count"
              nameKey="priority"
              cx="50%"
              cy="50%"
              innerRadius={50}
              outerRadius={95}
              paddingAngle={3}
            />

            <Tooltip />

            <Legend />
          </PieChart>
        </ResponsiveContainer>
      ) : (
        <div className="flex h-full items-center justify-center text-sm text-muted-foreground">
          No data available
        </div>
      )}
    </div>
  );
}
