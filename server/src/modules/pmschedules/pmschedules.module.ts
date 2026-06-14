import { Module } from '@nestjs/common';
import { PmschedulesController } from './pmschedules.controller';
import { PmschedulesService } from './pmschedules.service';
import { PrismaService } from '../../prisma/prisma.service';
import { AuditService } from '../../common/audit/audit.service';

@Module({
  controllers: [PmschedulesController],
  providers: [PmschedulesService, PrismaService, AuditService],
})
export class PmschedulesModule {}
