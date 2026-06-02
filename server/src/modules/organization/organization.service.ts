import {
  BadRequestException,
  ConflictException,
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
import { UpdateLocationDto } from './dto/update-location.dto';
import { InvitationStatus, Prisma } from '@prisma/client';
import { CreateDepartmentDto } from './dto/create-dep.dto';
import { UpdateDepartmentDto } from './dto/update-dep.dto';
import { SendInvitationDto } from './dto/send-invitation.dto';
import * as crypto from 'crypto';
import { hashVerificationToken } from '../../common/utils/generate-token.util';
import {
  buildPaginationMeta,
  buildQueryOptions,
  getPagination,
} from '../../common/utils/query-builder.util';
import { LocationQueryDto } from './dto/location-query.dto';
import { DepartmentQueryDto } from './dto/department-query.dto';

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

    const data: Prisma.OrganizationUpdateInput = {};
    if (name) data.name = name;
    if (slug) data.slug = slug;
    if (industryType) data.industryType = industryType;
    if (companySize) data.companySize = companySize;
    if (country) data.country = country;
    if (city) data.city = city;
    if (logoUrl) data.logoUrl = logoUrl;
    if (logoPublicId) data.logoPublicId = logoPublicId;

    // Update organization
    await this.prisma.organization.update({
      where: { id: organizationId },
      data,
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
    // why updateMany? this does two things in one query check org and checks that is active then update
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

  //#region Get locations based on organization
  async getLocationsService(organizationId: number, query: LocationQueryDto) {
    const { page = 1, limit = 10, search, sortBy, order, type } = query;

    const allowedSortBy = ['name'];

    if (sortBy && !allowedSortBy.includes(sortBy)) {
      throw new BadRequestException('Invalid sortby');
    }

    const { skip, take } = getPagination(page, limit);

    const filters: Prisma.LocationWhereInput = { organizationId };

    if (type) {
      filters.type = type;
    }

    const { where, orderBy } = buildQueryOptions({
      search,
      order,
      filters,
      searchFields: ['name', 'address'],
      sortBy,
    });

    const [locations, total] = await Promise.all([
      this.prisma.location.findMany({
        where,
        skip,
        take,
        orderBy: orderBy ?? { createdAt: 'desc' },
        select: {
          id: true,
          name: true,
          type: true,
          address: true,
        },
      }),

      this.prisma.location.count({ where }),
    ]);

    const pagination = buildPaginationMeta(page, limit, total);

    return {
      data: locations,
      pagination,
    };
  }
  //#endregion

  //#region Get location
  async getLocationService(id: number, organizationId: number) {
    const location = await this.prisma.location.findFirst({
      where: { id, organizationId },
      select: {
        id: true,
        name: true,
        type: true,
        address: true,
      },
    });

    if (!location) throw new NotFoundException('Location not found');

    return location;
  }
  //#endregion

  //#region Update location
  async updateLocationService(
    id: number,
    dto: UpdateLocationDto,
    organizationId: number,
    userId: number,
    meta?: MetaType,
  ) {
    const { type } = dto;
    const name = dto.name
      ?.trim()
      .replace(/\s+/g, ' ')
      .toLowerCase()
      .replace(/\b\w/g, (char) => char.toUpperCase());
    const address = dto.address?.replace(/\s+/g, ' ');

    const location = await this.prisma.location.findFirst({
      where: { id, organizationId },
    });

    if (!location) throw new NotFoundException('Location not found');

    const data: Prisma.LocationUpdateInput = {};

    if (name) {
      const existing = await this.prisma.location.findFirst({
        // find wihtout current id
        where: { name, organizationId, NOT: { id } },
      });

      if (existing) throw new BadRequestException('Location already exist');

      data.name = name;
    }

    if (type) data.type = type;
    if (address) data.address = address;

    await this.prisma.location.update({
      where: { id },
      data: {
        name,
        type,
        address,
      },
    });

    // Audit log
    await this.auditSerivce.logs({
      organizationId,
      userId,
      action: AuditAction.UPDATE_LOCATION,
      module: AuditModule.ORG,
      recordId: userId.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion

  //#region Delete location service
  async deleteLocationService(id: number, organizationId: number) {
    // why delteMany? this does two things in one query check org and checks that is active then update
    const location = await this.prisma.location.deleteMany({
      where: { id, organizationId },
    });

    if (location.count === 0) throw new NotFoundException('Location not found');
  }
  //#endregion

  //#region Create Document
  async createDepartmentService(
    dto: CreateDepartmentDto,
    organizationId: number,
    userId: number,
    meta?: MetaType,
  ) {
    const { name, code, type } = dto;

    try {
      await this.prisma.department.create({
        data: {
          name,
          code,
          type,
          organizationId,
        },
      });

      // Audit log
      await this.auditSerivce.logs({
        organizationId,
        userId,
        action: AuditAction.CREATE_DEPARTMENT,
        module: AuditModule.ORG,
        recordId: userId.toString(),
        ipAddress: meta?.ipAddress,
      });
    } catch (err) {
      if (
        err instanceof Prisma.PrismaClientKnownRequestError &&
        err.code === 'P2002'
      ) {
        throw new BadRequestException('Department already exist');
      }

      throw err;
    }
  }
  //#endregion

  //#region Get Departments based on organization
  async getDepartmentsService(
    organizationId: number,
    query: DepartmentQueryDto,
  ) {
    const { page = 1, limit = 10, search, sortBy, order, type } = query;

    const allowedSortBy = ['name', 'code'];

    if (sortBy && !allowedSortBy.includes(sortBy)) {
      throw new BadRequestException('Invalide sortby');
    }

    const { skip, take } = getPagination(page, limit);

    const filters: Prisma.DepartmentWhereInput = { organizationId };

    if (type) {
      filters.type = type;
    }

    const { where, orderBy } = buildQueryOptions({
      search,
      order,
      filters,
      searchFields: ['name', 'code'],
      sortBy,
    });

    const [departments, total] = await Promise.all([
      this.prisma.department.findMany({
        where,
        skip,
        take,
        orderBy: orderBy ?? { createdAt: 'desc' },
        select: {
          id: true,
          name: true,
          type: true,
          code: true,
          createdAt: true,
        },
      }),

      this.prisma.department.count({ where }),
    ]);

    const pagination = buildPaginationMeta(page, limit, total);

    return {
      data: departments,
      pagination,
    };
  }
  //#endregion

  //#region Get Department by id
  async getDepartmentService(id: number, organizationId: number) {
    const department = await this.prisma.department.findFirst({
      where: { id, organizationId },
      select: {
        id: true,
        name: true,
        type: true,
        code: true,
      },
    });

    if (!department) throw new NotFoundException('Department not found');

    return department;
  }
  //#endregion

  //#region Update Department service
  async updateDepartmentService(
    id: number,
    dto: UpdateDepartmentDto,
    organizationId: number,
    userId: number,
    meta?: MetaType,
  ) {
    const { name, code, type } = dto;

    const department = await this.prisma.department.findFirst({
      where: { id, organizationId },
    });

    if (!department) throw new NotFoundException('Department not found');

    const data: Prisma.DepartmentUpdateInput = {};

    if (name) data.name = name;
    if (code) data.code = code;
    if (type) data.type = type;
    try {
      await this.prisma.department.update({
        where: { id },
        data,
      });

      // Audit log
      await this.auditSerivce.logs({
        organizationId,
        userId,
        action: AuditAction.UPDATE_DEPARTMENT,
        module: AuditModule.ORG,
        recordId: id.toString(),
        ipAddress: meta?.ipAddress,
      });
    } catch (err) {
      if (
        err instanceof Prisma.PrismaClientKnownRequestError &&
        err.code === 'P2002'
      ) {
        throw new BadRequestException('Department already exist');
      }

      throw err;
    }
  }
  //#endregion

  //#region Delete department service
  async deleteDepartmentService(id: number, organizationId: number) {
    const department = await this.prisma.department.deleteMany({
      where: { id, organizationId },
    });

    if (department.count === 0) {
      throw new NotFoundException('Department not found');
    }
  }
  //#endregion

  //#region Send invitation service
  async sendInvitationService(
    dto: SendInvitationDto,
    organizationId: number,
    userId: number,
    meta?: MetaType,
  ) {
    const { email, roleId, departmentId } = dto;

    const [org, existingUser, dep, role, existingInvite] = await Promise.all([
      // Get Organization
      this.prisma.organization.findUnique({
        where: { id: organizationId },
        select: {
          id: true,
          name: true,
        },
      }),

      // Get existing user and check that user already in the organization
      this.prisma.user.findUnique({
        where: { email },
        select: { organizationId: true, name: true },
      }),

      // Get department and check that department valid or not
      this.prisma.department.findFirst({
        where: {
          id: departmentId,
          organizationId,
        },
        select: { id: true, name: true },
      }),

      // Get role and check that role valid or not
      this.prisma.role.findUnique({
        where: {
          id: roleId,
        },
        select: { id: true, name: true },
      }),

      // Get existing invite
      this.prisma.invitation.findUnique({
        where: {
          organizationId_email: {
            organizationId,
            email,
          },
        },
        select: { id: true, expiresAt: true },
      }),
    ]);

    if (!org) throw new NotFoundException('Organization not found');

    if (existingUser) {
      if (existingUser?.organizationId === organizationId) {
        throw new BadRequestException('User already in this organization');
      }
      throw new ConflictException('This email alreay register');
    }

    if (!dep) throw new BadRequestException('Invalid department');

    if (!role) throw new BadRequestException('Invalid role');

    const token = crypto.randomBytes(32).toString('hex');
    const hashedToken = hashVerificationToken(token);

    const expiresAt = new Date(Date.now() + 48 * 60 * 60 * 1000); //48 hours

    if (existingInvite) {
      if (existingInvite.expiresAt > new Date()) {
        throw new BadRequestException('Invitation already sent');
      }

      await this.prisma.invitation.update({
        where: {
          id: existingInvite.id,
        },
        data: {
          token: hashedToken,
          expiresAt,
          roleId,
          departmentId,
          organizationId,
          status: InvitationStatus.PENDING,
        },
      });
    } else {
      await this.prisma.invitation.create({
        data: {
          email,
          token: hashedToken,
          expiresAt,
          roleId,
          departmentId,
          organizationId,
        },
      });
    }

    const invitationLink = `http://localhost:5000/api/auth/accept-invite?token=${token}`;

    const formattedExpiry = expiresAt.toLocaleString();

    // Send Email
    await this.mailService.sendEmail({
      to: email,
      subject: `You are invited to join ${org.name}`,
      html: `
      <h3>Hi,</h3>
      <p>You've been invited to join an organization</p>
      <h4>Invitation Details:</h4>
      <p><b>Organization</b>: ${org.name}</p>
      <p><b>Role</b>: ${role.name}</p>
      <p><b>Department</b>: ${dep.name}</p>
      <p>To accept this invitation, click the link below and create your account</p>
      <a href="${invitationLink}">${invitationLink}</a>
      <h4>Important:</h4>
      <p>This invitation will expire on ${formattedExpiry}</p>
      <p>If you did not expect this invitation, you can safely ignore this email</p>
      <p>Thanks</p>
      <p>Maintix Team</p>
      `,
    });

    // Audit logs
    await this.auditSerivce.logs({
      organizationId,
      userId,
      action: AuditAction.SEND_INVITATION,
      module: AuditModule.ORG,
      recordId: userId.toString(),
      ipAddress: meta?.ipAddress,
    });
  }
  //#endregion

  //#region Get organization dropdown
  async getDropdownService(organizationId: number) {
    const [locations, departments] = await Promise.all([
      this.prisma.location.findMany({
        where: { organizationId },
        select: { id: true, name: true },
        orderBy: { name: 'asc' },
      }),

      this.prisma.department.findMany({
        where: { organizationId },
        select: { id: true, name: true },
        orderBy: { name: 'asc' },
      }),
    ]);

    return {
      location: locations.map((loc) => ({
        value: loc.id,
        label: loc.name,
      })),

      department: departments.map((dep) => ({
        value: dep.id,
        label: dep.name,
      })),
    };
  }
  //#endregion
}
