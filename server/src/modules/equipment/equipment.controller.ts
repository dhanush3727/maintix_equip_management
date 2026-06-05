import {
  Body,
  Controller,
  HttpCode,
  HttpStatus,
  Post,
  Req,
  UseGuards,
} from '@nestjs/common';
import { EquipmentService } from './equipment.service';
import { AccessTokenGuard } from '../../common/guards/access-token.guard';
import { OrganizationActiveGuard } from '../../common/guards/org-active.guard';
import { RolesGuard } from '../../common/guards/roles.guard';
import { Roles } from '../../common/decorators/roles.decorator';
import { RoleType } from '@prisma/client';
import type {
  AuthenticateRequest,
  MetaType,
} from '../../common/types/auth.types';
import { CreateEquipTypeDto } from './dto/create-equipType.dto';
import { ReqMeta } from '../../common/decorators/request-meta.decorator';

@Controller('equipment')
export class EquipmentController {
  constructor(private equipmentService: EquipmentService) {}

  //#region Create equipment type
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN, RoleType.MANAGER)
  @Post('equipment-type')
  @HttpCode(HttpStatus.OK)
  async createEquipmentType(
    @Req() req: AuthenticateRequest,
    @Body() dto: CreateEquipTypeDto,
    @ReqMeta() meta: MetaType,
  ) {
    await this.equipmentService.createEquipmentType(dto, req.user, meta);

    return {
      message: 'Equipment type created successfully',
    };
  }
}
