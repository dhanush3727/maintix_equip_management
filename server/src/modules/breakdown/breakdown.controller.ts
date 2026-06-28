import { Body, Controller, Post, Req, UseGuards } from '@nestjs/common';
import { BreakdownService } from './breakdown.service';
import { AccessTokenGuard } from '../../common/guards/access-token.guard';
import { OrganizationActiveGuard } from '../../common/guards/org-active.guard';
import { CreateBreakdownDto } from './dto/create-breakdown.dto';
import type {
  AuthenticateRequest,
  MetaType,
} from '../../common/types/auth.types';
import { ReqMeta } from '../../common/decorators/request-meta.decorator';

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
}
