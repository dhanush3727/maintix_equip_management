import {
  Body,
  Controller,
  Delete,
  Get,
  HttpCode,
  HttpStatus,
  Param,
  Post,
  Req,
  Res,
  UseGuards,
} from '@nestjs/common';
import { AuthService } from './auth.service';
import { RegisterDto } from './dto/register.dto';
import type { Request, Response } from 'express';
import { LoginDto } from './dto/login.dto';
import { Throttle } from '@nestjs/throttler';
import type {
  AuthenticateRequest,
  JwtPayloadType,
  MetaType,
  ReqMetaType,
  RequestWithCookies,
} from './types/auth.types';
import { ReqMeta } from '../../common/decorators/request-meta.decorator';
import { RefreshTokenGuard } from '../../common/guards/refresh-token.guard';
import { AccessTokenGuard } from '../../common/guards/access-token.guard';
import { ForgotPasswordDto } from './dto/forgot-password.dto';
import { ResetPasswordDto } from './dto/reset-password.dto';

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
      message: 'Register Successfully',
      data: {
        user: result.user,
        accessToken: result.accessToken,
      },
    };
  }
  // #endregion

  // #region Login user
  @Throttle({ default: { limit: 5, ttl: 60000 } })
  @Post('login')
  @HttpCode(HttpStatus.OK)
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
      message: 'Login Successfully',
      data: {
        user: result.user,
        accessToken: result.accessToken,
      },
    };
  }
  //#endregion

  // #region Logout current session
  @UseGuards(RefreshTokenGuard)
  @Post('logout')
  @HttpCode(HttpStatus.OK)
  async logout(
    @Req()
    req: RequestWithCookies & {
      user: JwtPayloadType & { refreshToken: string };
    },
    @ReqMeta() meta: ReqMetaType,
    @Res({ passthrough: true }) res: Response,
  ) {
    const { user } = req;

    await this.authService.logoutCurrentSession(
      user.userId,
      user.jti,
      user.refreshToken,
      meta,
    );

    res.clearCookie('refreshToken');

    return {
      message: 'Logout Successfully',
      data: {},
    };
  }
  //#endregion

  // #region Logout specific session
  @UseGuards(AccessTokenGuard)
  @Delete('sessions/:jti')
  async logoutOtherSession(
    @Param('jti') jti: string,
    @Req() req: AuthenticateRequest,
    @ReqMeta() meta: MetaType,
  ) {
    const userId = req.user.userId;

    await this.authService.logoutSpecificSession(userId, jti, meta);

    return {
      message: 'Session logged out successfully',
      data: {},
    };
  }
  //#endregion

  //#region Logout all sessions
  @UseGuards(AccessTokenGuard)
  @Post('logout-all')
  @HttpCode(HttpStatus.OK)
  async logoutAll(@Req() req: AuthenticateRequest, @ReqMeta() meta: MetaType) {
    const { userId, jti } = req.user;

    console.log(req.user);

    await this.authService.logoutAllSessions(userId, jti, meta);

    return {
      message: 'Logged out from all other sessions',
      data: {},
    };
  }
  //#endregion

  //#region Get all user sessions
  @UseGuards(AccessTokenGuard)
  @Get('sessions')
  async getAllSessions(@Req() req: AuthenticateRequest) {
    const { userId, jti } = req.user;

    const sessions = await this.authService.getUserSessions(userId, jti);

    return {
      message: 'Fetched all sessions',
      data: sessions,
    };
  }
  //#endregion

  //#region Forgot Password
  @Post('forgot-password')
  @HttpCode(HttpStatus.OK)
  async forgotPassword(
    @Body() dto: ForgotPasswordDto,
    @ReqMeta() meta: MetaType,
  ) {
    await this.authService.forgotPasswordService(dto, meta);

    return {
      message: 'Email sent',
      data: {},
    };
  }
  //#endregion

  //#region Reset Password
  @Post('reset-password')
  @HttpCode(HttpStatus.OK)
  async resetPassword(
    @Body() dto: ResetPasswordDto,
    @ReqMeta() meta: MetaType,
  ) {
    await this.authService.resetPasswordService(dto, meta);

    return {
      message: 'Password reset successful',
      data: {},
    };
  }
  //#endregion
}
