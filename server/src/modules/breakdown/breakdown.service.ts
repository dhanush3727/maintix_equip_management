import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { AuditService } from '../../common/audit/audit.service';
import { CreateBreakdownDto } from './dto/create-breakdown.dto';
import { MetaType, RequestUser } from '../../common/types/auth.types';
import { EquipmentStatus, Prisma } from '@prisma/client';
import { AuditAction, AuditModule } from '../../common/audit/audit.types';
import { BreakdownQueryDto } from './dto/breakdown-query.dto';
import { buildCursorQueryOptions } from '../../common/utils/query-builder.util';

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
  async getBreakdownsService(req: RequestUser, query: BreakdownQueryDto) {
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
      },
    });
  }
  //#endregion
}
