"use client";

import { Loading } from "@/components/ui";
import {
  DASHBOARD_CONTENT,
  EQUIPMENT_STATUS_CHART_COLORS,
} from "../constants/dashboard.constant";
import { EquipmentStatus } from "../types/dashboard.type";
import { ResponsiveContainer, PieChart, Pie, Tooltip, Legend } from "recharts";

export interface EquipmentStatusProps {
  equipmentStatus: EquipmentStatus;
  isDashboard: boolean;
}

export function EquipmentStatusChart({
  equipmentStatus,
  isDashboard,
}: EquipmentStatusProps) {
  const equipmentStatusData = [
    {
      name: DASHBOARD_CONTENT.EQUIPMENT_STATUS_ACTIVE,
      value: equipmentStatus.active,
      fill: EQUIPMENT_STATUS_CHART_COLORS.ACTIVE,
    },
    {
      name: DASHBOARD_CONTENT.EQUIPMENT_STATUS_INACTIVE,
      value: equipmentStatus.inactive,
      fill: EQUIPMENT_STATUS_CHART_COLORS.INACTIVE,
    },
    {
      name: DASHBOARD_CONTENT.EQUIPMENT_STATUS_MAINTENANCE,
      value: equipmentStatus.underMaintenance,
      fill: EQUIPMENT_STATUS_CHART_COLORS.UNDER_MAINTENANCE,
    },
    {
      name: DASHBOARD_CONTENT.EQUIPMENT_STATUS_BREAKDOWN,
      value: equipmentStatus.breakdown,
      fill: EQUIPMENT_STATUS_CHART_COLORS.BREAKDOWN,
    },
    {
      name: DASHBOARD_CONTENT.EQUIPMENT_STATUS_DECOMMISSIONED,
      value: equipmentStatus.decommissioned,
      fill: EQUIPMENT_STATUS_CHART_COLORS.DECOMMISSIONED,
    },
  ];

  const hasData = equipmentStatusData.some((item) => item.value > 0);

  return (
    <div className="h-80 shadow-sm rounded-md bg-background flex flex-col lg:flex-1 justify-center items-center">
      <p className="text-base font-semibold pt-2">Equipment Status</p>
      {isDashboard ? (
        <Loading />
      ) : hasData ? (
        <ResponsiveContainer
          className={"py-2 text-xs"}
          width="100%"
          height="100%"
        >
          <PieChart>
            <Pie
              data={equipmentStatusData}
              dataKey="value"
              nameKey="name"
              cx="50%"
              cy="50%"
              outerRadius={100}
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
