import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { AuditService } from '../../common/audit/audit.service';

@Injectable()
export class PmtasksService {
  constructor(
    private prisma: PrismaService,
    private audit: AuditService,
  ) {}
}
