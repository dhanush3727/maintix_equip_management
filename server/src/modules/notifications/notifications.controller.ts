import {
  Controller,
  Delete,
  Get,
  Param,
  ParseIntPipe,
  Patch,
  Query,
  Req,
  UseGuards,
} from '@nestjs/common';
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

  //#region Get unread notification count
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Get('unread-count')
  async getUnreadCount(@Req() req: AuthenticateRequest) {
    const data = await this.notification.getUnreadCountService(req.user);

    return {
      data,
    };
  }
  //#endregion

  //#region Get notification by id
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Get(':id')
  async getNotificationById(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
  ) {
    const data = await this.notification.getNotificationById(id, req.user);

    return {
      data,
    };
  }
  //#endregion

  //#region Mark all as read
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Patch('read-all')
  async markAllAsRead(@Req() req: AuthenticateRequest) {
    await this.notification.markAllAsReadService(req.user);

    return {
      message: 'All notifications marked as read',
    };
  }
  //#endregion

  //#region Mark as read
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Patch(':id/read')
  async markAsRead(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
  ) {
    await this.notification.markAsReadByIdService(id, req.user);

    return {
      message: 'Mark as read',
    };
  }
  //#endregion

  //#region Delete all notifications
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Delete('delete-all')
  async deleteAllNotifications(@Req() req: AuthenticateRequest) {
    await this.notification.deleteAllNotifications(req.user);

    return {
      message: 'All notifications deleted',
    };
  }
  //#endregion

  //#region Delete notification by id
  @UseGuards(AccessTokenGuard, OrganizationActiveGuard)
  @Delete(':id/delete')
  async deleteNotificationById(
    @Param('id', ParseIntPipe) id: number,
    @Req() req: AuthenticateRequest,
  ) {
    await this.notification.deleteNotificationById(id, req.user);

    return {
      message: 'Notification deleted',
    };
  }
  //#endregion
}
