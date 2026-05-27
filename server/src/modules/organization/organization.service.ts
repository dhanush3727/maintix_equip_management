import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { AuditService } from '../../common/audit/audit.service';
import { MailService } from '../../mail/mail.service';
import { AuditAction, AuditModule } from '../../common/audit/audit.types';
import { MetaType } from '../../common/types/auth.types';
import {
  CloudinaryService,
  CloudinaryUploadResult,
} from '../../cloudinary/cloudinary.service';
import { CreateLocationDto } from './dto/create-location.dto';
import { CreateOrganizationDto } from './dto/create-org.dto';
import { UpdateOrganizationDto } from './dto/update-org.dto';
import { generateSlug } from '../../common/utils/generate-slug.util';

@Injectable()
export class OrganizationService {
  constructor(
    private prisma: PrismaService,
    private auditSerivce: AuditService,
    private mailService: MailService,
    private cloudinary: CloudinaryService,
  ) {}

  //#region Get organization details
  async getOrganizationService(organizationId: number) {
    const org = await this.prisma.organization.findUnique({
      where: { id: organizationId },
      select: {
        id: true,
        name: true,
        slug: true,
        industryType: true,
        companySize: true,
        city: true,
        country: true,
        isActive: true,
      },
    });

    if (!org) throw new NotFoundException('Organization not found');

    return org;
  }
  //#endregion

  //#region Create a organization profile
  async createOrganizationService(
    organizationId: number,
    userId: number,
    dto: CreateOrganizationDto,
    file: Express.Multer.File,
    meta?: MetaType,
  ) {
    const { industryType, companySize } = dto;
    const country = dto.country?.trim().replace(/\s+/g, '');
    const city = dto.city?.trim().replace(/\s+/g, '');

    const org = await this.prisma.organization.findUnique({
      where: { id: organizationId },
    });

    if (!org) {
      throw new BadRequestException('User not linked to this organization');
    }

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
      userId,
      action: AuditAction.CREATE_ORG,
      module: AuditModule.ORG,
      recordId: userId.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion

  //#region Update organization profile
  async updateOrganizationService(
    dto: UpdateOrganizationDto,
    organizationId: number,
    userId: number,
    file?: Express.Multer.File,
    meta?: MetaType,
  ) {
    const { industryType, companySize } = dto;

    // Normalize inputs
    const name = dto.name?.trim().replace(/\s+/g, ' ');
    const country = dto.country?.trim().replace(/\s+/g, ' ');
    const city = dto.city?.trim().replace(/\s+/g, ' ');

    // Get organization
    const org = await this.prisma.organization.findUnique({
      where: { id: organizationId },
    });

    // Check organization exist
    if (!org) throw new NotFoundException('Organization not found');

    // Generate slug
    let slug: string = org.slug;
    if (name && name !== org.name) {
      const newSlug = generateSlug(name);

      const exist = await this.prisma.organization.findUnique({
        where: { slug: newSlug },
        select: { id: true },
      });

      if (exist) {
        throw new BadRequestException('There was an error tryagin later');
      }

      slug = newSlug;
    }

    let logoUrl = org.logoUrl;
    let logoPublicId = org.logoPublicId;

    if (file) {
      let updated: CloudinaryUploadResult;

      if (logoPublicId) {
        updated = await this.cloudinary.replaceFile(logoPublicId, file);
      } else {
        updated = await this.cloudinary.uploadFile(file);
      }

      logoUrl = updated.url;
      logoPublicId = updated.publicId;
    }

    // Update organization
    await this.prisma.organization.update({
      where: { id: organizationId },
      data: {
        name,
        slug,
        industryType,
        companySize,
        country,
        city,
        logoUrl,
        logoPublicId,
      },
    });

    // Audit log
    await this.auditSerivce.logs({
      organizationId,
      userId,
      action: AuditAction.UPDATE_ORG,
      module: AuditModule.ORG,
      recordId: organizationId.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion

  //#region Deactivate organization
  async deactivateOrganizationService(
    organizationId: number,
    userId: number,
    meta?: MetaType,
  ) {
    const updated = await this.prisma.organization.updateMany({
      where: { id: organizationId, isActive: true },
      data: { isActive: false },
    });

    if (updated.count === 0) {
      throw new BadRequestException(
        'Organization not found or already deactivate',
      );
    }

    // Audit log
    await this.auditSerivce.logs({
      organizationId,
      userId,
      action: AuditAction.DEACTIVE_ORG,
      module: AuditModule.ORG,
      recordId: organizationId.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion

  //#region Create Location
  async createLocationService(
    organizationId: number,
    dto: CreateLocationDto,
    userId: number,
    meta?: MetaType,
  ) {
    const { type } = dto;
    const name = dto.name
      .trim()
      .replace(/\s+/g, ' ')
      .toLowerCase()
      .replace(/\b\w/g, (char) => char.toUpperCase());
    const address = dto.address.replace(/\s+/g, ' ');

    // findFirst is used instead of findUnique because we are checking the location name for the same organization, not globally unique.
    const existing = await this.prisma.location.findFirst({
      where: { name, organizationId },
    });

    // Check already location exist
    if (existing) throw new BadRequestException('Location already exist');

    // Create location
    await this.prisma.location.create({
      data: {
        name,
        type,
        address,
        organizationId,
      },
    });

    // Audit logs
    await this.auditSerivce.logs({
      organizationId,
      userId,
      action: AuditAction.CREATE_LOCATION,
      module: AuditModule.ORG,
      recordId: userId.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion

  //#region Get location based on organization
  async getLocationService(organizationId: number) {
    const locations = await this.prisma.location.findMany({
      where: { organizationId },
    });

    return locations;
  }
  //#endregion
}
