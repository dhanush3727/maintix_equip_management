import { Module } from '@nestjs/common';
import { PmschedulesController } from './pmschedules.controller';
import { PmschedulesService } from './pmschedules.service';
import { PrismaService } from '../../prisma/prisma.service';
import { AuditService } from '../../common/audit/audit.service';
import { NotificationService } from '../../common/notification/notification.service';

@Module({
  controllers: [PmschedulesController],
  providers: [
    PmschedulesService,
    PrismaService,
    AuditService,
    NotificationService,
  ],
})
export class PmschedulesModule {}
