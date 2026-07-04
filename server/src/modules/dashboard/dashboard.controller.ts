import { Controller, Get, Req, UseGuards } from '@nestjs/common';
import { DashboardService } from './dashboard.service';
import { AccessTokenGuard } from '../../common/guards/access-token.guard';
import { OrganizationActiveGuard } from '../../common/guards/org-active.guard';
import type { AuthenticateRequest } from '../../common/types/auth.types';

@Controller('dashboard')
export class DashboardController {
  constructor(private dashboard: DashboardService) {}

  //#region Get Dashboard
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Get()
  async getDashboard(@Req() req: AuthenticateRequest) {
    const { data } = await this.dashboard.getDashboardService(req.user);

    return {
      data,
    };
  }
  //#endregion
}
