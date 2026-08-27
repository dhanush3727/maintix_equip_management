import {
  BadRequestException,
  ForbiddenException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { AuditService } from '../../common/audit/audit.service';
import { CreateBreakdownDto } from './dto/create-breakdown.dto';
import { MetaType, RequestUser } from '../../common/types/auth.types';
import { BreakdownStatus, EquipmentStatus, Prisma } from '@prisma/client';
import { AuditAction, AuditModule } from '../../common/audit/audit.types';
import { BreakdownQueryDto } from './dto/breakdown-query.dto';
import {
  buildCursorMeta,
  buildCursorQueryOptions,
} from '../../common/utils/query-builder.util';
import { UpdateBreakdownDto } from './dto/update-breakdown.dto';
import { AssignTechnicianDto } from './dto/assign-breakdown.dto';
import { ROLE_IDS } from '../../common/constants/roles.constants';
import { CreateActionsDto } from './dto/create-actions.dto';
import { UpdateActionsDto } from './dto/update-actions.dto';
import { ResolveBreakdownDto } from './dto/resolve-breakdown.dto';
import { NotificationService } from '../../common/notification/notification.service';
import {
  NotificationType,
  ReferenceType,
} from '../../common/notification/notification.type';

@Injectable()
export class BreakdownService {
  constructor(
    private prisma: PrismaService,
    private audit: AuditService,
    private notification: NotificationService,
  ) {}

  //#region Create breakdown
  async createBreakdownService(
    dto: CreateBreakdownDto,
    req: RequestUser,
    meta?: MetaType,
  ) {
    const { organizationId, userId } = req;
    const { title, description, severity, equipmentId } = dto;

    const equipment = await this.prisma.equipment.findFirst({
      where: { id: equipmentId, organizationId },
      select: { id: true, status: true },
    });

    //Check equipment exist
    if (!equipment) throw new NotFoundException('Equipment not found');
    if (equipment.status === EquipmentStatus.INACTIVE) {
      throw new BadRequestException('Equipment is inactive');
    }

    await this.prisma.$transaction(async (tx) => {
      const breakdown = await tx.breakdownReport.create({
        data: {
          organizationId,
          equipmentId,
          reportedBy: userId,
          title,
          description,
          severity,
        },
        select: {
          id: true,
        },
      });

      await tx.equipment.update({
        where: {
          id: equipmentId,
          organizationId,
        },
        data: {
          status: EquipmentStatus.BREAKDOWN,
        },
      });

      await this.audit.logs(tx, {
        organizationId,
        userId,
        action: AuditAction.CREATE_BREAKDOWN_REPORT,
        module: AuditModule.BREAKDOWN,
        recordId: breakdown.id.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion

  //#region Get all breakdowns
  async getAllBreakdowns(req: RequestUser, query: BreakdownQueryDto) {
    const { organizationId } = req;

    const { cursor, limit, order, equipment, severity, status } = query;

    const filters: Prisma.BreakdownReportWhereInput = { organizationId };

    if (severity) filters.severity = severity;

    if (status) filters.status = status;

    if (equipment) {
      filters.equipment = {
        name: equipment,
      };
    }

    const { where, orderBy, take } = buildCursorQueryOptions({
      cursor,
      limit,
      order,
      filters,
    });

    const breakdowns = await this.prisma.breakdownReport.findMany({
      where,
      take,
      orderBy,
      select: {
        id: true,
        title: true,
        severity: true,
        status: true,
        createdAt: true,
        reportedAt: true,
        resolvedAt: true,
        equipment: {
          select: {
            name: true,
          },
        },
        reporter: {
          select: {
            name: true,
          },
        },
        assignee: {
          select: {
            name: true,
          },
        },
      },
    });

    const formattedBreakdowns = breakdowns.map((breakdown) => ({
      id: breakdown.id,
      equipment: breakdown.equipment.name,
      reportedBy: breakdown.reporter.name,
      assignedTo: breakdown.assignee?.name,
      title: breakdown.title,
      severity: breakdown.severity,
      status: breakdown.status,
      reportedAt: breakdown.reportedAt,
      resolvedAt: breakdown.resolvedAt,
      createdAt: breakdown.createdAt,
    }));

    const { data, meta } = buildCursorMeta(formattedBreakdowns, limit);

    return { data, meta };
  }
  //#endregion

  //#region Get breakdown by id
  async getBreakdownbyId(id: number, req: RequestUser) {
    const { organizationId } = req;

    const breakdown = await this.prisma.breakdownReport.findFirst({
      where: {
        id,
        organizationId,
      },
      select: {
        id: true,
        assignedTo: true,
        title: true,
        rootCause: true,
        description: true,
        severity: true,
        status: true,
        createdAt: true,
        equipment: {
          select: {
            id: true,
            name: true,
          },
        },
        assignee: {
          select: {
            id: true,
            name: true,
          },
        },
        actions: true,
      },
    });

    if (!breakdown) throw new NotFoundException('Breakdown not found');

    const formattedBreakdowns = {
      id: breakdown.id,
      title: breakdown.title,
      rootCause: breakdown.rootCause,
      description: breakdown.description,
      severity: breakdown.severity,
      status: breakdown.status,
      createdAt: breakdown.createdAt,
      actions: breakdown.actions,
      equipment: {
        value: breakdown.equipment.id,
        label: breakdown.equipment.name,
      },
      assignedTo: {
        value: breakdown.assignee?.id,
        laberl: breakdown.assignee?.name,
      },
    };

    return formattedBreakdowns;
  }
  //#endregion

  //#region Update breakdown
  async updateBreakdownService(
    id: number,
    dto: UpdateBreakdownDto,
    req: RequestUser,
    meta?: MetaType,
  ) {
    const { organizationId, userId } = req;

    const { title, description, severity } = dto;

    const data: Prisma.BreakdownReportUpdateInput = {};

    const breakdown = await this.prisma.breakdownReport.findFirst({
      where: {
        id,
        organizationId,
      },
      select: {
        id: true,
        status: true,
      },
    });

    if (!breakdown) throw new NotFoundException('Breakdown not found');

    if (breakdown.status !== BreakdownStatus.OPEN) {
      throw new BadRequestException('This breakdown cannot be updated');
    }

    if (title) data.title = title;
    if (description) data.description = description;
    if (severity) data.severity = severity;

    if (Object.keys(data).length === 0) {
      throw new BadRequestException('No valid fields provided');
    }

    await this.prisma.$transaction(async (tx) => {
      await tx.breakdownReport.update({
        where: { id, organizationId },
        data,
      });

      await this.audit.logs(tx, {
        organizationId,
        userId,
        action: AuditAction.UPDATE_BREAKDOWN_REPORT,
        module: AuditModule.BREAKDOWN,
        recordId: id.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion

  //#region Assign technician
  async assignTechnicianService(
    id: number,
    dto: AssignTechnicianDto,
    req: RequestUser,
    meta?: MetaType,
  ) {
    const { organizationId, userId } = req;
    const { assignedTo } = dto;

    const breakdown = await this.prisma.breakdownReport.findFirst({
      where: { id, organizationId },
      select: {
        status: true,
        assignedTo: true,
      },
    });
    if (!breakdown) throw new NotFoundException('Breakdown not found');
    if (breakdown.status !== BreakdownStatus.OPEN) {
      throw new BadRequestException('Cannot assign technician');
    }
    if (breakdown.assignedTo !== null) {
      throw new BadRequestException('Technician already assigned');
    }

    const user = await this.prisma.user.findFirst({
      where: { id: assignedTo, organizationId },
      select: {
        id: true,
        isActive: true,
        roles: {
          select: {
            roleId: true,
          },
        },
      },
    });
    if (!user) throw new NotFoundException('User Not found');
    const isTechnician = user.roles.some(
      (role) => role.roleId === ROLE_IDS.TECHNICIAN,
    );
    if (!isTechnician) {
      throw new BadRequestException('User must have technician role');
    }
    if (!user.isActive) throw new BadRequestException('User is in active');

    const result = await this.prisma.$transaction(async (tx) => {
      const updated = await tx.breakdownReport.update({
        where: {
          id,
          organizationId,
        },
        data: {
          assignedTo,
          status: BreakdownStatus.IN_PROGRESS,
        },
        select: {
          equipment: {
            select: {
              name: true,
            },
          },
        },
      });

      await this.audit.logs(tx, {
        organizationId,
        userId,
        action: AuditAction.ASSIGN_TECHNICIAN_REPORT,
        module: AuditModule.BREAKDOWN,
        recordId: id.toString(),
        ipAddress: meta?.ipAddress,
      });

      return updated;
    });

    await this.notification.create(this.prisma, {
      organizationId,
      userId: assignedTo,
      type: NotificationType.BREAKDOWN_ASSIGNED,
      title: 'Breakdown Assigned',
      message: `You have been assigned a breakdown for ${result.equipment.name}`,
      referenceId: id,
      referenceType: ReferenceType.BREAKDOWN,
    });
  }
  //#endregion

  //#region Create breakdown actions
  async createActionsService(
    id: number,
    dto: CreateActionsDto,
    req: RequestUser,
    meta?: MetaType,
  ) {
    const { organizationId, userId } = req;
    const { action, remarks } = dto;

    const breakdown = await this.prisma.breakdownReport.findFirst({
      where: { id, organizationId },
      select: {
        status: true,
        assignedTo: true,
        equipmentId: true,
      },
    });

    if (!breakdown) throw new NotFoundException('Breakdown not found');
    if (breakdown.status !== BreakdownStatus.IN_PROGRESS) {
      throw new BadRequestException('Breakdown is not in progress');
    }
    if (breakdown.assignedTo !== userId) {
      throw new ForbiddenException('Only assigned technician can add action');
    }

    await this.prisma.$transaction(async (tx) => {
      await tx.breakdownAction.create({
        data: {
          breakdownId: id,
          performedBy: userId,
          action,
          remarks,
        },
      });

      await tx.equipment.update({
        where: {
          id: breakdown.equipmentId,
          organizationId,
        },
        data: {
          status: EquipmentStatus.UNDER_MAINTENANCE,
        },
      });

      await this.audit.logs(tx, {
        organizationId,
        userId,
        action: AuditAction.CREATE_BREAKDOWN_ACTION,
        module: AuditModule.BREAKDOWN,
        recordId: id.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion

  //#region Update breakdown action
  async updateActionsService(
    id: number,
    actionId: number,
    dto: UpdateActionsDto,
    req: RequestUser,
  ) {
    const { organizationId, userId } = req;
    const { action, remarks } = dto;

    const breakdown = await this.prisma.breakdownReport.findFirst({
      where: { id, organizationId },
      select: {
        status: true,
        assignedTo: true,
      },
    });

    if (!breakdown) throw new NotFoundException('Breakdown not found');
    if (breakdown.status !== BreakdownStatus.IN_PROGRESS) {
      throw new BadRequestException('Breakdown is not in progress');
    }
    if (breakdown.assignedTo !== userId) {
      throw new ForbiddenException(
        'Only assigned technician can update action',
      );
    }

    const existingAction = await this.prisma.breakdownAction.findFirst({
      where: { id: actionId, breakdownId: id },
      select: {
        id: true,
      },
    });

    if (!existingAction) {
      throw new NotFoundException('Breakdown Action not found');
    }

    const data: Prisma.BreakdownActionUpdateInput = {};

    if (action) data.action = action;
    if (remarks) data.remarks = remarks;

    if (Object.keys(data).length === 0) {
      throw new BadRequestException('No valid fields provided');
    }

    await this.prisma.breakdownAction.update({
      where: { id: actionId, breakdownId: id },
      data,
    });
  }
  //#endregion

  //#region Delete breakdown action
  async deleteActionsService(id: number, actionId: number, req: RequestUser) {
    const { organizationId, userId } = req;

    const breakdown = await this.prisma.breakdownReport.findFirst({
      where: { id, organizationId },
      select: {
        status: true,
        assignedTo: true,
      },
    });

    if (!breakdown) throw new NotFoundException('Breakdown not found');
    if (breakdown.status !== BreakdownStatus.IN_PROGRESS) {
      throw new BadRequestException('Breakdown is not in progress');
    }
    if (breakdown.assignedTo !== userId) {
      throw new ForbiddenException(
        'Only assigned technician can delete action',
      );
    }

    const actions = await this.prisma.breakdownAction.deleteMany({
      where: { id: actionId, breakdownId: id },
    });

    if (actions.count === 0) {
      throw new NotFoundException('Action not found');
    }
  }
  //#endregion

  //#region Resolve breakdown
  async resolveBreakdownService(
    id: number,
    dto: ResolveBreakdownDto,
    req: RequestUser,
    meta?: MetaType,
  ) {
    const { organizationId, userId } = req;
    const { rootCause } = dto;

    const breakdown = await this.prisma.breakdownReport.findFirst({
      where: { id, organizationId },
      select: {
        status: true,
        assignedTo: true,
      },
    });

    if (!breakdown) throw new NotFoundException('Breakdown not found');
    if (breakdown.status !== BreakdownStatus.IN_PROGRESS) {
      throw new BadRequestException('Breakdown is not in progress');
    }
    if (breakdown.assignedTo !== userId) {
      throw new ForbiddenException(
        'Only assigned technician can resolve this action',
      );
    }

    const hasActions = await this.prisma.breakdownAction.count({
      where: {
        breakdownId: id,
      },
    });

    if (hasActions === 0) {
      throw new BadRequestException(
        'At least one repair action is required before resolving',
      );
    }

    await this.prisma.$transaction(async (tx) => {
      await tx.breakdownReport.update({
        where: {
          id,
          organizationId,
        },
        data: {
          rootCause,
          status: BreakdownStatus.RESOLVED,
          resolvedAt: new Date(),
        },
      });

      await this.audit.logs(tx, {
        organizationId,
        userId,
        action: AuditAction.RESOLVE_BREAKDOWN_REPORT,
        module: AuditModule.BREAKDOWN,
        recordId: id.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion

  //#region Close breakdown
  async closeBreakdownService(id: number, req: RequestUser, meta?: MetaType) {
    const { organizationId, userId } = req;

    const breakdown = await this.prisma.breakdownReport.findFirst({
      where: { id, organizationId },
      select: {
        status: true,
        equipmentId: true,
      },
    });

    if (!breakdown) throw new NotFoundException('Breakdown not found');
    if (breakdown.status === BreakdownStatus.CLOSED) {
      throw new BadRequestException('Breakdown already closed');
    }
    if (breakdown.status !== BreakdownStatus.RESOLVED) {
      throw new BadRequestException('First resolve the breakdown');
    }

    await this.prisma.$transaction(async (tx) => {
      await tx.breakdownReport.update({
        where: {
          id,
          organizationId,
        },
        data: {
          status: BreakdownStatus.CLOSED,
        },
      });

      await tx.equipment.update({
        where: {
          id: breakdown.equipmentId,
          organizationId,
        },
        data: {
          status: EquipmentStatus.ACTIVE,
        },
      });

      await this.audit.logs(tx, {
        organizationId,
        userId,
        action: AuditAction.CLOSE_BREAKDOWN_REPORT,
        module: AuditModule.BREAKDOWN,
        recordId: id.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion
}
