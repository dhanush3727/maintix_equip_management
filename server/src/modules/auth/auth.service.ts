import {
  ConflictException,
  Injectable,
  InternalServerErrorException,
  NotFoundException,
  UnauthorizedException,
} from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import {
  GenereateTokensType,
  JwtPayloadType,
  MetaType,
} from './types/auth.types';
import { compareToken, generateSlug, hashToken } from './utils/auth.utils';
import { TokenService } from './services/tokens.service';
import { RegisterDto } from './dto/register.dto';
import * as bcrypt from 'bcrypt';
import { LoginDto } from './dto/login.dto';
import { AuditService } from '../../common/audit/audit.service';
import { AuditAction, AuditModule } from '../../common/audit/audit.types';

@Injectable()
export class AuthService {
  constructor(
    private prisma: PrismaService,
    private readonly tokenService: TokenService,
    private auditService: AuditService,
  ) {}

  //#region Generate access token and refresh token
  async generateAuthTokens(userId: number) {
    // Get organizationId for payload
    const user = await this.prisma.user.findUnique({
      where: { id: userId },
      include: {
        roles: {
          include: {
            role: true, // Include - Also fetch related data from another table
          },
        },
      },
    });

    if (!user) throw new UnauthorizedException('User not found');

    // Get roles from DB
    const roles = user.roles.map((userRole) => userRole.role.name);

    const payload: GenereateTokensType = {
      userId,
      email: user.email,
      organizationId: user.organizationId,
      roles,
    };

    return this.tokenService.generateTokens(payload);
  }
  //#endregion

  //#region Store Refresh Token in DB with hashed value
  async saveRefreshToken(
    userId: number,
    refreshToken: string,
    jti: string,
    meta?: MetaType,
  ) {
    const hashed = await hashToken(refreshToken);

    const expiresAt = new Date();
    expiresAt.setDate(expiresAt.getDate() + 7); // match JWT expiry

    await this.prisma.userSession.create({
      data: {
        userId,
        jti,
        refreshToken: hashed,
        expiresAt,
        deviceInfo: meta?.deviceInfo,
        ipAddress: meta?.ipAddress,
        userAgent: meta?.userAgent,
      },
    });
  }
  //#endregion

  //#region Refresh token rotation
  async refreshTokens(user: JwtPayloadType, refreshToken: string) {
    const { userId: userId, jti } = user;

    // Get session from DB
    const session = await this.prisma.userSession.findUnique({
      where: { jti },
      include: {
        user: true, // Join User table
      },
    });

    if (!session || !session.isActive) {
      throw new UnauthorizedException('Invalid session');
    }

    const isMatch = await compareToken(refreshToken, session.refreshToken);

    // Deactivate session if token doesn't match
    if (!isMatch) {
      throw new UnauthorizedException('Invalid refresh token');
    }

    // Check expiry
    if (session.expiresAt < new Date()) {
      // Deactivate expired session
      await this.prisma.userSession.update({
        where: { id: session.id },
        data: { isActive: false },
      });

      throw new UnauthorizedException('Refresh token expired');
    }

    // deactivate old session
    await this.prisma.userSession.update({
      where: { id: session.id },
      data: { isActive: false },
    });

    // generate new tokens
    const tokens = await this.generateAuthTokens(userId);

    // Save new refresh token
    await this.saveRefreshToken(userId, tokens.refreshToken, tokens.jti);

    return tokens;
  }
  //#endregion

