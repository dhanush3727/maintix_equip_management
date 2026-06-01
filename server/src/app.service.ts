import { Injectable } from '@nestjs/common';
import { formatEnum } from './common/utils/format-enum.util';
import {
  CompanySize,
  DepartmentType,
  IndustryType,
  InvitationStatus,
  LocationType,
  RoleType,
} from '@prisma/client';

@Injectable()
export class AppService {
  getHello(): string {
    return 'Hello World!';
  }

  //#region Get organization meta data
  getOrganizationMetaService() {
    return {
      roleType: formatEnum(RoleType),
      industryType: formatEnum(IndustryType),
      companySize: formatEnum(CompanySize),
      locationType: formatEnum(LocationType),
      departmentType: formatEnum(DepartmentType),
      invitationStatus: formatEnum(InvitationStatus),
    };
  }
  //#endregion
}
