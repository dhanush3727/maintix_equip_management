import {
  CanActivate,
  ExecutionContext,
  ForbiddenException,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { AuthenticateRequest } from '../types/auth.types';

@Injectable()
export class OrganizationActiveGuard implements CanActivate {
  constructor(private prisma: PrismaService) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const request = context.switchToHttp().getRequest<AuthenticateRequest>();

    const user = request.user;

    if (!user || !user.organizationId) {
      throw new UnauthorizedException('Invalid user');
    }

    const org = await this.prisma.organization.findUnique({
      where: { id: user.organizationId },
      select: { isActive: true },
    });

    if (!org || !org.isActive) {
      throw new ForbiddenException('Organization is deactivated');
    }

    return true;
  }
}
