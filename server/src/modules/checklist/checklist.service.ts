import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { AuditService } from '../../common/audit/audit.service';
import { CreateChecklistTemplateDto } from './dto/create-checklistTemplate.dto';
import { MetaType, RequestUser } from '../../common/types/auth.types';
import { ChecklistItemType } from '@prisma/client';
import { AuditAction, AuditModule } from '../../common/audit/audit.types';

@Injectable()
export class ChecklistService {
  constructor(
    private prisma: PrismaService,
    private audit: AuditService,
  ) {}

  //#region Create a checklist tempalat and checklist item
  async createChecklistService(
    dto: CreateChecklistTemplateDto,
    req: RequestUser,
    meta?: MetaType,
  ) {
    const { organizationId, userId } = req;
    const { name, equipmentTypeId, description, items } = dto;

    // check equipment type
    const existing = await this.prisma.equipmentType.findFirst({
      where: { id: equipmentTypeId, organizationId },
      select: { id: true, isActive: true },
    });

    if (!existing) throw new NotFoundException('Equipment type not found');

    if (!existing.isActive) {
      throw new BadRequestException('This equipment type is deactivated');
    }

    // Check duplicate order
    const orders = items.map((o) => o.order);
    const uniqueOrders = new Set(orders);

    if (orders.length !== uniqueOrders.size) {
      throw new BadRequestException('Duplicate order in checklist items');
    }

    // Check type validation
    for (const item of items) {
      // Check for NUMBER type
      if (item.type === ChecklistItemType.NUMBER) {
        if (!item.minValue) {
          throw new BadRequestException(`Min value expected for ${item.name}`);
        }

        if (!item.maxValue) {
          throw new BadRequestException(`Max value expected for ${item.name}`);
        }

        if (
          item.minValue !== undefined &&
          item.maxValue !== undefined &&
          item.minValue > item.maxValue
        ) {
          throw new BadRequestException(`Invalid range for item: ${item.name}`);
        }
      }

      // Check for SELECT type
      if (item.type === ChecklistItemType.SELECT) {
        if (!item.options || item.options.length === 0) {
          throw new BadRequestException(`Options required for: ${item.name}`);
        }

        if (!item.expectedValue) {
          throw new BadRequestException(
            `expected value required for ${item.name}`,
          );
        }

        if (item.expectedValue && !item.options.includes(item.expectedValue)) {
          throw new BadRequestException(
            `The expected value must have one of the options for item: ${item.name}`,
          );
        }
      }

      // Check for BOOLEAN type
      if (item.type === ChecklistItemType.BOOLEAN) {
        if (!item.expectedValue) {
          throw new BadRequestException(
            `expected value required for ${item.name}`,
          );
        }

        if (item.expectedValue !== undefined) {
          item.expectedValue = String(item.expectedValue).toLowerCase();
        }

        if (
          item.expectedValue &&
          !['true', 'false'].includes(item.expectedValue)
        ) {
          throw new BadRequestException(
            `Invalid expected value for ${item.name}`,
          );
        }
      }
    }

    // Create checklist template and item
    await this.prisma.checklistTemplate.create({
      data: {
        organizationId,
        equipmentTypeId,
        name,
        description,
        items: {
          create: items.map((item) => ({
            name: item.name,
            order: item.order,
            type: item.type,
            expectedValue: item.expectedValue,
            minValue: item.minValue,
            maxValue: item.maxValue,
            // Why we use JSON.stringify for options? because in prisma we can not save array of string directly in postgres, so we save it as string and when we get it we parse it back to array
            options: item.options ? JSON.stringify(item.options) : null,
            isRequired: item.isRequired ?? true,
          })),
        },
      },
      // Use `include` to fetch related items along with the checklist template in the same query.
      // Use `select` instead when you need to limit fields for better performance and smaller payload.
      include: {
        items: true,
      },
    });

    await this.audit.logs({
      organizationId,
      userId,
      action: AuditAction.CREATE_CHECKLIST,
      module: AuditModule.CHECKLIST,
      recordId: userId.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion
}
