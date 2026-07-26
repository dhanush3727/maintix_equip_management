import { Injectable } from '@nestjs/common';
import { formatEnum } from './common/utils/format-enum.util';
import {
  BreakdownSeverity,
  BreakdownStatus,
  ChecklistItemType,
  CompanySize,
  DepartmentType,
  EquipmentStatus,
  FrequencyType,
  IndustryType,
  InvitationStatus,
  ItemStatus,
  LocationType,
  NotificationType,
  OnboardingStep,
  ReferenceType,
  RoleType,
  TaskPriority,
  TaskStatus,
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
      euqipmentStatus: formatEnum(EquipmentStatus),
      frequencyType: formatEnum(FrequencyType),
      taskStatus: formatEnum(TaskStatus),
      taskPriority: formatEnum(TaskPriority),
      itemStatus: formatEnum(ItemStatus),
      breakdownSeverity: formatEnum(BreakdownSeverity),
      breakdownStatus: formatEnum(BreakdownStatus),
      notificationType: formatEnum(NotificationType),
      referenceType: formatEnum(ReferenceType),
      onboardingStep: formatEnum(OnboardingStep),
      checklistItemType: formatEnum(ChecklistItemType),
    };
  }
  //#endregion
}