  //#region Register user
  async registerService(dto: RegisterDto, meta?: MetaType) {
    const companyName = dto.companyName.trim().replace(/\s+/g, ' '); // Replace multiple spaces with single space
    const email = dto.email.trim().toLowerCase();
    const name = dto.name.trim().replace(/\s+/g, ' ');
    const password = dto.password;

    // Check existing user
    const existingUser = await this.prisma.user.findUnique({
      where: { email },
    });

    if (existingUser) {
      throw new ConflictException('Email already exists');
    }

    // Hash Password
    const hashedPassword = await bcrypt.hash(password, 10);

    const slug: string = await generateSlug(companyName);

    // Start transation - why this, if create everything will create if wrong no one will create
    const result = await this.prisma.$transaction(async (tx) => {
      // Create organization
      const organization = await tx.organization.create({
        data: {
          name: companyName,
          slug,
        },
      });

      // Create user
      const user = await tx.user.create({
        data: {
          name,
          email,
          passwordHash: hashedPassword,
          organizationId: organization.id,
        },
      });

      // Get Admin role
      const adminRole = await tx.role.findUnique({
        where: { name: 'ADMIN' },
      });

      if (!adminRole)
        throw new InternalServerErrorException('ADMIN role not found');

      // Assign role
      await tx.userRole.create({
        data: {
          userId: user.id,
          roleId: adminRole.id,
        },
      });

      return { user, organization };
    });

    const deviceInfo =
      dto.deviceInfo ??
      (meta?.userAgent ? meta?.userAgent?.slice(0, 50) : 'Unknown');

    // Set the metadata
    const metadata: MetaType = {
      ipAddress: meta?.ipAddress,
      userAgent: meta?.userAgent,
      deviceInfo,
    };

    // Generate tokens
    const { accessToken, refreshToken, jti } = await this.generateAuthTokens(
      result.user.id,
    );

    // Store session
    await this.saveRefreshToken(result.user.id, refreshToken, jti, metadata);

    // Create audit for register success
    await this.auditService.logs({
      organizationId: result.organization.id,
      userId: result.user.id,
      action: AuditAction.REGISTER_SUCCESS,
      module: AuditModule.AUTH,
      recordId: result.user.id.toString(),
      ipAddress: meta?.ipAddress,
    });

    // Return response
    return {
      user: {
        id: result.user.id,
        name: result.user.name,
        email: result.user.email,
      },
      accessToken,
      refreshToken,
    };
  }
  //#endregion

  // #region Login user
  async loginService(dto: LoginDto, meta?: MetaType) {
    const email = dto.email.trim().toLowerCase();
    const password = dto.password;

    // Find User
    const user = await this.prisma.user.findUnique({
      where: { email },
      select: {
        id: true,
        organizationId: true,
        name: true,
        email: true,
        passwordHash: true,
      },
    });

    // Check user
    if (!user) {
      throw new NotFoundException('User not found');
    }

    // Check password
    const isPasswordValid = await bcrypt.compare(password, user.passwordHash);

    if (!isPasswordValid) {
      // Create audit for login failed
      await this.auditService.logs({
        organizationId: user.organizationId,
        userId: user.id,
        action: AuditAction.LOGIN_FAILED,
        module: AuditModule.AUTH,
        recordId: user.id.toString(),
        ipAddress: meta?.ipAddress,
      });

      throw new UnauthorizedException('Password not match');
    }

    const deviceInfo =
      dto.deviceInfo ??
      (meta?.userAgent ? meta?.userAgent?.slice(0, 50) : 'Unknown');

    // Set the metadata
    const metadata: MetaType = {
      ipAddress: meta?.ipAddress,
      userAgent: meta?.userAgent,
      deviceInfo,
    };

    const { accessToken, refreshToken, jti } = await this.generateAuthTokens(
      user.id,
    );

    await this.saveRefreshToken(user.id, refreshToken, jti, metadata);

    // Create audit for login success
    await this.auditService.logs({
      organizationId: user.organizationId,
      userId: user.id,
      action: AuditAction.LOGIN_SUCCESS,
      module: AuditModule.AUTH,
      recordId: user.id.toString(),
      ipAddress: meta?.ipAddress,
    });

    return {
      user: {
        id: user.id,
        name: user.name,
        email: user.email,
      },
      accessToken,
      refreshToken,
    };
  }
  //#endregion

  // #region Logout current session
  async logoutCurrentSession(
    userId: number,
    jti: string,
    refreshToken: string,
    meta?: MetaType,
  ) {
    //Find session
    const session = await this.prisma.userSession.findUnique({
      where: { jti },
      include: {
        user: true,
      },
    });

    if (!session || !session.isActive) {
      throw new NotFoundException('Session not found or already logged out');
    }

    console.log(session);

    // verify token match
    const isMatch = await bcrypt.compare(refreshToken, session.refreshToken);

    if (!isMatch) throw new UnauthorizedException('Invalid session');

    // Deactivate session
    await this.prisma.userSession.update({
      where: { jti },
      data: { isActive: false },
    });

    //Audit log
    await this.auditService.logs({
      organizationId: session.user.organizationId,
      userId,
      action: AuditAction.LOGOUT_CURRENT_SESSION,
      module: AuditModule.AUTH,
      recordId: userId.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion
}
