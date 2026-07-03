import { Module } from '@nestjs/common';
import { BreakdownService } from './breakdown.service';
import { BreakdownController } from './breakdown.controller';
import { PrismaService } from '../../prisma/prisma.service';
import { AuditService } from '../../common/audit/audit.service';
import { NotificationService } from '../../common/notification/notification.service';

@Module({
  providers: [
    BreakdownService,
    PrismaService,
    AuditService,
    NotificationService,
  ],
  controllers: [BreakdownController],
})
export class BreakdownModule {}
