import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { AuditService } from '../../common/audit/audit.service';
import { CreatePMScheduleDto } from './dto/create-pmschedule.dto';
import { MetaType, RequestUser } from '../../common/types/auth.types';
import { EquipmentStatus } from '@prisma/client';
import { AuditAction, AuditModule } from '../../common/audit/audit.types';

@Injectable()
export class PmschedulesService {
  constructor(
    private prisma: PrismaService,
    private audit: AuditService,
  ) {}

  //#region Create pmschedule
  async createPMSchedule(
    dto: CreatePMScheduleDto,
    req: RequestUser,
    meta?: MetaType,
  ) {
    const { organizationId, userId } = req;

    const {
      equipmentId,
      templateId,
      frequencyType,
      interval,
      startDate,
      nextDueDate,
      assignedTo,
    } = dto;

    // Check equipment exist
    const equipment = await this.prisma.equipment.findFirst({
      where: { id: equipmentId, organizationId },
      select: { id: true, status: true },
    });

    if (!equipment) throw new NotFoundException('Equipment not found');

    if (equipment.status === EquipmentStatus.INACTIVE) {
      throw new BadRequestException('Equipment is deactivate');
    }

    // Check template
    const template = await this.prisma.checklistTemplate.findFirst({
      where: { id: templateId, organizationId },
      select: { id: true, isActive: true },
    });

    if (!template) throw new NotFoundException('Checklist template not found');

    if (!template.isActive) {
      throw new BadRequestException('Checklist template is deactivate');
    }

    // Check user
    const user = await this.prisma.user.findFirst({
      where: { id: assignedTo, organizationId },
      select: { id: true, isActive: true },
    });

    if (!user) throw new NotFoundException('User not found');

    if (!user.isActive) {
      throw new BadRequestException('User is deactivate');
    }

    await this.prisma.pMSchedule.create({
      data: {
        organizationId,
        equipmentId,
        templateId,
        frequencyType,
        interval,
        startDate,
        nextDueDate,
        assignedTo,
      },
    });

    await this.audit.logs({
      organizationId,
      userId,
      action: AuditAction.CREATE_PMSCHEDULE,
      module: AuditModule.PM,
      recordId: userId.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion
}
