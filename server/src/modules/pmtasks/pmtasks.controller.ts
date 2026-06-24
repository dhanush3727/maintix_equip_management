import { Controller, Get, Query, Req, UseGuards } from '@nestjs/common';
import { PmtasksService } from './pmtasks.service';
import { AccessTokenGuard } from '../../common/guards/access-token.guard';
import { OrganizationActiveGuard } from '../../common/guards/org-active.guard';
import type { AuthenticateRequest } from '../../common/types/auth.types';
import { PMTaskQueryDto } from './dto/pmtask-query.dto';

@Controller('pmtasks')
export class PmtasksController {
  constructor(private pmtask: PmtasksService) {}

  //#region Get PM tasks
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Get()
  async getPMTasks(
    @Req() req: AuthenticateRequest,
    @Query() query: PMTaskQueryDto,
  ) {
    const { data, meta } = await this.pmtask.getPMTasksService(req.user, query);

    return {
      data,
      meta,
    };
  }
  //#endregion
}
