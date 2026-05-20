export enum AuditAction {
  // Auth Actions
  LOGIN_SUCCESS = 'LOGIN_SUCCESS',
  LOGIN_FAILED = 'LOGIN_FAILED',
  REGISTER_SUCCESS = 'REGISTER_SUCCESS',
}

export enum AuditModule {
  AUTH = 'AUTH',
  EQUIPMENT = 'EQUIPMENT',
  PM = 'PM',
  BREAKDOWN = 'BREAKDOWN',
}

export type AuditParamsType = {
  organizationId: number;
  userId: number;
  action: AuditAction;
  module: AuditModule;
  recordId: string;
  ipAddress?: string;
};
