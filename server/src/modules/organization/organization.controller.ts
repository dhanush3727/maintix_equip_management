import {
  BadRequestException,
  Body,
  Controller,
  Get,
  HttpCode,
  HttpStatus,
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
}
