import {
  Body,
  Controller,
  HttpCode,
  HttpStatus,
  Post,
  Req,
  UseGuards,
} from '@nestjs/common';
import { PmschedulesService } from './pmschedules.service';
import { AccessTokenGuard } from '../../common/guards/access-token.guard';
import { OrganizationActiveGuard } from '../../common/guards/org-active.guard';
import { CreatePMScheduleDto } from './dto/create-pmschedule.dto';
import type {
  AuthenticateRequest,
  MetaType,
} from '../../common/types/auth.types';
import { ReqMeta } from '../../common/decorators/request-meta.decorator';
import { RolesGuard } from '../../common/guards/roles.guard';
import { Roles } from '../../common/decorators/roles.decorator';
import { RoleType } from '@prisma/client';

@Controller('pmschedules')
export class PmschedulesController {
  constructor(private pmschedule: PmschedulesService) {}

  //#region Create PMSchedule
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN, RoleType.ENGINEER, RoleType.MANAGER)
  @Post()
  @HttpCode(HttpStatus.OK)
  async createPMSchedule(
    @Body() dto: CreatePMScheduleDto,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    await this.pmschedule.createPMSchedule(dto, req.user, meta);

    return {
      message: 'PM Schedule successfully created',
    };
  }
  //#endregion
}
