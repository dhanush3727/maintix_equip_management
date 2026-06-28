import { Module } from '@nestjs/common';
import { BreakdownService } from './breakdown.service';
import { BreakdownController } from './breakdown.controller';
import { PrismaService } from '../../prisma/prisma.service';
import { AuditService } from '../../common/audit/audit.service';

@Module({
  providers: [BreakdownService, PrismaService, AuditService],
  controllers: [BreakdownController],
})
export class BreakdownModule {}
