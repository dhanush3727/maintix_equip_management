import {
  BadRequestException,
  ForbiddenException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { AuditService } from '../../common/audit/audit.service';
import { MetaType, RequestUser } from '../../common/types/auth.types';
import { PMTaskQueryDto } from './dto/pmtask-query.dto';
import {
  ChecklistItemType,
  ItemStatus,
  Prisma,
  TaskStatus,
} from '@prisma/client';
import {
  buildCursorMeta,
  buildCursorQueryOptions,
} from '../../common/utils/query-builder.util';
import { UpdatePMTaskItemDto } from './dto/update-pmtask.dto';
import { AuditAction, AuditModule } from '../../common/audit/audit.types';

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
        title: true,
        dueDate: true,
        completedAt: true,
        status: true,
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
      template: task.template.name,
      equipment: task.equipment.name,
      assignedTo: task.assignee.name,
      title: task.title,
      dueDate: task.dueDate,
      completedAt: task.completedAt,
      status: task.status,
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
        scheduleId: true,
        title: true,
        dueDate: true,
        completedAt: true,
        status: true,
        priority: true,
        remarks: true,
        createdAt: true,
        assignee: {
          select: {
            id: true,
            name: true,
          },
        },
        equipment: {
          select: {
            id: true,
            name: true,
          },
        },
        template: {
          select: {
            id: true,
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
      scheduleId: pmtask.scheduleId,
      title: pmtask.title,
      remarks: pmtask.remarks,
      dueDate: pmtask.dueDate,
      completedAt: pmtask.completedAt,
      status: pmtask.status,
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

  //#region Update PM Task checklist items
  async updatePMTaskItems(
    id: number,
    itemId: number,
    dto: UpdatePMTaskItemDto,
    req: RequestUser,
    meta?: MetaType,
  ) {
    const { organizationId, userId } = req;
    const { actualValue, remarks } = dto;

    // Check and validate the pmtask
    const pmtask = await this.prisma.pMTask.findFirst({
      where: {
        id,
        organizationId,
      },
      select: {
        id: true,
        status: true,
        assignedTo: true,
      },
    });

    if (!pmtask) throw new NotFoundException('PM Task not found');

    if (
      pmtask.status === TaskStatus.COMPLETED ||
      pmtask.status === TaskStatus.SKIPPED
    ) {
      throw new BadRequestException('Cannot update this task');
    }

    // Check and validate checklist item
    const checklistItem = await this.prisma.taskChecklistItem.findFirst({
      where: { id: itemId, taskId: id },
    });

    if (!checklistItem) throw new NotFoundException('Checklist Item not found');

    if (pmtask.assignedTo !== userId) {
      throw new ForbiddenException('You are not assigned to this task');
    }

    // Validate based on checklist item
    const options = (checklistItem.options ?? []) as string[];

    switch (checklistItem.type) {
      case ChecklistItemType.BOOLEAN:
        if (!['true', 'false'].includes(actualValue.toLowerCase())) {
          throw new BadRequestException(
            `${checklistItem.name} should only true or false`,
          );
        }
        break;

      case ChecklistItemType.NUMBER:
        if (Number.isNaN(Number(actualValue))) {
          throw new BadRequestException(
            `${checklistItem.name} should only numeric value`,
          );
        }
        break;

      case ChecklistItemType.SELECT:
        if (!options.includes(actualValue)) {
          throw new BadRequestException(
            `${checklistItem.name} must be one of the option`,
          );
        }
        break;

      case ChecklistItemType.TEXT:
        break;
    }

    let status: ItemStatus | null = checklistItem.status;

    switch (checklistItem.type) {
      case ChecklistItemType.BOOLEAN:
        status =
          actualValue?.toLowerCase() ===
          checklistItem.expectedValue?.toLowerCase()
            ? ItemStatus.OK
            : ItemStatus.NOT_OK;
        break;

      case ChecklistItemType.NUMBER:
        if (
          checklistItem.minValue !== null &&
          Number(actualValue) < checklistItem.minValue
        ) {
          status = ItemStatus.NOT_OK;
        } else if (
          checklistItem.maxValue !== null &&
          Number(actualValue) > checklistItem.maxValue
        ) {
          status = ItemStatus.NOT_OK;
        } else {
          status = ItemStatus.OK;
        }

        break;

      case ChecklistItemType.SELECT:
        status =
          checklistItem.expectedValue &&
          actualValue !== checklistItem.expectedValue
            ? ItemStatus.NOT_OK
            : ItemStatus.OK;
        break;

      case ChecklistItemType.TEXT:
        break;
    }

    await this.prisma.$transaction(async (tx) => {
      await tx.taskChecklistItem.update({
        where: {
          id: itemId,
        },
        data: {
          actualValue,
          status,
        },
      });

      if (pmtask.status === TaskStatus.PENDING) {
        await tx.pMTask.update({
          where: { id, organizationId },
          data: {
            remarks,
            status: TaskStatus.IN_PROGRESS,
          },
        });
      }

      await this.audit.logs(tx, {
        organizationId,
        userId,
        action: AuditAction.UPDATE_PMTASK,
        module: AuditModule.PM,
        recordId: id.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion

  //#region Complete PM Task
  async completePMTaskService(id: number, req: RequestUser, meta?: MetaType) {
    const { organizationId, userId } = req;

    const pmtask = await this.prisma.pMTask.findFirst({
      where: { id, organizationId },
      include: {
        checklistItems: true,
      },
    });

    if (!pmtask) throw new NotFoundException('PM Task not found');

    if (
      pmtask.status === TaskStatus.COMPLETED ||
      pmtask.status === TaskStatus.SKIPPED
    ) {
      throw new BadRequestException('Cannot complete this task');
    }

    if (pmtask.assignedTo !== userId) {
      throw new ForbiddenException('You are not assigned to this task');
    }

    if (pmtask.checklistItems.length === 0) {
      throw new BadRequestException('Task has no checklist items');
    }

    const hasIncompleteItems = pmtask.checklistItems.some(
      (item) => item.actualValue === null,
    );

    if (hasIncompleteItems) {
      throw new BadRequestException('Complete all items in checklist');
    }

    await this.prisma.$transaction(async (tx) => {
      await tx.pMTask.update({
        where: { id, organizationId },
        data: {
          status: TaskStatus.COMPLETED,
          completedAt: new Date(),
        },
      });

      await this.audit.logs(tx, {
        organizationId,
        userId,
        action: AuditAction.COMPLETE_PMTASK,
        module: AuditModule.PM,
        recordId: id.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion
}
