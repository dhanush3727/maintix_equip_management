import {
  BadRequestException,
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
import { UpdateUserDto } from './dto/update-user.dto';

@Injectable()
export class UserService {
  constructor(private prisma: PrismaService) {}

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
  async updateCurrentUserService(dto: UpdateMeDto, userId: number) {
    const { name, currentPassword, newPassword } = dto;

    const user = await this.prisma.user.findUnique({
      where: { id: userId },
      select: { id: true, passwordHash: true },
    });

    if (!user) throw new NotFoundException('User not found');

    if (userId !== user.id) {
      throw new ForbiddenException('You are not allow to update user');
    }

    const data: Prisma.UserUpdateInput = {};

    if (name) data.name = name;

    if (currentPassword && !newPassword) {
      throw new BadRequestException('Enter new password');
    }

    if (currentPassword) {
      const isMatch = await bcrypt.compare(currentPassword, user.passwordHash);
      if (!isMatch) {
        throw new BadRequestException('Current password is wrong');
      }
    }

    if (newPassword) {
      const hashedPassword = await bcrypt.hash(newPassword, 10);
      data.passwordHash = hashedPassword;
    }

    await this.prisma.user.update({
      where: { id: userId },
      data,
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

  //#region Update user by id
  async updateUserById(dto: UpdateUserDto, id: number, organizationId: number) {
    const { email, isActive } = dto;

    const user = await this.prisma.user.findFirst({
      where: { id, organizationId },
      select: { id: true },
    });

    if (!user) throw new NotFoundException('User not found');

    const data: Prisma.UserUpdateInput = {};

    if (email) data.email = email;
  }
  //#endregion
}
