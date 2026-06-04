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
import type {
  AuthenticateRequest,
  MetaType,
} from '../../common/types/auth.types';
import { OrganizationActiveGuard } from '../../common/guards/org-active.guard';
import { RolesGuard } from '../../common/guards/roles.guard';
import { Roles } from '../../common/decorators/roles.decorator';
import { RoleType } from '@prisma/client';
import { UpdateEmailDto } from './dto/update-email.dto';
import { UpdateRolesDto } from './dto/update-role.dto';
import { UpdateDepartmentDto } from './dto/update-department.dto';
import { UpdatePasswordDto } from './dto/update-password.dto';
import { ReqMeta } from '../../common/decorators/request-meta.decorator';

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
    @ReqMeta() meta: MetaType,
  ) {
    const { userId, organizationId } = req.user;

    await this.userService.updateCurrentUserService(
      dto,
      userId,
      organizationId,
      meta,
    );

    return {
      message: 'User updated successfully',
    };
  }
  //#endregion

  //#region Update current user password
  @UseGuards(AccessTokenGuard)
  @Patch('me/password')
  async updateCurrentUserPassword(
    @Body() dto: UpdatePasswordDto,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    const { userId, jti, organizationId } = req.user;

    await this.userService.updateCurrentUserPassword(
      dto,
      userId,
      jti,
      organizationId,
      meta,
    );

    return {
      message: 'User password updated successfully',
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

  //#region update user email by id
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @Patch('orgs/user/:id/email')
  async updateUserEmail(
    @Req() req: AuthenticateRequest,
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateEmailDto,
    @ReqMeta() meta: MetaType,
  ) {
    const { organizationId, userId } = req.user;

    await this.userService.updateUserEmailService(
      dto,
      id,
      organizationId,
      userId,
      meta,
    );

    return {
      message: 'User email updated successfully',
    };
  }
  //#endregion

  //#region Update user role
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @Patch('orgs/user/:id/roles')
  async updateUserRole(
    @Req() req: AuthenticateRequest,
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateRolesDto,
    @ReqMeta() meta: MetaType,
  ) {
    const { organizationId, userId } = req.user;

    await this.userService.updateUserRolesService(
      id,
      organizationId,
      dto,
      userId,
      meta,
    );

    return {
      message: 'User role updated successfully',
    };
  }
  //#endregion

  //#region Update user department
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @Patch('orgs/user/:id/department')
  async updateUserDepartment(
    @Req() req: AuthenticateRequest,
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateDepartmentDto,
    @ReqMeta() meta: MetaType,
  ) {
    const { organizationId, userId } = req.user;

    await this.userService.updateUserDepartment(
      id,
      organizationId,
      dto,
      userId,
      meta,
    );

    return {
      message: 'User department updated successfully',
    };
  }
  //#endregion

  //#region Deactivate user
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @Patch('orgs/user/:id/deactivate')
  async deactivateUser(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    await this.userService.deactivateUserService(id, req.user, meta);

    return {
      message: 'User deactivated successfully',
    };
  }
  //#endregion

  //#region Activate user
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard, RolesGuard)
  @Roles(RoleType.ADMIN)
  @Patch('orgs/user/:id/activate')
  async activateUser(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    await this.userService.activateUserService(id, req.user, meta);

    return {
      message: 'User activated successfully',
    };
  }
  //#endregion
}
