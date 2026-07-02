import {
  BadRequestException,
  ConflictException,
  ForbiddenException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import {
  buildPaginationMeta,
  buildQueryOptions,
  getPagination,
} from '../../common/utils/query-builder.util';
import { Prisma } from '@prisma/client';
import { UserQueryDto } from './dto/user-query.dto';
import { UpdateMeDto } from './dto/update-me.dto';
import * as bcrypt from 'bcrypt';
import { UpdateEmailDto } from './dto/update-email.dto';
import { UpdateRolesDto } from './dto/update-role.dto';
import { UpdateDepartmentDto } from './dto/update-department.dto';
import { UpdatePasswordDto } from './dto/update-password.dto';
import { AuditService } from '../../common/audit/audit.service';
import { AuditAction, AuditModule } from '../../common/audit/audit.types';
import { MetaType, RequestUser } from '../../common/types/auth.types';

@Injectable()
export class UserService {
  constructor(
    private prisma: PrismaService,
    private audit: AuditService,
  ) {}

  //#region Get all users
  async getAllUsersService(query: UserQueryDto) {
    const {
      page = 1,
      limit = 10,
      search,
      sortBy,
      order,
      role,
      department,
    } = query;

    const { skip, take } = getPagination(page, limit);

    const filters: Prisma.UserWhereInput = {};

    if (role) {
      filters.roles = {
        some: {
          role: {
            name: role,
          },
        },
      };
    }

    if (department) {
      filters.department = {
        department: {
          name: department,
        },
      };
    }

    const { where, orderBy } = buildQueryOptions({
      search,
      order,
      filters,
      searchFields: ['name', 'email'],
      sortBy,
    });

    const [users, total] = await Promise.all([
      this.prisma.user.findMany({
        where,
        skip,
        take,
        orderBy: orderBy ?? { createdAt: 'desc' },
        select: {
          id: true,
          name: true,
          email: true,
          organizationId: true,
          roles: {
            select: {
              role: {
                select: {
                  id: true,
                  name: true,
                },
              },
            },
          },
          department: {
            select: {
              department: {
                select: {
                  id: true,
                  name: true,
                },
              },
            },
          },
          isActive: true,
        },
      }),

      this.prisma.user.count({ where }),
    ]);

    const formattedUser = users.map((user) => ({
      id: user.id,
      name: user.name,
      email: user.email,
      organizationId: user.organizationId,
      isActive: user.isActive,
      roles: user.roles.map((role) => ({
        id: role.role.id,
        name: role.role.name,
      })),
      department: {
        id: user.department?.department.id,
        name: user.department?.department.name,
      },
    }));

    const pagination = buildPaginationMeta(page, limit, total);

    return {
      data: formattedUser,
      pagination,
    };
  }
  //#endregion

  //#region Get user by id
  async getUserByIdService(userId: number) {
    const user = await this.prisma.user.findUnique({
      where: {
        id: userId,
      },
      select: {
        id: true,
        name: true,
        email: true,
        organizationId: true,
        roles: {
          select: {
            id: true,
            roleId: true,
          },
        },
        department: {
          select: {
            id: true,
            departmentId: true,
          },
        },
        isActive: true,
      },
    });

    if (!user) throw new NotFoundException('User not found');

    return user;
  }
  //#endregion

  //#region Update current user
  async updateCurrentUserService(
    dto: UpdateMeDto,
    userId: number,
    organizationId: number,
    meta?: MetaType,
  ) {
    const { name } = dto;

    const user = await this.prisma.user.findUnique({
      where: { id: userId },
      select: { id: true },
    });

    if (!user) throw new NotFoundException('User not found');

    if (userId !== user.id) {
      throw new ForbiddenException('You are not allow to update user');
    }

    const data: Prisma.UserUpdateInput = {};

    if (name) data.name = name;

    await this.prisma.$transaction(async (tx) => {
      await tx.user.update({
        where: { id: userId },
        data,
      });

      await this.audit.logs(tx, {
        organizationId,
        userId,
        action: AuditAction.UPDATE_USER_NAME,
        module: AuditModule.USER,
        recordId: userId.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion

  //#region Update current user password
  async updateCurrentUserPassword(
    dto: UpdatePasswordDto,
    userId: number,
    jti: string,
    organizationId: number,
    meta?: MetaType,
  ) {
    const { currentPassword, newPassword } = dto;

    const user = await this.prisma.user.findUnique({
      where: { id: userId },
      select: { id: true, passwordHash: true },
    });

    if (!user) throw new NotFoundException('User not found');

    if (userId !== user.id) {
      throw new ForbiddenException('You are not allow to update user');
    }

    const data: Prisma.UserUpdateInput = {};

    if (currentPassword && !newPassword) {
      throw new BadRequestException('Enter new password');
    }

    if (currentPassword) {
      const isMatch = await bcrypt.compare(currentPassword, user.passwordHash);
      if (!isMatch) throw new BadRequestException('Current password is wrong');
    }

    if (newPassword) {
      const passwordHash = await bcrypt.hash(newPassword, 10);

      data.passwordHash = passwordHash;
    }

    await this.prisma.$transaction(async (tx) => {
      // update the user password
      await tx.user.update({
        where: { id: userId },
        data,
      });

      // deactivate all sessions for that user except current session
      await tx.userSession.updateMany({
        where: {
          userId,
          isActive: true,
          NOT: {
            jti,
          },
        },
        data: { isActive: false },
      });

      // Audit log
      await this.audit.logs(tx, {
        organizationId,
        userId,
        action: AuditAction.UPDATE_USER_PASSWORD,
        module: AuditModule.USER,
        recordId: userId.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion

  //#region Get Users based on organizations
  async getUsersByOrganizationService(
    organizationId: number,
    query: UserQueryDto,
  ) {
    const {
      page = 1,
      limit = 1,
      search,
      sortBy,
      order,
      role,
      department,
    } = query;

    const allowedSortBy = ['name', 'email'];

    if (sortBy && !allowedSortBy.includes(sortBy)) {
      throw new BadRequestException('Invalid sortBy');
    }

    const { skip, take } = getPagination(page, limit);

    const filters: Prisma.UserWhereInput = { organizationId };

    if (role) {
      filters.roles = {
        some: {
          role: {
            name: role,
          },
        },
      };
    }

    if (department) {
      filters.department = {
        department: {
          name: department,
        },
      };
    }

    const { where, orderBy } = buildQueryOptions({
      search,
      order,
      filters,
      searchFields: ['name', 'email'],
      sortBy,
    });

    const [users, total] = await Promise.all([
      this.prisma.user.findMany({
        where,
        skip,
        take,
        orderBy: orderBy ?? { createdAt: 'desc' },
        select: {
          id: true,
          name: true,
          email: true,
          organizationId: true,
          roles: {
            select: {
              role: {
                select: {
                  id: true,
                  name: true,
                },
              },
            },
          },
          department: {
            select: {
              department: {
                select: {
                  id: true,
                  name: true,
                },
              },
            },
          },
          isActive: true,
        },
      }),

      this.prisma.user.count({ where }),
    ]);

    const formattedUsers = users.map((user) => ({
      id: user.id,
      name: user.name,
      email: user.email,
      organizationId: user.organizationId,
      isActive: user.isActive,
      roles: user.roles.map((role) => ({
        id: role.role.id,
        name: role.role.name,
      })),
      department: {
        id: user.department?.department.id,
        name: user.department?.department.name,
      },
    }));

    const pagination = buildPaginationMeta(page, limit, total);

    return {
      data: formattedUsers,
      pagination,
    };
  }
  //#endregion

  //#region Get user by id based on organization
  async getUserByIdOrgsService(organizationId: number, id: number) {
    const user = await this.prisma.user.findFirst({
      where: { id, organizationId },
      select: {
        id: true,
        name: true,
        email: true,
        organizationId: true,
        roles: {
          select: {
            role: {
              select: {
                id: true,
                name: true,
              },
            },
          },
        },
        department: {
          select: {
            department: {
              select: {
                id: true,
                name: true,
              },
            },
          },
        },
        isActive: true,
      },
    });

    if (!user) throw new NotFoundException('User Not found');

    const formattedUser = {
      id: user.id,
      name: user.name,
      email: user.email,
      organizationId: user.organizationId,
      isActive: user.isActive,
      roles: user.roles.map((role) => ({
        id: role.role.id,
        name: role.role.name,
      })),
      department: {
        id: user.department?.department.id,
        name: user.department?.department.name,
      },
    };

    return {
      data: formattedUser,
    };
  }
  //#endregion

  //#region Update user email by id
  async updateUserEmailService(
    dto: UpdateEmailDto,
    id: number,
    organizationId: number,
    userId: number,
    meta?: MetaType,
  ) {
    const { email } = dto;

    const user = await this.prisma.user.findFirst({
      where: { id, organizationId },
      select: { id: true },
    });

    if (!user) throw new NotFoundException('User not found');

    const data: Prisma.UserUpdateInput = {};

    if (email) data.email = email;

    const existing = await this.prisma.user.findUnique({
      where: { email },
      select: { id: true },
    });

    if (existing) throw new ConflictException('This email already exist');

    await this.prisma.$transaction(async (tx) => {
      await tx.user.update({
        where: { id },
        data,
      });

      await this.audit.logs(tx, {
        organizationId,
        userId,
        action: AuditAction.UPDATE_USER_EMAIL,
        module: AuditModule.USER,
        recordId: id.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion

  //#region Update user roles by id
  async updateUserRolesService(
    id: number,
    organizationId: number,
    dto: UpdateRolesDto,
    userId: number,
    meta?: MetaType,
  ) {
    const { roleIds } = dto;

    // Check user
    const user = await this.prisma.user.findFirst({
      where: { id, organizationId },
      select: { id: true },
    });

    if (!user) throw new NotFoundException('User not found');

    // remove duplicates
    const uniqueRoleIds = [...new Set(roleIds)];

    // validate role exist
    // if request comes like [1,2,5] but in role only have [1,2,3] so it will return two roles only
    const roles = await this.prisma.role.findMany({
      where: {
        id: { in: uniqueRoleIds }, // in refers to SQL IN operator, it checks the uniqueRoleIds array and finds all roles that have an id matching any of the values in that array
      },
      select: {
        id: true,
      },
    });

    // after it return the roles check the roles length and the uniqueRoleIds length are same,
    // if not then uniqueRoleIds have invalid role id so we throw error
    if (roles.length !== uniqueRoleIds.length) {
      throw new BadRequestException('Invalid roles provided');
    }

    // Replace old roles with new roles
    // why replace? because if we only add new roles then old roles will still exist and if we only delete old roles then
    // there will be some time that user will have no role which is not good,
    // so we do it in transaction to make sure that either both operation success or both operation fail
    await this.prisma.$transaction(async (tx) => {
      // Delete old data
      await tx.userRole.deleteMany({
        where: {
          userId: id,
        },
      });

      //Create new data
      await tx.userRole.createMany({
        data: uniqueRoleIds.map((roleId) => ({
          userId: id,
          roleId,
        })),
        skipDuplicates: true, // skipDuplicates is used to avoid duplicate entries in case the same roleId is provided multiple times
      });

      await this.audit.logs(tx, {
        organizationId,
        userId,
        action: AuditAction.UPDATE_USER_ROLE,
        module: AuditModule.USER,
        recordId: id.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion

  //#region Update user department
  async updateUserDepartment(
    id: number,
    organizationId: number,
    dto: UpdateDepartmentDto,
    userId: number,
    meta?: MetaType,
  ) {
    const { departmentId } = dto;

    // check user
    const user = await this.prisma.user.findFirst({
      where: { id, organizationId },
      select: { id: true },
    });

    if (!user) throw new NotFoundException('User not found');

    // check valid dep id
    const department = await this.prisma.department.findFirst({
      where: { id: departmentId, organizationId },
      select: { id: true },
    });

    if (!department) throw new BadRequestException('Invalid department');

    // why upsert? because if we use update then if user have no department assigned then it will throw error but
    // with upsert if user have no department then it will create new record with user id and department id and if
    // user already have department then it will update the department id with new one
    await this.prisma.$transaction(async (tx) => {
      await tx.userDepartment.upsert({
        where: { userId: id },
        update: {
          departmentId,
        },
        create: {
          userId: id,
          departmentId,
        },
      });

      await this.audit.logs(tx, {
        organizationId,
        userId,
        action: AuditAction.UPDATE_USER_DEPARTMENT,
        module: AuditModule.USER,
        recordId: id.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion

  //#region Deactivate user
  async deactivateUserService(id: number, req: RequestUser, meta?: MetaType) {
    const { organizationId, userId } = req;

    // Check user
    const user = await this.prisma.user.findFirst({
      where: { id, organizationId },
      select: { id: true, isActive: true },
    });

    if (!user) throw new NotFoundException('User not found');

    if (!user.isActive)
      throw new BadRequestException('User already deactivated');

    if (id === userId) {
      throw new ForbiddenException('You cannot deactivate yourself');
    }

    // Deactivate user and user session
    await this.prisma.$transaction(async (tx) => {
      await tx.user.update({
        where: { id, isActive: true },
        data: { isActive: false },
      });

      await tx.userSession.updateMany({
        where: { userId: id, isActive: true },
        data: { isActive: false },
      });

      await this.audit.logs(tx, {
        organizationId,
        userId,
        action: AuditAction.DEACTIVATE_USER,
        module: AuditModule.USER,
        recordId: id.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion

  //#region Activate user
  async activateUserService(id: number, req: RequestUser, meta?: MetaType) {
    const { organizationId, userId } = req;

    const user = await this.prisma.user.findFirst({
      where: { id, organizationId },
      select: { id: true, isActive: true },
    });

    if (!user) throw new NotFoundException('User not found');

    if (user.isActive) {
      throw new BadRequestException('User already active');
    }

    await this.prisma.$transaction(async (tx) => {
      // Activate user
      await tx.user.update({
        where: { id, isActive: false },
        data: { isActive: true },
      });

      //audit logs
      await this.audit.logs(tx, {
        organizationId,
        userId,
        action: AuditAction.ACTIVATE_USER,
        module: AuditModule.USER,
        recordId: id.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion
}
