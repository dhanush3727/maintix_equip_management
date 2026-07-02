import { Injectable, Logger } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { NotificationParam } from './notification.type';
import { Prisma } from '@prisma/client';

@Injectable()
export class NotificationService {
  // This logger is used to log messages related to the NotificationService.
  // It helps in debugging and monitoring the service's operations.
  private readonly logger = new Logger(NotificationService.name);

  async create(
    prisma: Prisma.TransactionClient | PrismaService,
    params: NotificationParam,
  ) {
    try {
      await prisma.notification.create({
        data: {
          organizationId: params.organizationId,
          userId: params.userId,
          type: params.type,
          title: params.title,
          message: params.message,
          referenceId: params.referenceId,
          referenceType: params.referenceType,
        },
      });
    } catch (err: unknown) {
      if (err instanceof Error) {
        this.logger.error('Failed to create notification', err.stack);
      } else {
        this.logger.error('Failed to create notification');
      }
    }
  }
}
