import {
  BadRequestException,
  ConflictException,
  ForbiddenException,
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
} from '../../common/types/auth.types';
import { compareToken, hashToken } from './utils/auth.utils';
import { TokenService } from './services/tokens.service';
import { RegisterDto } from './dto/register.dto';
import * as bcrypt from 'bcrypt';
import { LoginDto } from './dto/login.dto';
import { AuditService } from '../../common/audit/audit.service';
import { AuditAction, AuditModule } from '../../common/audit/audit.types';
import * as crypto from 'crypto';
import { MailService } from '../../mail/mail.service';
import { RequestTokenDto } from './dto/request-token.dto';
import { ResetPasswordDto } from './dto/reset-password.dto';
import { EmailVerificationDto } from './dto/email-verification.dto';
import { AcceptInviteDto } from './dto/accept-invite.dto';
import { InvitationStatus } from '@prisma/client';
import { generateSlug } from '../../common/utils/generate-slug.util';
import { hashVerificationToken } from '../../common/utils/generate-token.util';
import { ConfigService } from '@nestjs/config';

@Injectable()
export class AuthService {
  private readonly clientUrl: string | undefined;

  constructor(
    private prisma: PrismaService,
    private readonly tokenService: TokenService,
    private auditService: AuditService,
    private mailService: MailService,
    private readonly config: ConfigService,
  ) {
    this.clientUrl = this.config.get<string>('client.url');
  }

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
  async refreshTokenService(user: JwtPayloadType, refreshToken: string) {
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

    const slug: string = generateSlug(companyName);

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

      // Create audit for register success
      await this.auditService.logs(tx, {
        organizationId: organization.id,
        userId: user.id,
        action: AuditAction.REGISTER_SUCCESS,
        module: AuditModule.AUTH,
        recordId: user.id.toString(),
        ipAddress: meta?.ipAddress,
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
      include: { organization: true },
    });

    // Check user
    if (!user) {
      throw new NotFoundException('User not found');
    }

    if (!user.isActive) {
      throw new ForbiddenException('Your account is deactivated');
    }

    if (!user.organization.isActive) {
      throw new ForbiddenException('Your organization is deactivated');
    }

    // Check password
    const isPasswordValid = await bcrypt.compare(password, user.passwordHash);

    if (!isPasswordValid) {
      // Create audit for login failed
      await this.auditService.logs(this.prisma, {
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
    await this.auditService.logs(this.prisma, {
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

    if (!session) {
      throw new NotFoundException('Session not found');
    }

    // verify token match
    const isMatch = await bcrypt.compare(refreshToken, session.refreshToken);

    if (!isMatch) throw new UnauthorizedException('Invalid session');

    if (!session.isActive) {
      throw new BadRequestException('Session alreadt logged out');
    }

    await this.prisma.$transaction(async (tx) => {
      // Deactivate session
      await tx.userSession.update({
        where: { jti },
        data: { isActive: false },
      });

      //Audit log
      await this.auditService.logs(tx, {
        organizationId: session.user.organizationId,
        userId,
        action: AuditAction.LOGOUT_CURRENT_SESSION,
        module: AuditModule.AUTH,
        recordId: userId.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion

  // #region Logout specific session
  async logoutSpecificSession(userId: number, jti: string, meta?: MetaType) {
    const session = await this.prisma.userSession.findUnique({
      where: { jti },
      include: {
        user: true,
      },
    });

    if (!session) throw new NotFoundException('Session not found');

    // Check ownership
    if (session.userId !== userId) {
      throw new UnauthorizedException('You cannot logout this session');
    }

    if (!session.isActive) {
      throw new BadRequestException('Session already logged out');
    }

    await this.prisma.$transaction(async (tx) => {
      // Deactivate session
      await tx.userSession.update({
        where: { jti },
        data: { isActive: false },
      });

      //Audit log
      await this.auditService.logs(tx, {
        organizationId: session.user.organizationId,
        userId,
        action: AuditAction.LOGOUT_SPECIFIC_SESSION,
        module: AuditModule.AUTH,
        recordId: userId.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion

  //#region Logout all session except current device
  async logoutAllSessions(userId: number, jti: string, meta?: MetaType) {
    await this.prisma.userSession.updateMany({
      where: {
        userId,
        isActive: true,
        NOT: {
          jti,
        },
      },
      data: {
        isActive: false,
      },
    });

    //Audit log
    await this.auditService.logs(this.prisma, {
      organizationId: 0,
      userId,
      action: AuditAction.LOGOUT_SPECIFIC_SESSION,
      module: AuditModule.AUTH,
      recordId: userId.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion

  //#region Get user sessions
  async getUserSessions(userId: number, jti: string) {
    const sessions = await this.prisma.userSession.findMany({
      where: { userId, isActive: true },
      orderBy: {
        lastActiveAt: 'desc',
      },
      select: {
        jti: true,
        ipAddress: true,
        deviceInfo: true,
        userAgent: true,
        lastActiveAt: true,
        createdAt: true,
      },
    });

    return sessions.map((session) => ({
      jti: session.jti,
      ipAddress: session.ipAddress,
      deviceInfo: session.deviceInfo,
      userAgent: session.userAgent,
      lastActiveAt: session.lastActiveAt,
      createdAt: session.createdAt,
      isCurrent: session.jti === jti, // It show the current device
    }));
  }
  //#endregion

  // #region Forgot Password Service
  async forgotPasswordService(dto: RequestTokenDto, meta?: MetaType) {
    const normalizedEmail = dto.email.trim().toLowerCase();

    // Find User
    const user = await this.prisma.user.findUnique({
      where: { email: normalizedEmail },
      select: { id: true, organizationId: true, email: true, name: true },
    });

    // Check user
    if (!user) throw new NotFoundException('User Not Found');

    // Delete old tokens
    await this.prisma.passwordReset.deleteMany({
      where: { userId: user.id },
    });

    const token = crypto.randomBytes(32).toString('hex');

    const hashedToken = hashVerificationToken(token);

    const expiresAt = new Date(Date.now() + 15 * 60 * 1000);

    // Save in DB
    await this.prisma.passwordReset.create({
      data: {
        userId: user.id,
        expiresAt,
        token: hashedToken,
      },
    });

    // Create reset link
    const resetLink = `${this.clientUrl}reset-password?token=${token}`;

    // Send mail
    await this.mailService.sendEmail({
      to: user.email,
      subject: 'Reset Password',
      html: `
      <h3>Hi, ${user.name}</h3>
      <p>We received a request to reset your password.</p>
      <p>Click the link below to reset your password:</p>
      <a href="${resetLink}">${resetLink}</a>
      <p>This link will expire in 15 minutes.</p>
      <p>If you did not request this, please ignore this email</p>
      <p>Thanks <br/>
      Maintix Team
      </p> 
      `,
    });

    // Audit log
    await this.auditService.logs(this.prisma, {
      organizationId: user.organizationId,
      userId: user.id,
      action: AuditAction.FORGOT_PASSWORD,
      module: AuditModule.AUTH,
      recordId: user.id.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion

  //#region Reset Password Service
  async resetPasswordService(dto: ResetPasswordDto, meta?: MetaType) {
    const { token, password } = dto;

    const hashedToken = hashVerificationToken(token);

    const resetRecord = await this.prisma.passwordReset.findUnique({
      where: { token: hashedToken },
      include: { user: true },
    });

    if (!resetRecord || resetRecord.isUsed) {
      throw new BadRequestException('Invalid or expired token');
    }

    if (resetRecord.expiresAt < new Date()) {
      throw new BadRequestException('Token expired');
    }

    const user = resetRecord.user;

    const passwordHash = await bcrypt.hash(password, 10);

    await this.prisma.$transaction(async (tx) => {
      // Update password
      await tx.user.update({
        where: { id: user.id },
        data: { passwordHash },
      });

      // Mark the token used
      await tx.passwordReset.update({
        where: { id: resetRecord.id },
        data: { isUsed: true },
      });

      // Logout all session
      await tx.userSession.updateMany({
        where: { userId: resetRecord.userId, isActive: true },
        data: { isActive: false },
      });

      // Audit logs
      await this.auditService.logs(tx, {
        organizationId: user.organizationId,
        userId: user.id,
        action: AuditAction.RESET_PASSWORD,
        module: AuditModule.AUTH,
        recordId: user.id.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion

  //#region Email verification
  async sendEmailVerificationService(dto: RequestTokenDto, meta?: MetaType) {
    const normalizedEmail = dto.email.trim().toLowerCase();

    const user = await this.prisma.user.findUnique({
      where: { email: normalizedEmail },
      select: {
        id: true,
        organizationId: true,
        email: true,
        name: true,
        isEmailVerified: true,
      },
    });

    if (!user) throw new NotFoundException('User Not Found');

    if (user.isEmailVerified) {
      throw new BadRequestException('Email already verified');
    }

    // Get the lastToken to cooldown the resend
    const lastToken = await this.prisma.emailVerification.findFirst({
      where: { userId: user.id },
      orderBy: { createdAt: 'desc' },
    });

    if (lastToken) {
      const diff = Date.now() - lastToken.createdAt.getTime();
      if (diff < 60 * 1000)
        throw new BadRequestException('Please wait before requesting again');
    }

    // Delete old tokens
    await this.prisma.emailVerification.deleteMany({
      where: { userId: user.id },
    });

    const token = crypto.randomBytes(32).toString('hex');

    const hashedToken = hashVerificationToken(token);

    const expiresAt = new Date(Date.now() + 15 * 60 * 1000);

    await this.prisma.emailVerification.create({
      data: {
        userId: user.id,
        expiresAt,
        token: hashedToken,
      },
    });

    // Create verfication link
    const verificationLink = `${this.clientUrl}email-verification?token=${token}`;

    // Send mail
    await this.mailService.sendEmail({
      to: user.email,
      subject: 'Verify your email',
      html: `
      <h3>Hi, ${user.name}</h3>
      <p>Please verify your email address by clicking the link below:</p>
      <a href="${verificationLink}">${verificationLink}</a>
      <p>This link will expire in 15 minutes.</p>
      <p>If you did not request this, please ignore this email</p>
      <p>Thanks</p>
      <p>Maintix Team</p>
      `,
    });

    // Audit log
    await this.auditService.logs(this.prisma, {
      organizationId: user.organizationId,
      userId: user.id,
      action: AuditAction.EMAIL_VERIFICATION,
      module: AuditModule.AUTH,
      recordId: user.id.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion

  //#region Verify Email
  async verifyEmailService(dto: EmailVerificationDto, meta?: MetaType) {
    const { token } = dto;
    const hashedToken = hashVerificationToken(token);

    const record = await this.prisma.emailVerification.findUnique({
      where: { token: hashedToken },
      include: { user: true },
    });

    if (!record || record.isUsed) {
      throw new BadRequestException('Invalid or expired token');
    }

    if (record.expiresAt < new Date()) {
      throw new BadRequestException('Token expired');
    }

    await this.prisma.$transaction(async (tx) => {
      // Mark the token as used
      await tx.emailVerification.update({
        where: { id: record.id },
        data: { isUsed: true },
      });

      // Update the emaill verification
      await tx.user.update({
        where: { id: record.userId },
        data: { isEmailVerified: true },
      });

      // Audit log
      await this.auditService.logs(tx, {
        organizationId: record.user.organizationId,
        userId: record.userId,
        action: AuditAction.EMAIL_VERIFICATION,
        module: AuditModule.AUTH,
        recordId: record.userId.toString(),
        ipAddress: meta?.ipAddress,
      });
    });
  }
  //#endregion

  //#region Resend Email verification
  async resendEmailVerificationService(dto: RequestTokenDto, meta?: MetaType) {
    await this.sendEmailVerificationService(dto, meta);
  }
  //#endregion

  //#region Invitation Accept service
  async acceptInvitationService(dto: AcceptInviteDto) {
    const { token, password } = dto;
    const name = dto.name.trim().replace(/\s+/g, ' ');

    const hashedToken = hashVerificationToken(token);

    // Get the invitation
    const invitation = await this.prisma.invitation.findUnique({
      where: { token: hashedToken },
      include: { organization: true, role: true, department: true },
    });

    // Check the invitation
    if (!invitation || invitation.status !== InvitationStatus.PENDING) {
      throw new BadRequestException('Invalid invitation');
    }

    // Expire invitaion
    if (invitation.expiresAt < new Date()) {
      await this.prisma.invitation.update({
        where: { token: hashedToken, status: InvitationStatus.PENDING },
        data: { status: InvitationStatus.EXPIRED },
      });

      throw new BadRequestException('Invitation Expired');
    }

    // Find the email already exist
    const existingUser = await this.prisma.user.findUnique({
      where: { email: invitation.email },
    });

    if (existingUser) throw new BadRequestException('User already exists');

    const passwordHash = await bcrypt.hash(password, 10);

    // Create the user and update invitation
    await this.prisma.$transaction(async (tx) => {
      // Create a user
      await tx.user.create({
        data: {
          name,
          email: invitation.email,
          passwordHash,
          organizationId: invitation.organizationId,
          isEmailVerified: true,
          // This is relational data, User don't have roleId and departmentId column,
          // So we need to create the relation data in userRole and userDepartment table, this is called nested write in prisma
          roles: {
            create: {
              roleId: invitation.roleId,
            },
          },
          department: invitation.departmentId
            ? {
                create: {
                  departmentId: invitation.departmentId,
                },
              }
            : undefined,
        },
      });

      // Update invitation
      await tx.invitation.update({
        where: { id: invitation.id },
        data: { status: InvitationStatus.ACCEPTED },
      });
    });
  }
  //#endregion

  //#region Get current user details
  async getCurrentUserService(userId: number) {
    // Fetch the user
    const user = await this.prisma.user.findUnique({
      where: { id: userId },
      select: {
        id: true,
        name: true,
        email: true,
        organizationId: true,
        isEmailVerified: true,
        isActive: true,
        roles: {
          select: {
            id: true,
            roleId: true,
          },
        },
        department: {
          select: {
            id: true,
            departmentId: true,
          },
        },
      },
    });

    if (!user) throw new NotFoundException('User not found');

    return user;
  }
  //#endregion
}
