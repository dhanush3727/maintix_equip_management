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
import { PmtasksService } from './pmtasks.service';
import { AccessTokenGuard } from '../../common/guards/access-token.guard';
import { OrganizationActiveGuard } from '../../common/guards/org-active.guard';
import type { AuthenticateRequest } from '../../common/types/auth.types';
import { PMTaskQueryDto } from './dto/pmtask-query.dto';
import { UpdatePMTaskItemDto } from './dto/update-pmtask.dto';

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

  //#region Get PM Task by id
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Get(':id')
  async getPMTaskById(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
  ) {
    const data = await this.pmtask.getPMTaskById(id, req.user);

    return {
      data,
    };
  }
  //#endregion

  //#region update PM task checklist items
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Patch(':id/checklist-items/:itemId')
  async updatePMTaskItems(
    @Param('id', ParseIntPipe) id: number,
    @Param('itemId', ParseIntPipe) itemId: number,
    @Body() dto: UpdatePMTaskItemDto,
    @Req() req: AuthenticateRequest,
  ) {
    await this.pmtask.updatePMTaskItems(id, itemId, dto, req.user);

    return {
      message: 'Checklist Items updated',
    };
  }
  //#endregion
}
