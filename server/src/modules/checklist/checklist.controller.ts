import {
  Body,
  Controller,
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
import { ChecklistQueryDto } from './dto/checklist-query.dto';
import { QueryDto } from '../../common/dto/query.dto';
import { UpdateChecklistTemplateDto } from './dto/update-checklistTemplate.dto';

@Controller('checklist')
export class ChecklistController {
  constructor(private checklist: ChecklistService) {}

  //#region Create checklist
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN, RoleType.MANAGER)
  @Post('checklist-template')
  @HttpCode(HttpStatus.OK)
  async createChecklist(
    @Body() dto: CreateChecklistTemplateDto,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    await this.checklist.createChecklistService(dto, req.user, meta);

    return {
      message: 'Checklist template created',
    };
  }
  //#endregion

  //#region Get checklist templates
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Get('checklist-template')
  async getChecklistTemplates(
    @Req() req: AuthenticateRequest,
    @Query() query: ChecklistQueryDto,
  ) {
    const { data, pagination } = await this.checklist.getChecklistTemplates(
      req.user,
      query,
    );

    return {
      data,
      pagination,
    };
  }
  //#endregion

  //#region Get checklist dropdown
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Get('/dropdown')
  async getChecklistDropdown(@Req() req: AuthenticateRequest) {
    const data = await this.checklist.getChecklistDropdown(req.user);

    return {
      data,
    };
  }
  //#endregion

  //#region Get Checklist template by id
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN, RoleType.MANAGER)
  @Get('checklist-template/:id')
  async getChecklistTemplateById(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
  ) {
    const checklist = await this.checklist.getChecklistTemplateById(
      id,
      req.user,
    );

    return {
      data: checklist,
    };
  }
  //#endregion

  //#region Get checklist templates by equipment type
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Get('checklist-template/equipment-type/:typeId')
  async getChecklistTemplatesByTypeId(
    @Param('typeId', ParseIntPipe) typeId: number,
    @Req() req: AuthenticateRequest,
    @Query() query: QueryDto,
  ) {
    const checklists = await this.checklist.getChecklistTemplateByTypeId(
      typeId,
      req.user,
      query,
    );

    return {
      data: checklists,
    };
  }
  //#endregion

  //#region Get checklist template dd by type
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Get('checklist-template/equipment-type/:typeId/dropdown')
  async getChecklistTemplateDropdown(
    @Param('typeId', ParseIntPipe) typeId: number,
    @Req() req: AuthenticateRequest,
  ) {
    const checklists = await this.checklist.getChecklistTemplateDropdown(
      typeId,
      req.user,
    );

    return {
      data: checklists,
    };
  }
  //#endregion

  //#region Update checklist template version
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN, RoleType.MANAGER)
  @Patch('checklist-template/:id')
  async updateChecklistTemplateVersion(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateChecklistTemplateDto,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    await this.checklist.updateChecklistTemplateVersion(
      id,
      dto,
      req.user,
      meta,
    );

    return {
      message: 'Create a new template version',
    };
  }
  //#endregion

  //#region Deactivate checklist template
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN, RoleType.MANAGER)
  @Patch('checklist-template/:id/deactivate')
  async deactivateChecklistTemplate(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    await this.checklist.deactivateChecklistTemplate(id, req.user, meta);

    return {
      message: 'Templates deactivated successfully',
    };
  }
  //#endregion

  //#region Get checklist by versions
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Get('checklist-template/:id/versions')
  async getChecklistTemplatesByVersions(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
  ) {
    const { data } = await this.checklist.getChecklistTemplatesVersions(
      id,
      req.user,
    );

    return {
      data,
    };
  }
  //#endregion
}
