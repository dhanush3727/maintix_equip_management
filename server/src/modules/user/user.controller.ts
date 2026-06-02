import {
  Controller,
  Get,
  Param,
  ParseIntPipe,
  Query,
  UseGuards,
} from '@nestjs/common';
import { UserService } from './user.service';
import { AccessTokenGuard } from '../../common/guards/access-token.guard';
import { ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { UserQueryDto } from './dto/user-query.dto';

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
