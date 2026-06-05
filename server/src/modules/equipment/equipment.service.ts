import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { CreateEquipTypeDto } from './dto/create-equipType.dto';
import { MetaType, RequestUser } from '../../common/types/auth.types';
import { Prisma } from '@prisma/client';
import { AuditService } from '../../common/audit/audit.service';
import { AuditAction, AuditModule } from '../../common/audit/audit.types';
import { QueryDto } from '../../common/dto/query.dto';
import {
  buildPaginationMeta,
  buildQueryOptions,
  getPagination,
} from '../../common/utils/query-builder.util';

@Injectable()
export class EquipmentService {
  constructor(
    private prisma: PrismaService,
    private audit: AuditService,
  ) {}

  //#region Create Equipment type service
  async createEquipmentType(
    dto: CreateEquipTypeDto,
    req: RequestUser,
    meta?: MetaType,
  ) {
    const { name, code, description } = dto;

    const { organizationId, userId } = req;

    try {
      await this.prisma.equipmentType.create({
        data: {
          name,
          code,
          description,
          organizationId,
        },
      });
    } catch (err) {
      if (
        err instanceof Prisma.PrismaClientKnownRequestError &&
        err.code === 'P2002'
      ) {
        throw new BadRequestException('Equipment Type already exist');
      }
    }

    await this.audit.logs({
      organizationId,
      userId,
      action: AuditAction.CREATE_EQUIPMENT_TYPE,
      module: AuditModule.EQUIPMENT,
      recordId: userId.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion

  //#region Get equipment types
  async getEquipmentTypes(req: RequestUser, query: QueryDto) {
    const { organizationId } = req;

    const { page = 1, limit = 10, search, sortBy, order } = query;

    const allowedSortBy = ['name', 'code'];

    if (sortBy && !allowedSortBy.includes(sortBy)) {
      throw new BadRequestException('Invalid sortby');
    }

    const { skip, take } = getPagination(page, limit);

    const filters: Prisma.EquipmentWhereInput = { organizationId };

    const { where, orderBy } = buildQueryOptions({
      search,
      order,
      filters,
      searchFields: ['name', 'code'],
      sortBy,
    });

    const [equipmentTypes, total] = await Promise.all([
      this.prisma.equipmentType.findMany({
        where,
        skip,
        take,
        orderBy: orderBy ?? { createdAt: 'desc' },
        select: {
          id: true,
          name: true,
          code: true,
          description: true,
          organizationId: true,
        },
      }),

      this.prisma.equipmentType.count({ where }),
    ]);

    const pagination = buildPaginationMeta(page, limit, total);

    return {
      data: equipmentTypes,
      pagination,
    };
  }
  //#endregion

  //#region get equipment type as dropdown
  async getEquipmentTypeDropdown(req: RequestUser) {
    const { organizationId } = req;

    const equipmentTypes = await this.prisma.equipmentType.findMany({
      where: { organizationId },
      select: { id: true, name: true, code: true },
    });

    return equipmentTypes;
  }
  //#endregion

  //#region Get equipment type by id
  async getEquipmentType(id: number, req: RequestUser) {
    const { organizationId } = req;

    const equipmentType = await this.prisma.equipmentType.findFirst({
      where: { id, organizationId },
      select: { id: true, name: true, code: true, description: true },
    });

    if (!equipmentType) {
      throw new NotFoundException('Equipment type not found');
    }

    return equipmentType;
  }
  //#endregion
}
