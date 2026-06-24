import { Module } from '@nestjs/common';
import { PmtasksController } from './pmtasks.controller';
import { PmtasksService } from './pmtasks.service';
import { PrismaService } from '../../prisma/prisma.service';
import { AuditService } from '../../common/audit/audit.service';
import { PMTaskGeneratorService } from './schedular/pmtask-generator.service';

@Module({
  controllers: [PmtasksController],
  providers: [
    PmtasksService,
    PrismaService,
    AuditService,
    PMTaskGeneratorService,
  ],
})
export class PmtasksModule {}
