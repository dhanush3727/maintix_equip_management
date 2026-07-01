import { Controller, Get } from '@nestjs/common';
import { NotificationsService } from './notifications.service';

@Controller('notifications')
export class NotificationsController {
  constructor(private notification: NotificationsService) {}

  @Get()
  notifications() {
    return 'Notification sent';
  }
}
