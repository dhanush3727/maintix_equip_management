import {
  Body,
  Controller,
  Get,
  Param,
  ParseIntPipe,
  Patch,
  Post,
  Query,
  Req,
  UseGuards,
} from '@nestjs/common';
import { BreakdownService } from './breakdown.service';
import { AccessTokenGuard } from '../../common/guards/access-token.guard';
import { OrganizationActiveGuard } from '../../common/guards/org-active.guard';
import { CreateBreakdownDto } from './dto/create-breakdown.dto';
import type {
  AuthenticateRequest,
  MetaType,
} from '../../common/types/auth.types';
import { ReqMeta } from '../../common/decorators/request-meta.decorator';
import { BreakdownQueryDto } from './dto/breakdown-query.dto';
import { UpdateBreakdownDto } from './dto/update-breakdown.dto';

@Controller('breakdowns')
export class BreakdownController {
  constructor(private breakdown: BreakdownService) {}

  //#region Create breakdown
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Post()
  async createBreakdown(
    @Body() dto: CreateBreakdownDto,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    await this.breakdown.createBreakdownService(dto, req.user, meta);

    return {
      message: 'Breakdown successfully created',
    };
  }
  //#endregion

  //#region Get all breakdowns
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Get()
  async getAllBreakdowns(
    @Req() req: AuthenticateRequest,
    @Query() query: BreakdownQueryDto,
  ) {
    const { data, meta } = await this.breakdown.getAllBreakdowns(
      req.user,
      query,
    );

    return {
      data,
      meta,
    };
  }
  //#endregion

  //#region Get breakdown by id
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Get(':id')
  async getBreakdownById(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
  ) {
    const data = await this.breakdown.getBreakdownbyId(id, req.user);

    return {
      data,
    };
  }
  //#endregion

  //#region Update breakdown
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Patch(':id')
  async updateBreakdown(
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateBreakdownDto,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    await this.breakdown.updateBreakdown(id, dto, req.user, meta);

    return {
      message: 'Breakdown update successfully',
    };
  }
  //#endregion
}
