import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { AuditService } from '../../common/audit/audit.service';
import { RequestUser } from '../../common/types/auth.types';
import { QueryDto } from '../../common/dto/query.dto';
import {
  buildCursorMeta,
  buildCursorQueryOptions,
} from '../../common/utils/query-builder.util';

@Injectable()
export class NotificationsService {
  constructor(
    private prisma: PrismaService,
    private audit: AuditService,
  ) {}

  // #region Create notification
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

    const formattedNotifications = notifications.map((item) => ({
      id: item.id,
      organizationId: item.organizationId,
      userId: item.userId,
      type: item.type,
      title: item.title,
      message: item.message,
      referenceId: item.referenceId,
      referenceType: item.referenceType,
      isRead: item.isRead,
      readAt: item.readAt,
      createdAt: item.createdAt,
    }));

    const { data, meta } = buildCursorMeta(formattedNotifications, limit);

    return { data, meta };
  }
  //#endregion
}
