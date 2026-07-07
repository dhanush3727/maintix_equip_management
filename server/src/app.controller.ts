import { Controller, Get, UseGuards } from '@nestjs/common';
import { AppService } from './app.service';
import { AccessTokenGuard } from './common/guards/access-token.guard';
import { ApiBearerAuth } from '@nestjs/swagger';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  //#region Get organization meta data
  @ApiBearerAuth()
  @Get('meta')
  getOrganizationMeta() {
    const data = this.appService.getOrganizationMetaService();

    return {
      data,
    };
  }
  //#endregion
}
