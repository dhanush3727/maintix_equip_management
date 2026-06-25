import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { AuditService } from '../../common/audit/audit.service';
import { RequestUser } from '../../common/types/auth.types';
import { PMTaskQueryDto } from './dto/pmtask-query.dto';
import { Prisma, TaskStatus } from '@prisma/client';
import {
  buildCursorMeta,
  buildCursorQueryOptions,
} from '../../common/utils/query-builder.util';

@Injectable()
export class PmtasksService {
  constructor(
    private prisma: PrismaService,
    private audit: AuditService,
  ) {}

  // #region Get PMTasks
  async getPMTasksService(req: RequestUser, query: PMTaskQueryDto) {
    const { organizationId } = req;

    const {
      cursor,
      limit,
      order,
      status,
      assignedTo,
      equipment,
      from,
      to,
      isOverdue,
    } = query;

    const now = new Date();

    const filters: Prisma.PMTaskWhereInput = { organizationId };

    if (status) filters.status = status;

    if (assignedTo) {
      filters.assignee = {
        name: assignedTo,
      };
    }

    if (equipment) {
      filters.equipment = {
        name: equipment,
      };
    }

    if (from || to) {
      filters.dueDate = {
        gte: from,
        lte: to,
      };
    }

    if (isOverdue) {
      filters.AND = [
        {
          dueDate: { lt: now },
          status: {
            notIn: [TaskStatus.COMPLETED, TaskStatus.SKIPPED],
          },
        },
      ];
    }

    const { where, orderBy, take } = buildCursorQueryOptions({
      cursor,
      limit,
      order,
      filters,
    });

    const tasks = await this.prisma.pMTask.findMany({
      where,
      orderBy,
      take,
      select: {
        id: true,
        organizationId: true,
        scheduleId: true,
        equipmentId: true,
        templateId: true,
        title: true,
        assignedTo: true,
        dueDate: true,
        completedAt: true,
        status: true,
        priority: true,
        remarks: true,
        createdAt: true,
        assignee: {
          select: {
            name: true,
          },
        },
        equipment: {
          select: {
            name: true,
          },
        },
        template: {
          select: {
            name: true,
          },
        },
      },
    });

    const formattedPMTasks = tasks.map((task) => ({
      id: task.id,
      organizationId: task.organizationId,
      scheduleId: task.scheduleId,
      templateId: task.templateId,
      template: task.template.name,
      equipmentId: task.equipmentId,
      equipment: task.equipment.name,
      assignedToId: task.assignedTo,
      assignedTo: task.assignee.name,
      title: task.title,
      dueDate: task.dueDate,
      completedAt: task.completedAt,
      status: task.status,
      priority: task.priority,
      remarks: task.remarks,
      createdAt: task.createdAt,
      isOverdue:
        task.dueDate < now &&
        task.status !== TaskStatus.COMPLETED &&
        task.status !== TaskStatus.SKIPPED,
    }));

    const { data, meta } = buildCursorMeta(formattedPMTasks, limit);

    return {
      data,
      meta,
    };
  }
  //#endregion

  //#region Get PM Task by id
  async getPMTaskById(id: number, req: RequestUser) {
    const { organizationId } = req;

    const now = new Date();

    const pmtask = await this.prisma.pMTask.findFirst({
      where: {
        id,
        organizationId,
      },
      select: {
        id: true,
        organizationId: true,
        scheduleId: true,
        equipmentId: true,
        templateId: true,
        title: true,
        assignedTo: true,
        dueDate: true,
        completedAt: true,
        status: true,
        priority: true,
        remarks: true,
        createdAt: true,
        assignee: {
          select: {
            name: true,
          },
        },
        equipment: {
          select: {
            name: true,
          },
        },
        template: {
          select: {
            name: true,
          },
        },
        checklistItems: {
          orderBy: {
            order: 'asc',
          },
        },
      },
    });

    if (!pmtask) throw new NotFoundException('PM Task not found');

    const formattedPMTask = {
      id: pmtask.id,
      organizationId: pmtask.organizationId,
      scheduleId: pmtask.scheduleId,
      templateId: pmtask.templateId,
      template: pmtask.template.name,
      equipmentId: pmtask.equipmentId,
      equipment: pmtask.equipment.name,
      assignedToId: pmtask.assignedTo,
      assignedTo: pmtask.assignee.name,
      title: pmtask.title,
      dueDate: pmtask.dueDate,
      completedAt: pmtask.completedAt,
      status: pmtask.status,
      priority: pmtask.priority,
      remarks: pmtask.remarks,
      createdAt: pmtask.createdAt,
      isOverdue:
        pmtask.dueDate < now &&
        pmtask.status !== TaskStatus.COMPLETED &&
        pmtask.status !== TaskStatus.SKIPPED,
      checklistItems: pmtask.checklistItems.map((item) => ({
        id: item.id,
        taskId: item.taskId,
        templateItemId: item.templateItemId,
        name: item.name,
        order: item.order,
        type: item.type,
        expectedValue: item.expectedValue,
        minValue: item.minValue,
        maxValue: item.maxValue,
        options: item.options,
        actualValue: item.actualValue,
        status: item.status,
      })),
    };

    return formattedPMTask;
  }
  //#endregion

  //#region
  //#endregion
}
