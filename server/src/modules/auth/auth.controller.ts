import { Body, Controller, Post, Res } from '@nestjs/common';
import { AuthService } from './auth.service';
import { RegisterDto } from './dto/register.dto';
import type { Request, Response } from 'express';
import { LoginDto } from './dto/login.dto';
import { Throttle } from '@nestjs/throttler';
import type { MetaType, ReqMetaType } from './types/auth.types';
import { ReqMeta } from './decorators/request-meta.decorator';

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  // #region Register new user
  @Post('register')
  async registerUser(
    @Body() dto: RegisterDto,
    @ReqMeta() meta: ReqMetaType, // Using the custom decorator to extract metadata from the request
    @Res({ passthrough: true }) res: Response, // Passthrough allows us to set cookies in the response while still returning a JSON response
  ) {
    const metadata: MetaType = {
      ipAddress: meta.ipAddress,
      userAgent: meta.userAgent,
      deviceInfo: dto.deviceInfo,
    };

    const result = await this.authService.registerService(dto, metadata);

    // Set refresh token in cookie
    res.cookie('refreshToken', result.refreshToken, {
      httpOnly: true,
      sameSite: 'none',
      maxAge: 7 * 24 * 60 * 60 * 1000, // 7days
    });

    return {
      user: result.user,
      accessToken: result.accessToken,
    };
  }
  // #endregion

  // #region Login user
  @Throttle({ default: { limit: 5, ttl: 60000 } })
  @Post('login')
  async loginUser(
    @Body() dto: LoginDto,
    @ReqMeta() meta: ReqMetaType, // Using the custom decorator to extract metadata from the request
    @Res({ passthrough: true }) res: Response,
  ) {
    const metadata: MetaType = {
      ipAddress: meta.ipAddress,
      userAgent: meta.userAgent,
      deviceInfo: dto.deviceInfo,
    };

    const result = await this.authService.loginService(dto, metadata);

    // Set refresh token in cookie
    res.cookie('refreshToken', result.refreshToken, {
      httpOnly: true,
      sameSite: 'none',
      maxAge: 7 * 24 * 60 * 60 * 1000, // 7days
    });

    return {
      user: result.user,
      accessToken: result.accessToken,
    };
  }
  //#endregion
}
