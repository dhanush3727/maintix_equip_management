import {
  Body,
  Controller,
  HttpCode,
  HttpStatus,
  Post,
  Req,
  UseGuards,
} from '@nestjs/common';
import { ChecklistService } from './checklist.service';
import { AccessTokenGuard } from '../../common/guards/access-token.guard';
import { OrganizationActiveGuard } from '../../common/guards/org-active.guard';
import { RolesGuard } from '../../common/guards/roles.guard';
import { Roles } from '../../common/decorators/roles.decorator';
import { RoleType } from '@prisma/client';
import { CreateChecklistTemplateDto } from './dto/create-checklistTemplate.dto';
import type {
  AuthenticateRequest,
  MetaType,
} from '../../common/types/auth.types';
import { ReqMeta } from '../../common/decorators/request-meta.decorator';

@Controller('checklist')
export class ChecklistController {
  constructor(private checklist: ChecklistService) {}

  // Create Checklist
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN, RoleType.MANAGER)
  @Post()
  @HttpCode(HttpStatus.OK)
  async createChecklist(
    @Body() dto: CreateChecklistTemplateDto,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    const template = await this.checklist.createChecklistService(
      dto,
      req.user,
      meta,
    );

    return {
      data: template,
      message: 'Checklist template created',
    };
  }
}
