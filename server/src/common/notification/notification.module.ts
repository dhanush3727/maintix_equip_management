import { Global, Module } from '@nestjs/common';
import { NotificationService } from './notification.service';
import { PrismaService } from '../../prisma/prisma.service';

@Global()
@Module({
  providers: [NotificationService, PrismaService],
  exports: [NotificationService],
})
export class NotificationModule {}
