import {
  BadRequestException,
  ConflictException,
  ForbiddenException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { CreateEquipTypeDto } from './dto/create-equipType.dto';
import { MetaType, RequestUser } from '../../common/types/auth.types';
import { EquipmentStatus, Prisma } from '@prisma/client';
import { AuditService } from '../../common/audit/audit.service';
import { AuditAction, AuditModule } from '../../common/audit/audit.types';
import { QueryDto } from '../../common/dto/query.dto';
import {
  buildPaginationMeta,
  buildQueryOptions,
  getPagination,
} from '../../common/utils/query-builder.util';
import { UpdateEquipTypeDto } from './dto/update-equipType.dto';
import { CreateEquipmentDto } from './dto/create-equipment.dto';
import { EquipmentQueryDto } from './dto/equipment-query.dto';
import { UpdateEquipmentDto } from './dto/update-equipment.dto';

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
      await this.prisma.$transaction(async (tx) => {
        const equipment = await tx.equipmentType.create({
          data: {
            name,
            code,
            description,
            organizationId,
          },
          select: {
            id: true,
          },
        });

        await this.audit.logs(tx, {
          organizationId,
          userId,
          action: AuditAction.CREATE_EQUIPMENT_TYPE,
          module: AuditModule.EQUIPMENT,
          recordId: equipment.id.toString(),
          ipAddress: meta?.ipAddress,
        });
      });
    } catch (err) {
      if (
        err instanceof Prisma.PrismaClientKnownRequestError &&
        err.code === 'P2002'
      ) {
        throw new ConflictException('Equipment Type already exists');
      }
      throw err;
    }
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
          isActive: true,
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
      where: { organizationId, isActive: true },
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

  //#region Get equipments based on type
  async getEquipmentsByType(id: number, req: RequestUser) {
    const { organizationId } = req;

    const equipments = await this.prisma.equipmentType.findMany({
      where: { id, organizationId },
      select: {
        id: true,
        name: true,
        equipments: {
          select: {
            id: true,
            name: true,
            status: true,
          },
        },
      },
    });

    return equipments;
  }
  //#endregion

  //#region update equipment type
  async updateEquipmentType(
    id: number,
    req: RequestUser,
    dto: UpdateEquipTypeDto,
    meta?: MetaType,
  ) {
    const { name, code, description } = dto;

    const { organizationId, userId } = req;

    const equipType = await this.prisma.equipmentType.findFirst({
      where: { id, organizationId, isActive: true },
      select: { id: true, isActive: true },
    });

    if (!equipType) throw new NotFoundException('Equipment type not found');

    if (!equipType.isActive) {
      throw new ForbiddenException('The equipment type is deactivate');
    }

    const data: Prisma.EquipmentTypeUpdateInput = {};

    if (name) data.name = name;
    if (code) data.code = code;
    if (description) data.description = description;

    if (Object.keys(data).length === 0) {
      throw new BadRequestException('No valid fields provided');
    }

    try {
      await this.prisma.$transaction(async (tx) => {
        await tx.equipmentType.update({
          where: { id, organizationId },
          data,
        });

        await this.audit.logs(tx, {
          organizationId,
          userId,
          action: AuditAction.UPDATE_EQUIPMENT_TYPE,
          module: AuditModule.EQUIPMENT,
          recordId: id.toString(),
          ipAddress: meta?.ipAddress,
        });
      });
    } catch (err) {
      if (
        err instanceof Prisma.PrismaClientKnownRequestError &&
        err.code === 'P2002'
      ) {
        throw new ConflictException('Equipment type already exist');
      }
      throw err;
    }
  }
  //#endregion

  //#region deactivate equiment type
  async deactivateEquipmentType(id: number, req: RequestUser, meta?: MetaType) {
    const { organizationId, userId } = req;

    const existing = await this.prisma.equipmentType.findFirst({
      where: { id, organizationId },
      select: { id: true, isActive: true },
    });

    if (!existing) throw new NotFoundException('Equipment type not found');

    if (!existing.isActive) {
      throw new BadRequestException('Equipment type already deactivated');
    }

    const isUsed = await this.prisma.equipment.findFirst({
      where: {
        equipmentTypeId: id,
        organizationId,
        status: EquipmentStatus.ACTIVE,
      },
      select: { id: true },
    });

    if (isUsed) {
      throw new BadRequestException(
        'Cannot deactivate equipment type that is already in use',
      );
    }

    await this.prisma.$transaction(async (tx) => {
      await tx.equipmentType.update({
        where: { id },
        data: { isActive: false },
      });

      await this.audit.logs(tx, {
        organizationId,
        userId,
        action: AuditAction.DEACTIVATE_EQUIPMENT_TYPE,
        module: AuditModule.EQUIPMENT,
        recordId: id.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion

  //#region activate equipment type
  async activateEquipmentType(id: number, req: RequestUser, meta?: MetaType) {
    const { organizationId, userId } = req;

    const existing = await this.prisma.equipmentType.findFirst({
      where: { id, organizationId },
      select: { id: true, isActive: true },
    });

    if (!existing) throw new NotFoundException('Equipment type not found');

    if (existing.isActive) {
      throw new BadRequestException('Equipment type already in active');
    }

    await this.prisma.$transaction(async (tx) => {
      await tx.equipmentType.update({
        where: { id },
        data: { isActive: true },
      });

      await this.audit.logs(tx, {
        organizationId,
        userId,
        action: AuditAction.ACTIVATE_EQUIPMENT_TYPE,
        module: AuditModule.EQUIPMENT,
        recordId: id.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion

  //#region Create equipment
  async createEquipmentService(
    req: RequestUser,
    dto: CreateEquipmentDto,
    meta?: MetaType,
  ) {
    const { organizationId, userId } = req;

    const {
      name,
      code,
      serialNumber,
      equipmentTypeId,
      locationId,
      departmentId,
      installedDate,
      warrantyExpiry,
      manufacturer,
      model,
    } = dto;

    // Check equipment type
    const equipmentType = await this.prisma.equipmentType.findFirst({
      where: { id: equipmentTypeId, organizationId },
      select: { id: true, isActive: true },
    });

    if (!equipmentType) throw new NotFoundException('Equipment type not found');

    if (!equipmentType.isActive) {
      throw new BadRequestException('Equipment type is deactivated');
    }

    // Check location
    const location = await this.prisma.location.findFirst({
      where: { id: locationId, organizationId },
      select: { id: true },
    });

    if (!location) throw new NotFoundException('Location not found');

    // Check department
    const department = await this.prisma.department.findFirst({
      where: { id: departmentId, organizationId },
      select: {
        id: true,
      },
    });

    if (!department) throw new NotFoundException('Department not found');

    try {
      await this.prisma.$transaction(async (tx) => {
        const equipment = await tx.equipment.create({
          data: {
            name,
            code,
            serialNumber,
            equipmentTypeId,
            organizationId,
            locationId,
            departmentId,
            installedDate,
            warrantyExpiry,
            manufacturer,
            model,
          },
          select: {
            id: true,
          },
        });

        await this.audit.logs(tx, {
          organizationId,
          userId,
          action: AuditAction.CREATE_EQUIPMENT,
          module: AuditModule.EQUIPMENT,
          recordId: equipment.id.toString(),
          ipAddress: meta?.ipAddress,
        });
      });
    } catch (err) {
      if (
        err instanceof Prisma.PrismaClientKnownRequestError &&
        err.code === 'P2002'
      ) {
        throw new ConflictException('Equipment code already exist');
      }
      throw err;
    }
  }
  //#endregion

  //#region Get equipments
  async getEquipmentsService(req: RequestUser, query: EquipmentQueryDto) {
    const { organizationId } = req;

    const {
      page = 1,
      limit = 10,
      search,
      sortBy,
      order,
      status,
      department,
      location,
      type,
    } = query;

    const allowedSortBy = ['name', 'code'];

    if (sortBy && !allowedSortBy.includes(sortBy)) {
      throw new BadRequestException('Invalid sortBy');
    }

    const { skip, take } = getPagination(page, limit);

    const filters: Prisma.EquipmentWhereInput = { organizationId };

    if (status) {
      filters.status = status;
    }

    if (location) {
      filters.location = {
        name: location,
      };
    }

    if (department) {
      filters.department = {
        name: department,
      };
    }

    if (type) {
      filters.equipmentType = {
        name: type,
      };
    }

    const { where, orderBy } = buildQueryOptions({
      search,
      order,
      filters,
      searchFields: ['name', 'serialNumber', 'code', 'manufacturer', 'model'],
      sortBy,
    });

    const [equipments, total] = await Promise.all([
      this.prisma.equipment.findMany({
        where,
        skip,
        take,
        orderBy: orderBy ?? { createdAt: 'desc' },
        select: {
          id: true,
          equipmentTypeId: true,
          name: true,
          code: true,
          serialNumber: true,
          status: true,
          installedDate: true,
          warrantyExpiry: true,
          manufacturer: true,
          model: true,
          equipmentType: {
            select: {
              name: true,
              code: true,
            },
          },
          location: {
            select: {
              id: true,
              name: true,
            },
          },
          department: {
            select: {
              id: true,
              name: true,
            },
          },
        },
      }),

      this.prisma.equipment.count({ where }),
    ]);

    const pagination = buildPaginationMeta(page, limit, total);

    return {
      data: equipments,
      pagination,
    };
  }
  //#endregion

  //#region Get equipments by type
  async getEquipmentsByTypeId(
    typeId: number,
    req: RequestUser,
    query: EquipmentQueryDto,
  ) {
    const { organizationId } = req;

    const equipType = await this.prisma.equipmentType.findFirst({
      where: { id: typeId, organizationId },
      select: { id: true, isActive: true },
    });

    if (!equipType) throw new NotFoundException('Equipment type not found');

    if (!equipType.isActive) {
      throw new BadRequestException('Equipment type is deactivate');
    }

    const {
      page = 1,
      limit = 10,
      search,
      sortBy,
      order,
      status,
      department,
      location,
      type,
    } = query;

    const { skip, take } = getPagination(page, limit);

    const filters: Prisma.EquipmentWhereInput = {
      organizationId,
      equipmentTypeId: typeId,
    };

    if (status) {
      filters.status = status;
    }

    if (location) {
      filters.location = {
        name: location,
      };
    }

    if (department) {
      filters.department = {
        name: department,
      };
    }

    if (type) {
      filters.equipmentType = {
        name: type,
      };
    }

    const { where, orderBy } = buildQueryOptions({
      search,
      order,
      filters,
      searchFields: ['name', 'serialNumber', 'code', 'manufacturer', 'model'],
      sortBy,
    });

    const [equipments, total] = await Promise.all([
      this.prisma.equipment.findMany({
        where,
        skip,
        take,
        orderBy: orderBy ?? { createdAt: 'desc' },
        select: {
          id: true,
          equipmentTypeId: true,
          name: true,
          code: true,
          serialNumber: true,
          status: true,
          installedDate: true,
          warrantyExpiry: true,
          manufacturer: true,
          model: true,
          equipmentType: {
            select: {
              name: true,
              code: true,
            },
          },
          location: {
            select: {
              id: true,
              name: true,
            },
          },
          department: {
            select: {
              id: true,
              name: true,
            },
          },
        },
      }),

      this.prisma.equipment.count({ where }),
    ]);

    const pagination = buildPaginationMeta(page, limit, total);

    return {
      data: equipments,
      pagination,
    };
  }
  //#endregion

  //#region Get equipments by location
  async getEquipmentsByLocation(
    locationId: number,
    req: RequestUser,
    query: EquipmentQueryDto,
  ) {
    const { organizationId } = req;

    const existing = await this.prisma.location.findFirst({
      where: { id: locationId, organizationId },
      select: { id: true },
    });

    if (!existing) throw new NotFoundException('Location not found');

    const {
      page = 1,
      limit = 10,
      search,
      sortBy,
      order,
      status,
      department,
      location,
      type,
    } = query;

    const { skip, take } = getPagination(page, limit);

    const filters: Prisma.EquipmentWhereInput = {
      organizationId,
      locationId,
    };

    if (status) {
      filters.status = status;
    }

    if (location) {
      filters.location = {
        name: location,
      };
    }

    if (department) {
      filters.department = {
        name: department,
      };
    }

    if (type) {
      filters.equipmentType = {
        name: type,
      };
    }

    const { where, orderBy } = buildQueryOptions({
      search,
      order,
      filters,
      searchFields: ['name', 'serialNumber', 'code', 'manufacturer', 'model'],
      sortBy,
    });

    const [equipments, total] = await Promise.all([
      this.prisma.equipment.findMany({
        where,
        skip,
        take,
        orderBy: orderBy ?? { createdAt: 'desc' },
        select: {
          id: true,
          equipmentTypeId: true,
          name: true,
          code: true,
          serialNumber: true,
          status: true,
          installedDate: true,
          warrantyExpiry: true,
          manufacturer: true,
          model: true,
          equipmentType: {
            select: {
              name: true,
              code: true,
            },
          },
          location: {
            select: {
              id: true,
              name: true,
            },
          },
          department: {
            select: {
              id: true,
              name: true,
            },
          },
        },
      }),

      this.prisma.equipment.count({ where }),
    ]);

    const pagination = buildPaginationMeta(page, limit, total);

    return {
      data: equipments,
      pagination,
    };
  }
  //#endregion

  //#region Get equipments by department
  async getEquipmentsByDepartment(
    departmentId: number,
    req: RequestUser,
    query: EquipmentQueryDto,
  ) {
    const { organizationId } = req;

    const existing = await this.prisma.department.findFirst({
      where: { id: departmentId, organizationId },
      select: { id: true },
    });

    if (!existing) throw new NotFoundException('Department not found');

    const {
      page = 1,
      limit = 10,
      search,
      sortBy,
      order,
      status,
      department,
      location,
      type,
    } = query;

    const { skip, take } = getPagination(page, limit);

    const filters: Prisma.EquipmentWhereInput = {
      organizationId,
      departmentId,
    };

    if (status) {
      filters.status = status;
    }

    if (location) {
      filters.location = {
        name: location,
      };
    }

    if (department) {
      filters.department = {
        name: department,
      };
    }

    if (type) {
      filters.equipmentType = {
        name: type,
      };
    }

    const { where, orderBy } = buildQueryOptions({
      search,
      order,
      filters,
      searchFields: ['name', 'serialNumber', 'code', 'manufacturer', 'model'],
      sortBy,
    });

    const [equipments, total] = await Promise.all([
      this.prisma.equipment.findMany({
        where,
        skip,
        take,
        orderBy: orderBy ?? { createdAt: 'desc' },
        select: {
          id: true,
          equipmentTypeId: true,
          name: true,
          code: true,
          serialNumber: true,
          status: true,
          installedDate: true,
          warrantyExpiry: true,
          manufacturer: true,
          model: true,
          equipmentType: {
            select: {
              name: true,
              code: true,
            },
          },
          location: {
            select: {
              id: true,
              name: true,
            },
          },
          department: {
            select: {
              id: true,
              name: true,
            },
          },
        },
      }),

      this.prisma.equipment.count({ where }),
    ]);

    const pagination = buildPaginationMeta(page, limit, total);

    return {
      data: equipments,
      pagination,
    };
  }
  //#endregion

  //#region Get equipment by id
  async getEquipmentById(id: number, req: RequestUser) {
    const { organizationId } = req;

    const equipment = await this.prisma.equipment.findFirst({
      where: { id, organizationId },
      select: {
        id: true,
        equipmentTypeId: true,
        name: true,
        code: true,
        serialNumber: true,
        status: true,
        installedDate: true,
        warrantyExpiry: true,
        manufacturer: true,
        model: true,
        equipmentType: {
          select: {
            name: true,
            code: true,
          },
        },
        location: {
          select: {
            id: true,
            name: true,
          },
        },
        department: {
          select: {
            id: true,
            name: true,
          },
        },
      },
    });

    if (!equipment) throw new NotFoundException('Equipment not found');

    return equipment;
  }
  //#endregion

  //#region update equipment
  async updateEquipment(
    id: number,
    req: RequestUser,
    dto: UpdateEquipmentDto,
    meta?: MetaType,
  ) {
    const { organizationId, userId } = req;

    const {
      name,
      code,
      serialNumber,
      equipmentTypeId,
      locationId,
      departmentId,
      installedDate,
      warrantyExpiry,
      manufacturer,
      model,
    } = dto;

    const existing = await this.prisma.equipment.findFirst({
      where: { id, organizationId },
      select: { id: true, status: true },
    });

    if (!existing) throw new NotFoundException('Equipment not found');

    if (existing.status === EquipmentStatus.INACTIVE) {
      throw new BadRequestException('Equipment is deactivate');
    }

    const data: Prisma.EquipmentUpdateInput = {};

    if (name) data.name = name;
    if (code) data.code = code;
    if (serialNumber) data.serialNumber = serialNumber;
    if (installedDate) data.installedDate = installedDate;
    if (warrantyExpiry) data.warrantyExpiry = warrantyExpiry;
    if (manufacturer) data.manufacturer = manufacturer;
    if (model) data.model = model;

    if (equipmentTypeId) {
      const equipType = await this.prisma.equipmentType.findFirst({
        where: { id: equipmentTypeId, organizationId },
        select: { id: true, isActive: true },
      });

      if (!equipType)
        throw new NotFoundException('Equipment type is not found');

      if (!equipType.isActive) {
        throw new BadRequestException('Equipment type is deactivated');
      }

      console.log(data.equipmentType);

      data.equipmentType = {
        // Link this record to an existing row in another table
        connect: {
          id: equipmentTypeId,
        },
      };
    }

    if (locationId) {
      const location = await this.prisma.location.findFirst({
        where: { id: locationId, organizationId },
        select: { id: true },
      });

      if (!location) throw new NotFoundException('Location not found');

      data.location = {
        // Link this record to an existing row in another table
        connect: {
          id: locationId,
        },
      };
    }

    if (departmentId) {
      const department = await this.prisma.department.findFirst({
        where: { id: departmentId, organizationId },
        select: { id: true },
      });

      if (!department) throw new NotFoundException('Department not found');

      data.department = {
        // Link this record to an existing row in another table
        connect: {
          id: departmentId,
        },
      };
    }

    if (Object.keys(data).length === 0) {
      throw new BadRequestException('No valid fields provided');
    }

    try {
      await this.prisma.$transaction(async (tx) => {
        await tx.equipment.update({
          where: { id, organizationId },
          data,
        });

        await this.audit.logs(tx, {
          organizationId,
          userId,
          action: AuditAction.UPDATE_EQUIPMENT,
          module: AuditModule.EQUIPMENT,
          recordId: id.toString(),
          ipAddress: meta?.ipAddress,
        });
      });
    } catch (err) {
      if (
        err instanceof Prisma.PrismaClientKnownRequestError &&
        err.code === 'P2002'
      ) {
        throw new ConflictException('Equipment code already exists');
      }
      throw err;
    }
  }
  //#endregion

  //#region deactivate equipment
  async deactivateEquipment(id: number, req: RequestUser, meta?: MetaType) {
    const { organizationId, userId } = req;

    const existing = await this.prisma.equipment.findFirst({
      where: { id, organizationId },
      select: { id: true, status: true },
    });

    if (!existing) throw new NotFoundException('Equipment not found');

    if (existing.status === EquipmentStatus.INACTIVE) {
      throw new BadRequestException('Equipment already deactivated');
    }

    if (
      existing.status === EquipmentStatus.BREAKDOWN ||
      existing.status === EquipmentStatus.UNDER_MAINTENANCE
    ) {
      throw new BadRequestException('Cannot deactivate equipment');
    }

    await this.prisma.$transaction(async (tx) => {
      await tx.equipment.update({
        where: { id, organizationId },
        data: { status: EquipmentStatus.INACTIVE },
      });

      await this.audit.logs(tx, {
        organizationId,
        userId,
        action: AuditAction.DEACTIVATE_EQUIPMENT,
        module: AuditModule.EQUIPMENT,
        recordId: id.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion

  //#region activate equipment
  async activateEquipment(id: number, req: RequestUser, meta?: MetaType) {
    const { organizationId, userId } = req;

    const existing = await this.prisma.equipment.findFirst({
      where: { id, organizationId },
      select: { id: true, status: true },
    });

    if (!existing) throw new NotFoundException('Equipment not found');

    if (existing.status === EquipmentStatus.ACTIVE) {
      throw new BadRequestException('Equipment is already active');
    }

    await this.prisma.$transaction(async (tx) => {
      await tx.equipment.update({
        where: { id, organizationId },
        data: { status: EquipmentStatus.ACTIVE },
      });

      await this.audit.logs(tx, {
        organizationId,
        userId,
        action: AuditAction.ACTIVATE_EQUIPMENT,
        module: AuditModule.EQUIPMENT,
        recordId: id.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion
}
