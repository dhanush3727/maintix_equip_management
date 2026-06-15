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
import { calculateNextDueDate } from './utils/calculateNextDueDate';

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
      assignedTo,
    } = dto;

    const [equipment, template, user] = await Promise.all([
      this.prisma.equipment.findFirst({
        where: { id: equipmentId, organizationId },
        select: { id: true, status: true },
      }),
      this.prisma.checklistTemplate.findFirst({
        where: { id: templateId, organizationId },
        select: { id: true, isActive: true },
      }),
      this.prisma.user.findFirst({
        where: { id: assignedTo, organizationId },
        select: {
          id: true,
          isActive: true,
          roles: {
            select: {
              roleId: true,
            },
          },
        },
      }),
    ]);

    // Check equipment exist
    if (!equipment) throw new NotFoundException('Equipment not found');
    if (equipment.status === EquipmentStatus.INACTIVE) {
      throw new BadRequestException('Equipment is inactive');
    }

    // Check template
    if (!template) throw new NotFoundException('Checklist template not found');
    if (!template.isActive) {
      throw new BadRequestException('Checklist template is deactivate');
    }

    // Check user
    if (!user) throw new NotFoundException('User not found');
    if (!user.isActive) {
      throw new BadRequestException('User is deactivate');
    }
    const isTechnician = user.roles.some((role) => role.roleId === 3);
    if (!isTechnician) {
      throw new BadRequestException('Assigned user must have Technician role');
    }

    // Allow only today/future dates
    const today = new Date();
    today.setHours(0, 0, 0, 0); // Set time to 00:00:00 for accurate comparison

    if (startDate < today) {
      throw new BadRequestException('Invalid start date');
    }

    const nextDueDate = calculateNextDueDate(
      startDate,
      frequencyType,
      interval,
    );

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
