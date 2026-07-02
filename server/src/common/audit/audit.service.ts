import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { AuditParamsType } from './audit.types';
import { Prisma } from '@prisma/client';

@Injectable()
export class AuditService {
  async logs(
    prisma: Prisma.TransactionClient | PrismaService,
    params: AuditParamsType,
  ) {
    await prisma.auditLog
      .create({
        data: {
          organizationId: params.organizationId,
          userId: params.userId,
          action: params.action,
          module: params.module,
          recordId: params.recordId,
          ipAddress: params.ipAddress,
        },
      })
      .catch(() => {}); // Never break main flow
  }
}
