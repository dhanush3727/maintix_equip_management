import {
  Body,
  Controller,
  Get,
  HttpCode,
  HttpStatus,
  Param,
  ParseIntPipe,
  Post,
  Query,
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
import { PMScheduleQueryDto } from './dto/pmschedule-query.dto';

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

  //#region Get PMSchedules
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Get()
  async getPMSchedules(
    @Req() req: AuthenticateRequest,
    @Query() query: PMScheduleQueryDto,
  ) {
    const { data, pagination } = await this.pmschedule.getPMSchedules(
      req.user,
      query,
    );

    return {
      data,
      pagination,
    };
  }
  //#endregion

  //#region Get PMSchedule by id
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Get(':id')
  async getPMScheduleById(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
  ) {
    const data = await this.pmschedule.getPMScheduleById(id, req.user);

    return {
      data,
    };
  }
  //#endregion
}
