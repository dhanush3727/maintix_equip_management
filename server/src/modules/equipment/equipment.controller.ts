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
import { QueryDto } from '../../common/dto/query.dto';
import { UpdateEquipTypeDto } from './dto/update-equipType.dto';

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
  //#endregion

  //#region Get equipment types
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN, RoleType.MANAGER)
  @Get('equipment-type')
  async getEquipmentsType(
    @Req() req: AuthenticateRequest,
    @Query() query: QueryDto,
  ) {
    const { data, pagination } = await this.equipmentService.getEquipmentTypes(
      req.user,
      query,
    );

    return {
      data,
      pagination,
    };
  }
  //#endregion

  //#region get equipment type dropdown
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Get('equipment-type/dropdown')
  async getEquipmentTypeDropdown(@Req() req: AuthenticateRequest) {
    const equipmentTypes = await this.equipmentService.getEquipmentTypeDropdown(
      req.user,
    );

    return {
      data: equipmentTypes,
    };
  }
  //#endregion

  //#region Get equipment type by id
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN, RoleType.MANAGER)
  @Get('equipment-type/:id')
  async getEquipmentType(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
  ) {
    const equipmentType = await this.equipmentService.getEquipmentType(
      id,
      req.user,
    );

    return {
      data: equipmentType,
    };
  }
  //#endregion

  //#region Get equipments based on type
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN, RoleType.MANAGER)
  @Get('equipment-type/:id/equipments')
  async getEquipmentsByType(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
  ) {
    const data = await this.equipmentService.getEquipmentsByType(id, req.user);

    return {
      data,
    };
  }
  //#endregion

  //#region Update equipment type
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN, RoleType.MANAGER)
  @Patch('equipment-type/:id')
  async updateEquipmentType(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
    @Body() dto: UpdateEquipTypeDto,
    @ReqMeta() meta: MetaType,
  ) {
    await this.equipmentService.updateEquipmentType(id, req.user, dto, meta);

    return {
      message: 'Equipment type updated successfully',
    };
  }
  //#endregion

  //#region Deactivate equipment type
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN, RoleType.MANAGER)
  @Patch('equipment-type/:id/deactivate')
  async deactivateEquipmentType(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    await this.equipmentService.deactivateEquipmentType(id, req.user, meta);

    return {
      message: 'Equipment type deactivated',
    };
  }
  //#endregion

  //#region Activate equipment type
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN, RoleType.MANAGER)
  @Patch('equipment-type/:id/activate')
  async activateEquipmentType(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    await this.equipmentService.activateEquipmentType(id, req.user, meta);

    return {
      message: 'Equipment type activated',
    };
  }
  //#endregion
}
