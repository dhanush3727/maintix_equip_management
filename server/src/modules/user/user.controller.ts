import {
  Body,
  Controller,
  Get,
  Param,
  ParseIntPipe,
  Patch,
  Query,
  Req,
  UseGuards,
} from '@nestjs/common';
import { UserService } from './user.service';
import { AccessTokenGuard } from '../../common/guards/access-token.guard';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { UserQueryDto } from './dto/user-query.dto';
import { UpdateMeDto } from './dto/update-me.dto';
import type { AuthenticateRequest } from '../../common/types/auth.types';
import { OrganizationActiveGuard } from '../../common/guards/org-active.guard';
import { RolesGuard } from '../../common/guards/roles.guard';
import { Roles } from '../../common/decorators/roles.decorator';
import { RoleType } from '@prisma/client';

@ApiTags('Users')
@ApiBearerAuth()
@Controller('users')
export class UserController {
  constructor(private userService: UserService) {}

  //#region Get all users
  @UseGuards(AccessTokenGuard)
  @Get()
  async getAllUser(@Query() query: UserQueryDto) {
    const { data, pagination } =
      await this.userService.getAllUsersService(query);

    return {
      data,
      pagination,
    };
  }
  //#endregion

  //#region Get user by id
  @UseGuards(AccessTokenGuard)
  @Get(':id')
  async getUserById(@Param('id', ParseIntPipe) id: number) {
    const data = await this.userService.getUserByIdService(id);

    return {
      data,
    };
  }
  //#endregion

  //#region Update current user
  @UseGuards(AccessTokenGuard)
  @Patch('me')
  async updateCurrentUser(
    @Body() dto: UpdateMeDto,
    @Req() req: AuthenticateRequest,
  ) {
    const { userId } = req.user;

    await this.userService.updateCurrentUserService(dto, userId);

    return {
      message: 'User updated successfully',
    };
  }
  //#endregion

  //#region Get Users based on organization
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @Get('orgs/users')
  async getUsersByOrganization(
    @Req() req: AuthenticateRequest,
    @Query() query: UserQueryDto,
  ) {
    const { organizationId } = req.user;

    const { data, pagination } =
      await this.userService.getUsersByOrganizationService(
        organizationId,
        query,
      );

    return {
      data,
      pagination,
    };
  }
  //#endregion

  //#region Get user by id based on organization
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @Get('orgs/user/:id')
  async getUserByIdOrgs(
    @Req() req: AuthenticateRequest,
    @Param('id', ParseIntPipe) id: number,
  ) {
    const { organizationId } = req.user;

    const data = await this.userService.getUserByIdOrgsService(
      organizationId,
      id,
    );

    return {
      data,
    };
  }
  //#endregion
}
