import {
  BadRequestException,
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
  Req,
  Res,
  UploadedFile,
  UseGuards,
  UseInterceptors,
} from '@nestjs/common';
import type { Response } from 'express';
import { OrganizationService } from './organization.service';
import { AccessTokenGuard } from '../../common/guards/access-token.guard';
import { RolesGuard } from '../../common/guards/roles.guard';
import { RoleType } from '@prisma/client';
import type {
  AuthenticateRequest,
  MetaType,
  ReqMetaType,
} from '../../common/types/auth.types';
import { ReqMeta } from '../../common/decorators/request-meta.decorator';
import { Roles } from '../../common/decorators/roles.decorator';
import { FileInterceptor } from '@nestjs/platform-express';
import { CreateLocationDto } from './dto/create-location.dto';
import { CreateOrganizationDto } from './dto/create-org.dto';
import { UpdateOrganizationDto } from './dto/update-org.dto';
import { OrganizationActiveGuard } from '../../common/guards/org-active.guard';
import { UpdateLocationDto } from './dto/update-location.dto';
import { CreateDepartmentDto } from './dto/create-dep.dto';
import { UpdateDepartmentDto } from './dto/update-dep.dto';
import { SendInvitationDto } from './dto/send-invitation.dto';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

@ApiTags('Organization') // Swagger tag for grouping endpoints
@ApiBearerAuth() // Indicates that the endpoints require authentication
@Controller('organization')
export class OrganizationController {
  constructor(private organizationService: OrganizationService) {}

  //#region Get current organization
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @Get()
  async getOrganization(@Req() req: AuthenticateRequest) {
    const user = req.user;
    const org = await this.organizationService.getOrganizationService(
      user.organizationId,
    );

    return {
      message: 'Fetched organization successfully',
      data: org,
    };
  }
  //#endregion

  //#region Create organization profile
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @UseInterceptors(FileInterceptor('logo'))
  @Post()
  @HttpCode(HttpStatus.OK)
  async createOrganization(
    @Body() dto: CreateOrganizationDto,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: ReqMetaType,
    @UploadedFile() file: Express.Multer.File,
  ) {
    const user = req.user;

    await this.organizationService.createOrganizationService(
      user.organizationId,
      user.userId,
      dto,
      file,
      meta,
    );

    return {
      message: 'Organization profile completed',
    };
  }
  //#endregion

  //#region Update organization
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @UseInterceptors(FileInterceptor('logo'))
  @Patch()
  @HttpCode(HttpStatus.OK)
  async updateOrganization(
    @Body() dto: UpdateOrganizationDto,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: ReqMetaType,
    @UploadedFile() file: Express.Multer.File,
  ) {
    const user = req.user;

    await this.organizationService.updateOrganizationService(
      dto,
      user.organizationId,
      user.userId,
      file,
      meta,
    );

    return {
      message: 'Organization updated successfully',
    };
  }
  //#endregion

  // #region Deactivate organization
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @Patch('deactivate')
  async deactivateOrganization(
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
    @Res({ passthrough: true }) res: Response,
  ) {
    const user = req.user;

    await this.organizationService.deactivateOrganizationService(
      user.organizationId,
      user.userId,
      meta,
    );

    res.clearCookie('refreshToken');

    return {
      message: 'Organization Deactivate successfully',
    };
  }
  //#endregion

  //#region Create location
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @Post('location')
  async createLocation(
    @Body() dto: CreateLocationDto,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    const user = req.user;

    if (!user) throw new BadRequestException('Unexpected Error');

    await this.organizationService.createLocationService(
      user.organizationId,
      dto,
      user.userId,
      meta,
    );

    return {
      message: 'Location created',
    };
  }
  //#endregion

  //#region Get locations based on organization
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @Get('location')
  async getLocations(@Req() req: AuthenticateRequest) {
    const { organizationId } = req.user;

    const locations =
      await this.organizationService.getLocationsService(organizationId);

    return {
      message: 'Fetched locations',
      data: locations,
    };
  }
  //#endregion

  //#region Get location
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @Get('location/:id')
  async getLocation(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
  ) {
    const { organizationId } = req.user;

    const location = await this.organizationService.getLocationService(
      id,
      organizationId,
    );

    return {
      message: 'Location successfully get',
      data: location,
    };
  }
  //#endregion

  //#region Update location
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @Patch('location/:id')
  async updteLocation(
    @Param('id', ParseIntPipe) id: number, // parseIntPipe change id to number
    @Body() dto: UpdateLocationDto,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    const { organizationId, userId } = req.user;

    await this.organizationService.updateLocationService(
      id,
      dto,
      organizationId,
      userId,
      meta,
    );

    return {
      message: 'Location updated successfully!',
    };
  }
  //#endregion

  //#region Delete location
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @Delete('location/:id')
  async deleteLocation(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
  ) {
    const { organizationId } = req.user;

    await this.organizationService.deleteLocationService(id, organizationId);

    return {
      message: 'Location deleted successfully',
    };
  }
  //#endregion

  //#region Create Department
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @Post('department')
  async createDepartment(
    @Body() dto: CreateDepartmentDto,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    const { userId, organizationId } = req.user;

    await this.organizationService.createDepartmentService(
      dto,
      organizationId,
      userId,
      meta,
    );

    return {
      message: 'Department Created',
    };
  }
  //#endregion

  //#region Get departments based on organization
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @Get('department')
  async getDepartments(@Req() req: AuthenticateRequest) {
    const { organizationId } = req.user;

    const data =
      await this.organizationService.getDepartmentsService(organizationId);

    return {
      message: 'Successfully get the departments',
      data,
    };
  }
  //#endregion

  //#region Get department by id
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @Get('department/:id')
  async getDepartment(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
  ) {
    const { organizationId } = req.user;

    const data = await this.organizationService.getDepartmentService(
      id,
      organizationId,
    );

    return {
      message: 'Successfully Fetched Department',
      data,
    };
  }
  //#endregion

  //#region Update Department
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @Patch('department/:id')
  async updateDepartment(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateDepartmentDto,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    const { userId, organizationId } = req.user;

    await this.organizationService.updateDepartmentService(
      id,
      dto,
      organizationId,
      userId,
      meta,
    );

    return {
      message: 'Department updated successfully',
    };
  }
  //#endregion

  //#region Delete department
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @Delete('department/:id')
  async deleteDepartment(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
  ) {
    const { organizationId } = req.user;

    await this.organizationService.deleteDepartmentService(id, organizationId);

    return {
      message: 'Department deleted successfully',
    };
  }
  //#endregion

  //#region Send invite
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @Post('send-invite')
  @HttpCode(HttpStatus.OK)
  async sendInvitation(
    @Body() dto: SendInvitationDto,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    const { userId, organizationId } = req.user;

    await this.organizationService.sendInvitationService(
      dto,
      organizationId,
      userId,
      meta,
    );

    return {
      message: 'Invitation send successfully',
    };
  }
  //#endregion

  //#region Get organization meta data
  @UseGuards(AccessTokenGuard)
  @Get('meta')
  getOrganizationMeta() {
    const data = this.organizationService.getOrganizationMetaService();

    return {
      data,
    };
  }
  //#endregion

  //#region Get organization dropdown
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Get('dropdown')
  async getDropdown(@Req() req: AuthenticateRequest) {
    const { organizationId } = req.user;

    const data =
      await this.organizationService.getDropdownService(organizationId);

    return {
      data,
    };
  }
  //#endregion
}
