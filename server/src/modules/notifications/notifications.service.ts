import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { RequestUser } from '../../common/types/auth.types';
import { QueryDto } from '../../common/dto/query.dto';
import {
  buildCursorMeta,
  buildCursorQueryOptions,
} from '../../common/utils/query-builder.util';

@Injectable()
export class NotificationsService {
  constructor(private prisma: PrismaService) {}

  // #region Get notifications
  async getAllNotificationsService(req: RequestUser, query: QueryDto) {
    const { organizationId, userId } = req;
    const { cursor, limit, order } = query;

    const { where } = buildCursorQueryOptions({
      cursor,
      limit,
      order,
      filters: { organizationId, userId },
    });

    const notifications = await this.prisma.notification.findMany({
      where,
      select: {
        id: true,
        organizationId: true,
        userId: true,
        type: true,
        title: true,
        message: true,
        referenceId: true,
        referenceType: true,
        isRead: true,
        readAt: true,
        createdAt: true,
      },
    });

    const { data, meta } = buildCursorMeta(notifications, limit);

    return { data, meta };
  }
  //#endregion

  //#region Get unread notification count
  async getUnreadCountService(req: RequestUser) {
    const { organizationId, userId } = req;

    const count = await this.prisma.notification.count({
      where: {
        organizationId,
        userId,
        isRead: false,
      },
    });

    return count;
  }
  //#endregion

  //#region Get notification by id
  async getNotificationById(id: number, req: RequestUser) {
    const { organizationId, userId } = req;

    const notification = await this.prisma.notification.findFirst({
      where: {
        id,
        organizationId,
        userId,
      },
      select: {
        id: true,
        type: true,
        title: true,
        message: true,
        referenceId: true,
        referenceType: true,
        isRead: true,
        readAt: true,
      },
    });

    if (!notification) throw new NotFoundException('Notification not found');

    return notification;
  }
  //#endregion

  //#region Mark all as read
  async markAllAsReadService(req: RequestUser) {
    const { organizationId, userId } = req;

    await this.prisma.notification.updateMany({
      where: {
        organizationId,
        userId,
        isRead: false,
      },
      data: {
        isRead: true,
        readAt: new Date(),
      },
    });
  }
  //#endregion

  //#region Mark as read
  async markAsReadByIdService(id: number, req: RequestUser) {
    const { organizationId, userId } = req;

    await this.prisma.notification.updateMany({
      where: {
        id,
        organizationId,
        userId,
        isRead: false,
      },
      data: {
        isRead: true,
        readAt: new Date(),
      },
    });
  }
  //#endregion

  //#region Delete all notification
  async deleteAllNotifications(req: RequestUser) {
    const { organizationId, userId } = req;

    await this.prisma.notification.deleteMany({
      where: {
        organizationId,
        userId,
        isRead: true,
      },
    });
  }
  //#endregion

  //#region Delete notification by id
  async deleteNotificationById(id: number, req: RequestUser) {
    const { organizationId, userId } = req;

    const deleted = await this.prisma.notification.deleteMany({
      where: {
        id,
        organizationId,
        userId,
        isRead: true,
      },
    });

    if (deleted.count === 0) {
      throw new NotFoundException('Notification not found');
    }
  }
  //#endregion
}
