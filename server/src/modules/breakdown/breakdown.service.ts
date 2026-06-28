import {
  BadRequestException,
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

@Injectable()
export class BreakdownService {
  constructor(
    private prisma: PrismaService,
    private audit: AuditService,
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
      await tx.breakdownReport.create({
        data: {
          organizationId,
          equipmentId,
          reportedBy: userId,
          title,
          description,
          severity,
        },
      });

      await tx.equipment.update({
        where: {
          id: equipmentId,
          organizationId,
        },
        data: {
          status: EquipmentStatus.UNDER_MAINTENANCE,
        },
      });
    });

    await this.audit.logs({
      organizationId,
      userId,
      action: AuditAction.CREATE_BREAKDOWN,
      module: AuditModule.BREAKDOWN,
      recordId: userId.toString(),
      ipAddress: meta?.ipAddress,
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
        organizationId: true,
        equipmentId: true,
        reportedBy: true,
        assignedTo: true,
        title: true,
        rootCause: true,
        description: true,
        severity: true,
        status: true,
        createdAt: true,
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
      organizationId: breakdown.organizationId,
      equipmentId: breakdown.equipmentId,
      equipment: breakdown.equipment.name,
      reportedById: breakdown.reportedBy,
      reportedBy: breakdown.reporter.name,
      assignedToId: breakdown.assignedTo,
      assignedTo: breakdown.assignee?.name,
      title: breakdown.title,
      rootCause: breakdown.rootCause,
      description: breakdown.description,
      severity: breakdown.severity,
      status: breakdown.status,
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
        organizationId: true,
        equipmentId: true,
        reportedBy: true,
        assignedTo: true,
        title: true,
        rootCause: true,
        description: true,
        severity: true,
        status: true,
        createdAt: true,
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
        actions: true,
      },
    });

    if (!breakdown) throw new NotFoundException('Breakdown not found');

    const formattedBreakdowns = {
      id: breakdown.id,
      organizationId: breakdown.organizationId,
      equipmentId: breakdown.equipmentId,
      equipment: breakdown.equipment.name,
      reportedById: breakdown.reportedBy,
      reportedBy: breakdown.reporter.name,
      assignedToId: breakdown.assignedTo,
      assignedTo: breakdown.assignee?.name,
      title: breakdown.title,
      rootCause: breakdown.rootCause,
      description: breakdown.description,
      severity: breakdown.severity,
      status: breakdown.status,
      createdAt: breakdown.createdAt,
      actions: breakdown.actions,
    };

    return formattedBreakdowns;
  }
  //#endregion

  //#region Update breakdown
  async updateBreakdown(
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

    await this.prisma.breakdownReport.update({
      where: { id, organizationId },
      data,
    });

    await this.audit.logs({
      organizationId,
      userId,
      action: AuditAction.UPDATE_BREAKDOWN,
      module: AuditModule.BREAKDOWN,
      recordId: id.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion
}
