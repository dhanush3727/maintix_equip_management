import { Loading } from "@/components/ui";
import { BreakdownTrend } from "../types/dashboard.type";
import {
  CartesianGrid,
  Line,
  LineChart,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from "recharts";

export interface BreakdownTrendProps {
  breakdown: BreakdownTrend[];
  isDashboard: boolean;
}

export function BreakdownTrendChart({
  breakdown,
  isDashboard,
}: BreakdownTrendProps) {
  const chartData = breakdown.map((item) => ({
    date: new Date(item.date).toLocaleDateString("en-US", {
      month: "short",
      day: "numeric",
    }),
    count: item.count,
  }));

  const hasData = chartData.some((item) => item.count > 0);

  return (
    <div className="h-80 shadow-sm rounded-md bg-background flex flex-col lg:flex-1 justify-center items-center">
      <p className="text-base font-semibold pt-2">Breakdown Trend</p>
      {isDashboard ? (
        <Loading />
      ) : hasData ? (
        <ResponsiveContainer width="100%" height="100%">
          <LineChart
            data={chartData}
            margin={{
              top: 20,
              right: 20,
              left: 0,
              bottom: 10,
            }}
          >
            <CartesianGrid strokeDasharray="3 3" />

            <XAxis dataKey="date" />

            <YAxis allowDecimals={false} />

            <Tooltip />

            <Line
              type="monotone"
              dataKey="count"
              stroke="var(--chart-1)"
              strokeWidth={2}
              dot={{ r: 4 }}
              activeDot={{ r: 6 }}
            />
          </LineChart>
        </ResponsiveContainer>
      ) : (
        <div className="flex h-full items-center justify-center text-sm text-muted-foreground">
          No data available
        </div>
      )}
    </div>
  );
}
