import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { AuditService } from '../../common/audit/audit.service';
import { CreatePMScheduleDto } from './dto/create-pmschedule.dto';
import { MetaType, RequestUser } from '../../common/types/auth.types';
import { EquipmentStatus, Prisma } from '@prisma/client';
import { AuditAction, AuditModule } from '../../common/audit/audit.types';
import { calculateNextDueDate } from './utils/calculateNextDueDate';
import { PMScheduleQueryDto } from './dto/pmschedule-query.dto';
import {
  buildPaginationMeta,
  buildQueryOptions,
  getPagination,
} from '../../common/utils/query-builder.util';
import { UpdatePMScheduleDto } from './dto/update-pmschedule.dto';

@Injectable()
export class PmschedulesService {
  constructor(
    private prisma: PrismaService,
    private audit: AuditService,
  ) {}

  //#region Create pmschedule
  async createPMSchedule(
    dto: CreatePMScheduleDto,
    req: RequestUser,
    meta?: MetaType,
  ) {
    const { organizationId, userId } = req;

    const {
      equipmentId,
      templateId,
      frequencyType,
      interval,
      startDate,
      assignedTo,
    } = dto;

    const [equipment, template, user] = await Promise.all([
      this.prisma.equipment.findFirst({
        where: { id: equipmentId, organizationId },
        select: { id: true, status: true },
      }),
      this.prisma.checklistTemplate.findFirst({
        where: { id: templateId, organizationId },
        select: { id: true, isActive: true },
      }),
      this.prisma.user.findFirst({
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
      }),
    ]);

    // Check equipment exist
    if (!equipment) throw new NotFoundException('Equipment not found');
    if (equipment.status === EquipmentStatus.INACTIVE) {
      throw new BadRequestException('Equipment is inactive');
    }

    // Check template
    if (!template) throw new NotFoundException('Checklist template not found');
    if (!template.isActive) {
      throw new BadRequestException('Checklist template is deactivate');
    }

    // Check user
    if (!user) throw new NotFoundException('User not found');
    if (!user.isActive) {
      throw new BadRequestException('User is deactivate');
    }
    const isTechnician = user.roles.some((role) => role.roleId === 3);
    if (!isTechnician) {
      throw new BadRequestException('Assigned user must have Technician role');
    }

    // Allow only today/future dates
    const today = new Date();
    today.setHours(0, 0, 0, 0); // Set time to 00:00:00 for accurate comparison

    if (startDate < today) {
      throw new BadRequestException('Invalid start date');
    }

    const nextDueDate = calculateNextDueDate(
      startDate,
      frequencyType,
      interval,
    );

    await this.prisma.pMSchedule.create({
      data: {
        organizationId,
        equipmentId,
        templateId,
        frequencyType,
        interval,
        startDate,
        nextDueDate,
        assignedTo,
      },
    });

    await this.audit.logs({
      organizationId,
      userId,
      action: AuditAction.CREATE_PMSCHEDULE,
      module: AuditModule.PM,
      recordId: userId.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion

  //#region Get pmschedules
  async getPMSchedules(req: RequestUser, query: PMScheduleQueryDto) {
    const { organizationId } = req;

    const {
      page,
      limit,
      sortBy,
      order,
      template,
      equipment,
      frequencyType,
      from,
      to,
    } = query;

    const { skip, take } = getPagination(page, limit);

    const filters: Prisma.PMScheduleWhereInput = { organizationId };

    if (equipment) {
      filters.equipment = {
        name: equipment,
      };
    }

    if (template) {
      filters.template = {
        name: template,
      };
    }

    if (frequencyType) {
      filters.frequencyType = frequencyType;
    }

    if (from || to) {
      filters.nextDueDate = {
        gte: from,
        lte: to,
      };

      console.log(from);
    }

    const { where, orderBy } = buildQueryOptions({
      order,
      filters,
      sortBy,
    });

    const [pmschedules, total] = await Promise.all([
      this.prisma.pMSchedule.findMany({
        where,
        skip,
        take,
        orderBy: orderBy ?? { createdAt: 'desc' },
        select: {
          id: true,
          organizationId: true,
          equipmentId: true,
          templateId: true,
          frequencyType: true,
          interval: true,
          startDate: true,
          nextDueDate: true,
          assignedTo: true,
          isActive: true,
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
          assignee: {
            select: {
              name: true,
            },
          },
        },
      }),

      this.prisma.pMSchedule.count({ where }),
    ]);

    const pagination = buildPaginationMeta(page, limit, total);

    const formattedPMSchedules = pmschedules.map((list) => ({
      id: list.id,
      organizationId: list.id,
      equipmentId: list.equipmentId,
      equipmentName: list.equipment.name,
      templateId: list.templateId,
      template: list.template.name,
      assignedToId: list.assignedTo,
      assignedTo: list.assignee.name,
      frequencyType: list.frequencyType,
      interval: list.interval,
      startDate: list.startDate,
      nextDueDate: list.nextDueDate,
      isActive: list.isActive,
    }));

    return {
      data: formattedPMSchedules,
      pagination,
    };
  }
  //#endregion

  //#region Get PMSchedule by Id
  async getPMScheduleById(id: number, req: RequestUser) {
    const { organizationId } = req;

    const pmschedule = await this.prisma.pMSchedule.findFirst({
      where: {
        id,
        organizationId,
      },
      select: {
        id: true,
        organizationId: true,
        equipmentId: true,
        templateId: true,
        frequencyType: true,
        interval: true,
        startDate: true,
        nextDueDate: true,
        assignedTo: true,
        isActive: true,
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
        assignee: {
          select: {
            name: true,
          },
        },
      },
    });

    if (!pmschedule) throw new NotFoundException('PM Schedule not found');

    const formattedPMSchedule = {
      id: pmschedule.id,
      organizationId: pmschedule.id,
      equipmentId: pmschedule.equipmentId,
      equipmentName: pmschedule.equipment.name,
      templateId: pmschedule.templateId,
      template: pmschedule.template.name,
      assignedToId: pmschedule.assignedTo,
      assignedTo: pmschedule.assignee.name,
      frequencyType: pmschedule.frequencyType,
      interval: pmschedule.interval,
      startDate: pmschedule.startDate,
      nextDueDate: pmschedule.nextDueDate,
      isActive: pmschedule.isActive,
    };

    return formattedPMSchedule;
  }
  //#endregion

  //#region Get PMSchedule by equipment
  async getPMScheduleByEquipment(
    id: number,
    req: RequestUser,
    query: PMScheduleQueryDto,
  ) {
    const { organizationId } = req;

    const {
      page,
      limit,
      sortBy,
      template,
      equipment,
      order,
      frequencyType,
      from,
      to,
    } = query;

    const { skip, take } = getPagination(page, limit);

    const filters: Prisma.PMScheduleWhereInput = {
      organizationId,
      equipmentId: id,
    };

    if (frequencyType) filters.frequencyType = frequencyType;

    if (template) {
      filters.template = {
        name: template,
      };
    }

    if (equipment) {
      filters.equipment = {
        name: equipment,
      };
    }

    if (from || to) {
      filters.nextDueDate = {
        gte: from,
        lte: to,
      };
    }

    const { where, orderBy } = buildQueryOptions({
      order,
      filters,
      sortBy,
    });

    const [pmschedules, total] = await Promise.all([
      this.prisma.pMSchedule.findMany({
        where,
        skip,
        take,
        orderBy: orderBy ?? { createdAt: 'desc' },
        select: {
          id: true,
          organizationId: true,
          equipmentId: true,
          templateId: true,
          frequencyType: true,
          interval: true,
          startDate: true,
          nextDueDate: true,
          assignedTo: true,
          isActive: true,
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
          assignee: {
            select: {
              name: true,
            },
          },
        },
      }),

      this.prisma.pMSchedule.count({ where }),
    ]);

    const pagination = buildPaginationMeta(page, limit, total);

    const formattedPMSchedules = pmschedules.map((list) => ({
      id: list.id,
      organizationId: list.id,
      equipmentId: list.equipmentId,
      equipmentName: list.equipment.name,
      templateId: list.templateId,
      template: list.template.name,
      assignedToId: list.assignedTo,
      assignedTo: list.assignee.name,
      frequencyType: list.frequencyType,
      interval: list.interval,
      startDate: list.startDate,
      nextDueDate: list.nextDueDate,
      isActive: list.isActive,
    }));

    return {
      data: formattedPMSchedules,
      pagination,
    };
  }
  //#endregion

  //#region update PMSchedule
  async updatePMSchedule(
    id: number,
    req: RequestUser,
    dto: UpdatePMScheduleDto,
    meta?: MetaType,
  ) {
    const { organizationId, userId } = req;

    const { frequencyType, interval, startDate, assignedTo } = dto;

    const existing = await this.prisma.pMSchedule.findFirst({
      where: { id, organizationId },
      select: {
        id: true,
        startDate: true,
        frequencyType: true,
        interval: true,
        isActive: true,
      },
    });

    if (!existing) throw new NotFoundException('PMSchedule not found');

    if (!existing.isActive) {
      throw new BadRequestException('PMSchedule is deactivated');
    }

    const data: Prisma.PMScheduleUpdateInput = {};

    if (frequencyType) data.frequencyType = frequencyType;

    if (interval) data.interval = interval;

    if (startDate) {
      const today = new Date();
      today.setHours(0, 0, 0);

      if (startDate < today) {
        throw new BadRequestException('Invalid start date');
      }

      const nextDueDate = calculateNextDueDate(
        startDate,
        frequencyType ?? existing.frequencyType,
        interval ?? existing.interval,
      );

      data.startDate = startDate;
      data.nextDueDate = nextDueDate;
    }

    if (assignedTo) {
      const user = await this.prisma.user.findFirst({
        where: { id: assignedTo, organizationId },
        select: { id: true, isActive: true, roles: true },
      });

      if (!user) throw new NotFoundException('User not found');
      if (!user.isActive) {
        throw new BadRequestException('User is deactivated');
      }
      const isTechnician = user.roles.some((role) => role.roleId === 3);
      if (!isTechnician) {
        throw new BadRequestException(
          'Assigned user must have Technician role',
        );
      }

      data.assignee = {
        connect: {
          id: assignedTo,
        },
      };
    }

    if (Object.keys(data).length === 0) {
      throw new BadRequestException('No valid fields provided');
    }

    if (frequencyType || interval || startDate) {
      const finalStartDate = startDate ?? existing.startDate;
      const finalFrequency = frequencyType ?? existing.frequencyType;
      const finalInterval = interval ?? existing.interval;

      const nextDueDate = calculateNextDueDate(
        finalStartDate,
        finalFrequency,
        finalInterval,
      );

      data.nextDueDate = nextDueDate;
    }

    await this.prisma.pMSchedule.update({
      where: { id, organizationId },
      data,
    });

    await this.audit.logs({
      organizationId,
      userId,
      action: AuditAction.UPDATE_PMSCHEDULE,
      module: AuditModule.PM,
      recordId: id.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion

  //#region Deactivate PM Schedule
  async deactivatePMSchedule(id: number, req: RequestUser, meta?: MetaType) {
    const { organizationId, userId } = req;

    const pmschedule = await this.prisma.pMSchedule.findFirst({
      where: { id, organizationId },
      select: { id: true, isActive: true },
    });

    if (!pmschedule) throw new NotFoundException('PM Schedule not found');

    if (!pmschedule.isActive) {
      throw new BadRequestException('PM Schedule already deactivated');
    }

    await this.prisma.pMSchedule.update({
      where: { id, organizationId },
      data: { isActive: false },
    });

    await this.audit.logs({
      organizationId,
      userId,
      action: AuditAction.DEACTIVATE_PMSCHEDULE,
      module: AuditModule.PM,
      recordId: id.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion

  //#region Activate PM Schedule
  async activatePMSchedule(id: number, req: RequestUser, meta?: MetaType) {
    const { organizationId, userId } = req;

    const pmschedule = await this.prisma.pMSchedule.findFirst({
      where: { id, organizationId },
      select: { id: true, isActive: true },
    });

    if (!pmschedule) throw new NotFoundException('PM Schedule not found');

    if (pmschedule.isActive) {
      throw new BadRequestException('PM Schedule already activated');
    }

    await this.prisma.pMSchedule.update({
      where: { id, organizationId },
      data: { isActive: true },
    });

    await this.audit.logs({
      organizationId,
      userId,
      action: AuditAction.DEACTIVATE_PMSCHEDULE,
      module: AuditModule.PM,
      recordId: id.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion
}
