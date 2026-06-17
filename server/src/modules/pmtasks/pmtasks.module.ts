import { Module } from '@nestjs/common';
import { PmtasksController } from './pmtasks.controller';
import { PmtasksService } from './pmtasks.service';
import { PrismaService } from '../../prisma/prisma.service';
import { AuditService } from '../../common/audit/audit.service';

@Module({
  controllers: [PmtasksController],
  providers: [PmtasksService, PrismaService, AuditService],
})
export class PmtasksModule {}
