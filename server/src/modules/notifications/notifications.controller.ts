import { Controller, Get, Query, Req, UseGuards } from '@nestjs/common';
import { NotificationsService } from './notifications.service';
import { AccessTokenGuard } from '../../common/guards/access-token.guard';
import { OrganizationActiveGuard } from '../../common/guards/org-active.guard';
import type { AuthenticateRequest } from '../../common/types/auth.types';
import { QueryDto } from '../../common/dto/query.dto';

@Controller('notifications')
export class NotificationsController {
  constructor(private notification: NotificationsService) {}

  //#region Get all notification
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Get()
  async getNotifications(
    @Req() req: AuthenticateRequest,
    @Query() query: QueryDto,
  ) {
    const { data, meta } = await this.notification.getAllNotificationsService(
      req.user,
      query,
    );

    return { data, meta };
  }
  //#endregion
}
