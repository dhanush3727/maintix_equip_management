import {
  Bar,
  BarChart,
  CartesianGrid,
  ResponsiveContainer,
  Tooltip,
  XAxis,
  YAxis,
} from "recharts";
import { PmTaskCompletion } from "../types/dashboard.type";
import { Loading } from "@/components/ui";

export interface PmCompletionChartProps {
  pmTasks: PmTaskCompletion[];
  isDashboard: boolean;
}

export function PmCompletionChart({
  pmTasks,
  isDashboard,
}: PmCompletionChartProps) {
  const hasData = pmTasks.some((item) => item.completed > 0);

  return (
    <div className="h-80 shadow-sm rounded-md bg-background flex flex-col lg:flex-1 justify-center items-center">
      <p className="text-base font-semibold pt-2">PM Task Completion</p>
      {isDashboard ? (
        <Loading />
      ) : hasData ? (
        <ResponsiveContainer width="100%" height="100%">
          <BarChart
            data={pmTasks}
            margin={{
              top: 20,
              right: 20,
              left: 0,
              bottom: 10,
            }}
          >
            <CartesianGrid strokeDasharray="3 3" />

            <XAxis dataKey="month" />

            <YAxis allowDecimals={false} />

            <Tooltip />

            <Bar
              dataKey="completed"
              fill="var(--chart-2)"
              radius={[6, 6, 0, 0]}
            />
          </BarChart>
        </ResponsiveContainer>
      ) : (
        <div className="flex h-full items-center justify-center text-sm text-muted-foreground">
          No data available
        </div>
      )}
    </div>
  );
}
