import {
  Body,
  Controller,
  Delete,
  Get,
  HttpCode,
  HttpStatus,
  Param,
  ParseIntPipe,
  Patch,
  Post,
  Query,
  Req,
  UseGuards,
} from '@nestjs/common';
import { BreakdownService } from './breakdown.service';
import { AccessTokenGuard } from '../../common/guards/access-token.guard';
import { OrganizationActiveGuard } from '../../common/guards/org-active.guard';
import { CreateBreakdownDto } from './dto/create-breakdown.dto';
import type {
  AuthenticateRequest,
  MetaType,
} from '../../common/types/auth.types';
import { ReqMeta } from '../../common/decorators/request-meta.decorator';
import { BreakdownQueryDto } from './dto/breakdown-query.dto';
import { UpdateBreakdownDto } from './dto/update-breakdown.dto';
import { RolesGuard } from '../../common/guards/roles.guard';
import { Roles } from '../../common/decorators/roles.decorator';
import { RoleType } from '@prisma/client';
import { AssignTechnicianDto } from './dto/assign-breakdown.dto';
import { CreateActionsDto } from './dto/create-actions.dto';
import { UpdateActionsDto } from './dto/update-actions.dto';
import { ResolveBreakdownDto } from './dto/resolve-breakdown.dto';

@Controller('breakdowns')
export class BreakdownController {
  constructor(private breakdown: BreakdownService) {}

  //#region Create breakdown
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Post()
  async createBreakdown(
    @Body() dto: CreateBreakdownDto,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    await this.breakdown.createBreakdownService(dto, req.user, meta);

    return {
      message: 'Breakdown successfully created',
    };
  }
  //#endregion

  //#region Get all breakdowns
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Get()
  async getAllBreakdowns(
    @Req() req: AuthenticateRequest,
    @Query() query: BreakdownQueryDto,
  ) {
    const { data, meta } = await this.breakdown.getAllBreakdowns(
      req.user,
      query,
    );

    return {
      data,
      meta,
    };
  }
  //#endregion

  //#region Get breakdown by id
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Get(':id')
  async getBreakdownById(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
  ) {
    const data = await this.breakdown.getBreakdownbyId(id, req.user);

    return {
      data,
    };
  }
  //#endregion

  //#region Update breakdown
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Patch(':id')
  async updateBreakdown(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateBreakdownDto,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    await this.breakdown.updateBreakdownService(id, dto, req.user, meta);

    return {
      message: 'Breakdown update successfully',
    };
  }
  //#endregion

  //#region Assign Technician
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.MANAGER)
  @Patch(':id/assign')
  async assignTechnician(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: AssignTechnicianDto,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    await this.breakdown.assignTechnicianService(id, dto, req.user, meta);

    return {
      message: 'Technician Assigned',
    };
  }
  //#endregion

  //#region Create breakdown action
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.TECHNICIAN)
  @Post(':id/actions')
  @HttpCode(HttpStatus.OK)
  async createActions(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: CreateActionsDto,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    await this.breakdown.createActionsService(id, dto, req.user, meta);

    return {
      message: 'Action added',
    };
  }
  //#endregion

  //#region Update breakdown action
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.TECHNICIAN)
  @Patch(':id/actions/:actionId')
  async updateActions(
    @Param('id', ParseIntPipe) id: number,
    @Param('actionId', ParseIntPipe) actionId: number,
    @Body() dto: UpdateActionsDto,
    @Req() req: AuthenticateRequest,
  ) {
    await this.breakdown.updateActionsService(id, actionId, dto, req.user);

    return {
      message: 'Action updated',
    };
  }
  //#endregion

  //#region Delete breakdown action
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.TECHNICIAN)
  @Delete(':id/actions/:actionId')
  async deleteActions(
    @Param('id', ParseIntPipe) id: number,
    @Param('actionId', ParseIntPipe) actionId: number,
    @Req() req: AuthenticateRequest,
  ) {
    await this.breakdown.deleteActionsService(id, actionId, req.user);

    return {
      message: 'Action deleted',
    };
  }
  //#endregion

  //#region Resolve breakdown
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.TECHNICIAN)
  @Patch(':id/resolve')
  async resolveBreakdown(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: ResolveBreakdownDto,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    await this.breakdown.resolveBreakdownService(id, dto, req.user, meta);

    return {
      message: 'Breakdown resolved successfully',
    };
  }
  //#endregion

  //#region Close breakdown
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.MANAGER)
  @Patch(':id/close')
  async closeBreakdown(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    await this.breakdown.closeBreakdownService(id, req.user, meta);

    return {
      message: 'Breakdown closed successfully',
    };
  }
  //#endregion
}
