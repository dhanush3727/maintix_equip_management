import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { RequestUser } from '../../common/types/auth.types';
import { BreakdownStatus, EquipmentStatus, TaskStatus } from '@prisma/client';

type EquipmentStatusSummary = {
  active: number;
  inactive: number;
  underMaintenance: number;
  breakdown: number;
  decommissioned: number;
};

type BreakdownTrendType = {
  date: string;
  count: number;
};

@Injectable()
export class DashboardService {
  constructor(private prisma: PrismaService) {}

  //#region Get Cards data
  async getCardsData(organizationId: number) {
    const today = new Date();

    const startOfDay = new Date(today);
    startOfDay.setHours(0, 0, 0, 0);

    const endOfDay = new Date(today);
    endOfDay.setHours(23, 59, 59, 999);

    const [totalEquipment, todayDue, overdue, openBreakdown] =
      await Promise.all([
        this.prisma.equipment.count({
          where: { organizationId },
        }),

        this.prisma.pMTask.count({
          where: {
            organizationId,
            dueDate: {
              lte: startOfDay,
              gte: endOfDay,
            },
            status: {
              notIn: [TaskStatus.COMPLETED, TaskStatus.SKIPPED],
            },
          },
        }),

        this.prisma.pMTask.count({
          where: {
            organizationId,
            dueDate: {
              lt: startOfDay,
            },
            status: {
              notIn: [TaskStatus.COMPLETED, TaskStatus.SKIPPED],
            },
          },
        }),

        this.prisma.breakdownReport.count({
          where: {
            organizationId,
            status: {
              equals: BreakdownStatus.OPEN,
            },
          },
        }),
      ]);

    return { totalEquipment, todayDue, overdue, openBreakdown };
  }
  //#endregion

  //#region Equipment status
  async getEquipmentStatus(organizationId: number) {
    const equipmentStatus = await this.prisma.equipment.groupBy({
      by: ['status'],
      where: {
        organizationId,
      },
      _count: {
        status: true,
      },
    });

    const transformedStatus: EquipmentStatusSummary = {
      active: 0,
      inactive: 0,
      underMaintenance: 0,
      breakdown: 0,
      decommissioned: 0,
    };

    const statusKeyMap: Record<EquipmentStatus, keyof EquipmentStatusSummary> =
      {
        [EquipmentStatus.ACTIVE]: 'active',
        [EquipmentStatus.INACTIVE]: 'inactive',
        [EquipmentStatus.UNDER_MAINTENANCE]: 'underMaintenance',
        [EquipmentStatus.BREAKDOWN]: 'breakdown',
        [EquipmentStatus.DECOMMISSIONED]: 'decommissioned',
      };

    for (const item of equipmentStatus) {
      transformedStatus[statusKeyMap[item.status]] = item._count.status;
    }

    return transformedStatus;
  }
  //#endregion

  //#region Get Breakdown trend
  async getBreakdownTrend(organizationId: number) {
    const today = new Date();
    const startOfDay = new Date(today);
    startOfDay.setHours(0, 0, 0, 0);
    startOfDay.setDate(startOfDay.getDate() - 29);

    const breakdowns = await this.prisma.breakdownReport.findMany({
      where: {
        organizationId,
        reportedAt: {
          gte: startOfDay,
        },
      },
      select: {
        reportedAt: true,
      },
    });

    const breakdownMap = new Map<string, number>();

    for (const breakdown of breakdowns) {
      const date = breakdown.reportedAt.toISOString().split('T')[0];

      breakdownMap.set(date, (breakdownMap.get(date) ?? 0) + 1);
    }

    const breakdownTrend: BreakdownTrendType[] = [];

    for (let i = 0; i < 30; i++) {
      const date = new Date(startOfDay);
      date.setDate(startOfDay.getDate() + i);

      const key = date.toISOString().split('T')[0];

      breakdownTrend.push({
        date: key,
        count: breakdownMap.get(key) ?? 0,
      });
    }

    return breakdownTrend;
  }
  //#endregion

  //#region Get Dashboards
  async getDashboardService(req: RequestUser) {
    const { organizationId } = req;

    const { totalEquipment, todayDue, overdue, openBreakdown } =
      await this.getCardsData(organizationId);

    const equipmentStatus = await this.getEquipmentStatus(organizationId);

    const breakdownTrend = await this.getBreakdownTrend(organizationId);

    const data = {
      summary: {
        totalEquipment,
        todayDue,
        overdue,
        openBreakdown,
      },
      equipmentStatus,
      breakdownTrend,
    };

    return {
      data,
    };
  }
  //#endregion
}
