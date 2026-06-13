import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { AuditService } from '../../common/audit/audit.service';
import { CreateChecklistTemplateDto } from './dto/create-checklistTemplate.dto';
import { MetaType, RequestUser } from '../../common/types/auth.types';
import { ChecklistItemType, Prisma } from '@prisma/client';
import { AuditAction, AuditModule } from '../../common/audit/audit.types';
import {
  buildPaginationMeta,
  buildQueryOptions,
  getPagination,
} from '../../common/utils/query-builder.util';
import { ChecklistQueryDto } from './dto/checklist-query.dto';
import { QueryDto } from '../../common/dto/query.dto';
import { UpdateChecklistTemplateDto } from './dto/update-checklistTemplate.dto';

@Injectable()
export class ChecklistService {
  constructor(
    private prisma: PrismaService,
    private audit: AuditService,
  ) {}

  //#region Create a checklist template and checklist item
  async createChecklistService(
    dto: CreateChecklistTemplateDto,
    req: RequestUser,
    meta?: MetaType,
  ) {
    const { organizationId, userId } = req;
    const { name, equipmentTypeId, description, items } = dto;

    // check equipment type
    const existing = await this.prisma.equipmentType.findFirst({
      where: { id: equipmentTypeId, organizationId },
      select: { id: true, isActive: true },
    });

    if (!existing) throw new NotFoundException('Equipment type not found');

    if (!existing.isActive) {
      throw new BadRequestException('This equipment type is deactivated');
    }

    // Check duplicate order
    const orders = items.map((o) => o.order);
    const uniqueOrders = new Set(orders);

    if (orders.length !== uniqueOrders.size) {
      throw new BadRequestException('Duplicate order in checklist items');
    }

    // Check type validation
    for (const item of items) {
      // Check for NUMBER type
      if (item.type === ChecklistItemType.NUMBER) {
        if (!item.minValue) {
          throw new BadRequestException(`Min value expected for ${item.name}`);
        }

        if (!item.maxValue) {
          throw new BadRequestException(`Max value expected for ${item.name}`);
        }

        if (
          item.minValue !== undefined &&
          item.maxValue !== undefined &&
          item.minValue > item.maxValue
        ) {
          throw new BadRequestException(`Invalid range for item: ${item.name}`);
        }
      }

      // Check for SELECT type
      if (item.type === ChecklistItemType.SELECT) {
        if (!item.options || item.options.length === 0) {
          throw new BadRequestException(`Options required for: ${item.name}`);
        }

        if (!item.expectedValue) {
          throw new BadRequestException(
            `expected value required for ${item.name}`,
          );
        }

        if (item.expectedValue && !item.options.includes(item.expectedValue)) {
          throw new BadRequestException(
            `The expected value must have one of the options for item: ${item.name}`,
          );
        }
      }

      // Check for BOOLEAN type
      if (item.type === ChecklistItemType.BOOLEAN) {
        if (!item.expectedValue) {
          throw new BadRequestException(
            `expected value required for ${item.name}`,
          );
        }

        if (item.expectedValue !== undefined) {
          item.expectedValue = String(item.expectedValue).toLowerCase();
        }

        if (
          item.expectedValue &&
          !['true', 'false'].includes(item.expectedValue)
        ) {
          throw new BadRequestException(
            `Invalid expected value for ${item.name}`,
          );
        }
      }
    }

    await this.prisma.$transaction(async (tx) => {
      // Create checklist template and item
      const template = await tx.checklistTemplate.create({
        data: {
          organizationId,
          equipmentTypeId,
          name,
          description,
          parentId: null,
          items: {
            create: items.map((item) => ({
              name: item.name,
              order: item.order,
              type: item.type,
              expectedValue: item.expectedValue ?? null,
              minValue: item.minValue ?? null,
              maxValue: item.maxValue ?? null,
              // Why we use JSON.stringify for options? because in prisma we can not save array of string directly in postgres, so we save it as string and when we get it we parse it back to array
              options: item.options ? JSON.stringify(item.options) : null,
              isRequired: item.isRequired ?? true,
            })),
          },
        },
        // Use `include` to fetch related items along with the checklist template in the same query.
        // Use `select` instead when you need to limit fields for better performance and smaller payload.
      });

      await tx.checklistTemplate.update({
        where: { id: template.id },
        data: { parentId: template.id },
      });
    });

    await this.audit.logs({
      organizationId,
      userId,
      action: AuditAction.CREATE_CHECKLIST,
      module: AuditModule.CHECKLIST,
      recordId: userId.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion

  //#region Get checklist templates
  async getChecklistTemplates(req: RequestUser, query: ChecklistQueryDto) {
    const { organizationId } = req;

    const { page = 1, limit = 10, search, sortBy, order, type } = query;

    const allowedSortby = ['name'];

    if (sortBy && !allowedSortby.includes(sortBy)) {
      throw new BadRequestException('Invalid sortby');
    }

    const { skip, take } = getPagination(page, limit);

    const filters: Prisma.ChecklistTemplateWhereInput = { organizationId };

    if (type) {
      filters.equipmentType = {
        name: type,
      };
    }

    const { where, orderBy } = buildQueryOptions({
      search,
      order,
      filters,
      searchFields: ['name'],
      sortBy,
    });

    const [checklistTemplates, total] = await Promise.all([
      this.prisma.checklistTemplate.findMany({
        where,
        skip,
        take,
        orderBy: orderBy ?? { createdAt: 'desc' },
        select: {
          id: true,
          organizationId: true,
          parentId: true,
          version: true,
          name: true,
          description: true,
          isActive: true,
          equipmentTypeId: true,
          equipmentType: {
            select: {
              name: true,
            },
          },
          items: {
            select: {
              id: true,
              name: true,
              order: true,
              type: true,
              expectedValue: true,
              minValue: true,
              maxValue: true,
              options: true,
              isRequired: true,
              isActive: true,
            },
          },
        },
      }),

      this.prisma.checklistTemplate.count({ where }),
    ]);

    const pagination = buildPaginationMeta(page, limit, total);

    const formattedChecklists = checklistTemplates.map((list) => ({
      id: list.id,
      name: list.name,
      organizationId: list.organizationId,
      equipmentTypeId: list.equipmentTypeId,
      equipmentType: list.equipmentType.name,
      parentId: list.parentId,
      version: list.version,
      description: list.description,
      isActive: list.isActive,
      checklistItems: list.items,
    }));

    return {
      data: formattedChecklists,
      pagination,
    };
  }
  //#endregion

  //#region Get checklist template by id
  async getChecklistTemplateById(id: number, req: RequestUser) {
    const { organizationId } = req;

    const checklistTemplate = await this.prisma.checklistTemplate.findFirst({
      where: { id, organizationId },
      select: {
        id: true,
        organizationId: true,
        parentId: true,
        name: true,
        description: true,
        isActive: true,
        version: true,
        equipmentTypeId: true,
        equipmentType: {
          select: {
            name: true,
          },
        },
        items: {
          select: {
            id: true,
            name: true,
            order: true,
            type: true,
            expectedValue: true,
            minValue: true,
            maxValue: true,
            options: true,
            isRequired: true,
            isActive: true,
          },
        },
      },
    });

    if (!checklistTemplate) {
      throw new NotFoundException('Checklist template not found');
    }

    const formattedChecklist = {
      id: checklistTemplate.id,
      name: checklistTemplate.name,
      organizationId: checklistTemplate.organizationId,
      equipmentTypeId: checklistTemplate.equipmentTypeId,
      equipmentType: checklistTemplate.equipmentType.name,
      parentId: checklistTemplate.parentId,
      version: checklistTemplate.version,
      description: checklistTemplate.description,
      isActive: checklistTemplate.isActive,
      checklistItems: checklistTemplate.items,
    };

    return formattedChecklist;
  }
  //#endregion

  //#region Get checklist templates by type id
  async getChecklistTemplateByTypeId(
    id: number,
    req: RequestUser,
    query: QueryDto,
  ) {
    const { organizationId } = req;

    const { page, limit, search, order, sortBy } = query;

    const allowedSortby = ['name'];

    if (sortBy && !allowedSortby.includes(sortBy)) {
      throw new BadRequestException('Invalid sortby');
    }

    // Check equipment type is exist
    const exisiting = await this.prisma.equipmentType.findFirst({
      where: { id, organizationId },
      select: { id: true, isActive: true },
    });

    if (!exisiting) throw new NotFoundException('Equipment type is not found');

    if (!exisiting.isActive) {
      throw new BadRequestException('Equipment type is deactivated');
    }

    const { skip, take } = getPagination(page, limit);

    const filters: Prisma.ChecklistTemplateWhereInput = {
      organizationId,
      equipmentTypeId: id,
    };

    const { where, orderBy } = buildQueryOptions({
      search,
      order,
      filters,
      searchFields: ['name'],
      sortBy,
    });

    const [checklists, total] = await Promise.all([
      this.prisma.checklistTemplate.findMany({
        where,
        skip,
        take,
        orderBy: orderBy ?? { createdAt: 'desc' },
        select: {
          id: true,
          organizationId: true,
          parentId: true,
          version: true,
          name: true,
          description: true,
          isActive: true,
          equipmentTypeId: true,
          equipmentType: {
            select: {
              name: true,
            },
          },
          items: {
            select: {
              id: true,
              name: true,
              order: true,
              type: true,
              expectedValue: true,
              minValue: true,
              maxValue: true,
              options: true,
              isRequired: true,
              isActive: true,
            },
          },
        },
      }),

      this.prisma.checklistTemplate.count({ where }),
    ]);

    const pagination = buildPaginationMeta(page, limit, total);

    const formattedChecklists = checklists.map((list) => ({
      id: list.id,
      name: list.name,
      organizationId: list.organizationId,
      equipmentTypeId: list.equipmentTypeId,
      equipmentType: list.equipmentType.name,
      parentId: list.parentId,
      version: list.version,
      description: list.description,
      isActive: list.isActive,
      checklistItems: list.items,
    }));

    return {
      data: formattedChecklists,
      pagination,
    };
  }
  //#endregion

  //#region update template version
  async updateChecklistTemplateVersion(
    id: number,
    dto: UpdateChecklistTemplateDto,
    req: RequestUser,
    meta?: MetaType,
  ) {
    const { organizationId, userId } = req;
    const { name, equipmentTypeId, description, items } = dto;

    // Check equipment type
    const equipmentType = await this.prisma.equipmentType.findFirst({
      where: { id: equipmentTypeId, organizationId },
      select: { id: true, isActive: true },
    });

    if (!equipmentType)
      throw new NotFoundException('Equipment type is not found');

    if (!equipmentType.isActive) {
      throw new BadRequestException('Equipment type is deactivated');
    }

    const existing = await this.prisma.checklistTemplate.findFirst({
      where: { id, organizationId, isActive: true },
      include: { items: true },
    });

    if (!existing) {
      throw new NotFoundException('Checklist template is not found');
    }

    const rootParentId = existing.parentId ?? existing.id;

    await this.prisma.$transaction(async (tx) => {
      // deactivate old version
      await tx.checklistTemplate.update({
        where: { id: existing.id },
        data: { isActive: false },
      });

      // Create new version
      await tx.checklistTemplate.create({
        data: {
          organizationId,
          equipmentTypeId: equipmentTypeId ?? existing.equipmentTypeId,
          name: name ?? existing.name,
          description: description ?? existing.description,
          parentId: rootParentId,
          version: existing.version + 1,
          items: {
            create: items.map((item) => ({
              name: item.name,
              order: item.order,
              type: item.type,
              expectedValue: item.expectedValue ?? null,
              minValue: item.minValue ?? null,
              maxValue: item.maxValue ?? null,
              // Why we use JSON.stringify for options? because in prisma we can not save array of string directly in postgres, so we save it as string and when we get it we parse it back to array
              options: item.options ? JSON.stringify(item.options) : null,
              isRequired: item.isRequired ?? true,
            })),
          },
        },
      });
    });

    await this.audit.logs({
      organizationId,
      userId,
      action: AuditAction.UPDATE_CHECKLIST,
      module: AuditModule.CHECKLIST,
      recordId: userId.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion

  //#region Deactivate checklist template
  async deactivateChecklistTemplate(
    id: number,
    req: RequestUser,
    meta?: MetaType,
  ) {
    const { organizationId, userId } = req;

    const exisiting = await this.prisma.checklistTemplate.findFirst({
      where: { id, organizationId },
      select: { id: true, isActive: true, parentId: true },
    });

    if (!exisiting) throw new NotFoundException('Checklist template not found');

    if (!exisiting.isActive) {
      throw new BadRequestException('Checklist already deactivated');
    }

    const rootId = exisiting.parentId ?? exisiting.id;

    const updated = await this.prisma.checklistTemplate.updateMany({
      where: {
        organizationId,
        OR: [{ id: rootId }, { parentId: rootId }],
        isActive: true,
      },
      data: { isActive: false },
    });

    if (updated.count === 0) {
      throw new BadRequestException('No active templates found to deactivate');
    }

    await this.audit.logs({
      organizationId,
      userId,
      action: AuditAction.DEACTIVATE_CHECKLIST,
      module: AuditModule.CHECKLIST,
      recordId: id.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion

  //#region Get checklist templates by version
  async getChecklistTemplatesVersions(id: number, req: RequestUser) {
    const { organizationId } = req;

    // Check that template exist
    const exisit = await this.prisma.checklistTemplate.findFirst({
      where: { id, organizationId },
      select: { id: true, parentId: true },
    });

    if (!exisit) throw new NotFoundException('Checklist template not found');

    const rootId = exisit.parentId ?? exisit.id;

    const versions = await this.prisma.checklistTemplate.findMany({
      where: { organizationId, parentId: rootId },
      orderBy: { version: 'asc' },
      select: {
        id: true,
        name: true,
        organizationId: true,
        parentId: true,
        version: true,
        description: true,
        isActive: true,
        equipmentTypeId: true,
        equipmentType: {
          select: {
            name: true,
          },
        },
      },
    });

    const formattedVersions = versions.map((list) => ({
      id: list.id,
      name: list.name,
      organizationId: list.organizationId,
      parentId: list.parentId,
      version: list.version,
      description: list.description,
      isActive: list.isActive,
      equipmentTypeId: list.equipmentTypeId,
      equipmentType: list.equipmentType.name,
    }));

    return {
      data: formattedVersions,
    };
  }
  //#endregion
}
