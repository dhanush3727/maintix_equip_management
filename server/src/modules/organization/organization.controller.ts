import {
  BadRequestException,
  Body,
  Controller,
  HttpCode,
  HttpStatus,
  Patch,
  Post,
  Req,
  UploadedFile,
  UseGuards,
  UseInterceptors,
} from '@nestjs/common';
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

@Controller('organization')
export class OrganizationController {
  constructor(private organizationService: OrganizationService) {}

  //#region Create organization profile
  @UseGuards(AccessTokenGuard, RolesGuard)
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
  @UseGuards(AccessTokenGuard, RolesGuard)
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

  //#region Create location
  @UseGuards(AccessTokenGuard, RolesGuard)
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
