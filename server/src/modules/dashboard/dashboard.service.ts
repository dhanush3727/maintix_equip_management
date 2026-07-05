import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { RequestUser } from '../../common/types/auth.types';
import { BreakdownStatus, EquipmentStatus, TaskStatus } from '@prisma/client';
import {
  BREAKDOWN_TREND,
  BREAKDOWN_TREND_START,
  DASHBOARD_LIST_LIMI,
  PMTASK_TREND,
} from './constants/dashboard.constant';
import {
  BreakdownPriorityType,
  BreakdownTrendType,
  EquipmentStatusSummary,
  PMTaskCompletionType,
} from './types/dashboard.type';
import { formatKey, getDays } from './utils/dashboard.util';

@Injectable()
export class DashboardService {
  constructor(private prisma: PrismaService) {}

  //#region Get Cards data
  async getCardsData(organizationId: number) {
    const { startOfDay, endOfDay } = getDays();

    // Use Promise.all to execute multiple queries in parallel for better performance
    const [totalEquipment, todayDue, overdue, openBreakdown] =
      await Promise.all([
        this.prisma.equipment.count({
          where: { organizationId },
        }),

        this.prisma.pMTask.count({
          where: {
            organizationId,
            dueDate: {
              gte: startOfDay,
              lte: endOfDay,
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
    // Group equipment by status and count the number of equipment in each status for the given organization
    const equipmentStatus = await this.prisma.equipment.groupBy({
      by: ['status'],
      where: {
        organizationId,
      },
      _count: {
        status: true,
      },
    });

    // Transform the grouped data into a summary object with counts for each status
    const transformedStatus: EquipmentStatusSummary = {
      active: 0,
      inactive: 0,
      underMaintenance: 0,
      breakdown: 0,
      decommissioned: 0,
    };

    // Map the status values to the corresponding keys in the summary object
    const statusKeyMap: Record<EquipmentStatus, keyof EquipmentStatusSummary> =
      {
        [EquipmentStatus.ACTIVE]: 'active',
        [EquipmentStatus.INACTIVE]: 'inactive',
        [EquipmentStatus.UNDER_MAINTENANCE]: 'underMaintenance',
        [EquipmentStatus.BREAKDOWN]: 'breakdown',
        [EquipmentStatus.DECOMMISSIONED]: 'decommissioned',
      };

    // Iterate through the grouped equipment status data and populate the summary object with counts for each status
    for (const item of equipmentStatus) {
      transformedStatus[statusKeyMap[item.status]] = item._count.status;
    }

    return transformedStatus;
  }
  //#endregion

  //#region Get Breakdown trend
  async getBreakdownTrend(organizationId: number) {
    const { startOfDay } = getDays();
    startOfDay.setDate(startOfDay.getDate() - BREAKDOWN_TREND_START); // Get the date 29 days ago to include today in the 30-day range

    // Fetch breakdown reports for the given organization within the last 30 days, selecting only the reportedAt field
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

    const breakdownMap = new Map<string, number>(); // Map to store the count of breakdowns for each date

    // Iterate through the fetched breakdown reports and populate the breakdownMap with counts for each date
    for (const breakdown of breakdowns) {
      const date = breakdown.reportedAt;

      // Generate a key in the format 'YYYY-MM-DD' for the breakdown date
      const key = formatKey(date);

      // Increment the count for the corresponding date in the breakdownMap, initializing it to 0 if it doesn't exist yet
      breakdownMap.set(key, (breakdownMap.get(key) ?? 0) + 1);
    }

    // Generate an array of BreakdownTrendType objects for the last 30 days, including today, with counts of breakdowns for each date
    const breakdownTrend: BreakdownTrendType[] = [];

    for (let i = 0; i < BREAKDOWN_TREND; i++) {
      const date = new Date(startOfDay);
      date.setDate(startOfDay.getDate() + i);

      // Generate a key in the format 'YYYY-MM-DD' for the current date in the loop
      const key = formatKey(date);

      breakdownTrend.push({
        date: key,
        count: breakdownMap.get(key) ?? 0,
      });
    }

    return breakdownTrend;
  }
  //#endregion

  //#region Get completed PM
  async getCompletedPMTask(organizationId: number) {
    const now = new Date();
    // Calculate the date six months ago from the current date to filter completed PM tasks within the last six months
    const sixMonthAgo = new Date(
      now.getFullYear(),
      now.getMonth() - PMTASK_TREND,
      1,
    );

    const pmTasks = await this.prisma.pMTask.findMany({
      where: {
        organizationId,
        status: TaskStatus.COMPLETED,
        completedAt: {
          gte: sixMonthAgo,
        },
      },
      select: {
        completedAt: true,
      },
    });

    const pmTaskCompletion: PMTaskCompletionType[] = [];

    // Generate an array of PMTaskCompletionType objects for the last six months, including the current month, with counts of completed PM tasks for each month
    for (let i = PMTASK_TREND; i >= 0; i--) {
      const date = new Date(now);

      date.setMonth(date.getMonth() - i);

      const month = date.toLocaleString('en-us', {
        month: 'short',
      });

      pmTaskCompletion.push({
        month,
        completed: 0,
      });
    }

    // Create a Map where:
    // Key   -> Month name (e.g., "Feb")
    // Value -> The SAME object stored inside the pmTaskCompletion array.
    //
    // Note:
    // The Map does NOT create a copy of the object.
    // It stores a reference (memory address) to the existing object.
    const monthMap = new Map<string, PMTaskCompletionType>();

    for (const item of pmTaskCompletion) {
      monthMap.set(item.month, item);
    }

    for (const task of pmTasks) {
      if (!task.completedAt) continue;

      const month = task.completedAt.toLocaleString('en-us', {
        month: 'short',
      });

      // Retrieve the object reference for this month.
      const found = monthMap.get(month);

      if (found) {
        // Since 'found' references the SAME object inside
        // the pmTaskCompletion array, updating it here
        // automatically updates the array as well.
        //
        // Example:
        // pmTaskCompletion[0] ---> { month: "Feb", completed: 0 }
        // monthMap.get("Feb") ---> points to the SAME object
        //
        // After this line:
        // found.completed = 1
        //
        // pmTaskCompletion automatically becomes:
        // { month: "Feb", completed: 1 }
        found.completed++;
      }
    }

    return pmTaskCompletion;
  }
  //#endregion

  //#region Get breakdown priority
  async getBreakdownPriority(organizationId: number) {
    const breakdowns = await this.prisma.breakdownReport.groupBy({
      by: ['severity'],
      where: {
        organizationId,
        status: {
          in: [BreakdownStatus.OPEN, BreakdownStatus.IN_PROGRESS],
        },
      },
      _count: {
        severity: true,
      },
    });

    const breakdownPriority: BreakdownPriorityType[] = [];

    for (const item of breakdowns) {
      breakdownPriority.push({
        priority: item.severity,
        count: item._count.severity,
      });
    }

    return breakdownPriority;
  }
  //#endregion

  //#region Get today pm tasks
  async getTodayPMTask(organizationId: number) {
    const { startOfDay, endOfDay } = getDays();

    const pmtasks = await this.prisma.pMTask.findMany({
      where: {
        organizationId,
        dueDate: {
          gte: startOfDay,
          lte: endOfDay,
        },
        status: {
          notIn: [TaskStatus.COMPLETED, TaskStatus.SKIPPED],
        },
      },
      take: DASHBOARD_LIST_LIMI,
      select: {
        id: true,
        title: true,
        status: true,
        equipmentId: true,
        equipment: {
          select: {
            name: true,
          },
        },
        assignedTo: true,
        assignee: {
          select: {
            name: true,
          },
        },
      },
    });

    const todayTasks = pmtasks.map((task) => ({
      id: task.id,
      title: task.title,
      equipmentId: task.equipmentId,
      equipment: task.equipment.name,
      assignedTo: task.assignedTo,
      userName: task.assignee?.name,
      status: task.status,
    }));

    return todayTasks;
  }
  //#endregion

  //#region Get Recent breakdowns
  async getRecentBreakdowns(organizationId: number) {
    const breakdowns = await this.prisma.breakdownReport.findMany({
      where: {
        organizationId,
      },
      orderBy: {
        reportedAt: 'desc',
      },
      take: DASHBOARD_LIST_LIMI,
      select: {
        id: true,
        equipmentId: true,
        equipment: {
          select: {
            name: true,
          },
        },
        severity: true,
        status: true,
      },
    });

    const recentBreakdowns = breakdowns.map((breakdown) => ({
      id: breakdown.id,
      equipmentId: breakdown.equipmentId,
      equipment: breakdown.equipment.name,
      severity: breakdown.severity,
      status: breakdown.status,
    }));

    return recentBreakdowns;
  }
  //#endregion

  //#region Get Dashboards
  async getDashboardService(req: RequestUser) {
    const { organizationId } = req;

    const [
      cards,
      equipmentStatus,
      breakdownTrend,
      pmTaskCompletion,
      breakdownPriority,
      todayTasks,
      recentBreakdowns,
    ] = await Promise.all([
      this.getCardsData(organizationId),
      this.getEquipmentStatus(organizationId),
      this.getBreakdownTrend(organizationId),
      this.getCompletedPMTask(organizationId),
      this.getBreakdownPriority(organizationId),
      this.getTodayPMTask(organizationId),
      this.getRecentBreakdowns(organizationId),
    ]);

    const data = {
      summary: {
        totalEquipment: cards.totalEquipment,
        todayDue: cards.todayDue,
        overdue: cards.overdue,
        openBreakdown: cards.openBreakdown,
      },
      equipmentStatus,
      breakdownTrend,
      pmTaskCompletion,
      breakdownPriority,
      todayTasks,
      recentBreakdowns,
    };

    return {
      data,
    };
  }
  //#endregion
}
