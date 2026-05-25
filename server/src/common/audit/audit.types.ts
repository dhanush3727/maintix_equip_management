export enum AuditAction {
  // Auth Actions
  LOGIN_SUCCESS = 'LOGIN_SUCCESS',
  LOGIN_FAILED = 'LOGIN_FAILED',
  REGISTER_SUCCESS = 'REGISTER_SUCCESS',
  LOGOUT_CURRENT_SESSION = 'LOGOUT_CURRENT_SESSION',
  LOGOUT_SPECIFIC_SESSION = 'LOGOUT_SPECIFIC_SESSION',
  LOGOUT_ALL_SESSION = 'LOGOUT_ALL_SESSION',
  FORGOT_PASSWORD = 'FORGOT_PASSWORD',
  RESET_PASSWORD = 'RESET_PASSWORD',
  EMAIL_VERIFICATION = 'EMAIL_VERIFICATION',
  ACCEPT_INVITATION = 'ACCEPT_INVITATION',
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
