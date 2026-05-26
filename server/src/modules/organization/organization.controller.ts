import {
  Body,
  Controller,
  HttpCode,
  HttpStatus,
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
import { UpdateOrganizationDto } from './dto/update-organization.dto';
import type {
  AuthenticateRequest,
  ReqMetaType,
} from '../../common/types/auth.types';
import { ReqMeta } from '../../common/decorators/request-meta.decorator';
import { Roles } from '../../common/decorators/roles.decorator';
import { FileInterceptor } from '@nestjs/platform-express';

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
    @Body() dto: UpdateOrganizationDto,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: ReqMetaType,
    @UploadedFile() file: Express.Multer.File,
  ) {
    const user = req.user;

    await this.organizationService.createOrganizationService(
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
}
