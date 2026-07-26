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
  OnboardingSetup,
  ReferenceType,
  RoleType,
  TaskPriority,
  TaskStatus,
} from "./enum/metadata.enum";

interface Roles {
  label: string;
  value: RoleType;
}

interface Industries {
  label: string;
  value: IndustryType;
}

interface CompanySizeType {
  label: string;
  value: CompanySize;
}

interface Locations {
  label: string;
  value: LocationType;
}

interface Departments {
  label: string;
  value: DepartmentType;
}

interface InvitationStatusType {
  label: string;
  value: InvitationStatus;
}

interface EquipmentStatusType {
  label: string;
  value: EquipmentStatus;
}

interface Frequency {
  label: string;
  value: FrequencyType;
}

interface TaskStatusType {
  label: string;
  value: TaskStatus;
}

interface TaskPriorityType {
  label: string;
  value: TaskPriority;
}

interface ItemStatusType {
  label: string;
  value: ItemStatus;
}

interface BreakdownSeverityType {
  label: string;
  value: BreakdownSeverity;
}

interface BreakdownStatusType {
  label: string;
  value: BreakdownStatus;
}

interface Notifications {
  label: string;
  value: NotificationType;
}

interface Reference {
  label: string;
  value: ReferenceType;
}

interface OnboardingSetupType {
  label: string;
  value: OnboardingSetup;
}

interface ChecklistItems {
  label: string;
  value: ChecklistItemType;
}

export interface MetaData {
  roleType: Roles[];
  industryType: Industries[];
  companySize: CompanySizeType[];
  locationType: Locations[];
  departmentType: Departments[];
  invitationStatus: InvitationStatusType[];
  euqipmentStatus: EquipmentStatusType[];
  frequencyType: Frequency[];
  taskStatus: TaskStatusType[];
  taskPriority: TaskPriorityType[];
  itemStatus: ItemStatusType[];
  breakdownSeverity: BreakdownSeverityType[];
  breakdownStatus: BreakdownStatusType[];
  notificationType: Notifications[];
  referenceType: Reference[];
  onboardingStep: OnboardingSetupType[];
  checklistItemType: ChecklistItems[];
}
