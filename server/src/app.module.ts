import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';
import { ConfigModule } from '@nestjs/config';
import { CloudinaryModule } from './cloudinary/cloudinary.module';
import { MailModule } from './mail/mail.module';
import configuration from './config/configuration';
import { AuthModule } from './modules/auth/auth.module';
import { ThrottlerModule } from '@nestjs/throttler';
import { AuditModule } from './common/audit/audit.module';
import { APP_INTERCEPTOR } from '@nestjs/core';
import { RequestMetaInterceptor } from './common/interceptors/request-meta.interceptor';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      envFilePath: '.env',
      load: [configuration],
    }),

    ThrottlerModule.forRoot({
      throttlers: [
        {
          ttl: 60, // 1 min
          limit: 5, // max 5 attempts
        },
      ],
    }),

    PrismaModule,
    CloudinaryModule,
    MailModule,
    AuthModule,
    AuditModule,
  ],
  controllers: [AppController],
  providers: [
    {
      provide: APP_INTERCEPTOR,
      useClass: RequestMetaInterceptor,
    },
    AppService,
  ],
})
export class AppModule {}
