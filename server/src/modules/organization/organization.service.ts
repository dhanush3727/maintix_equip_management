import { BadRequestException, Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { AuditService } from '../../common/audit/audit.service';
import { MailService } from '../../mail/mail.service';
import { UpdateOrganizationDto } from './dto/update-organization.dto';
import { AuditAction, AuditModule } from '../../common/audit/audit.types';
import { MetaType } from '../../common/types/auth.types';
import { CloudinaryService } from '../../cloudinary/cloudinary.service';

@Injectable()
export class OrganizationService {
  constructor(
    private prisma: PrismaService,
    private auditSerivce: AuditService,
    private mailService: MailService,
    private cloudinary: CloudinaryService,
  ) {}

  //#region create a organization profile
  async createOrganizationService(
    userId: number,
    dto: UpdateOrganizationDto,
    file: Express.Multer.File,
    meta?: MetaType,
  ) {
    const { industryType, companySize, country, city } = dto;

    const user = await this.prisma.user.findUnique({
      where: { id: userId },
      include: { organization: true },
    });

    if (!user || !user.organization) {
      throw new BadRequestException('User not linked to this organization');
    }

    const org = user.organization;
    let logoUrl = org.logoUrl;
    let logoPublicId = org.logoPublicId;

    if (file) {
      const updated = await this.cloudinary.uploadFile(file);
      logoUrl = updated.url;
      logoPublicId = updated.publicId;
    }

    // Create organization profile
    await this.prisma.organization.update({
      where: { id: org.id },
      data: {
        industryType,
        companySize,
        country,
        city,
        logoUrl,
        logoPublicId,
      },
    });

    // Create audit log
    await this.auditSerivce.logs({
      organizationId: org.id,
      userId: userId,
      action: AuditAction.CREATE_ORG,
      module: AuditModule.ORG,
      recordId: userId.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion
}
