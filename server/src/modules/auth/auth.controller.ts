import { Body, Controller, Post, Req, Res } from '@nestjs/common';
import { AuthService } from './auth.service';
import { RegisterDto } from './dto/register.dto';
import type { Request, Response } from 'express';
import { LoginDto } from './dto/login.dto';
import { Throttle } from '@nestjs/throttler';
import { MetaType } from './types/auth.types';

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  // #region Register new user
  @Post('register')
  async registerUser(
    @Body() dto: RegisterDto,
    @Res({ passthrough: true }) res: Response, // Passthrough allows us to set cookies in the response while still returning a JSON response
  ) {
    const result = await this.authService.registerService(dto);

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
    @Req() req: Request,
    @Res({ passthrough: true }) res: Response,
  ) {
    // Extract IP
    const forwarded = req.headers['x-forwarded-for']; // This is used when your app is behind a proxy (like nginx) to get the original client's IP address
    // If x-forwarded-for is present, it may contain multiple IPs (client, proxy1, proxy2), so we take the first one. Otherwise, we use req.ip which gives us the remote address of the request.
    const ipAddress =
      typeof forwarded === 'string' ? forwarded.split(',')[0] : req.ip;
    const userAgent = req.headers['user-agent'] ?? 'unknown'; // Fallback to 'unknown' if user-agent header is missing

    const meta: MetaType = {
      ipAddress,
      userAgent,
      deviceInfo: dto.deviceInfo,
    };

    const result = await this.authService.loginService(dto, meta);

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
