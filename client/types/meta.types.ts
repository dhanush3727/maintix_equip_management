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

export interface Roles {
  label: string;
  value: RoleType;
}

export interface Industries {
  label: string;
  value: IndustryType;
}

export interface CompanySizeType {
  label: string;
  value: CompanySize;
}

export interface Locations {
  label: string;
  value: LocationType;
}

export interface Departments {
  label: string;
  value: DepartmentType;
}

export interface InvitationStatusType {
  label: string;
  value: InvitationStatus;
}

export interface EquipmentStatusType {
  label: string;
  value: EquipmentStatus;
}

export interface Frequency {
  label: string;
  value: FrequencyType;
}

export interface TaskStatusType {
  label: string;
  value: TaskStatus;
}

export interface TaskPriorityType {
  label: string;
  value: TaskPriority;
}

export interface ItemStatusType {
  label: string;
  value: ItemStatus;
}

export interface BreakdownSeverityType {
  label: string;
  value: BreakdownSeverity;
}

export interface BreakdownStatusType {
  label: string;
  value: BreakdownStatus;
}

export interface Notifications {
  label: string;
  value: NotificationType;
}

export interface Reference {
  label: string;
  value: ReferenceType;
}

export interface OnboardingSetupType {
  label: string;
  value: OnboardingSetup;
}

export interface ChecklistItems {
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
