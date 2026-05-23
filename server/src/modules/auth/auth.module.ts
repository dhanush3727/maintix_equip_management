import { Module } from '@nestjs/common';
import { JwtModule } from '@nestjs/jwt';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
import { PrismaService } from '../../prisma/prisma.service';
import { AccessTokenStrategy } from '../../common/strategies/access-token.strategy';
import { RefreshTokenStrategy } from '../../common/strategies/refresh-token.strategy';
import { TokenService } from './services/tokens.service';
import { MailService } from '../../mail/mail.service';

@Module({
  imports: [JwtModule.register({})],
  controllers: [AuthController],
  providers: [
    AuthService,
    PrismaService,
    AccessTokenStrategy,
    RefreshTokenStrategy,
    TokenService,
    MailService,
  ],
})
export class AuthModule {}
