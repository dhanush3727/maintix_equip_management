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
}
