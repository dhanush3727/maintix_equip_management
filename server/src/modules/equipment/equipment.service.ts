import { BadRequestException, Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { CreateEquipTypeDto } from './dto/create-equipType.dto';
import { MetaType, RequestUser } from '../../common/types/auth.types';
import { Prisma } from '@prisma/client';
import { AuditService } from '../../common/audit/audit.service';
import { AuditAction, AuditModule } from '../../common/audit/audit.types';

@Injectable()
export class EquipmentService {
  constructor(
    private prisma: PrismaService,
    private audit: AuditService,
  ) {}

  //#region Create Equipment type service
  async createEquipmentType(
    dto: CreateEquipTypeDto,
    req: RequestUser,
    meta?: MetaType,
  ) {
    const { name, code, description } = dto;

    const { organizationId, userId } = req;

    try {
      await this.prisma.equipmentType.create({
        data: {
          name,
          code,
          description,
          organizationId,
        },
      });
    } catch (err) {
      if (
        err instanceof Prisma.PrismaClientKnownRequestError &&
        err.code === 'P2002'
      ) {
        throw new BadRequestException('Equipment Type already exist');
      }
    }

    await this.audit.logs({
      organizationId,
      userId,
      action: AuditAction.CREATE_EQUIPMENT_TYPE,
      module: AuditModule.EQUIPMENT,
      recordId: userId.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
}
