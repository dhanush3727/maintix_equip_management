import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';

@Injectable()
export class UserService {
  constructor(private prisma: PrismaService) {}

  //#region Get all users
  async getAllUsersService() {
    const users = await this.prisma.user.findMany({
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

    return users;
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
}
