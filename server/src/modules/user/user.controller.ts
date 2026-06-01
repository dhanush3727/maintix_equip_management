import {
  Controller,
  Get,
  Param,
  ParseIntPipe,
  UseGuards,
} from '@nestjs/common';
import { UserService } from './user.service';
import { AccessTokenGuard } from '../../common/guards/access-token.guard';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';

@ApiTags('Users')
@ApiBearerAuth()
@Controller('users')
export class UserController {
  constructor(private userService: UserService) {}

  //#region Get all users
  @UseGuards(AccessTokenGuard)
  @Get()
  async getAllUser() {
    const data = await this.userService.getAllUsersService();

    return {
      data,
    };
  }

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
}
