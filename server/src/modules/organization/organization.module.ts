import { Module } from '@nestjs/common';
import { OrganizationService } from './organization.service';
import { OrganizationController } from './organization.controller';
import { PrismaService } from '../../prisma/prisma.service';
import { AuditService } from '../../common/audit/audit.service';
import { MailService } from '../../mail/mail.service';
import { CloudinaryService } from '../../cloudinary/cloudinary.service';

@Module({
  providers: [
    OrganizationService,
    PrismaService,
    AuditService,
    MailService,
    CloudinaryService,
  ],
  controllers: [OrganizationController],
})
export class OrganizationModule {}
