import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { AuditParamsType } from './audit.types';

@Injectable()
export class AuditService {
  constructor(private prisma: PrismaService) {}

  async logs(params: AuditParamsType) {
    await this.prisma.auditLog
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
