--
-- PostgreSQL database dump
--

\restrict KOtde6URrTUTGi027FpLRAGN8tdPGhssbow1CWaFjTeyIhHY0efeWpM4g5fTDnL

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY maintix."User" DROP CONSTRAINT "User_organizationId_fkey";
ALTER TABLE ONLY maintix."UserSession" DROP CONSTRAINT "UserSession_userId_fkey";
ALTER TABLE ONLY maintix."UserRole" DROP CONSTRAINT "UserRole_userId_fkey";
ALTER TABLE ONLY maintix."UserRole" DROP CONSTRAINT "UserRole_roleId_fkey";
ALTER TABLE ONLY maintix."UserDepartment" DROP CONSTRAINT "UserDepartment_userId_fkey";
ALTER TABLE ONLY maintix."UserDepartment" DROP CONSTRAINT "UserDepartment_departmentId_fkey";
ALTER TABLE ONLY maintix."TaskChecklistItem" DROP CONSTRAINT "TaskChecklistItem_templateItemId_fkey";
ALTER TABLE ONLY maintix."TaskChecklistItem" DROP CONSTRAINT "TaskChecklistItem_taskId_fkey";
ALTER TABLE ONLY maintix."PasswordReset" DROP CONSTRAINT "PasswordReset_userId_fkey";
ALTER TABLE ONLY maintix."PMTask" DROP CONSTRAINT "PMTask_templateId_fkey";
ALTER TABLE ONLY maintix."PMTask" DROP CONSTRAINT "PMTask_scheduleId_fkey";
ALTER TABLE ONLY maintix."PMTask" DROP CONSTRAINT "PMTask_organizationId_fkey";
ALTER TABLE ONLY maintix."PMTask" DROP CONSTRAINT "PMTask_equipmentId_fkey";
ALTER TABLE ONLY maintix."PMTask" DROP CONSTRAINT "PMTask_assignedTo_fkey";
ALTER TABLE ONLY maintix."PMSchedule" DROP CONSTRAINT "PMSchedule_templateId_fkey";
ALTER TABLE ONLY maintix."PMSchedule" DROP CONSTRAINT "PMSchedule_organizationId_fkey";
ALTER TABLE ONLY maintix."PMSchedule" DROP CONSTRAINT "PMSchedule_equipmentId_fkey";
ALTER TABLE ONLY maintix."PMSchedule" DROP CONSTRAINT "PMSchedule_assignedTo_fkey";
ALTER TABLE ONLY maintix."Notification" DROP CONSTRAINT "Notification_userId_fkey";
ALTER TABLE ONLY maintix."Notification" DROP CONSTRAINT "Notification_organizationId_fkey";
ALTER TABLE ONLY maintix."Location" DROP CONSTRAINT "Location_organizationId_fkey";
ALTER TABLE ONLY maintix."Invitation" DROP CONSTRAINT "Invitation_roleId_fkey";
ALTER TABLE ONLY maintix."Invitation" DROP CONSTRAINT "Invitation_organizationId_fkey";
ALTER TABLE ONLY maintix."Invitation" DROP CONSTRAINT "Invitation_departmentId_fkey";
ALTER TABLE ONLY maintix."Equipment" DROP CONSTRAINT "Equipment_organizationId_fkey";
ALTER TABLE ONLY maintix."Equipment" DROP CONSTRAINT "Equipment_locationId_fkey";
ALTER TABLE ONLY maintix."Equipment" DROP CONSTRAINT "Equipment_equipmentTypeId_fkey";
ALTER TABLE ONLY maintix."Equipment" DROP CONSTRAINT "Equipment_departmentId_fkey";
ALTER TABLE ONLY maintix."EquipmentType" DROP CONSTRAINT "EquipmentType_organizationId_fkey";
ALTER TABLE ONLY maintix."EmailVerification" DROP CONSTRAINT "EmailVerification_userId_fkey";
ALTER TABLE ONLY maintix."Department" DROP CONSTRAINT "Department_organizationId_fkey";
ALTER TABLE ONLY maintix."ChecklistTemplate" DROP CONSTRAINT "ChecklistTemplate_parentId_fkey";
ALTER TABLE ONLY maintix."ChecklistTemplate" DROP CONSTRAINT "ChecklistTemplate_organizationId_fkey";
ALTER TABLE ONLY maintix."ChecklistTemplate" DROP CONSTRAINT "ChecklistTemplate_equipmentTypeId_fkey";
ALTER TABLE ONLY maintix."ChecklistItem" DROP CONSTRAINT "ChecklistItem_templateId_fkey";
ALTER TABLE ONLY maintix."BreakdownReport" DROP CONSTRAINT "BreakdownReport_reportedBy_fkey";
ALTER TABLE ONLY maintix."BreakdownReport" DROP CONSTRAINT "BreakdownReport_organizationId_fkey";
ALTER TABLE ONLY maintix."BreakdownReport" DROP CONSTRAINT "BreakdownReport_equipmentId_fkey";
ALTER TABLE ONLY maintix."BreakdownReport" DROP CONSTRAINT "BreakdownReport_assignedTo_fkey";
ALTER TABLE ONLY maintix."BreakdownAction" DROP CONSTRAINT "BreakdownAction_performedBy_fkey";
ALTER TABLE ONLY maintix."BreakdownAction" DROP CONSTRAINT "BreakdownAction_breakdownId_fkey";
DROP INDEX maintix."User_organizationId_idx";
DROP INDEX maintix."User_email_key";
DROP INDEX maintix."UserSession_jti_key";
DROP INDEX maintix."UserRole_userId_roleId_key";
DROP INDEX maintix."UserDepartment_userId_key";
DROP INDEX maintix."TaskChecklistItem_templateItemId_idx";
DROP INDEX maintix."TaskChecklistItem_taskId_idx";
DROP INDEX maintix."Role_name_key";
DROP INDEX maintix."PasswordReset_userId_idx";
DROP INDEX maintix."PasswordReset_token_key";
DROP INDEX maintix."PasswordReset_expiresAt_idx";
DROP INDEX maintix."PMTask_status_idx";
DROP INDEX maintix."PMTask_scheduleId_idx";
DROP INDEX maintix."PMTask_organizationId_idx";
DROP INDEX maintix."PMTask_dueDate_idx";
DROP INDEX maintix."PMTask_assignedTo_idx";
DROP INDEX maintix."PMSchedule_organizationId_idx";
DROP INDEX maintix."PMSchedule_nextDueDate_idx";
DROP INDEX maintix."PMSchedule_equipmentId_idx";
DROP INDEX maintix."PMSchedule_assignedTo_idx";
DROP INDEX maintix."Organization_slug_key";
DROP INDEX maintix."Notification_organizationId_userId_isRead_idx";
DROP INDEX maintix."Invitation_token_key";
DROP INDEX maintix."Invitation_organizationId_email_key";
DROP INDEX maintix."Invitation_email_idx";
DROP INDEX maintix."Equipment_organizationId_idx";
DROP INDEX maintix."Equipment_organizationId_code_key";
DROP INDEX maintix."Equipment_equipmentTypeId_idx";
DROP INDEX maintix."EquipmentType_organizationId_name_key";
DROP INDEX maintix."EquipmentType_organizationId_code_key";
DROP INDEX maintix."EmailVerification_userId_idx";
DROP INDEX maintix."EmailVerification_token_key";
DROP INDEX maintix."EmailVerification_expiresAt_idx";
DROP INDEX maintix."Department_organizationId_name_key";
DROP INDEX maintix."Department_organizationId_code_key";
DROP INDEX maintix."ChecklistTemplate_parentId_idx";
DROP INDEX maintix."ChecklistTemplate_organizationId_idx";
DROP INDEX maintix."ChecklistTemplate_equipmentTypeId_idx";
DROP INDEX maintix."ChecklistItem_templateId_order_key";
DROP INDEX maintix."BreakdownReport_status_idx";
DROP INDEX maintix."BreakdownReport_organizationId_idx";
DROP INDEX maintix."BreakdownReport_equipmentId_idx";
DROP INDEX maintix."BreakdownReport_assignedTo_idx";
DROP INDEX maintix."BreakdownAction_breakdownId_idx";
ALTER TABLE ONLY maintix._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
ALTER TABLE ONLY maintix."User" DROP CONSTRAINT "User_pkey";
ALTER TABLE ONLY maintix."UserSession" DROP CONSTRAINT "UserSession_pkey";
ALTER TABLE ONLY maintix."UserRole" DROP CONSTRAINT "UserRole_pkey";
ALTER TABLE ONLY maintix."UserDepartment" DROP CONSTRAINT "UserDepartment_pkey";
ALTER TABLE ONLY maintix."TaskChecklistItem" DROP CONSTRAINT "TaskChecklistItem_pkey";
ALTER TABLE ONLY maintix."Role" DROP CONSTRAINT "Role_pkey";
ALTER TABLE ONLY maintix."PasswordReset" DROP CONSTRAINT "PasswordReset_pkey";
ALTER TABLE ONLY maintix."PMTask" DROP CONSTRAINT "PMTask_pkey";
ALTER TABLE ONLY maintix."PMSchedule" DROP CONSTRAINT "PMSchedule_pkey";
ALTER TABLE ONLY maintix."Organization" DROP CONSTRAINT "Organization_pkey";
ALTER TABLE ONLY maintix."Notification" DROP CONSTRAINT "Notification_pkey";
ALTER TABLE ONLY maintix."Location" DROP CONSTRAINT "Location_pkey";
ALTER TABLE ONLY maintix."Invitation" DROP CONSTRAINT "Invitation_pkey";
ALTER TABLE ONLY maintix."Equipment" DROP CONSTRAINT "Equipment_pkey";
ALTER TABLE ONLY maintix."EquipmentType" DROP CONSTRAINT "EquipmentType_pkey";
ALTER TABLE ONLY maintix."EmailVerification" DROP CONSTRAINT "EmailVerification_pkey";
ALTER TABLE ONLY maintix."Department" DROP CONSTRAINT "Department_pkey";
ALTER TABLE ONLY maintix."ChecklistTemplate" DROP CONSTRAINT "ChecklistTemplate_pkey";
ALTER TABLE ONLY maintix."ChecklistItem" DROP CONSTRAINT "ChecklistItem_pkey";
ALTER TABLE ONLY maintix."BreakdownReport" DROP CONSTRAINT "BreakdownReport_pkey";
ALTER TABLE ONLY maintix."BreakdownAction" DROP CONSTRAINT "BreakdownAction_pkey";
ALTER TABLE ONLY maintix."AuditLog" DROP CONSTRAINT "AuditLog_pkey";
ALTER TABLE maintix."UserSession" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE maintix."UserRole" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE maintix."UserDepartment" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE maintix."User" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE maintix."TaskChecklistItem" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE maintix."Role" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE maintix."PasswordReset" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE maintix."PMTask" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE maintix."PMSchedule" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE maintix."Organization" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE maintix."Notification" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE maintix."Location" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE maintix."Invitation" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE maintix."EquipmentType" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE maintix."Equipment" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE maintix."EmailVerification" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE maintix."Department" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE maintix."ChecklistTemplate" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE maintix."ChecklistItem" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE maintix."BreakdownReport" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE maintix."BreakdownAction" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE maintix."AuditLog" ALTER COLUMN id DROP DEFAULT;
DROP TABLE maintix._prisma_migrations;
DROP SEQUENCE maintix."User_id_seq";
DROP SEQUENCE maintix."UserSession_id_seq";
DROP TABLE maintix."UserSession";
DROP SEQUENCE maintix."UserRole_id_seq";
DROP TABLE maintix."UserRole";
DROP SEQUENCE maintix."UserDepartment_id_seq";
DROP TABLE maintix."UserDepartment";
DROP TABLE maintix."User";
DROP SEQUENCE maintix."TaskChecklistItem_id_seq";
DROP TABLE maintix."TaskChecklistItem";
DROP SEQUENCE maintix."Role_id_seq";
DROP TABLE maintix."Role";
DROP SEQUENCE maintix."PasswordReset_id_seq";
DROP TABLE maintix."PasswordReset";
DROP SEQUENCE maintix."PMTask_id_seq";
DROP TABLE maintix."PMTask";
DROP SEQUENCE maintix."PMSchedule_id_seq";
DROP TABLE maintix."PMSchedule";
DROP SEQUENCE maintix."Organization_id_seq";
DROP TABLE maintix."Organization";
DROP SEQUENCE maintix."Notification_id_seq";
DROP TABLE maintix."Notification";
DROP SEQUENCE maintix."Location_id_seq";
DROP TABLE maintix."Location";
DROP SEQUENCE maintix."Invitation_id_seq";
DROP TABLE maintix."Invitation";
DROP SEQUENCE maintix."Equipment_id_seq";
DROP SEQUENCE maintix."EquipmentType_id_seq";
DROP TABLE maintix."EquipmentType";
DROP TABLE maintix."Equipment";
DROP SEQUENCE maintix."EmailVerification_id_seq";
DROP TABLE maintix."EmailVerification";
DROP SEQUENCE maintix."Department_id_seq";
DROP TABLE maintix."Department";
DROP SEQUENCE maintix."ChecklistTemplate_id_seq";
DROP TABLE maintix."ChecklistTemplate";
DROP SEQUENCE maintix."ChecklistItem_id_seq";
DROP TABLE maintix."ChecklistItem";
DROP SEQUENCE maintix."BreakdownReport_id_seq";
DROP TABLE maintix."BreakdownReport";
DROP SEQUENCE maintix."BreakdownAction_id_seq";
DROP TABLE maintix."BreakdownAction";
DROP SEQUENCE maintix."AuditLog_id_seq";
DROP TABLE maintix."AuditLog";
DROP TYPE maintix."TaskStatus";
DROP TYPE maintix."TaskPriority";
DROP TYPE maintix."RoleType";
DROP TYPE maintix."ReferenceType";
DROP TYPE maintix."OnboardingStep";
DROP TYPE maintix."NotificationType";
DROP TYPE maintix."LocationType";
DROP TYPE maintix."ItemStatus";
DROP TYPE maintix."InvitationStatus";
DROP TYPE maintix."IndustryType";
DROP TYPE maintix."FrequencyType";
DROP TYPE maintix."EquipmentStatus";
DROP TYPE maintix."DepartmentType";
DROP TYPE maintix."CompanySize";
DROP TYPE maintix."ChecklistItemType";
DROP TYPE maintix."BreakdownStatus";
DROP TYPE maintix."BreakdownSeverity";
DROP SCHEMA maintix;
--
-- Name: maintix; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA maintix;


--
-- Name: BreakdownSeverity; Type: TYPE; Schema: maintix; Owner: -
--

CREATE TYPE maintix."BreakdownSeverity" AS ENUM (
    'LOW',
    'MEDIUM',
    'HIGH',
    'CRITICAL'
);


--
-- Name: BreakdownStatus; Type: TYPE; Schema: maintix; Owner: -
--

CREATE TYPE maintix."BreakdownStatus" AS ENUM (
    'OPEN',
    'IN_PROGRESS',
    'RESOLVED',
    'CLOSED'
);


--
-- Name: ChecklistItemType; Type: TYPE; Schema: maintix; Owner: -
--

CREATE TYPE maintix."ChecklistItemType" AS ENUM (
    'TEXT',
    'NUMBER',
    'BOOLEAN',
    'SELECT'
);


--
-- Name: CompanySize; Type: TYPE; Schema: maintix; Owner: -
--

CREATE TYPE maintix."CompanySize" AS ENUM (
    'SMALL',
    'MEDIUM',
    'LARGE',
    'ENTERPRISE'
);


--
-- Name: DepartmentType; Type: TYPE; Schema: maintix; Owner: -
--

CREATE TYPE maintix."DepartmentType" AS ENUM (
    'MECHANICAL',
    'ELECTRICAL',
    'INSTRUMENTATION',
    'CIVIL',
    'OTHERS'
);


--
-- Name: EquipmentStatus; Type: TYPE; Schema: maintix; Owner: -
--

CREATE TYPE maintix."EquipmentStatus" AS ENUM (
    'ACTIVE',
    'INACTIVE',
    'UNDER_MAINTENANCE',
    'BREAKDOWN',
    'DECOMMISSIONED'
);


--
-- Name: FrequencyType; Type: TYPE; Schema: maintix; Owner: -
--

CREATE TYPE maintix."FrequencyType" AS ENUM (
    'DAILY',
    'WEEKLY',
    'MONTHLY',
    'YEARLY'
);


--
-- Name: IndustryType; Type: TYPE; Schema: maintix; Owner: -
--

CREATE TYPE maintix."IndustryType" AS ENUM (
    'MANUFACTURING',
    'CHEMICAL',
    'OIL_GAS',
    'FERTILIZER',
    'GENERAL',
    'OTHERS'
);


--
-- Name: InvitationStatus; Type: TYPE; Schema: maintix; Owner: -
--

CREATE TYPE maintix."InvitationStatus" AS ENUM (
    'PENDING',
    'ACCEPTED',
    'EXPIRED',
    'REVOKED'
);


--
-- Name: ItemStatus; Type: TYPE; Schema: maintix; Owner: -
--

CREATE TYPE maintix."ItemStatus" AS ENUM (
    'PENDING',
    'OK',
    'NOT_OK',
    'SKIPPED'
);


--
-- Name: LocationType; Type: TYPE; Schema: maintix; Owner: -
--

CREATE TYPE maintix."LocationType" AS ENUM (
    'PLANT',
    'WAREHOUSE',
    'OFFICE',
    'FACILITY',
    'OTHERS'
);


--
-- Name: NotificationType; Type: TYPE; Schema: maintix; Owner: -
--

CREATE TYPE maintix."NotificationType" AS ENUM (
    'TASK_ASSIGNED',
    'TASK_OVERDUE',
    'BREAKDOWN_RAISED',
    'BREAKDOWN_ASSIGNED',
    'BREAKDOWN_RESOLVED',
    'SCHEDULE_ASSIGNED'
);


--
-- Name: OnboardingStep; Type: TYPE; Schema: maintix; Owner: -
--

CREATE TYPE maintix."OnboardingStep" AS ENUM (
    'ORGANIZATION',
    'LOCATION',
    'DEPARTMENT',
    'USERS',
    'COMPLETED'
);


--
-- Name: ReferenceType; Type: TYPE; Schema: maintix; Owner: -
--

CREATE TYPE maintix."ReferenceType" AS ENUM (
    'TASK',
    'BREAKDOWN',
    'SCHEDULE'
);


--
-- Name: RoleType; Type: TYPE; Schema: maintix; Owner: -
--

CREATE TYPE maintix."RoleType" AS ENUM (
    'ADMIN',
    'MANAGER',
    'ENGINEER',
    'TECHNICIAN',
    'INSPECTOR'
);


--
-- Name: TaskPriority; Type: TYPE; Schema: maintix; Owner: -
--

CREATE TYPE maintix."TaskPriority" AS ENUM (
    'LOW',
    'MEDIUM',
    'HIGH'
);


--
-- Name: TaskStatus; Type: TYPE; Schema: maintix; Owner: -
--

CREATE TYPE maintix."TaskStatus" AS ENUM (
    'PENDING',
    'IN_PROGRESS',
    'COMPLETED',
    'SKIPPED'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: AuditLog; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."AuditLog" (
    id integer NOT NULL,
    "organizationId" integer NOT NULL,
    "userId" integer NOT NULL,
    action text NOT NULL,
    module text NOT NULL,
    "recordId" text NOT NULL,
    "ipAddress" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: AuditLog_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."AuditLog_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: AuditLog_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."AuditLog_id_seq" OWNED BY maintix."AuditLog".id;


--
-- Name: BreakdownAction; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."BreakdownAction" (
    id integer NOT NULL,
    "breakdownId" integer NOT NULL,
    "performedBy" integer NOT NULL,
    action text NOT NULL,
    remarks text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: BreakdownAction_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."BreakdownAction_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: BreakdownAction_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."BreakdownAction_id_seq" OWNED BY maintix."BreakdownAction".id;


--
-- Name: BreakdownReport; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."BreakdownReport" (
    id integer NOT NULL,
    "organizationId" integer NOT NULL,
    "equipmentId" integer NOT NULL,
    "reportedBy" integer NOT NULL,
    "assignedTo" integer,
    title text NOT NULL,
    "rootCause" text,
    description text,
    severity maintix."BreakdownSeverity" NOT NULL,
    status maintix."BreakdownStatus" DEFAULT 'OPEN'::maintix."BreakdownStatus" NOT NULL,
    "reportedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "resolvedAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: BreakdownReport_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."BreakdownReport_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: BreakdownReport_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."BreakdownReport_id_seq" OWNED BY maintix."BreakdownReport".id;


--
-- Name: ChecklistItem; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."ChecklistItem" (
    id integer NOT NULL,
    "templateId" integer NOT NULL,
    name text NOT NULL,
    "order" integer NOT NULL,
    "expectedValue" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "isRequired" boolean DEFAULT true NOT NULL,
    "maxValue" double precision,
    "minValue" double precision,
    type maintix."ChecklistItemType" NOT NULL,
    options jsonb
);


--
-- Name: ChecklistItem_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."ChecklistItem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ChecklistItem_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."ChecklistItem_id_seq" OWNED BY maintix."ChecklistItem".id;


--
-- Name: ChecklistTemplate; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."ChecklistTemplate" (
    id integer NOT NULL,
    "organizationId" integer NOT NULL,
    "equipmentTypeId" integer NOT NULL,
    name text NOT NULL,
    description text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    "parentId" integer
);


--
-- Name: ChecklistTemplate_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."ChecklistTemplate_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ChecklistTemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."ChecklistTemplate_id_seq" OWNED BY maintix."ChecklistTemplate".id;


--
-- Name: Department; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."Department" (
    id integer NOT NULL,
    "organizationId" integer NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    type maintix."DepartmentType" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: Department_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."Department_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Department_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."Department_id_seq" OWNED BY maintix."Department".id;


--
-- Name: EmailVerification; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."EmailVerification" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "isUsed" boolean DEFAULT false NOT NULL
);


--
-- Name: EmailVerification_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."EmailVerification_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: EmailVerification_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."EmailVerification_id_seq" OWNED BY maintix."EmailVerification".id;


--
-- Name: Equipment; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."Equipment" (
    id integer NOT NULL,
    "organizationId" integer NOT NULL,
    "equipmentTypeId" integer NOT NULL,
    name text NOT NULL,
    "serialNumber" text,
    status maintix."EquipmentStatus" DEFAULT 'ACTIVE'::maintix."EquipmentStatus" NOT NULL,
    "installedDate" timestamp(3) without time zone,
    "warrantyExpiry" timestamp(3) without time zone,
    manufacturer text,
    model text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    code text NOT NULL,
    "departmentId" integer,
    "locationId" integer
);


--
-- Name: EquipmentType; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."EquipmentType" (
    id integer NOT NULL,
    "organizationId" integer NOT NULL,
    name text NOT NULL,
    code text,
    description text,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: EquipmentType_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."EquipmentType_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: EquipmentType_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."EquipmentType_id_seq" OWNED BY maintix."EquipmentType".id;


--
-- Name: Equipment_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."Equipment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Equipment_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."Equipment_id_seq" OWNED BY maintix."Equipment".id;


--
-- Name: Invitation; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."Invitation" (
    id integer NOT NULL,
    "organizationId" integer NOT NULL,
    email text NOT NULL,
    "roleId" integer NOT NULL,
    "departmentId" integer,
    token text NOT NULL,
    status maintix."InvitationStatus" DEFAULT 'PENDING'::maintix."InvitationStatus" NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: Invitation_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."Invitation_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Invitation_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."Invitation_id_seq" OWNED BY maintix."Invitation".id;


--
-- Name: Location; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."Location" (
    id integer NOT NULL,
    "organizationId" integer NOT NULL,
    name text NOT NULL,
    type maintix."LocationType",
    address text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: Location_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."Location_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Location_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."Location_id_seq" OWNED BY maintix."Location".id;


--
-- Name: Notification; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."Notification" (
    id integer NOT NULL,
    "organizationId" integer NOT NULL,
    "userId" integer NOT NULL,
    type maintix."NotificationType" NOT NULL,
    title text NOT NULL,
    message text NOT NULL,
    "referenceId" integer,
    "referenceType" maintix."ReferenceType",
    "isRead" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "readAt" timestamp(3) without time zone
);


--
-- Name: Notification_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."Notification_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Notification_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."Notification_id_seq" OWNED BY maintix."Notification".id;


--
-- Name: Organization; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."Organization" (
    id integer NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    "industryType" maintix."IndustryType",
    "companySize" maintix."CompanySize",
    country text,
    city text,
    "logoUrl" text,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "logoPublicId" text,
    "onboardingStep" maintix."OnboardingStep" DEFAULT 'ORGANIZATION'::maintix."OnboardingStep" NOT NULL
);


--
-- Name: Organization_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."Organization_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Organization_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."Organization_id_seq" OWNED BY maintix."Organization".id;


--
-- Name: PMSchedule; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."PMSchedule" (
    id integer NOT NULL,
    "organizationId" integer NOT NULL,
    "equipmentId" integer NOT NULL,
    "templateId" integer NOT NULL,
    "frequencyType" maintix."FrequencyType" NOT NULL,
    "interval" integer NOT NULL,
    "startDate" timestamp(3) without time zone NOT NULL,
    "nextDueDate" timestamp(3) without time zone NOT NULL,
    "assignedTo" integer NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "lastGeneratedAt" timestamp(3) without time zone
);


--
-- Name: PMSchedule_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."PMSchedule_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: PMSchedule_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."PMSchedule_id_seq" OWNED BY maintix."PMSchedule".id;


--
-- Name: PMTask; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."PMTask" (
    id integer NOT NULL,
    "organizationId" integer NOT NULL,
    "scheduleId" integer NOT NULL,
    "equipmentId" integer NOT NULL,
    "templateId" integer NOT NULL,
    "assignedTo" integer NOT NULL,
    "dueDate" timestamp(3) without time zone NOT NULL,
    "completedAt" timestamp(3) without time zone,
    status maintix."TaskStatus" DEFAULT 'PENDING'::maintix."TaskStatus" NOT NULL,
    priority maintix."TaskPriority" DEFAULT 'MEDIUM'::maintix."TaskPriority" NOT NULL,
    remarks text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    title text NOT NULL
);


--
-- Name: PMTask_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."PMTask_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: PMTask_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."PMTask_id_seq" OWNED BY maintix."PMTask".id;


--
-- Name: PasswordReset; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."PasswordReset" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "isUsed" boolean DEFAULT false NOT NULL
);


--
-- Name: PasswordReset_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."PasswordReset_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: PasswordReset_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."PasswordReset_id_seq" OWNED BY maintix."PasswordReset".id;


--
-- Name: Role; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."Role" (
    id integer NOT NULL,
    name maintix."RoleType" NOT NULL
);


--
-- Name: Role_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."Role_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: Role_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."Role_id_seq" OWNED BY maintix."Role".id;


--
-- Name: TaskChecklistItem; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."TaskChecklistItem" (
    id integer NOT NULL,
    "taskId" integer NOT NULL,
    name text NOT NULL,
    "order" integer NOT NULL,
    "expectedValue" text,
    "actualValue" text,
    status maintix."ItemStatus",
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "maxValue" double precision,
    "minValue" double precision,
    "templateItemId" integer NOT NULL,
    type maintix."ChecklistItemType" NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    options jsonb
);


--
-- Name: TaskChecklistItem_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."TaskChecklistItem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: TaskChecklistItem_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."TaskChecklistItem_id_seq" OWNED BY maintix."TaskChecklistItem".id;


--
-- Name: User; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."User" (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "isEmailVerified" boolean DEFAULT false NOT NULL,
    "lastLoginAt" timestamp(3) without time zone,
    "organizationId" integer NOT NULL,
    "passwordHash" text NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: UserDepartment; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."UserDepartment" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "departmentId" integer NOT NULL
);


--
-- Name: UserDepartment_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."UserDepartment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: UserDepartment_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."UserDepartment_id_seq" OWNED BY maintix."UserDepartment".id;


--
-- Name: UserRole; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."UserRole" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "roleId" integer NOT NULL
);


--
-- Name: UserRole_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."UserRole_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: UserRole_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."UserRole_id_seq" OWNED BY maintix."UserRole".id;


--
-- Name: UserSession; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix."UserSession" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "refreshToken" text NOT NULL,
    "deviceInfo" text,
    "ipAddress" text,
    "userAgent" text,
    "isActive" boolean DEFAULT true NOT NULL,
    "lastActiveAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    jti text NOT NULL
);


--
-- Name: UserSession_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."UserSession_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: UserSession_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."UserSession_id_seq" OWNED BY maintix."UserSession".id;


--
-- Name: User_id_seq; Type: SEQUENCE; Schema: maintix; Owner: -
--

CREATE SEQUENCE maintix."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: maintix; Owner: -
--

ALTER SEQUENCE maintix."User_id_seq" OWNED BY maintix."User".id;


--
-- Name: _prisma_migrations; Type: TABLE; Schema: maintix; Owner: -
--

CREATE TABLE maintix._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


--
-- Name: AuditLog id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."AuditLog" ALTER COLUMN id SET DEFAULT nextval('maintix."AuditLog_id_seq"'::regclass);


--
-- Name: BreakdownAction id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."BreakdownAction" ALTER COLUMN id SET DEFAULT nextval('maintix."BreakdownAction_id_seq"'::regclass);


--
-- Name: BreakdownReport id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."BreakdownReport" ALTER COLUMN id SET DEFAULT nextval('maintix."BreakdownReport_id_seq"'::regclass);


--
-- Name: ChecklistItem id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."ChecklistItem" ALTER COLUMN id SET DEFAULT nextval('maintix."ChecklistItem_id_seq"'::regclass);


--
-- Name: ChecklistTemplate id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."ChecklistTemplate" ALTER COLUMN id SET DEFAULT nextval('maintix."ChecklistTemplate_id_seq"'::regclass);


--
-- Name: Department id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Department" ALTER COLUMN id SET DEFAULT nextval('maintix."Department_id_seq"'::regclass);


--
-- Name: EmailVerification id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."EmailVerification" ALTER COLUMN id SET DEFAULT nextval('maintix."EmailVerification_id_seq"'::regclass);


--
-- Name: Equipment id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Equipment" ALTER COLUMN id SET DEFAULT nextval('maintix."Equipment_id_seq"'::regclass);


--
-- Name: EquipmentType id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."EquipmentType" ALTER COLUMN id SET DEFAULT nextval('maintix."EquipmentType_id_seq"'::regclass);


--
-- Name: Invitation id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Invitation" ALTER COLUMN id SET DEFAULT nextval('maintix."Invitation_id_seq"'::regclass);


--
-- Name: Location id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Location" ALTER COLUMN id SET DEFAULT nextval('maintix."Location_id_seq"'::regclass);


--
-- Name: Notification id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Notification" ALTER COLUMN id SET DEFAULT nextval('maintix."Notification_id_seq"'::regclass);


--
-- Name: Organization id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Organization" ALTER COLUMN id SET DEFAULT nextval('maintix."Organization_id_seq"'::regclass);


--
-- Name: PMSchedule id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."PMSchedule" ALTER COLUMN id SET DEFAULT nextval('maintix."PMSchedule_id_seq"'::regclass);


--
-- Name: PMTask id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."PMTask" ALTER COLUMN id SET DEFAULT nextval('maintix."PMTask_id_seq"'::regclass);


--
-- Name: PasswordReset id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."PasswordReset" ALTER COLUMN id SET DEFAULT nextval('maintix."PasswordReset_id_seq"'::regclass);


--
-- Name: Role id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Role" ALTER COLUMN id SET DEFAULT nextval('maintix."Role_id_seq"'::regclass);


--
-- Name: TaskChecklistItem id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."TaskChecklistItem" ALTER COLUMN id SET DEFAULT nextval('maintix."TaskChecklistItem_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."User" ALTER COLUMN id SET DEFAULT nextval('maintix."User_id_seq"'::regclass);


--
-- Name: UserDepartment id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."UserDepartment" ALTER COLUMN id SET DEFAULT nextval('maintix."UserDepartment_id_seq"'::regclass);


--
-- Name: UserRole id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."UserRole" ALTER COLUMN id SET DEFAULT nextval('maintix."UserRole_id_seq"'::regclass);


--
-- Name: UserSession id; Type: DEFAULT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."UserSession" ALTER COLUMN id SET DEFAULT nextval('maintix."UserSession_id_seq"'::regclass);


--
-- Data for Name: AuditLog; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."AuditLog" (id, "organizationId", "userId", action, module, "recordId", "ipAddress", "createdAt") FROM stdin;
1	2	2	REGISTER_SUCCESS	AUTH	2	::1	2026-05-27 10:16:54.11
2	3	3	REGISTER_SUCCESS	AUTH	3	::1	2026-05-27 10:17:22.617
3	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-27 10:41:16.073
4	2	2	LOGIN_SUCCESS	AUTH	2	::ffff:127.0.0.1	2026-05-27 11:01:18.776
5	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-28 04:30:19.026
6	3	3	CREATE_LOCATION	ORG	3	::1	2026-05-28 04:30:43.338
7	3	3	CREATE_LOCATION	ORG	3	::1	2026-05-28 04:30:55.759
8	3	3	CREATE_LOCATION	ORG	3	::1	2026-05-28 04:31:19.576
9	3	3	CREATE_LOCATION	ORG	3	::1	2026-05-28 04:31:34.086
10	3	3	CREATE_LOCATION	ORG	3	::1	2026-05-28 04:31:56.689
11	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-05-28 04:34:03.251
12	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-28 05:43:16.441
13	3	3	UPDATE_LOCATION	ORG	3	::1	2026-05-28 05:44:41.613
14	3	3	UPDATE_LOCATION	ORG	3	::1	2026-05-28 05:45:12.855
15	3	3	CREATE_LOCATION	ORG	3	::1	2026-05-28 05:48:02.114
16	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-28 06:01:20.67
17	3	3	UPDATE_LOCATION	ORG	3	::1	2026-05-28 06:05:14.938
18	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-28 06:16:27.967
19	3	3	UPDATE_ORG	ORG	3	::1	2026-05-28 06:16:37.436
20	3	3	UPDATE_ORG	ORG	3	::1	2026-05-28 06:17:06.168
21	3	3	UPDATE_ORG	ORG	3	::1	2026-05-28 06:17:19.501
22	3	3	UPDATE_ORG	ORG	3	::1	2026-05-28 06:17:28.753
23	3	3	UPDATE_ORG	ORG	3	::1	2026-05-28 06:18:29.464
24	3	3	UPDATE_ORG	ORG	3	::1	2026-05-28 06:18:49.94
25	3	3	UPDATE_ORG	ORG	3	::1	2026-05-28 06:19:28.116
26	3	3	UPDATE_ORG	ORG	3	::1	2026-05-28 06:20:52.769
27	3	3	UPDATE_ORG	ORG	3	::1	2026-05-28 06:21:12.165
28	3	3	UPDATE_ORG	ORG	3	::1	2026-05-28 06:21:19.378
29	3	3	UPDATE_ORG	ORG	3	::1	2026-05-28 06:21:44.931
30	3	3	UPDATE_ORG	ORG	3	::1	2026-05-28 06:21:57.987
31	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-28 06:24:03.64
32	3	3	UPDATE_LOCATION	ORG	3	::1	2026-05-28 06:24:16.551
33	3	3	UPDATE_LOCATION	ORG	3	::1	2026-05-28 06:24:56.345
34	3	3	UPDATE_LOCATION	ORG	3	::1	2026-05-28 06:25:10.265
35	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:37:05.015
36	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:37:05.449
37	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:37:05.579
38	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-28 07:38:21.18
39	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:39:01.932
40	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:39:02.212
41	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:39:02.348
42	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:39:45.672
43	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:39:45.894
44	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:39:46.014
45	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:41:40.036
46	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:41:40.279
47	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:41:40.401
48	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:41:55.571
49	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:41:55.793
50	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:41:55.916
51	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:43:02.4
52	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:43:02.59
53	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:43:02.708
54	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:48:40.622
55	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:49:00.33
56	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:49:48.601
57	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 07:50:17.129
58	3	3	UPDATE_LOCATION	ORG	3	::ffff:127.0.0.1	2026-05-28 07:50:17.332
59	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 08:00:04.327
60	3	3	UPDATE_LOCATION	ORG	3	::ffff:127.0.0.1	2026-05-28 08:00:04.621
61	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 08:00:04.909
62	3	3	UPDATE_LOCATION	ORG	3	::ffff:127.0.0.1	2026-05-28 08:00:04.934
63	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 08:00:05.123
64	3	3	UPDATE_LOCATION	ORG	3	::ffff:127.0.0.1	2026-05-28 08:00:05.141
65	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 08:00:05.408
66	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 08:00:05.593
67	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 08:00:05.895
68	3	3	UPDATE_LOCATION	ORG	3	::ffff:127.0.0.1	2026-05-28 08:00:05.909
69	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 08:03:40.521
70	3	3	UPDATE_LOCATION	ORG	3	::ffff:127.0.0.1	2026-05-28 08:03:40.621
71	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 08:03:40.764
72	3	3	UPDATE_LOCATION	ORG	3	::ffff:127.0.0.1	2026-05-28 08:03:40.771
73	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 08:03:40.882
74	3	3	UPDATE_LOCATION	ORG	3	::ffff:127.0.0.1	2026-05-28 08:03:40.889
75	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 08:03:41.002
76	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 08:03:41.119
77	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 08:03:41.234
78	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-28 08:14:51.142
79	3	3	UPDATE_LOCATION	ORG	3	::1	2026-05-28 08:15:03.814
80	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 08:28:59.167
81	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 08:28:59.41
82	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 08:30:54.134
83	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 08:30:54.414
84	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-28 09:14:04.475
85	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-28 09:14:48.891
86	3	3	CREATE_DEPARTMENT	ORG	3	::1	2026-05-28 09:15:49.931
87	3	3	CREATE_DEPARTMENT	ORG	3	::1	2026-05-28 09:17:12.962
88	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 09:28:56.69
89	3	3	CREATE_DEPARTMENT	ORG	3	::ffff:127.0.0.1	2026-05-28 09:28:56.911
90	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 09:28:57.059
91	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 09:28:57.379
92	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-28 09:52:19.987
93	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 10:03:43.23
94	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 10:03:43.59
95	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 10:03:43.713
96	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-28 10:50:44.061
97	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 11:23:00.124
98	3	3	UPDATE_DEPARTMENT	ORG	1	::ffff:127.0.0.1	2026-05-28 11:23:00.252
99	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 11:23:00.428
100	3	3	UPDATE_DEPARTMENT	ORG	1	::ffff:127.0.0.1	2026-05-28 11:23:00.45
101	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 11:23:00.606
102	3	3	UPDATE_DEPARTMENT	ORG	1	::ffff:127.0.0.1	2026-05-28 11:23:00.621
103	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 11:23:00.757
104	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 11:23:00.888
105	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 11:23:01.04
106	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 11:23:01.353
107	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-28 11:23:59.603
108	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 11:25:01.399
109	3	3	UPDATE_DEPARTMENT	ORG	1	::ffff:127.0.0.1	2026-05-28 11:25:01.503
110	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 11:25:01.635
111	3	3	UPDATE_DEPARTMENT	ORG	1	::ffff:127.0.0.1	2026-05-28 11:25:01.645
112	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 11:25:01.767
113	3	3	UPDATE_DEPARTMENT	ORG	1	::ffff:127.0.0.1	2026-05-28 11:25:01.776
114	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 11:25:01.902
115	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 11:25:02.024
116	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 11:25:02.14
117	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 11:25:02.414
118	3	3	UPDATE_DEPARTMENT	ORG	4	::1	2026-05-28 11:27:13.091
119	3	3	UPDATE_DEPARTMENT	ORG	4	::1	2026-05-28 11:27:53.098
120	3	3	UPDATE_DEPARTMENT	ORG	4	::1	2026-05-28 11:28:21.647
121	3	3	UPDATE_DEPARTMENT	ORG	4	::1	2026-05-28 11:28:31.53
122	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 11:36:00.992
123	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-28 11:36:01.223
124	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-29 06:15:21.961
125	3	3	SEND_INVITATION	ORG	3	::1	2026-05-29 06:15:48.653
126	3	3	SEND_INVITATION	ORG	3	::1	2026-05-29 06:18:30.358
127	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-29 06:38:13.909
128	3	3	SEND_INVITATION	ORG	3	::1	2026-05-29 06:40:08.459
129	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-29 07:32:11.72
130	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-29 07:54:08.696
131	3	3	SEND_INVITATION	ORG	3	::1	2026-05-29 07:54:34.119
132	3	3	SEND_INVITATION	ORG	3	::1	2026-05-29 07:57:35.489
133	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-29 08:13:10.699
134	3	3	SEND_INVITATION	ORG	3	::1	2026-05-29 08:13:27.603
135	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-29 08:21:56.315
136	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-29 08:21:56.473
137	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-29 08:21:56.589
138	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-29 08:21:56.706
139	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-29 08:21:56.824
140	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-29 08:21:56.947
141	3	3	SEND_INVITATION	ORG	3	::1	2026-05-29 08:23:54.26
142	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-29 08:26:53.429
143	3	3	SEND_INVITATION	ORG	3	::ffff:127.0.0.1	2026-05-29 08:26:57.794
144	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-29 08:26:57.947
145	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-29 08:26:58.073
146	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-29 08:26:58.201
147	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-29 08:26:58.341
148	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-29 08:26:58.472
149	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-29 08:28:24.658
150	3	3	SEND_INVITATION	ORG	3	::ffff:127.0.0.1	2026-05-29 08:28:29.333
151	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-29 08:28:29.479
152	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-29 08:28:29.608
153	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-29 08:28:29.734
154	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-29 08:28:29.869
155	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-05-29 08:28:29.994
156	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-29 08:30:01.54
157	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-29 08:47:12.398
158	3	3	SEND_INVITATION	ORG	3	::1	2026-05-29 08:47:32.631
159	3	3	SEND_INVITATION	ORG	3	::1	2026-05-29 09:00:58.306
160	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-29 09:11:57.628
161	3	3	SEND_INVITATION	ORG	3	::1	2026-05-29 09:19:07.485
162	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-29 09:20:19.685
163	3	3	LOGOUT_CURRENT_SESSION	AUTH	3	::1	2026-05-29 09:34:42.073
164	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-05-29 09:36:50.994
165	3	3	SEND_INVITATION	ORG	3	::1	2026-05-29 09:37:18.261
166	3	3	LOGOUT_CURRENT_SESSION	AUTH	3	::1	2026-05-29 09:37:25.637
167	3	4	LOGIN_SUCCESS	AUTH	4	::1	2026-05-29 09:39:22.541
168	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-01 05:07:29.917
169	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-01 09:17:12.557
170	3	3	LOGIN_FAILED	AUTH	3	::1	2026-06-01 09:23:09.666
171	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-01 09:23:26.585
172	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-01 10:00:16.737
173	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-01 10:18:27.225
174	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-01 10:21:50.578
175	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-01 10:27:47.216
176	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-01 10:40:29.926
177	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-02 04:24:17.798
178	3	3	LOGIN_FAILED	AUTH	3	::1	2026-06-02 04:25:36.807
179	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-02 04:25:44.077
180	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-02 04:41:44.734
181	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-02 06:41:38.926
182	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-02 06:58:30.761
183	3	3	CREATE_DEPARTMENT	ORG	3	::1	2026-06-02 06:59:04.694
184	3	3	CREATE_DEPARTMENT	ORG	3	::1	2026-06-02 06:59:34.531
185	3	3	CREATE_DEPARTMENT	ORG	3	::1	2026-06-02 06:59:58.062
186	3	3	CREATE_DEPARTMENT	ORG	3	::1	2026-06-02 07:00:20.352
187	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-02 07:33:34.686
188	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-02 07:50:38.819
189	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-02 08:07:45.352
190	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-02 08:22:53.318
191	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-02 08:37:50.455
192	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-02 09:29:11.783
193	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-02 10:07:52.61
194	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-02 10:16:42.192
195	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-02 10:25:13.651
196	3	3	CREATE_LOCATION	ORG	3	::1	2026-06-02 10:31:41.28
197	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-03 04:28:17.884
198	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-03 04:29:41.018
199	3	3	LOGIN_FAILED	AUTH	3	::1	2026-06-03 04:33:03.814
200	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-03 04:33:10.219
201	2	2	LOGIN_SUCCESS	AUTH	2	::ffff:127.0.0.1	2026-06-03 04:47:18.918
202	3	3	LOGIN_FAILED	AUTH	3	::1	2026-06-03 04:49:54.25
203	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-03 04:50:00.071
204	2	2	LOGIN_FAILED	AUTH	2	::1	2026-06-03 04:57:05.479
205	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-03 05:03:24.862
206	2	2	LOGIN_SUCCESS	AUTH	2	::ffff:127.0.0.1	2026-06-03 05:04:15.368
207	2	2	LOGIN_SUCCESS	AUTH	2	::ffff:127.0.0.1	2026-06-03 05:04:15.568
208	2	2	LOGIN_FAILED	AUTH	2	::ffff:127.0.0.1	2026-06-03 05:04:15.735
209	2	2	LOGIN_FAILED	AUTH	2	::ffff:127.0.0.1	2026-06-03 05:04:15.794
210	2	2	LOGIN_FAILED	AUTH	2	::ffff:127.0.0.1	2026-06-03 05:04:15.852
211	2	2	LOGIN_FAILED	AUTH	2	::ffff:127.0.0.1	2026-06-03 05:04:15.909
212	2	2	LOGIN_FAILED	AUTH	2	::ffff:127.0.0.1	2026-06-03 05:04:15.966
213	2	2	LOGIN_FAILED	AUTH	2	::ffff:127.0.0.1	2026-06-03 05:06:02.662
214	2	2	LOGIN_FAILED	AUTH	2	::ffff:127.0.0.1	2026-06-03 05:06:02.862
215	2	2	LOGIN_FAILED	AUTH	2	::ffff:127.0.0.1	2026-06-03 05:06:02.973
216	2	2	LOGIN_FAILED	AUTH	2	::ffff:127.0.0.1	2026-06-03 05:06:03.084
217	2	2	LOGIN_FAILED	AUTH	2	::ffff:127.0.0.1	2026-06-03 05:06:03.179
218	2	2	LOGIN_FAILED	AUTH	2	::ffff:127.0.0.1	2026-06-03 05:06:03.282
219	2	2	LOGIN_FAILED	AUTH	2	::ffff:127.0.0.1	2026-06-03 05:06:03.372
220	3	3	LOGIN_FAILED	AUTH	3	::1	2026-06-03 05:06:06.355
221	2	2	LOGIN_SUCCESS	AUTH	2	::ffff:127.0.0.1	2026-06-03 05:07:03.774
222	2	2	LOGIN_SUCCESS	AUTH	2	::ffff:127.0.0.1	2026-06-03 05:07:03.974
223	2	2	LOGIN_SUCCESS	AUTH	2	::ffff:127.0.0.1	2026-06-03 05:07:04.188
224	2	2	LOGIN_SUCCESS	AUTH	2	::ffff:127.0.0.1	2026-06-03 05:07:04.3
225	2	2	LOGIN_SUCCESS	AUTH	2	::ffff:127.0.0.1	2026-06-03 05:07:04.411
226	2	2	LOGIN_SUCCESS	AUTH	2	::ffff:127.0.0.1	2026-06-03 05:07:04.522
227	2	2	LOGIN_SUCCESS	AUTH	2	::ffff:127.0.0.1	2026-06-03 05:07:04.638
228	3	3	LOGIN_FAILED	AUTH	3	::1	2026-06-03 05:18:06.169
229	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-03 05:18:11.894
230	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-03 05:51:29.663
231	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-03 06:00:48.126
232	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-03 08:07:40.44
233	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-03 08:22:51.156
234	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 08:33:08.384
235	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 08:33:08.609
236	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 08:33:08.728
237	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 08:33:08.845
238	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 08:33:08.971
239	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 08:35:48.91
240	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 08:35:49.266
241	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 08:35:49.4
242	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 08:35:49.557
243	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 08:35:49.698
244	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 08:36:33.87
245	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 08:36:34.677
246	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 08:36:34.966
247	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 08:36:35.29
248	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 08:36:35.676
249	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 08:37:03.513
250	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 08:37:03.774
251	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 08:37:03.91
252	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 08:37:04.052
253	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 08:37:04.194
254	3	4	LOGIN_SUCCESS	AUTH	4	::1	2026-06-03 10:32:01.565
255	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-03 10:50:07.767
256	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:06:47.553
257	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:06:48.155
258	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:06:48.352
259	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:06:48.556
260	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:06:48.786
261	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:06:49.285
262	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:06:49.649
263	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:06:49.895
264	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:06:50.158
265	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-03 11:27:10.785
266	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:35:48.716
267	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:35:48.898
268	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:35:49.017
269	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:35:49.131
270	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:35:49.249
271	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:35:49.473
272	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:35:49.658
273	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:35:49.768
274	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:35:49.877
275	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:35:50.056
276	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:35:50.229
277	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:35:50.34
278	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-03 11:35:50.456
279	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-04 05:04:25.117
280	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-04 05:21:11.317
281	2	2	LOGIN_SUCCESS	AUTH	2	::ffff:127.0.0.1	2026-06-04 05:31:00.98
282	2	2	LOGIN_SUCCESS	AUTH	2	::ffff:127.0.0.1	2026-06-04 05:31:01.299
283	2	2	LOGIN_SUCCESS	AUTH	2	::ffff:127.0.0.1	2026-06-04 05:31:01.431
284	2	2	LOGIN_SUCCESS	AUTH	2	::ffff:127.0.0.1	2026-06-04 05:31:01.673
285	2	2	LOGIN_SUCCESS	AUTH	2	::ffff:127.0.0.1	2026-06-04 05:31:01.8
286	2	2	LOGIN_SUCCESS	AUTH	2	::ffff:127.0.0.1	2026-06-04 05:31:01.936
287	2	2	LOGIN_SUCCESS	AUTH	2	::ffff:127.0.0.1	2026-06-04 05:31:02.07
288	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-04 08:12:07.735
289	3	3	DEACTIVATE_USER	USER	4	::1	2026-06-04 08:12:55.951
290	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-04 08:34:44.774
291	3	3	ACTIVATE_USER	USER	4	::1	2026-06-04 08:35:00.984
292	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-04 09:04:57.197
293	3	3	DEACTIVATE_USER	USER	4	::ffff:127.0.0.1	2026-06-04 09:04:57.338
294	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-04 09:04:57.493
295	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-04 09:04:57.613
296	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-04 09:04:57.738
297	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-04 09:04:58.115
298	3	3	ACTIVATE_USER	USER	4	::ffff:127.0.0.1	2026-06-04 09:04:58.309
299	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-04 09:04:58.43
300	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-04 09:04:58.616
301	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-04 09:05:52.877
302	3	3	DEACTIVATE_USER	USER	4	::ffff:127.0.0.1	2026-06-04 09:05:52.972
303	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-04 09:05:53.102
304	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-04 09:05:53.231
305	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-04 09:05:53.356
306	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-04 09:05:53.817
307	3	3	ACTIVATE_USER	USER	4	::ffff:127.0.0.1	2026-06-04 09:05:53.891
308	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-04 09:05:54.025
309	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-04 09:05:54.177
310	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-05 04:06:10.125
311	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-05 04:10:22.547
312	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-05 04:33:14.788
313	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-05 06:20:21.382
314	3	3	CREATE_EQUIPMENT_TYPE	EQUIPMENT	3	::1	2026-06-05 06:21:32.266
315	3	4	LOGIN_SUCCESS	AUTH	4	::1	2026-06-05 06:22:28.046
316	3	4	CREATE_EQUIPMENT_TYPE	EQUIPMENT	4	::1	2026-06-05 06:23:18.976
317	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-05 06:24:57.393
318	3	3	UPDATE_USER_ROLE	USER	4	::1	2026-06-05 06:25:09.733
319	3	4	LOGIN_SUCCESS	AUTH	4	::1	2026-06-05 06:25:45.716
320	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-05 06:48:21.192
321	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 06:52:08.429
322	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 06:52:08.589
323	3	4	LOGIN_SUCCESS	AUTH	4	::ffff:127.0.0.1	2026-06-05 06:52:08.716
324	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 06:52:08.848
325	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 06:52:08.968
326	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 06:52:09.096
327	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 06:56:02.191
328	3	3	CREATE_EQUIPMENT_TYPE	EQUIPMENT	3	::ffff:127.0.0.1	2026-06-05 06:56:02.274
329	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 06:56:02.406
330	3	4	LOGIN_SUCCESS	AUTH	4	::ffff:127.0.0.1	2026-06-05 06:56:02.659
331	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 06:56:02.805
332	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 06:56:02.923
333	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 06:56:03.036
334	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-05 08:43:31.235
335	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 08:54:06.184
336	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 08:54:06.581
337	3	4	LOGIN_SUCCESS	AUTH	4	::ffff:127.0.0.1	2026-06-05 08:54:06.741
338	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 08:54:06.889
339	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 08:54:07.042
340	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 08:54:07.155
341	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 08:54:07.374
342	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 09:01:34.158
343	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 09:01:34.42
344	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-05 09:02:42.827
345	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 09:03:26.343
346	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 09:03:26.696
347	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-05 09:12:59.956
348	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 09:19:24.663
349	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 09:19:24.881
350	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 09:19:25.102
351	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-05 09:19:25.281
352	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-05 09:25:01.671
353	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-05 09:32:56.032
354	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-06 04:31:15.021
355	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-06 04:54:13.207
356	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:02:11.01
357	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:02:11.414
358	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:02:11.699
359	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:02:11.931
360	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:02:12.224
361	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:02:34.197
362	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:02:34.517
363	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:02:34.729
364	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:02:34.943
365	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:02:35.439
366	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:03:36.985
367	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:03:37.421
368	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:03:37.66
369	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:03:37.932
370	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:03:38.262
371	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-06 05:09:02.56
372	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:22:29.573
373	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:22:29.964
374	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:22:30.385
375	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:22:30.671
376	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:22:30.958
377	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:22:31.496
378	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:22:31.884
379	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:22:32.05
380	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:22:32.228
381	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:22:32.377
382	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:22:32.541
383	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 05:22:32.763
384	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-06 05:48:36.284
385	3	3	DEACTIVATE_EQUIPMENT_TYPE	EQUIPMENT	3	::1	2026-06-06 05:48:51.983
386	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-06 05:58:23.293
387	3	3	DEACTIVATE_EQUIPMENT_TYPE	EQUIPMENT	3	::1	2026-06-06 05:59:06.329
388	3	3	ACTIVATE_EQUIPMENT_TYPE	EQUIPMENT	3	::1	2026-06-06 05:59:15.916
389	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:14:05.33
390	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:14:05.541
391	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:14:05.754
392	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:14:05.93
393	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:14:06.156
394	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:14:06.456
395	3	3	UPDATE_EQUIPMENT_TYPE	EQUIPMENT	3	::ffff:127.0.0.1	2026-06-06 06:14:06.517
396	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:14:06.656
397	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:14:06.768
398	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:14:06.879
399	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:14:06.989
400	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:14:07.1
401	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:14:07.209
402	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:14:07.534
403	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:14:07.671
404	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:14:07.781
405	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:14:07.996
406	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:14:08.135
407	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:14:08.255
408	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:15:29.742
409	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:15:30.161
410	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:15:30.382
411	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:15:30.56
412	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:15:30.838
413	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:15:31.144
414	3	3	UPDATE_EQUIPMENT_TYPE	EQUIPMENT	3	::ffff:127.0.0.1	2026-06-06 06:15:31.206
415	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:15:31.323
416	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:15:31.446
417	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:15:31.579
418	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:15:31.698
419	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:15:31.812
420	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:15:31.923
421	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:15:32.252
422	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:15:32.503
423	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:15:32.628
424	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:15:32.855
425	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:15:33.007
426	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:15:33.129
427	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:17:31.676
428	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:17:31.921
429	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:17:32.114
430	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:17:32.307
431	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:17:32.55
432	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:17:32.978
433	3	3	UPDATE_EQUIPMENT_TYPE	EQUIPMENT	3	::ffff:127.0.0.1	2026-06-06 06:17:33.041
434	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:17:33.154
435	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:17:33.267
436	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:17:33.385
437	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:17:33.511
438	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:17:33.64
439	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:17:33.751
440	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:17:34.032
441	3	3	DEACTIVATE_EQUIPMENT_TYPE	EQUIPMENT	3	::ffff:127.0.0.1	2026-06-06 06:17:34.102
442	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:17:34.22
443	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:17:34.336
444	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:17:34.54
445	3	3	ACTIVATE_EQUIPMENT_TYPE	EQUIPMENT	3	::ffff:127.0.0.1	2026-06-06 06:17:34.607
446	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:17:34.721
447	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 06:17:34.833
448	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-06 10:07:51.519
449	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-06 10:22:57.418
450	3	3	CREATE_EQUIPMENT	EQUIPMENT	3	::1	2026-06-06 10:23:48.304
451	3	3	CREATE_EQUIPMENT	EQUIPMENT	3	::1	2026-06-06 10:25:45.735
452	3	3	CREATE_EQUIPMENT	EQUIPMENT	3	::1	2026-06-06 10:26:22.409
453	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-06 10:52:31.565
454	3	3	CREATE_EQUIPMENT	EQUIPMENT	3	::1	2026-06-06 10:52:54.123
455	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:05:34.924
456	3	3	CREATE_EQUIPMENT	EQUIPMENT	3	::ffff:127.0.0.1	2026-06-06 11:05:35.111
457	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:05:35.265
458	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:05:35.389
459	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:05:35.512
460	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:05:35.637
461	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:05:35.765
462	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:05:35.915
463	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:05:36.045
464	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:05:36.177
465	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:05:36.29
466	3	3	CREATE_EQUIPMENT	EQUIPMENT	3	::ffff:127.0.0.1	2026-06-06 11:05:36.297
467	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-06 11:10:14.314
468	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:13:39.99
469	3	3	CREATE_EQUIPMENT	EQUIPMENT	3	::ffff:127.0.0.1	2026-06-06 11:13:40.191
470	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:13:40.328
471	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:13:40.445
472	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:13:40.564
473	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:13:40.678
474	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:13:40.795
475	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:13:40.908
476	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:13:41.024
477	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:13:41.141
478	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:13:41.259
479	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:14:31.235
480	3	3	CREATE_EQUIPMENT	EQUIPMENT	3	::ffff:127.0.0.1	2026-06-06 11:14:31.312
481	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:14:31.468
482	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:14:31.614
483	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:14:31.737
484	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:14:31.986
485	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:14:32.267
486	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:14:32.386
487	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:14:32.504
488	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:14:32.63
489	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-06 11:14:32.744
490	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-09 04:07:03.41
491	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-09 04:26:17.142
492	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-09 04:41:57.064
493	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-09 04:52:31.157
494	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-09 05:14:21.966
495	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-09 05:29:30.43
496	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-09 06:19:34.932
497	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::1	2026-06-09 06:20:18.113
498	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::1	2026-06-09 06:21:40.391
499	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::1	2026-06-09 06:22:18.289
500	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::1	2026-06-09 06:22:33.852
501	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::1	2026-06-09 06:22:55.083
502	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::1	2026-06-09 06:25:45.302
503	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::1	2026-06-09 06:31:32.844
504	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::1	2026-06-09 06:33:09.382
505	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::1	2026-06-09 06:33:53.245
506	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-09 07:05:05.361
507	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::1	2026-06-09 07:07:28.126
508	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::1	2026-06-09 07:07:54.308
509	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::1	2026-06-09 07:08:01.939
510	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::1	2026-06-09 07:08:34.928
511	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::1	2026-06-09 07:09:10.136
512	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::1	2026-06-09 07:09:33.773
513	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 07:27:06.378
514	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::ffff:127.0.0.1	2026-06-09 07:27:06.483
515	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 07:27:06.629
516	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::ffff:127.0.0.1	2026-06-09 07:27:06.639
517	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 07:27:06.76
518	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::ffff:127.0.0.1	2026-06-09 07:27:06.886
519	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 07:27:07.023
520	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::ffff:127.0.0.1	2026-06-09 07:27:07.031
521	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 07:27:07.164
522	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 07:27:07.32
523	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 07:27:07.498
524	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 07:27:07.657
525	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 07:27:07.813
526	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 07:28:35.639
527	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::ffff:127.0.0.1	2026-06-09 07:28:35.769
528	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 07:28:35.927
529	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::ffff:127.0.0.1	2026-06-09 07:28:35.936
530	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 07:28:36.052
531	3	3	UPDATE_EQUIPMENT	EQUIPMENT	3	::ffff:127.0.0.1	2026-06-09 07:28:36.116
532	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 07:28:36.238
533	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 07:28:36.503
534	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 07:28:36.664
535	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 07:28:36.785
536	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 07:28:36.909
537	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 07:28:37.027
538	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-09 07:46:27.484
539	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-09 08:28:04.771
540	3	3	DEACTIVATE_EQUIPMENT	EQUIPMENT	3	::1	2026-06-09 08:28:55.237
541	3	3	ACTIVATE_EQUIPMENT	EQUIPMENT	3	::1	2026-06-09 08:41:49.997
542	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 08:50:14.018
543	3	3	DEACTIVATE_EQUIPMENT	EQUIPMENT	3	::ffff:127.0.0.1	2026-06-09 08:50:14.231
544	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 08:50:14.361
545	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 08:50:14.476
546	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 08:50:14.725
547	3	3	ACTIVATE_EQUIPMENT	EQUIPMENT	3	::ffff:127.0.0.1	2026-06-09 08:50:14.808
548	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 08:50:14.921
549	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-09 08:50:15.033
550	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-09 08:52:30.001
551	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-09 09:07:34.662
552	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-11 06:11:05.202
553	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-11 06:17:41.37
554	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-11 06:18:58.002
555	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-11 06:21:07.373
556	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-11 06:23:04.89
557	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-11 06:23:27.499
558	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-11 06:25:17.216
559	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-11 06:26:19.984
560	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-11 06:36:54.996
561	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-11 06:41:28.055
562	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-11 07:31:22.837
563	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-11 07:42:57.702
564	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-11 07:43:13.821
565	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-11 07:48:22.296
566	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-11 07:49:02.472
567	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-11 07:54:27.737
568	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:41:13.135
569	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:41:13.39
570	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:41:13.844
571	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:41:14.017
572	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:41:14.145
573	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:41:14.279
574	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:41:14.552
575	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:41:14.735
576	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:41:14.88
577	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:41:15.025
578	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:41:15.447
579	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:41:15.62
580	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:41:15.768
581	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:42:01.83
582	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:42:02.088
583	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:42:02.342
584	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:42:02.699
585	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:42:02.814
586	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:42:02.944
587	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:42:03.081
588	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:42:03.259
589	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:42:03.709
590	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:42:03.839
591	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:42:03.999
592	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:42:04.155
593	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:42:04.319
594	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:42:04.583
595	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:42:04.755
596	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:42:04.941
597	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:42:05.065
598	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:44:09.472
599	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:44:09.626
600	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:44:09.79
601	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:44:10.122
602	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:44:10.219
603	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:44:10.356
604	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:44:10.481
605	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:44:10.6
606	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:44:10.885
607	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:44:10.994
608	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:44:11.119
609	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:44:11.262
610	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:44:11.39
611	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:44:11.682
612	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:44:11.764
613	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:44:11.931
614	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:44:12.057
615	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:47:02.578
616	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:47:02.754
617	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:47:02.894
618	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:47:03.218
619	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:47:03.319
620	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:47:03.442
621	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:47:03.658
622	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:47:03.78
623	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:47:04.183
624	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:47:04.287
625	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:47:04.433
626	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:47:04.56
627	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:47:04.686
628	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:47:04.9
629	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:47:05.181
630	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:47:05.341
631	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:47:05.466
632	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:48:36.493
633	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:48:36.636
634	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:48:36.797
635	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:48:37.17
636	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:48:37.464
637	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:48:37.633
638	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:48:37.766
639	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:48:37.898
640	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:48:38.296
641	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:48:38.427
642	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:48:38.58
643	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:48:38.712
644	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:48:38.841
645	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:48:39.085
646	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:48:39.393
647	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:48:39.532
648	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:48:39.656
649	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:13.195
650	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:49:13.322
651	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:13.46
652	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:13.719
653	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:49:13.798
654	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:13.936
655	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:14.074
656	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:14.197
657	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:14.578
658	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:49:14.944
659	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:15.069
660	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:15.199
661	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:15.317
662	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:15.534
663	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:49:15.67
664	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:15.791
665	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:15.916
666	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:43.355
667	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:49:43.712
668	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:43.845
669	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:44.201
670	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:49:44.312
671	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:44.528
672	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:44.74
673	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:44.86
674	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:45.188
675	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:49:45.507
676	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:45.63
677	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:45.761
678	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:45.888
679	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:46.138
680	3	3	CREATE_CHECKLIST	CHECKLIST	3	::ffff:127.0.0.1	2026-06-11 08:49:46.379
681	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:46.523
682	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-11 08:49:46.652
683	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-12 07:52:52.247
684	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-12 07:54:59.63
685	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-12 08:36:37.699
686	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-12 08:39:22.064
687	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-12 08:40:18.315
688	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-12 08:47:33.67
689	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-12 09:00:52.787
690	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-12 09:14:46.712
691	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-12 09:15:23.081
692	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-12 09:15:58.708
693	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-12 09:28:37.95
694	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-12 09:41:37.695
695	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-12 10:33:04.753
696	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-13 05:56:27.365
697	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-13 05:57:20.695
698	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-13 05:58:20.328
699	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-13 06:47:57.618
700	3	3	UPDATE_CHECKLIST	CHECKLIST	3	::1	2026-06-13 06:50:32.213
701	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-13 07:57:49.921
702	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-13 08:13:29.882
703	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-13 08:31:54.121
704	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-13 08:57:40.308
705	3	3	UPDATE_CHECKLIST	CHECKLIST	3	::1	2026-06-13 09:03:16.772
706	3	3	DEACTIVATE_CHECKLIST	CHECKLIST	45	::1	2026-06-13 09:04:17.885
707	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-13 12:00:14.988
708	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-13 12:35:54.419
709	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-13 13:06:09.739
710	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-13 13:11:17.235
711	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-13 13:12:06.769
712	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-13 13:13:39.982
713	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-13 13:14:57.099
714	3	3	UPDATE_CHECKLIST	CHECKLIST	3	::1	2026-06-13 13:16:11.603
715	3	3	UPDATE_CHECKLIST	CHECKLIST	3	::1	2026-06-13 13:17:24.684
716	3	3	UPDATE_CHECKLIST	CHECKLIST	3	::1	2026-06-13 13:19:00.623
717	3	3	UPDATE_CHECKLIST	CHECKLIST	3	::1	2026-06-13 13:19:18.627
718	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-14 05:14:08.294
719	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-15 04:17:24.682
720	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-15 04:42:41.08
721	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-15 07:21:44.004
722	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-15 07:40:35.795
723	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-15 07:55:53.25
724	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-15 08:08:56.827
725	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-15 08:09:27.419
726	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-15 08:20:25.898
727	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-15 08:29:30.857
728	3	3	CREATE_PMSCHEDULE	PM	3	::ffff:127.0.0.1	2026-06-15 08:29:31.076
729	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-15 08:29:31.199
730	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-15 08:29:31.337
731	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-15 08:29:31.483
732	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-15 08:29:31.624
733	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-15 08:29:31.784
734	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-15 08:29:31.961
735	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-15 08:29:32.088
736	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-06-15 08:35:45.721
737	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-06-15 09:00:15.682
738	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-15 09:00:56.923
739	3	3	CREATE_PMSCHEDULE	PM	3	::1	2026-06-15 09:01:28.853
740	3	3	CREATE_PMSCHEDULE	PM	3	::1	2026-06-15 09:01:44.151
741	3	3	CREATE_PMSCHEDULE	PM	3	::1	2026-06-15 09:01:52.605
742	3	3	CREATE_PMSCHEDULE	PM	3	::1	2026-06-15 09:02:12.34
743	3	3	CREATE_PMSCHEDULE	PM	3	::1	2026-06-15 09:02:52.659
744	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-15 09:16:47.942
745	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-16 04:39:26.371
746	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-16 04:51:07.206
747	3	3	UPDATE_PMSCHEDULE	PM	1	::1	2026-06-16 04:52:15.502
748	3	3	UPDATE_PMSCHEDULE	PM	2	::1	2026-06-16 04:53:47.909
749	3	3	UPDATE_PMSCHEDULE	PM	2	::1	2026-06-16 04:56:34.26
750	3	3	UPDATE_PMSCHEDULE	PM	2	::1	2026-06-16 04:59:20.663
751	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-16 05:48:16.365
752	3	3	UPDATE_PMSCHEDULE	PM	1	::1	2026-06-16 05:49:03.973
753	3	3	UPDATE_PMSCHEDULE	PM	1	::1	2026-06-16 05:55:32.199
754	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-16 05:57:06.475
755	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-16 05:57:06.764
756	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-16 05:57:06.926
757	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-16 05:57:07.057
758	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-16 05:58:48.561
759	3	3	UPDATE_PMSCHEDULE	PM	3	::ffff:127.0.0.1	2026-06-16 05:58:48.668
760	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-16 05:58:48.834
761	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-16 05:58:48.979
762	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-16 05:58:49.108
763	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-16 06:30:11.929
764	3	3	DEACTIVATE_PMSCHEDULE	PM	1	::1	2026-06-16 06:30:33.567
765	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-16 06:33:12.728
766	3	3	DEACTIVATE_PMSCHEDULE	PM	1	::1	2026-06-16 06:33:40.447
767	3	3	DEACTIVATE_PMSCHEDULE	PM	3	::1	2026-06-16 06:33:57.934
768	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-16 08:00:01.343
769	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-16 08:14:57.262
770	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-16 09:04:11.269
771	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-24 04:42:57.903
772	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-24 10:16:56.533
773	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-24 10:48:22.151
774	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-24 11:06:08.825
775	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-24 11:29:30.658
776	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-24 14:22:59.583
777	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-24 14:38:42.219
778	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-25 13:50:59.225
779	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-25 14:07:27.995
780	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-25 14:28:45.708
781	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-25 14:29:01.453
782	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-25 15:31:00.795
783	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-26 14:59:47.842
784	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-26 15:23:45.519
785	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-26 15:30:12.073
786	3	3	CREATE_CHECKLIST	CHECKLIST	3	::1	2026-06-26 15:30:42.015
787	3	3	CREATE_PMSCHEDULE	PM	3	::1	2026-06-26 15:32:19.881
788	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-26 15:40:52.272
789	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-26 15:59:48.263
790	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-27 12:38:20.349
791	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-27 12:57:45.312
792	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-06-27 12:58:29.537
793	3	10	COMPLETE_PMTASK	PM	24	::1	2026-06-27 12:59:27.721
794	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-06-28 12:47:38.485
795	3	10	CREATE_BREAKDOWN	BREAKDOWN	10	::1	2026-06-28 12:55:42.328
796	3	10	CREATE_BREAKDOWN	BREAKDOWN	10	::1	2026-06-28 12:59:17.263
797	3	10	CREATE_BREAKDOWN	BREAKDOWN	10	::1	2026-06-28 13:00:14.222
798	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-06-28 13:54:45.69
799	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-28 13:55:17.453
800	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-28 14:06:16.204
801	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-28 15:39:53.392
802	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-28 15:42:39.36
803	3	3	CREATE_BREAKDOWN	BREAKDOWN	3	::ffff:127.0.0.1	2026-06-28 15:42:39.51
804	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-28 15:42:39.71
805	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-28 15:42:39.894
806	3	3	UPDATE_BREAKDOWN	BREAKDOWN	1	::1	2026-06-29 05:13:40.033
807	3	3	UPDATE_BREAKDOWN	BREAKDOWN	1	::1	2026-06-29 05:15:33.116
808	3	3	UPDATE_BREAKDOWN	BREAKDOWN	1	::1	2026-06-29 05:16:22.845
809	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-29 05:31:03.637
810	3	3	UPDATE_BREAKDOWN	BREAKDOWN	4	::ffff:127.0.0.1	2026-06-29 05:31:04.122
811	3	3	LOGIN_SUCCESS	AUTH	3	::ffff:127.0.0.1	2026-06-29 05:31:04.716
812	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-29 07:19:28.366
813	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-06-29 07:21:30.925
814	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-06-29 07:23:02.839
815	3	8	LOGIN_SUCCESS	AUTH	8	::1	2026-06-29 07:32:05.646
816	3	8	ASSIGN_TECHNICIAN	BREAKDOWN	4	::1	2026-06-29 07:33:41.2
817	3	8	LOGIN_SUCCESS	AUTH	8	::ffff:127.0.0.1	2026-06-29 07:57:16.462
818	3	8	ASSIGN_TECHNICIAN	BREAKDOWN	1	::ffff:127.0.0.1	2026-06-29 07:57:16.688
819	3	8	LOGIN_SUCCESS	AUTH	8	::ffff:127.0.0.1	2026-06-29 07:57:16.888
820	3	8	LOGIN_SUCCESS	AUTH	8	::ffff:127.0.0.1	2026-06-29 07:57:17.076
821	3	8	LOGIN_SUCCESS	AUTH	8	::ffff:127.0.0.1	2026-06-29 07:57:17.252
822	3	8	LOGIN_SUCCESS	AUTH	8	::ffff:127.0.0.1	2026-06-29 07:57:17.409
823	3	8	LOGIN_SUCCESS	AUTH	8	::ffff:127.0.0.1	2026-06-29 08:00:02.039
824	3	8	ASSIGN_TECHNICIAN	BREAKDOWN	2	::ffff:127.0.0.1	2026-06-29 08:00:02.283
825	3	8	LOGIN_SUCCESS	AUTH	8	::ffff:127.0.0.1	2026-06-29 08:00:02.457
826	3	8	LOGIN_SUCCESS	AUTH	8	::ffff:127.0.0.1	2026-06-29 08:00:02.61
827	3	8	LOGIN_SUCCESS	AUTH	8	::ffff:127.0.0.1	2026-06-29 08:00:02.816
828	3	8	LOGIN_SUCCESS	AUTH	8	::ffff:127.0.0.1	2026-06-29 08:00:02.966
829	3	8	LOGIN_SUCCESS	AUTH	8	::1	2026-06-29 08:29:43.411
830	3	8	ASSIGN_TECHNICIAN	BREAKDOWN	3	::1	2026-06-29 08:30:05.805
831	3	8	LOGIN_SUCCESS	AUTH	8	::1	2026-06-30 14:57:55.199
832	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-06-30 14:58:08.765
833	3	8	LOGIN_SUCCESS	AUTH	8	::1	2026-06-30 14:59:16.614
834	3	10	CREATE_BREAKDOWN_REPORT	BREAKDOWN	10	::1	2026-06-30 15:00:20.297
835	3	8	ASSIGN_TECHNICIAN_REPORT	BREAKDOWN	5	::1	2026-06-30 15:01:09.506
836	3	10	CREATE_BREAKDOWN_ACTION	BREAKDOWN	5	::1	2026-06-30 15:01:29.842
837	3	10	CREATE_BREAKDOWN_ACTION	BREAKDOWN	5	::1	2026-06-30 15:01:43.184
838	3	10	CREATE_BREAKDOWN_ACTION	BREAKDOWN	5	::1	2026-06-30 15:01:49.839
839	3	10	CREATE_BREAKDOWN_ACTION	BREAKDOWN	5	::1	2026-06-30 15:02:52.771
840	3	10	CREATE_BREAKDOWN_ACTION	BREAKDOWN	5	::1	2026-06-30 15:03:26.476
841	3	10	CREATE_BREAKDOWN_ACTION	BREAKDOWN	5	::1	2026-06-30 15:04:20.559
842	3	8	LOGIN_SUCCESS	AUTH	8	::1	2026-06-30 15:17:15.293
843	3	8	LOGIN_SUCCESS	AUTH	8	::1	2026-06-30 15:18:32.014
844	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-06-30 15:20:08.238
845	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-06-30 15:45:28.263
846	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-01 14:24:26.62
847	3	10	CREATE_BREAKDOWN_ACTION	BREAKDOWN	1	::1	2026-07-01 14:32:54.337
848	3	10	RESOLVE_BREAKDOWN_REPORT	BREAKDOWN	1	::1	2026-07-01 14:33:00.494
849	3	14	LOGIN_SUCCESS	AUTH	14	::1	2026-07-01 14:34:13.183
850	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-01 15:54:55.172
851	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:13:41.105
852	3	10	CREATE_BREAKDOWN_ACTION	BREAKDOWN	2	::ffff:127.0.0.1	2026-07-01 16:13:41.222
853	3	14	LOGIN_SUCCESS	AUTH	14	::ffff:127.0.0.1	2026-07-01 16:13:41.429
854	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:13:41.618
855	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:13:41.805
856	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:13:42.138
857	3	14	LOGIN_SUCCESS	AUTH	14	::ffff:127.0.0.1	2026-07-01 16:13:42.4
858	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:13:42.585
859	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:13:42.756
860	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:13:42.898
861	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:13:43.12
862	3	14	LOGIN_SUCCESS	AUTH	14	::ffff:127.0.0.1	2026-07-01 16:13:43.507
863	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:13:43.674
864	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:13:43.875
865	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:13:44.091
866	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:24:33.569
867	3	10	CREATE_BREAKDOWN_ACTION	BREAKDOWN	2	::ffff:127.0.0.1	2026-07-01 16:24:33.782
868	3	14	LOGIN_SUCCESS	AUTH	14	::ffff:127.0.0.1	2026-07-01 16:24:34.19
869	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:24:34.612
870	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:24:34.98
871	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:24:35.818
872	3	14	LOGIN_SUCCESS	AUTH	14	::ffff:127.0.0.1	2026-07-01 16:24:36.35
873	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:24:36.728
874	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:24:37.101
875	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:24:37.469
876	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:24:38.268
877	3	14	LOGIN_SUCCESS	AUTH	14	::ffff:127.0.0.1	2026-07-01 16:24:38.751
878	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:24:39.124
879	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:24:39.472
880	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:24:39.837
881	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:30:18.536
882	3	10	CREATE_BREAKDOWN_ACTION	BREAKDOWN	2	::ffff:127.0.0.1	2026-07-01 16:30:18.656
883	3	14	LOGIN_SUCCESS	AUTH	14	::ffff:127.0.0.1	2026-07-01 16:30:18.848
884	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:30:19.042
885	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:30:19.227
886	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:30:19.585
887	3	14	LOGIN_SUCCESS	AUTH	14	::ffff:127.0.0.1	2026-07-01 16:30:19.869
888	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:30:20.071
889	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:30:20.289
890	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:30:20.49
891	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:30:20.837
892	3	14	LOGIN_SUCCESS	AUTH	14	::ffff:127.0.0.1	2026-07-01 16:30:21.13
893	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:30:21.337
894	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:30:21.509
895	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:30:21.672
896	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:32:22.638
897	3	10	CREATE_BREAKDOWN_ACTION	BREAKDOWN	2	::ffff:127.0.0.1	2026-07-01 16:32:22.886
898	3	14	LOGIN_SUCCESS	AUTH	14	::ffff:127.0.0.1	2026-07-01 16:32:23.075
899	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:32:23.298
900	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:32:23.509
901	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:32:23.863
902	3	14	LOGIN_SUCCESS	AUTH	14	::ffff:127.0.0.1	2026-07-01 16:32:24.128
903	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:32:24.332
904	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:32:24.576
905	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:32:24.786
906	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:32:25.129
907	3	14	LOGIN_SUCCESS	AUTH	14	::ffff:127.0.0.1	2026-07-01 16:32:25.394
908	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:32:25.605
909	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:32:25.813
910	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:32:26.016
911	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:33:03.169
912	3	10	CREATE_BREAKDOWN_ACTION	BREAKDOWN	2	::ffff:127.0.0.1	2026-07-01 16:33:03.275
913	3	14	LOGIN_SUCCESS	AUTH	14	::ffff:127.0.0.1	2026-07-01 16:33:03.445
914	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:33:03.627
915	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:33:03.833
916	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:33:04.227
917	3	14	LOGIN_SUCCESS	AUTH	14	::ffff:127.0.0.1	2026-07-01 16:33:04.641
918	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:33:04.831
919	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:33:05.032
920	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:33:05.213
921	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:33:05.546
922	3	14	LOGIN_SUCCESS	AUTH	14	::ffff:127.0.0.1	2026-07-01 16:33:05.814
923	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:33:06.058
924	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:33:06.294
925	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:33:06.46
926	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:43:23.759
927	3	10	RESOLVE_BREAKDOWN_REPORT	BREAKDOWN	2	::ffff:127.0.0.1	2026-07-01 16:43:23.895
928	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:43:24.109
929	3	10	LOGIN_SUCCESS	AUTH	10	::ffff:127.0.0.1	2026-07-01 16:43:24.321
930	3	14	LOGIN_SUCCESS	AUTH	14	::ffff:127.0.0.1	2026-07-01 16:43:24.524
931	3	8	LOGIN_SUCCESS	AUTH	8	::ffff:127.0.0.1	2026-07-01 17:22:11.667
932	3	8	CLOSE_BREAKDOWN_REPORT	BREAKDOWN	2	::ffff:127.0.0.1	2026-07-01 17:22:11.785
933	3	8	LOGIN_SUCCESS	AUTH	8	::ffff:127.0.0.1	2026-07-01 17:22:11.948
934	3	8	LOGIN_SUCCESS	AUTH	8	::ffff:127.0.0.1	2026-07-01 17:22:12.118
935	3	8	CLOSE_BREAKDOWN_REPORT	BREAKDOWN	1	::ffff:127.0.0.1	2026-07-01 17:22:12.127
936	3	8	LOGIN_SUCCESS	AUTH	8	::ffff:127.0.0.1	2026-07-01 17:22:40.875
937	3	8	LOGIN_SUCCESS	AUTH	8	::ffff:127.0.0.1	2026-07-01 17:22:41.181
938	3	8	LOGIN_SUCCESS	AUTH	8	::ffff:127.0.0.1	2026-07-01 17:22:41.348
939	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-01 17:23:59.698
940	3	10	RESOLVE_BREAKDOWN_REPORT	BREAKDOWN	5	::1	2026-07-01 17:24:22.353
941	3	8	LOGIN_SUCCESS	AUTH	8	::1	2026-07-01 17:25:07.639
942	3	8	CLOSE_BREAKDOWN_REPORT	BREAKDOWN	5	::1	2026-07-01 17:25:23.649
943	3	8	LOGIN_SUCCESS	AUTH	8	::1	2026-07-03 10:33:08.8
944	3	8	CREATE_BREAKDOWN_REPORT	BREAKDOWN	6	::1	2026-07-03 10:38:20.94
945	3	8	LOGIN_SUCCESS	AUTH	8	::1	2026-07-03 10:43:43.663
946	3	8	ASSIGN_TECHNICIAN_REPORT	BREAKDOWN	6	::1	2026-07-03 10:44:08.384
947	3	8	CREATE_PMSCHEDULE	PM	8	::1	2026-07-03 10:44:38.084
948	3	8	CREATE_PMSCHEDULE	PM	9	::1	2026-07-03 10:44:45.816
949	3	8	CREATE_PMSCHEDULE	PM	10	::1	2026-07-03 10:44:52.227
950	3	8	CREATE_PMSCHEDULE	PM	11	::1	2026-07-03 10:44:56.241
951	3	8	CREATE_PMSCHEDULE	PM	12	::1	2026-07-03 10:46:53.895
952	3	8	CREATE_PMSCHEDULE	PM	13	::1	2026-07-03 10:50:02.574
953	3	8	CREATE_PMSCHEDULE	PM	14	::1	2026-07-03 10:50:21.225
954	3	8	CREATE_PMSCHEDULE	PM	15	::1	2026-07-03 10:50:27.569
955	3	8	CREATE_PMSCHEDULE	PM	16	::1	2026-07-03 10:50:32.384
956	3	8	LOGIN_SUCCESS	AUTH	8	::1	2026-07-03 10:51:11.092
957	3	8	CREATE_BREAKDOWN_REPORT	BREAKDOWN	7	::1	2026-07-03 10:51:25.756
958	3	8	CREATE_BREAKDOWN_REPORT	BREAKDOWN	8	::1	2026-07-03 10:51:27.745
959	3	8	CREATE_BREAKDOWN_REPORT	BREAKDOWN	9	::1	2026-07-03 10:51:29.414
960	3	8	ASSIGN_TECHNICIAN_REPORT	BREAKDOWN	7	::1	2026-07-03 10:51:52.668
961	3	8	ASSIGN_TECHNICIAN_REPORT	BREAKDOWN	8	::1	2026-07-03 10:52:00.486
962	3	8	ASSIGN_TECHNICIAN_REPORT	BREAKDOWN	9	::1	2026-07-03 10:52:08.352
963	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-03 11:21:36.12
964	3	14	LOGIN_SUCCESS	AUTH	14	::1	2026-07-03 11:27:30.742
965	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-03 11:28:42.342
966	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-03 15:11:36.034
967	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-03 15:27:27.57
968	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-03 15:54:39.042
969	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-03 15:56:22.062
970	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-03 16:07:04.446
971	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-03 16:29:19.422
972	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-03 16:29:56.789
973	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-03 16:33:05.242
974	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-04 04:33:52.263
975	3	14	LOGIN_SUCCESS	AUTH	14	::1	2026-07-04 04:38:15.311
976	3	14	LOGIN_SUCCESS	AUTH	14	::1	2026-07-04 04:47:51.767
977	3	14	LOGIN_SUCCESS	AUTH	14	::1	2026-07-04 05:41:43.589
978	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-04 05:43:54.617
979	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-06 04:21:32.741
980	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-06 09:29:54.101
981	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-17 09:19:37.462
982	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-17 11:23:35.652
983	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-17 11:24:10.255
984	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-17 11:44:57.98
985	3	3	LOGIN_FAILED	AUTH	3	::1	2026-07-20 06:26:46.192
986	3	3	LOGIN_FAILED	AUTH	3	::1	2026-07-20 06:26:52.157
987	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-20 06:27:14.171
988	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-20 06:34:02.896
989	3	3	LOGIN_FAILED	AUTH	3	::1	2026-07-20 07:40:21.523
990	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-20 07:43:04.978
991	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-20 07:49:49.916
992	3	3	LOGIN_FAILED	AUTH	3	::1	2026-07-20 08:10:26.515
993	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-20 08:10:34.534
994	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-20 08:19:49.329
995	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-20 08:28:25.887
996	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-20 08:29:42.894
997	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-20 09:08:09.522
998	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-20 09:27:12.307
999	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-20 10:32:00.226
1000	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-20 10:33:03.495
1001	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-20 10:33:38.386
1002	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-20 10:38:37.104
1003	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-20 10:55:38.691
1004	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-21 04:36:48.071
1005	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-21 04:48:58.259
1006	2	2	FORGOT_PASSWORD	AUTH	2	::1	2026-07-21 09:45:34.664
1007	2	2	FORGOT_PASSWORD	AUTH	2	::1	2026-07-21 10:11:17.611
1008	2	2	FORGOT_PASSWORD	AUTH	2	::1	2026-07-21 11:00:56.613
1009	2	2	FORGOT_PASSWORD	AUTH	2	::1	2026-07-21 11:17:51.297
1010	2	2	FORGOT_PASSWORD	AUTH	2	::1	2026-07-21 11:18:37.482
1011	2	2	FORGOT_PASSWORD	AUTH	2	::1	2026-07-21 11:34:24.196
1012	2	2	FORGOT_PASSWORD	AUTH	2	::1	2026-07-21 11:35:05.107
1013	2	2	FORGOT_PASSWORD	AUTH	2	::1	2026-07-21 11:35:41.277
1014	2	2	FORGOT_PASSWORD	AUTH	2	::1	2026-07-21 11:37:00.874
1015	2	2	FORGOT_PASSWORD	AUTH	2	::1	2026-07-21 11:37:17.543
1016	2	2	FORGOT_PASSWORD	AUTH	2	::1	2026-07-21 11:44:15.855
1017	2	2	FORGOT_PASSWORD	AUTH	2	::1	2026-07-21 11:44:21.586
1018	2	2	FORGOT_PASSWORD	AUTH	2	::1	2026-07-21 11:45:35.33
1019	2	2	FORGOT_PASSWORD	AUTH	2	::1	2026-07-22 05:37:31.816
1020	2	2	LOGIN_FAILED	AUTH	2	::1	2026-07-22 05:47:24.327
1021	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-22 05:47:35.353
1022	2	2	LOGIN_FAILED	AUTH	2	::1	2026-07-22 06:17:39.036
1023	2	2	FORGOT_PASSWORD	AUTH	2	::1	2026-07-22 06:27:30.421
1024	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-22 08:26:18.311
1025	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-22 08:27:24.681
1026	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-22 08:28:35.835
1027	2	2	LOGIN_FAILED	AUTH	2	::1	2026-07-22 08:30:08.996
1028	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-22 08:30:15.145
1029	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-22 08:31:30.188
1030	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-22 08:35:49.219
1031	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-22 08:36:33.732
1032	3	3	LOGIN_FAILED	AUTH	3	::1	2026-07-22 08:37:46.399
1033	3	3	LOGIN_FAILED	AUTH	3	::1	2026-07-22 08:37:50.386
1034	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-22 08:37:52.689
1035	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-22 08:48:56.81
1036	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-22 10:01:18.447
1037	3	3	LOGIN_FAILED	AUTH	3	::1	2026-07-22 10:03:15.528
1038	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-22 10:03:23.067
1039	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-22 10:07:09.966
1040	2	2	FORGOT_PASSWORD	AUTH	2	::1	2026-07-22 10:17:31.915
1041	2	2	RESET_PASSWORD	AUTH	2	::1	2026-07-22 10:19:16.786
1042	2	2	LOGIN_FAILED	AUTH	2	::1	2026-07-22 10:19:55.997
1043	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-22 10:20:04.987
1044	3	3	FORGOT_PASSWORD	AUTH	3	::1	2026-07-22 10:26:05.526
1045	2	2	FORGOT_PASSWORD	AUTH	2	::1	2026-07-22 10:27:27.791
1046	2	2	RESET_PASSWORD	AUTH	2	::1	2026-07-22 10:28:05.729
1047	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-22 10:28:31.105
1048	2	2	FORGOT_PASSWORD	AUTH	2	::1	2026-07-22 10:30:23.835
1049	2	2	LOGIN_FAILED	AUTH	2	::1	2026-07-22 10:37:42.295
1050	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-22 10:37:49.079
1051	4	15	REGISTER_SUCCESS	AUTH	15	::1	2026-07-23 05:33:21.99
1052	4	15	EMAIL_VERIFICATION	AUTH	15	::1	2026-07-23 05:33:26.816
1053	5	16	REGISTER_SUCCESS	AUTH	16	::1	2026-07-23 09:02:44.732
1054	5	16	EMAIL_VERIFICATION	AUTH	16	::1	2026-07-23 09:02:49.155
1055	6	17	REGISTER_SUCCESS	AUTH	17	::1	2026-07-23 09:08:26.965
1056	6	17	EMAIL_VERIFICATION	AUTH	17	::1	2026-07-23 09:08:31.287
1057	6	17	EMAIL_VERIFICATION	AUTH	17	::1	2026-07-23 09:22:05.552
1058	6	17	EMAIL_VERIFICATION	AUTH	17	::1	2026-07-23 09:23:54.494
1059	7	18	REGISTER_SUCCESS	AUTH	18	::1	2026-07-23 09:52:10.517
1060	7	18	EMAIL_VERIFICATION	AUTH	18	::1	2026-07-23 09:52:36.282
1061	7	18	EMAIL_VERIFICATION	AUTH	18	::1	2026-07-23 09:53:56.916
1062	7	18	EMAIL_VERIFICATION	AUTH	18	::1	2026-07-23 09:53:56.934
1063	7	18	EMAIL_VERIFICATION	AUTH	18	::1	2026-07-23 09:53:56.954
1064	7	18	EMAIL_VERIFICATION	AUTH	18	::1	2026-07-23 09:53:56.983
1065	7	18	EMAIL_VERIFICATION	AUTH	18	::1	2026-07-23 09:53:57.002
1066	7	18	EMAIL_VERIFICATION	AUTH	18	::1	2026-07-23 09:53:57.029
1067	8	19	REGISTER_SUCCESS	AUTH	19	::1	2026-07-23 10:18:23.946
1068	8	19	EMAIL_VERIFICATION	AUTH	19	::1	2026-07-23 10:18:28.051
1069	8	19	EMAIL_VERIFICATION	AUTH	19	::1	2026-07-23 10:27:59.696
1070	8	19	EMAIL_VERIFICATION	AUTH	19	::1	2026-07-23 10:31:47.791
1071	8	19	EMAIL_VERIFICATION	AUTH	19	::1	2026-07-23 10:33:30.933
1072	2	2	EMAIL_VERIFICATION	AUTH	2	::1	2026-07-23 10:34:01.729
1073	3	3	EMAIL_VERIFICATION	AUTH	3	::1	2026-07-23 10:36:30.966
1074	8	19	EMAIL_VERIFICATION	AUTH	19	::1	2026-07-24 04:15:26.36
1075	2	2	EMAIL_VERIFICATION	AUTH	2	::1	2026-07-24 04:47:51.437
1076	2	2	FORGOT_PASSWORD	AUTH	2	::1	2026-07-24 07:47:18.557
1077	2	2	FORGOT_PASSWORD	AUTH	2	::1	2026-07-24 07:51:34.575
1078	2	2	EMAIL_VERIFICATION	AUTH	2	::1	2026-07-24 07:53:32.102
1079	2	2	EMAIL_VERIFICATION	AUTH	2	::1	2026-07-24 07:54:19.273
1080	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-24 08:08:18.872
1081	3	10	LOGIN_SUCCESS	AUTH	10	::1	2026-07-24 08:09:36.322
1082	9	20	REGISTER_SUCCESS	AUTH	20	::1	2026-07-24 08:10:38.154
1083	9	20	EMAIL_VERIFICATION	AUTH	20	::1	2026-07-24 08:10:42.495
1084	2	2	LOGIN_FAILED	AUTH	2	::1	2026-07-24 08:47:21.19
1085	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-24 09:02:29.572
1086	2	2	LOGIN_FAILED	AUTH	2	::1	2026-07-24 09:57:21.496
1087	3	3	LOGIN_FAILED	AUTH	3	::1	2026-07-24 09:57:30.43
1088	3	3	EMAIL_VERIFICATION	AUTH	3	::1	2026-07-24 10:54:07.078
1089	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-24 10:55:30.008
1090	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-24 10:56:58.756
1091	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-24 11:30:44.65
1092	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-24 11:34:26.828
1093	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-24 11:34:38.682
1094	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-24 11:35:22.477
1095	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-24 11:37:11.152
1096	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-24 11:55:53.166
1097	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-24 11:56:12.18
1098	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 04:39:12.735
1099	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 05:00:10.646
1100	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-25 05:38:09.476
1101	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 05:44:15.342
1102	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-25 05:45:05.837
1103	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 05:48:40.134
1104	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-25 05:48:46.392
1105	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 05:49:03.74
1106	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-25 05:49:11.745
1107	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 06:21:15.401
1108	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 06:22:44.871
1109	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-25 06:24:03.206
1110	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 06:24:26.777
1111	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 08:06:36.373
1112	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 08:14:42.383
1113	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 08:15:44.757
1114	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 08:16:51.401
1115	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 09:01:00.74
1116	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-25 09:03:29.79
1117	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 09:18:32.552
1118	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-25 09:20:34.341
1119	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 09:20:46.319
1120	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-25 09:21:05.169
1121	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 09:21:17.129
1122	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-25 09:21:28.985
1123	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 09:41:48.729
1124	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 11:54:02.239
1134	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-26 04:24:44.207
1144	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-26 11:41:21.588
1154	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-27 15:50:56.738
1164	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-28 16:00:46.296
1125	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-25 12:01:37.808
1135	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-26 05:28:54.726
1145	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-26 11:41:53.914
1155	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-27 16:15:52.706
1126	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 12:01:48.41
1136	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-26 07:25:48.873
1146	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-27 14:08:53.983
1156	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-27 16:44:34.431
1127	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-25 12:42:27.747
1137	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-26 07:25:58.307
1147	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-27 14:09:14.41
1157	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-27 17:03:47.186
1128	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 12:42:48.298
1138	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-26 09:52:18.036
1148	2	2	CREATE_ORG	ORG	2	::1	2026-07-27 14:09:50.074
1158	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-28 14:13:52.284
1129	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-25 13:01:33.776
1139	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-26 09:52:28.795
1149	2	2	CREATE_LOCATION	ORG	8	::1	2026-07-27 14:18:26.754
1159	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-28 14:14:11.473
1130	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 13:01:41.228
1140	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-26 11:36:24.672
1150	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-27 15:10:44.354
1160	2	2	SEND_INVITATION	ORG	2	::1	2026-07-28 15:33:22.347
1131	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-25 16:34:52.758
1141	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-26 11:39:13.995
1151	2	2	CREATE_DEPARTMENT	ORG	14	::1	2026-07-27 15:11:41.401
1161	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-28 15:45:15.559
1132	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-26 04:15:24.402
1142	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-26 11:41:00.896
1152	2	2	CREATE_DEPARTMENT	ORG	15	::1	2026-07-27 15:19:52.805
1162	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-28 15:45:24.345
1133	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-26 04:15:34.073
1143	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-26 11:41:06.258
1153	8	19	LOGIN_SUCCESS	AUTH	19	::1	2026-07-27 15:47:14.884
1163	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-28 15:59:08.364
1165	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-29 04:19:05.421
1174	10	22	LOGIN_SUCCESS	AUTH	22	::1	2026-07-29 06:16:36.655
1183	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-29 06:33:56.97
1166	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-29 04:19:14.408
1175	10	22	CREATE_ORG	ORG	10	::1	2026-07-29 06:17:21.569
1184	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-29 08:07:33.75
1167	2	21	LOGIN_SUCCESS	AUTH	21	::1	2026-07-29 06:04:42.993
1176	10	22	CREATE_LOCATION	ORG	9	::1	2026-07-29 06:17:46.169
1185	3	3	LOGIN_SUCCESS	AUTH	3	::1	2026-07-29 08:16:13.611
1168	2	21	LOGOUT_CURRENT_SESSION	AUTH	21	::1	2026-07-29 06:05:55.799
1177	10	22	CREATE_DEPARTMENT	ORG	16	::1	2026-07-29 06:18:08.006
1186	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-29 10:35:34.585
1169	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-29 06:06:14.915
1178	10	22	SEND_INVITATION	ORG	10	::1	2026-07-29 06:18:37.721
1170	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-29 06:07:14.388
1179	10	22	LOGOUT_CURRENT_SESSION	AUTH	22	::1	2026-07-29 06:20:21.827
1171	10	22	REGISTER_SUCCESS	AUTH	22	::1	2026-07-29 06:08:03.424
1180	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-29 06:20:59.476
1172	10	22	EMAIL_VERIFICATION	AUTH	22	::1	2026-07-29 06:08:29.56
1181	2	2	LOGOUT_CURRENT_SESSION	AUTH	2	::1	2026-07-29 06:22:29.202
1173	10	22	EMAIL_VERIFICATION	AUTH	22	::1	2026-07-29 06:16:10.345
1182	2	2	LOGIN_SUCCESS	AUTH	2	::1	2026-07-29 06:31:57.407
\.


--
-- Data for Name: BreakdownAction; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."BreakdownAction" (id, "breakdownId", "performedBy", action, remarks, "createdAt") FROM stdin;
6	5	10	New action 5 added	Remark for action 5	2026-06-30 15:04:20.545
1	5	10	New action added	this is a test action	2026-06-30 15:01:29.823
2	5	10	Newaction2added	New remark added	2026-06-30 15:01:43.162
7	1	10	New action 5 added	Remark for action 5	2026-07-01 14:32:54.308
8	2	10	Test action	Test remarks	2026-07-01 16:13:41.215
11	2	10	Test action	Test remarks	2026-07-01 16:32:22.879
12	2	10	Test action	Test remarks	2026-07-01 16:33:03.267
9	2	10	update action	update remarks	2026-07-01 16:24:33.768
\.


--
-- Data for Name: BreakdownReport; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."BreakdownReport" (id, "organizationId", "equipmentId", "reportedBy", "assignedTo", title, "rootCause", description, severity, status, "reportedAt", "resolvedAt", "createdAt", "updatedAt") FROM stdin;
4	3	5	3	10	Update Breakdown	\N	Update the description	HIGH	IN_PROGRESS	2026-06-28 15:42:39.491	\N	2026-06-28 15:42:39.491	2026-06-29 07:33:41.108
3	3	7	10	10	New Breakdown 3	\N	this is a new breakdown for testing purpose	HIGH	IN_PROGRESS	2026-06-28 13:00:14.176	\N	2026-06-28 13:00:14.176	2026-06-29 08:30:05.79
2	3	3	10	10	New Breakdown 2	Test root cause	this is a new breakdown for testing purpose	MEDIUM	CLOSED	2026-06-28 12:59:17.218	2026-07-01 16:43:23.887	2026-06-28 12:59:17.218	2026-07-01 17:22:11.78
1	3	1	10	10	Update the breakdown	The test root cause	Update the description	CRITICAL	CLOSED	2026-06-28 12:55:42.286	2026-07-01 14:33:00.467	2026-06-28 12:55:42.286	2026-07-01 17:22:12.126
5	3	1	10	10	New Breakdown 5	The test root cause	this is a new breakdown for testing purpose	LOW	CLOSED	2026-06-30 15:00:20.264	2026-07-01 17:24:22.323	2026-06-30 15:00:20.264	2026-07-01 17:25:23.642
6	3	1	8	14	New Breakdown 5	\N	this is a new breakdown for testing purpose	LOW	IN_PROGRESS	2026-07-03 10:38:20.873	\N	2026-07-03 10:38:20.873	2026-07-03 10:44:08.36
7	3	1	8	10	New Breakdown 5	\N	this is a new breakdown for testing purpose	LOW	IN_PROGRESS	2026-07-03 10:51:25.732	\N	2026-07-03 10:51:25.732	2026-07-03 10:51:52.655
8	3	1	8	14	New Breakdown 5	\N	this is a new breakdown for testing purpose	LOW	IN_PROGRESS	2026-07-03 10:51:27.735	\N	2026-07-03 10:51:27.735	2026-07-03 10:52:00.48
9	3	1	8	10	New Breakdown 5	\N	this is a new breakdown for testing purpose	LOW	IN_PROGRESS	2026-07-03 10:51:29.407	\N	2026-07-03 10:51:29.407	2026-07-03 10:52:08.344
\.


--
-- Data for Name: ChecklistItem; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."ChecklistItem" (id, "templateId", name, "order", "expectedValue", "createdAt", "isActive", "isRequired", "maxValue", "minValue", type, options) FROM stdin;
122	56	Emergency access clear	1	true	2026-06-26 15:30:41.98	t	t	\N	\N	BOOLEAN	\N
123	56	Ambient temperature	2	\N	2026-06-26 15:30:41.98	t	t	35	18	NUMBER	\N
124	56	Indicator status	3	NORMAL	2026-06-26 15:30:41.98	t	t	\N	\N	SELECT	["NORMAL", "WARNING", "CRITICAL"]
125	56	Power supply stable	4	true	2026-06-26 15:30:41.98	t	t	\N	\N	BOOLEAN	\N
126	56	Visible wear or damage	5	false	2026-06-26 15:30:41.98	t	t	\N	\N	BOOLEAN	\N
127	56	Inspector notes	6	\N	2026-06-26 15:30:41.98	t	f	\N	\N	TEXT	\N
\.


--
-- Data for Name: ChecklistTemplate; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."ChecklistTemplate" (id, "organizationId", "equipmentTypeId", name, description, "createdAt", "updatedAt", "isActive", version, "parentId") FROM stdin;
56	3	6	Workstation Safety Inspection	Checklist to ensure safety and operational readiness	2026-06-26 15:30:41.98	2026-06-26 15:30:42.004	t	1	56
\.


--
-- Data for Name: Department; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."Department" (id, "organizationId", name, code, type, "createdAt") FROM stdin;
1	3	Civil	CIV	CIVIL	2026-05-28 09:15:49.924
10	3	Mechanical	MECH	MECHANICAL	2026-06-02 06:59:04.683
11	3	Other	OTH	OTHERS	2026-06-02 06:59:34.524
12	3	Human resource	HR	CIVIL	2026-06-02 06:59:58.057
13	3	Information technology	IT	MECHANICAL	2026-06-02 07:00:20.348
14	2	Information technology	IT	MECHANICAL	2026-07-27 15:11:41.382
15	2	Administrative	ADMIN	ELECTRICAL	2026-07-27 15:19:52.793
16	10	Information tech	IT	CIVIL	2026-07-29 06:18:07.993
\.


--
-- Data for Name: EmailVerification; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."EmailVerification" (id, "userId", token, "expiresAt", "createdAt", "isUsed") FROM stdin;
1	15	42f0d9d0ecaeef6c531b766447d3f44c8b0476185e840c00a2a55588df5cd3f6	2026-07-23 05:48:22.104	2026-07-23 05:33:22.117	f
2	16	26807a9e4462c801f1aa26b446519483c661cd507c9b5b09f7a6dd6195252ce9	2026-07-23 09:17:44.819	2026-07-23 09:02:44.825	f
5	17	c62a2cdf742ba361d5f23ee37151b7576077b1dab2027e13b260272b87761ff9	2026-07-23 09:38:50.333	2026-07-23 09:23:50.334	f
6	18	078f99453ee1c751fbb83287caa3319e559724ea339e53709e058efcd21bd871	2026-07-23 10:07:10.563	2026-07-23 09:52:10.569	t
13	19	39825fd265aaf15931748c80a7bac216d8bc8197c6285e4ff14c89e8016f5622	2026-07-24 04:30:21.525	2026-07-24 04:15:21.542	f
15	2	fdbf42f1d13ef968fc1a0582b150048cde277f6d6cab66f4f5d2d127bebb7cc2	2026-07-24 08:08:07.169	2026-07-24 07:53:07.176	t
16	20	bba64b5e8f47a18ab975d30e816abadc5c0d6a898afff38de9b6ba939d4ab5fe	2026-07-24 08:25:38.205	2026-07-24 08:10:38.206	f
17	3	027a7653ba2fdd53376d35b16b44603e6fa4ee2517ec754d40ea0daf0419687d	2026-07-24 11:09:01.135	2026-07-24 10:54:01.15	f
18	22	4c6f2bd19cd9df1e1250b0b73324081bd37b38adac844aacfa648670f41733fe	2026-07-29 06:23:03.489	2026-07-29 06:08:03.492	t
\.


--
-- Data for Name: Equipment; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."Equipment" (id, "organizationId", "equipmentTypeId", name, "serialNumber", status, "installedDate", "warrantyExpiry", manufacturer, model, "createdAt", "updatedAt", code, "departmentId", "locationId") FROM stdin;
10	3	6	Screw	4	ACTIVE	2003-10-09 00:00:00	2026-10-09 00:00:00	MCF	screw type	2026-06-06 11:05:35.108	2026-06-06 11:05:35.108	eq-05	1	1
11	3	1	Newequip	\N	ACTIVE	\N	\N	\N	\N	2026-06-06 11:05:36.296	2026-06-06 11:05:36.296	eq-10	10	1
12	3	6	Screw	4	ACTIVE	2003-10-09 00:00:00	2026-10-09 00:00:00	MCF	screw type	2026-06-06 11:13:40.186	2026-06-06 11:13:40.186	eq-06	1	1
13	3	6	Screw	4	ACTIVE	2003-10-09 00:00:00	2026-10-09 00:00:00	MCF	screw type	2026-06-06 11:14:31.309	2026-06-06 11:14:31.309	eq-07	1	1
3	3	1	Pump	1	BREAKDOWN	2024-01-01 00:00:00	2026-10-01 00:00:00	PVT	centrifugal	2026-06-06 10:25:45.717	2026-06-28 12:59:17.236	eq-02	1	1
7	3	6	Pump	\N	UNDER_MAINTENANCE	\N	\N	\N	\N	2026-06-06 10:52:54.116	2026-06-28 13:00:14.197	eq-04	1	1
5	3	6	Handsaw	003	UNDER_MAINTENANCE	2024-10-14 00:00:00	2026-10-14 00:00:00	Tatasteel	Saw	2026-06-06 10:26:22.403	2026-06-28 15:42:39.503	EQ-003	10	2
1	3	6	Screw	07	UNDER_MAINTENANCE	2003-10-09 00:00:00	2003-12-01 00:00:00	TATA	Screw v2	2026-06-06 10:23:48.286	2026-07-03 10:51:29.411	EQ-10	10	2
\.


--
-- Data for Name: EquipmentType; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."EquipmentType" (id, "organizationId", name, code, description, "isActive", "createdAt", "updatedAt") FROM stdin;
3	3	Civil	CIVIL	\N	f	2026-06-05 06:23:18.97	2026-06-06 05:48:51.975
1	3	Mechnical	MECH02	\N	t	2026-06-05 06:21:32.239	2026-06-06 06:17:33.039
6	3	Instrumentation	INSTRUMENT	This is the instrumentation type	t	2026-06-05 06:56:02.271	2026-06-06 06:17:34.605
\.


--
-- Data for Name: Invitation; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."Invitation" (id, "organizationId", email, "roleId", "departmentId", token, status, "expiresAt", "createdAt") FROM stdin;
5	3	webheadonline@gmail.com	3	1	7de0effb7ea688a0c7094b567fa8352662215465a6241e6dd0a42d93e3db7438	PENDING	2026-05-29 08:28:21.089	2026-05-29 07:57:31.715
9	3	myfreegames003@gmail.com	3	1	fc976cf0b0317f187ac24206938ad6648de2e9e0045842185839312f29554814	ACCEPTED	2026-05-31 09:37:14.092	2026-05-29 09:00:54.376
10	2	dhanushs4827@gmail.com	5	14	b7728c61e38b2f984b1192e13e72810fb2afa231886cefc6cb5330ae119e25c6	ACCEPTED	2026-07-30 15:33:22.334	2026-07-28 15:33:22.339
11	10	jacobmartinb.e@gmail.com	3	16	4be4d5861736c493587baca860d19f93fab99837ba937082b7c026a12056dffe	ACCEPTED	2026-07-31 06:18:37.708	2026-07-29 06:18:37.713
\.


--
-- Data for Name: Location; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."Location" (id, "organizationId", name, type, address, "createdAt") FROM stdin;
1	3	Plant A	PLANT	73 ammankudi	2026-05-28 04:30:43.325
2	3	Plant B	PLANT	 no 69 daniel road 	2026-05-28 04:30:55.751
7	3	Warehouse A	WAREHOUSE	No 18, ESP Street	2026-06-02 10:31:41.259
8	2	Warehouse B	WAREHOUSE	Chennai	2026-07-27 14:18:26.747
9	10	Plant A	PLANT	89, vasan city	2026-07-29 06:17:46.16
\.


--
-- Data for Name: Notification; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."Notification" (id, "organizationId", "userId", type, title, message, "referenceId", "referenceType", "isRead", "createdAt", "readAt") FROM stdin;
9	3	10	SCHEDULE_ASSIGNED	PM Schedule Assigned	You have been assigned a PM schedule for "Pump".	15	SCHEDULE	f	2026-07-03 10:50:27.575	\N
11	3	10	BREAKDOWN_ASSIGNED	Breakdown Assigned	You have been assigned a breakdown for Screw	7	BREAKDOWN	f	2026-07-03 10:51:52.678	\N
13	3	10	BREAKDOWN_ASSIGNED	Breakdown Assigned	You have been assigned a breakdown for Screw	9	BREAKDOWN	f	2026-07-03 10:52:08.358	\N
\.


--
-- Data for Name: Organization; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."Organization" (id, name, slug, "industryType", "companySize", country, city, "logoUrl", "isActive", "createdAt", "updatedAt", "logoPublicId", "onboardingStep") FROM stdin;
3	CD Equipments	cd-equipments-cdd0a4	MANUFACTURING	SMALL	India	Chennai	https://res.cloudinary.com/dxzdsnaye/image/upload/v1779949167/maintix/f9yjgge0y1ninitib9aq.png	t	2026-05-27 10:17:22.492	2026-05-28 06:21:57.983	maintix/f9yjgge0y1ninitib9aq	ORGANIZATION
4	DC equipments	dc-equipments-e1f0c2	\N	\N	\N	\N	\N	t	2026-07-23 05:33:21.816	2026-07-23 05:33:21.816	\N	ORGANIZATION
5	PS Construction	ps-construction-6b4348	\N	\N	\N	\N	\N	t	2026-07-23 09:02:44.661	2026-07-23 09:02:44.661	\N	ORGANIZATION
6	Web Head	web-head-327e7f	\N	\N	\N	\N	\N	t	2026-07-23 09:08:26.913	2026-07-23 09:08:26.913	\N	ORGANIZATION
7	DC Construction	dc-construction-8892f1	\N	\N	\N	\N	\N	t	2026-07-23 09:52:10.478	2026-07-23 09:52:10.478	\N	ORGANIZATION
9	DC equipments	dc-equipments-2c1c4a	\N	\N	\N	\N	\N	t	2026-07-24 08:10:38.097	2026-07-24 08:10:38.097	\N	ORGANIZATION
8	test	test-b88a0f	\N	\N	\N	\N	\N	t	2026-07-23 10:18:23.857	2026-07-27 15:48:06.08	\N	COMPLETED
2	DC Equipments	dc-equipments-faab32	MANUFACTURING	SMALL	Ingland	London	https://res.cloudinary.com/dxzdsnaye/image/upload/v1785161390/maintix/m7dwgod6tthstkthhaqt.png	t	2026-05-27 10:16:53.948	2026-07-28 15:45:05.381	maintix/m7dwgod6tthstkthhaqt	COMPLETED
10	JJ Consultancy	jj-consultancy-63d009	OIL_GAS	LARGE	India	Trichy	https://res.cloudinary.com/dxzdsnaye/image/upload/v1785305840/maintix/epht6fqzvgshw7szzsep.png	t	2026-07-29 06:08:03.382	2026-07-29 06:19:25.232	maintix/epht6fqzvgshw7szzsep	COMPLETED
\.


--
-- Data for Name: PMSchedule; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."PMSchedule" (id, "organizationId", "equipmentId", "templateId", "frequencyType", "interval", "startDate", "nextDueDate", "assignedTo", "isActive", "createdAt", "updatedAt", "lastGeneratedAt") FROM stdin;
7	3	7	56	DAILY	1	2026-06-26 00:00:00	2026-06-27 00:00:00	10	t	2026-06-26 15:32:19.874	2026-06-26 15:40:00.151	2026-06-26 15:40:00.149
8	3	7	56	DAILY	1	2026-07-04 00:00:00	2026-07-05 00:00:00	14	t	2026-07-03 10:44:38.051	2026-07-03 10:44:38.051	\N
9	3	7	56	DAILY	1	2026-07-04 00:00:00	2026-07-05 00:00:00	10	t	2026-07-03 10:44:45.789	2026-07-03 10:44:45.789	\N
10	3	7	56	DAILY	1	2026-07-04 00:00:00	2026-07-05 00:00:00	14	t	2026-07-03 10:44:52.211	2026-07-03 10:44:52.211	\N
11	3	7	56	DAILY	1	2026-07-04 00:00:00	2026-07-05 00:00:00	10	t	2026-07-03 10:44:56.218	2026-07-03 10:44:56.218	\N
12	3	7	56	DAILY	1	2026-07-04 00:00:00	2026-07-05 00:00:00	10	t	2026-07-03 10:46:53.834	2026-07-03 10:46:53.834	\N
13	3	7	56	DAILY	1	2026-07-04 00:00:00	2026-07-05 00:00:00	10	t	2026-07-03 10:50:02.513	2026-07-03 10:50:02.513	\N
14	3	7	56	DAILY	1	2026-07-04 00:00:00	2026-07-05 00:00:00	14	t	2026-07-03 10:50:21.212	2026-07-03 10:50:21.212	\N
15	3	7	56	DAILY	1	2026-07-04 00:00:00	2026-07-05 00:00:00	10	t	2026-07-03 10:50:27.551	2026-07-03 10:50:27.551	\N
16	3	7	56	DAILY	1	2026-07-04 00:00:00	2026-07-05 00:00:00	14	t	2026-07-03 10:50:32.376	2026-07-03 10:50:32.376	\N
\.


--
-- Data for Name: PMTask; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."PMTask" (id, "organizationId", "scheduleId", "equipmentId", "templateId", "assignedTo", "dueDate", "completedAt", status, priority, remarks, "createdAt", "updatedAt", title) FROM stdin;
24	3	7	7	56	10	2026-06-26 00:00:00	2026-06-27 12:59:27.69	COMPLETED	MEDIUM	\N	2026-06-26 15:40:00.124	2026-06-27 12:59:27.698	Workstation Safety Inspection
\.


--
-- Data for Name: PasswordReset; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."PasswordReset" (id, "userId", token, "expiresAt", "createdAt", "isUsed") FROM stdin;
17	3	037544201f709f4a181009832863e0ffd61ec4e00d47e74de56e0c7372fa1c10	2026-07-22 10:40:40.046	2026-07-22 10:25:40.052	f
21	2	f22ceeb5ab17c623ad80e58979ef2f2e821604659faaa86b88461740ca7c7901	2026-07-24 08:06:30.758	2026-07-24 07:51:30.76	f
\.


--
-- Data for Name: Role; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."Role" (id, name) FROM stdin;
1	ADMIN
2	MANAGER
3	TECHNICIAN
4	INSPECTOR
5	ENGINEER
\.


--
-- Data for Name: TaskChecklistItem; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."TaskChecklistItem" (id, "taskId", name, "order", "expectedValue", "actualValue", status, "createdAt", "maxValue", "minValue", "templateItemId", type, "updatedAt", options) FROM stdin;
120	24	Emergency access clear	1	true	false	NOT_OK	2026-06-26 15:40:00.124	\N	\N	122	BOOLEAN	2026-06-26 15:42:56.912	null
125	24	Inspector notes	6	\N	completed	\N	2026-06-26 15:40:00.124	\N	\N	127	TEXT	2026-06-26 15:43:57.978	null
121	24	Ambient temperature	2	\N	5	NOT_OK	2026-06-26 15:40:00.124	35	18	123	NUMBER	2026-06-26 15:44:49.978	null
122	24	Indicator status	3	NORMAL	CRITICAL	NOT_OK	2026-06-26 15:40:00.124	\N	\N	124	SELECT	2026-06-26 15:45:44.782	["NORMAL", "WARNING", "CRITICAL"]
123	24	Power supply stable	4	true	true	OK	2026-06-26 15:40:00.124	\N	\N	125	BOOLEAN	2026-06-26 15:46:11.699	null
124	24	Visible wear or damage	5	false	true	NOT_OK	2026-06-26 15:40:00.124	\N	\N	126	BOOLEAN	2026-06-26 15:46:35.776	null
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."User" (id, name, email, "createdAt", "isActive", "isEmailVerified", "lastLoginAt", "organizationId", "passwordHash", "updatedAt") FROM stdin;
4	John	dhanush1@gmail.com	2026-05-29 09:38:54.476	t	t	\N	3	$2b$10$2EzMpYFNkHk5RHqpnFsnL.6.UemjscxnL7096o4NQ1dTjNtoJXIWW	2026-06-04 09:05:53.889
5	User 1	testUser1@gmail.com	2026-06-14 05:27:12.389	t	f	\N	3	$2b$10$hKEzkNAeK0XYYrDoW.h...P.yx1bEqABLZ/iya.YlRVwPRdU5m2Ni	2026-06-14 05:27:12.389
6	User 2	testUser2@gmail.com	2026-06-14 05:28:32.113	t	f	\N	3	$2b$10$XkFDj0EmrHyITM//ttHs6O7cdtxoTpHnKD/OJiVXlhSDo3WYdzCl.	2026-06-14 05:28:32.113
10	Technician	technicianuser@gmail.com	2026-06-14 05:30:29.028	t	f	\N	3	$2b$10$BtSEWR4XrT..SGAYjROEhuXeJ4AYrIDEPonUH/RHnqXj.JIQwI1Dm	2026-06-14 05:30:29.028
11	Inspector	inspectoruser@gmail.com	2026-06-14 05:31:00.273	t	f	\N	3	$2b$10$cM5etnJ9Lpi/EKPburdAtOldJ4VhMfkvNK1FgrcyA6TODH8HPGB9i	2026-06-14 05:31:00.273
12	Engineer	engineeruser@gmail.com	2026-06-14 05:31:20.084	t	f	\N	3	$2b$10$Ho569/B9zMvGBMcbSrad/eDadqGnvzlpsFvsiT8p7AXp4vXTbHm06	2026-06-14 05:31:20.084
8	Manager	manageruser@gmail.com	2026-06-14 05:29:51.247	t	f	\N	3	$2b$10$3v305YccmwWvChAKqkbOouZemgi4zSB5EtBhjQ2tKoDkwvv3xyDBu	2026-06-14 05:29:51.247
13	Engineer	technicianuser2@gmail.com	2026-07-01 14:27:38.13	t	f	\N	3	$2b$10$bguB/Du9jwuuLCO8ZsMbceA.U1tCvrKyISwf0YR9o4EI0fv7eF52a	2026-07-01 14:27:38.13
14	Engineer	technicianuser3@gmail.com	2026-07-01 14:28:07.607	t	f	\N	3	$2b$10$nqzWRg/phqln.9BiwSX9oOKYFlYRwDY9j4BQxS0kjw0vN0wYPY7eu	2026-07-01 14:28:07.607
15	Technician	dhanush78@maintix.com	2026-07-23 05:33:21.905	t	f	\N	4	$2b$10$YCcJfLm4tANw/3Bjmk3PcOdL7XRSKripAH7UgHASb7UgrmBZyraVu	2026-07-23 05:33:21.905
16	Suruthi	suruthishanmuganathan@gmail.com	2026-07-23 09:02:44.694	t	f	\N	5	$2b$10$Lu8W216ASNlQGXwoRLiQjO/EyOJ4Bsm2jj6g8sWoXCv8SFKi4uy3u	2026-07-23 09:02:44.694
17	Dhanush	myfreegames003@gmail.com	2026-07-23 09:08:26.932	t	f	\N	6	$2b$10$7tgrmD9E8YyNF.EAvn8C0uhyzb4ki30zlAJCzdQMWZPTYwvz6HWny	2026-07-23 09:08:26.932
18	Dhanush	dhanush4827@outlook.com	2026-07-23 09:52:10.496	t	t	\N	7	$2b$10$kx28Zmo7QvVyjW4e5fGvl.JHH5cibRkgU04Cm7Ky/aiRJFGokCexK	2026-07-23 09:53:57.021
20	Technician	dhanush8@maintix.com	2026-07-24 08:10:38.12	t	f	\N	9	$2b$10$ZKy5D86z.f42/zTGFoWvrex.xGjWQPfmfW3xVL6Ws8Wfy4DPZ/lU.	2026-07-24 08:10:38.12
19	Dhanush	dhanush@test.com	2026-07-23 10:18:23.915	t	t	\N	8	$2b$10$k66CWRaAS/hpppKo2JmlkO1yapCPpzuqhBPw/NE/925ZlbpqgQIKW	2026-07-23 10:18:23.915
21	Dhanush	dhanushs4827@gmail.com	2026-07-29 06:04:30.628	t	t	\N	2	$2b$10$3LeUw5z1rBS1NAPO.u3ZB.uLyPF0uw9zeF0dg6e/N1Qx2yNFbzPXm	2026-07-29 06:04:30.628
22	Jacob	sjacobmartin@gmail.com	2026-07-29 06:08:03.396	t	t	\N	10	$2b$10$T8FHk0wEiFSWrstkMO1uE.kcuqtqQMxm4yaatCu9TEn08EyL18ls6	2026-07-29 06:16:10.33
23	Hariram	jacobmartinb.e@gmail.com	2026-07-29 06:20:14.119	t	t	\N	10	$2b$10$7oj0PXabXPphH1Huy06ELeibeMvxPr0cjCIwiY9o.Fdx5h.Ex0Aw6	2026-07-29 06:20:14.119
2	Dhanush kumar	dhanush3727@gmail.com	2026-05-27 10:16:53.958	t	t	\N	2	$2b$10$YP.xX.dJzlLMuu7gPpT0auwPcM/WD0PI0uAQY52Gu85ZPsbsoGdp.	2026-07-24 07:54:19.254
3	Charu	dhanush7825@gmail.com	2026-05-27 10:17:22.496	t	t	\N	3	$2b$10$ZMdO7/xBGcpbjpOEU3hxnOoJvDXiVixFAaS0zhIf6FbFdK7IvlrUG	2026-06-04 05:23:27.672
\.


--
-- Data for Name: UserDepartment; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."UserDepartment" (id, "userId", "departmentId") FROM stdin;
1	4	11
4	21	14
5	23	16
\.


--
-- Data for Name: UserRole; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."UserRole" (id, "userId", "roleId") FROM stdin;
1	2	1
2	3	1
18	4	4
19	4	5
20	5	2
21	6	3
22	8	2
23	10	3
24	11	4
25	12	4
26	13	4
27	14	3
28	15	1
29	16	1
30	17	1
31	18	1
32	19	1
33	20	1
34	21	5
35	22	1
36	23	3
\.


--
-- Data for Name: UserSession; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."UserSession" (id, "userId", "refreshToken", "deviceInfo", "ipAddress", "userAgent", "isActive", "lastActiveAt", "createdAt", "expiresAt", jti) FROM stdin;
734	10	$2b$10$zDW066iYopRlaPYX1AdNeuShwkrveRy9fma3qgJWNHp555NM6WdxO	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	2026-07-20 09:27:12.287	2026-07-20 09:27:12.287	2026-07-27 09:27:12.261	0b904388-496f-43b1-8411-2f0755d744c1
735	10	$2b$10$.WIysmb/cIEpKRYOcR17C.7n0ovG.1Ym4ANibh0xBuGJRQijkxNgq	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-07-20 10:32:00.171	2026-07-20 10:32:00.171	2026-07-27 10:32:00.14	9128cda1-8868-4d47-9533-63cfeeff2ebe
736	10	$2b$10$1iThmeYtVe7s.ut5VBUR2u3FgUdsmMiR8mNd0WhcGR5GSVQ2Wzlwe	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-07-20 10:33:03.481	2026-07-20 10:33:03.481	2026-07-27 10:33:03.466	e50e17c3-7067-4c96-9885-79f001f13132
737	10	$2b$10$KUc35kjELCqRss3s6gz.z.2sHP206TTjWKFSreZcfn0v55zaCsg.i	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-07-20 10:33:38.368	2026-07-20 10:33:38.368	2026-07-27 10:33:38.349	3ce89fed-a53a-4066-bada-fe5c2c7fbb7b
738	10	$2b$10$V2krzvzL6Px1nCqU8u5rZ.QKbCWF1YiQFFa1sdvhaWhGWerJw06TC	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-07-20 10:38:37.083	2026-07-20 10:38:37.083	2026-07-27 10:38:37.063	67a5531b-46d7-44e3-a66b-928013341efb
739	3	$2b$10$swHWTka6Xj1urqGYDIKumOWT7CApNVOMT/2CXBaoT/28s6gp/gDWu	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	2026-07-20 10:55:38.659	2026-07-20 10:55:38.659	2026-07-27 10:55:38.64	27d45adb-213d-4676-8b1c-a69794039794
741	3	$2b$10$EtluYs/RZjauFyruoK5rHe.SXgFBSILbtkv24Y9uodh5FdT.WwOwe	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	2026-07-21 04:48:58.218	2026-07-21 04:48:58.218	2026-07-28 04:48:58.211	78edcc86-b0e3-4f5f-b35f-4eecc30f18bc
744	3	$2b$10$a..hXisOPXGlUdk4c7jEA.Gto.Wq043Y5Hf9TXkJEDv8sWmflWVwC	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	2026-07-22 08:27:24.662	2026-07-22 08:27:24.662	2026-07-29 08:27:24.658	53aa64c4-4d5f-4694-93ad-a5726b28e475
745	3	$2b$10$4aiqKRzaeiw8b7/WEWVCWOZ./7kO/1mYQc.WcaXVaVOyzhst0TQ/m	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	2026-07-22 08:28:35.821	2026-07-22 08:28:35.821	2026-07-29 08:28:35.819	d1ec7d1b-6bb6-432a-b255-36c3f9694a7c
747	3	$2b$10$pNoNhmtPM4DAlGIa3xYUUONb6B86RT2t.WYE6lHC9iiOsMp7TYVhS	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	2026-07-22 08:31:30.175	2026-07-22 08:31:30.175	2026-07-29 08:31:30.173	c3c8ef2e-6d44-4858-abfb-b25e96f4bd0a
748	3	$2b$10$PeqBMiLua9O7ZmAAwlzD5enyKq/6AxMKdd52ydNMdSt6PRS4wcS1y	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	2026-07-22 08:35:49.205	2026-07-22 08:35:49.205	2026-07-29 08:35:49.202	7017c8a9-5f7b-423b-89aa-3f2da6d4a1c0
749	3	$2b$10$5Q8Jyw5TQwWBjxSXpZHd/uB/8NhcbBRyY2tki3Sw05ODnScAAMjGu	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	2026-07-22 08:36:33.719	2026-07-22 08:36:33.719	2026-07-29 08:36:33.717	44e49e7b-6d5c-4d2e-89bb-74162fafdfc3
750	3	$2b$10$4UP7MBLkw3Z8kjuSj2Rw5O0rq9vgXf9XZLMreJfVR26YaSlXJ/oNK	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	2026-07-22 08:37:52.677	2026-07-22 08:37:52.677	2026-07-29 08:37:52.675	026bff0f-7168-46e1-9aea-18cc481f8254
751	3	$2b$10$QzYpGZc1l6lJMZd65LWEReu8SLr3PSLVkoRgfV9OoS94MqvSjAzIC	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	2026-07-22 08:48:56.795	2026-07-22 08:48:56.795	2026-07-29 08:48:56.793	754c39b8-0be2-495c-83f6-010acf0dc85f
752	3	$2b$10$J7o7SY0rcMlV6oQtIRKYGOj53CTutW8iH/frnyxFgo.Rv6VJGEjPW	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	2026-07-22 10:01:18.396	2026-07-22 10:01:18.396	2026-07-29 10:01:18.373	72e19b2d-8a2e-4f7f-a3e7-30126645ff3a
753	3	$2b$10$abHzrj1JEzJ9F1uIaLrEKORgxYtxcfS15RhsgO7jqJV23VI6Qd8Dq	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	2026-07-22 10:03:23.054	2026-07-22 10:03:23.054	2026-07-29 10:03:23.049	a8bf0ddd-ab07-41f7-9da5-2efba463d13a
754	3	$2b$10$ptb1ih98mevW/H1jFdeskuLsinNj6s8ZtMxCxXpOx2Ib.G6N5aTSi	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	2026-07-22 10:07:09.951	2026-07-22 10:07:09.951	2026-07-29 10:07:09.948	456cbc24-5ebe-4645-a581-743584ed8890
740	2	$2b$10$m/.wgkb1EWUblXxHsLq6MOy56veqZwoXHw91zcd/R0/6/3tJosbna	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-21 04:36:48.001	2026-07-21 04:36:48.001	2026-07-28 04:36:47.925	5c93b527-c11d-42fe-9db7-a68bf861e816
742	2	$2b$10$IeWgYS1HdIHAOt0BSFcsVOVCwIAX8FsBOkWOAFrZtMyL7clTQn6.G	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-22 05:47:35.328	2026-07-22 05:47:35.328	2026-07-29 05:47:35.32	23189e65-b3c4-40e4-bf8a-6b25e96da130
743	2	$2b$10$p.YokfD6J.MoxnHjT0SGQeZF0N7/xRw0E2KTJxVLeLtUdaFSVAClu	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-22 08:26:18.259	2026-07-22 08:26:18.259	2026-07-29 08:26:18.187	cd1d6734-aca1-461a-b834-fb61d4cb38d3
746	2	$2b$10$20jbxITMc.LGFAe0bJQUJexKsjVgcnboFTeGPyIrK8WG1mVTcu6v2	Mobile Chrome on Android 15	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-22 08:30:15.133	2026-07-22 08:30:15.133	2026-07-29 08:30:15.131	37e6fc78-53a9-4f23-b541-e1e8713106c0
755	2	$2b$10$SgPZ3wh/TpPaCdlE/Of5f.Cm2IS1YRiumXasMrhqMdFXAhX67OErq	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-22 10:20:04.976	2026-07-22 10:20:04.976	2026-07-29 10:20:04.974	999aa12f-126a-42fe-9ef1-ce5b8fb920fe
756	2	$2b$10$K3Th0PjeHTbSNvJ6xC2/2ujqgqc7IIRghCxyhdDwzNPHdtCigR.qe	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	2026-07-22 10:28:31.093	2026-07-22 10:28:31.093	2026-07-29 10:28:31.09	2ea33404-fd84-46cb-9295-a3bbf88abbcd
757	2	$2b$10$UFO3wYnw.igwfBTQ3RcDUO0G0hQscII6FOm4D9Y.DUA8WRzgh7dSa	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	t	2026-07-22 10:37:49.062	2026-07-22 10:37:49.062	2026-07-29 10:37:49.058	71119c53-3ef8-41c8-aa21-d56f45748e79
758	10	$2b$10$Hu3Fn.b3e.I2TcVMRgMGJeu4SxBQeVgslPlc9Iy/lcZOPFcUkPgiW	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-07-24 08:08:18.819	2026-07-24 08:08:18.819	2026-07-31 08:08:18.793	f6661ca9-57bb-4001-96b0-cadf38fcfe29
759	10	$2b$10$6bWHars3aB6jZ1nQlzD/J.oKGVQCTHkSAu0ZeM8zNxIeNvjBKrJMK	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-07-24 08:09:36.299	2026-07-24 08:09:36.299	2026-07-31 08:09:36.281	0648e345-1ecc-43a1-af18-1aa60e8c8589
796	2	$2b$10$wM9K.pA19vxHdSj.QE7uPu1MbbTli94qR7XMPrBQcwHL.ASedQztO	\N	\N	\N	f	2026-07-25 09:03:04.784	2026-07-25 09:03:04.784	2026-08-01 09:03:04.783	86239d9a-ca07-47d7-acf3-ed92b1aa4802
797	2	$2b$10$BN1oWMBAqB18mATlllKJNeotV2DdjDOrweODjiftHrBal0lVSzyYW	\N	\N	\N	f	2026-07-25 09:03:20.294	2026-07-25 09:03:20.294	2026-08-01 09:03:20.293	66ab9c5a-c1af-4c3e-ad98-2e28563c3c33
760	2	$2b$10$VcgI7WjEI.o/YBnF61d/u.PGgnfFETLs/pNGWYgmI5QO7ZvvrZL12	PostmanRuntime/7.55.1	::1	PostmanRuntime/7.55.1	f	2026-07-24 09:02:29.535	2026-07-24 09:02:29.535	2026-07-31 09:02:29.5	5b9e72d5-5039-4cf4-a98e-49d05e56587b
761	2	$2b$10$327itF93sXV5b0khwvZuleztlsGetaLkejQ49m31lpIMg/csmgksK	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-24 10:55:29.951	2026-07-24 10:55:29.951	2026-07-31 10:55:29.91	043e5837-aa2c-41d4-9d2c-9b0afac26b31
762	2	$2b$10$uJfs0OBfArTooX.LDvlL3uZgpp1s0FsqYvnj5bxXWwuw8rgWve03O	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-24 11:34:26.804	2026-07-24 11:34:26.804	2026-07-31 11:34:26.776	d57abb16-23b3-4c4d-b803-4c83d5558f88
763	2	$2b$10$qJwQwS1P6EXuxm16YDStC.3vrWeagpBWNtxWSz/02PXzDnmmMAdby	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-24 11:35:22.443	2026-07-24 11:35:22.443	2026-07-31 11:35:22.439	fff2c08f-9491-441e-8039-7668af99c8fa
764	2	$2b$10$dWOSha15tpcnw89ShQ3JCuC0snfPXFQC9scJfCde0/hlKIV.IN1zW	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-24 11:55:53.149	2026-07-24 11:55:53.149	2026-07-31 11:55:53.145	ee086db3-d768-4eb3-99b3-7f1110a8ec03
765	2	$2b$10$WyrL5NqDt7jC4PnMc9YvyuAZg.KqCEzM5U8g4pkiu24I2IrKuW03m	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-25 04:39:12.681	2026-07-25 04:39:12.681	2026-08-01 04:39:12.66	6b3c69a0-a807-4ed8-a37e-a02689898011
767	2	$2b$10$5He5UY/TT6iV9VbSGPaoruNTpKp1RxPJSi0YCMcxkD1PhH05gOP6S	PostmanRuntime/7.55.1	::1	PostmanRuntime/7.55.1	t	2026-07-25 05:00:10.628	2026-07-25 05:00:10.628	2026-08-01 05:00:10.596	009d697b-b41f-42e8-ab57-28be3d4a8314
766	2	$2b$10$mT8bzrdES.QyKyJqppBHoeys3D6n1pqazHRaJ5/W204DWzQZChwbu	\N	\N	\N	f	2026-07-25 04:39:13.544	2026-07-25 04:39:13.544	2026-08-01 04:39:13.542	83b1864f-79bc-47ad-8968-0d077423780c
768	2	$2b$10$TbsIgK/wT7Livyxz2FRBn.zZIcfH.DdxVYFVRblRZiQz6orqg.vPu	\N	\N	\N	f	2026-07-25 05:27:25.651	2026-07-25 05:27:25.651	2026-08-01 05:27:25.647	028cd85b-1f89-4ee5-a517-e7cb27cbde15
769	2	$2b$10$yH0M.FK9vvQvmNh0GB301uR9Wwr33Udog55Cf4YlR12NSl4gVMcvG	\N	\N	\N	f	2026-07-25 05:27:29.037	2026-07-25 05:27:29.037	2026-08-01 05:27:29.037	e681915f-fb5a-4534-af8e-02bd27a53763
770	2	$2b$10$1YU7a9JHbOXTJFsKJAeSd.X83QYJ2u2H74A6mUOZItphpmc2e4O7a	\N	\N	\N	f	2026-07-25 05:27:57.434	2026-07-25 05:27:57.434	2026-08-01 05:27:57.434	822c35f6-a852-41bc-9be5-0ac1e081060f
771	2	$2b$10$ZeV9fdDj0AqSAN7WotGoMOtv26AXD1JxrDABb4x0bdO3qEkKH5nKm	\N	\N	\N	f	2026-07-25 05:28:06.986	2026-07-25 05:28:06.986	2026-08-01 05:28:06.986	9ceddbee-cd8e-48b8-99f1-e9dfd4b68765
772	2	$2b$10$WlppW1BGEqE.441dvpXVHe3fdAqMq/hW/r7hlxmMczUxzhDN7/81a	\N	\N	\N	f	2026-07-25 05:30:34.119	2026-07-25 05:30:34.119	2026-08-01 05:30:34.117	a1f311a4-6a5e-470f-888f-6b1ede152ce1
773	2	$2b$10$/Bo34FdyCvxD8bkuIuAOR.EIdzRRb5oEfXQhT5MReMijaSFIiXSoy	\N	\N	\N	f	2026-07-25 05:33:54.543	2026-07-25 05:33:54.543	2026-08-01 05:33:54.542	681c44a0-b5c1-441f-9398-d00362dd4943
774	2	$2b$10$RUhTKEb1loWxCBObEPgueeK3MChCEATLQg.l3TGhu51nl4rTsZF/q	\N	\N	\N	f	2026-07-25 05:34:07.532	2026-07-25 05:34:07.532	2026-08-01 05:34:07.531	1fe2addb-59c9-47e6-ad91-3044bbada787
775	2	$2b$10$uvRACCIVu2ZE4Mqya.uI7uEvAOFCCuy.R8sCuNcnkqLInulwLFlTO	\N	\N	\N	f	2026-07-25 05:34:29.957	2026-07-25 05:34:29.957	2026-08-01 05:34:29.957	8ac1a3f8-fd59-4985-a697-9902e6f08a61
776	2	$2b$10$gaASNRklc1WJicOEfTR1o.9H3i4NgXsDwYdNzUtCzhuAu0/6B5g1u	\N	\N	\N	f	2026-07-25 05:34:38.17	2026-07-25 05:34:38.17	2026-08-01 05:34:38.169	df2f4938-a00b-46c1-a008-de0e4890da0b
777	2	$2b$10$hI5xhSw9TqPpB0MJMPmAe.pXpKKssk2mZ19Mb9XEcwtsiS6CyEbk.	\N	\N	\N	f	2026-07-25 05:35:25.82	2026-07-25 05:35:25.82	2026-08-01 05:35:25.82	70a9bb41-1f70-4a41-8ccb-3f0737d1a44d
778	2	$2b$10$vqZrSLD9OGkcyjsVRxbFhOULPJinqGj4wRTcv7uDuw7s7RPcrh3fe	\N	\N	\N	f	2026-07-25 05:37:13.895	2026-07-25 05:37:13.895	2026-08-01 05:37:13.894	927816b5-6338-410a-bff0-af09ccab5965
779	2	$2b$10$ZUlEAgkSosybNd/.bqPH2eirsGqvZSR7BN7wogQcaSCEUoKIvIQfG	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-25 05:44:15.322	2026-07-25 05:44:15.322	2026-08-01 05:44:15.318	146afccc-405d-479f-9ca2-af9a38e2600e
780	2	$2b$10$fqDLDaK69WJ9EdYYbcwTjOWA/caot15j6KoIVfCEvos8LsHrNLqAy	\N	\N	\N	f	2026-07-25 05:44:16.152	2026-07-25 05:44:16.152	2026-08-01 05:44:16.151	b6c8ba26-9812-46f8-a09f-8650b8214bf1
781	2	$2b$10$7gv2Gi6L6i4p2LJwH5GpE.j5TQ3uTOXBQwp7ceanCHzQkmkhn8LOy	\N	\N	\N	f	2026-07-25 05:44:55.465	2026-07-25 05:44:55.465	2026-08-01 05:44:55.465	ef99cba6-f33b-4f0d-8b96-e303d186e5bc
782	2	$2b$10$L3QHfwkSmZv5Jjs/ae7NiezQ06c6G8jjS88.3tQGFYBYkD1vuAUHS	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-25 05:48:40.116	2026-07-25 05:48:40.116	2026-08-01 05:48:40.11	84ac6eb0-2bf8-421e-946f-ed6a6aad3e8b
783	2	$2b$10$p6/H0xSGVibtnUWU8Ukb9.VefySufOQK4nJTYi8efedFKGFssfUju	\N	\N	\N	f	2026-07-25 05:48:41.038	2026-07-25 05:48:41.038	2026-08-01 05:48:41.037	68662e7f-a444-4ecd-bf08-a57d5dba0425
784	2	$2b$10$wfsBpvFOjkwoEF/E1b/KEeCfVXK0lViYJnOmj2n7oCikTihk4w4Eu	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-25 05:49:03.734	2026-07-25 05:49:03.734	2026-08-01 05:49:03.733	c6ff1cae-4659-4451-a2bd-edc640093f65
785	2	$2b$10$NERi1CC7CbGbBz.tCiG/5e4iWdlu/Xu5CaUDX9Kqys8.8p5GNfPRy	PostmanRuntime/7.55.1	::1	PostmanRuntime/7.55.1	t	2026-07-25 06:21:15.386	2026-07-25 06:21:15.386	2026-08-01 06:21:15.368	1c583640-1e31-4d8a-b970-ef13cc619218
786	2	$2b$10$tOeTdgt5uBh/SpXVnIwIRe.jyn3iSiLxRPG1INvuVkH4ll0HKbqPC	PostmanRuntime/7.55.1	::1	PostmanRuntime/7.55.1	f	2026-07-25 06:22:44.862	2026-07-25 06:22:44.862	2026-08-01 06:22:44.861	f227924e-07fe-4ce1-be2c-844bde08b3b2
787	2	$2b$10$wMnBmuotiYtTOun8HggCGuKeA8FMtteTdLgtMksPAca6iut5fHph2	PostmanRuntime/7.55.1	::1	PostmanRuntime/7.55.1	t	2026-07-25 06:24:26.771	2026-07-25 06:24:26.771	2026-08-01 06:24:26.77	95e12d89-72d3-42ad-bda1-5a0239128183
788	2	$2b$10$2wR5YyLbcUm8fHHFxDAsAuIvlJ8OYySMdjk0idrldQDY3rxtu5Pjm	PostmanRuntime/7.55.1	::1	PostmanRuntime/7.55.1	t	2026-07-25 08:10:30.001	2026-07-25 08:06:36.303	2026-08-01 08:06:36.271	76e55e0a-8f74-4699-b3d4-9348ba464dd1
789	2	$2b$10$uv8.Q5IbaAdevPr4wG5a2urrIDcEc3khL4Vs5F5HfiGy5p4fFvCrK	PostmanRuntime/7.55.1	::1	PostmanRuntime/7.55.1	t	2026-07-25 08:14:42.368	2026-07-25 08:14:42.368	2026-08-01 08:14:42.364	3344ab2e-c7f5-4ecd-8861-7ae12a6dfbcc
790	2	$2b$10$GWJsAXH6wKjDeqdh7M8n4.Ge7IfLAmNwZlunkmUGFc7tmOZI.efA2	PostmanRuntime/7.55.1	::1	PostmanRuntime/7.55.1	t	2026-07-25 08:15:44.748	2026-07-25 08:15:44.748	2026-08-01 08:15:44.741	d4e879cd-cb59-443c-bb09-504c59a1640a
791	2	$2b$10$Gk/KIMHuaUn5X3.vxsBmQONng7eL0KAUtLD8FJMPcXpFNPhn0YLsq	PostmanRuntime/7.55.1	::1	PostmanRuntime/7.55.1	t	2026-07-25 08:16:51.394	2026-07-25 08:16:51.394	2026-08-01 08:16:51.394	ab6079cd-0bae-4583-a5a8-1f638818abfd
792	2	$2b$10$6CuzF0t88y59pWMQWQ2Dw.uObPJLNKELebDRnFVtl2fOMI05t5iVy	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-25 09:01:00.718	2026-07-25 09:01:00.718	2026-08-01 09:01:00.697	15456243-028e-46e2-9c80-66d5587b52d3
793	2	$2b$10$8c18y3ZZw6e6XmL/KIenAeM2Cz.4NbHF15QMIhKqIh2Ybks7fad.i	\N	\N	\N	f	2026-07-25 09:01:01.548	2026-07-25 09:01:01.548	2026-08-01 09:01:01.545	db7b7529-72d3-4af0-ab99-c935e9784d86
794	2	$2b$10$vvBy0SszfmaFfwl733IKOOf4EbICO8opHDhdn9olcWhcoskPSdzGq	\N	\N	\N	f	2026-07-25 09:01:28.097	2026-07-25 09:01:28.097	2026-08-01 09:01:28.096	ac3ada4f-16a9-478b-ae8a-48e53f242f63
795	2	$2b$10$EBrk0W6yekJ3SOwlS9rcfu3l2PAMHoMLst6Itkzx.DAF4JiCzIRAK	\N	\N	\N	f	2026-07-25 09:01:36.635	2026-07-25 09:01:36.635	2026-08-01 09:01:36.633	02479187-ef2e-413d-8c2f-a7a9d19ac1ff
798	2	$2b$10$172wnSlhYcsVL18Fa1n6AulbdYqp7yB1UTW688aDvGtkXjHHsx6Fi	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-25 09:18:32.534	2026-07-25 09:18:32.534	2026-08-01 09:18:32.529	453847aa-712b-4486-8ed9-06a89d3f9aa6
799	2	$2b$10$LwJGXQAH.xCBGIhrfBP81.W2FxD8tFbUS4wULIFCFOqm0/mwWPlga	\N	\N	\N	f	2026-07-25 09:18:34.344	2026-07-25 09:18:34.344	2026-08-01 09:18:34.344	d20e3e31-56a5-4c4b-9960-17b082f12cf5
800	2	$2b$10$dRxUylJWibuJ6aq5SoDvyetoP2A/QfWAGNDtw.6YOD4dVmVn4ZbIm	\N	\N	\N	f	2026-07-25 09:18:45.078	2026-07-25 09:18:45.078	2026-08-01 09:18:45.077	3099997e-e4d0-4b65-8b4e-07c8180d1a1b
801	2	$2b$10$HNrrAbzty3RKdWFcqAXPSeq/c.Tx7T7eOaOgin9EuA.vSLbCoocMq	\N	\N	\N	f	2026-07-25 09:19:19.24	2026-07-25 09:19:19.24	2026-08-01 09:19:19.235	92d5636d-9563-44ba-b448-d279ced2cb2f
802	2	$2b$10$WbNbs4wyXVYsN.l.UZTdLOKLojFQneqsLhRh2tKtbzPNmUQizgZ2G	\N	\N	\N	f	2026-07-25 09:20:12.582	2026-07-25 09:20:12.582	2026-08-01 09:20:12.578	0a67dc6d-a71f-48b9-86f0-f5058465746b
803	2	$2b$10$ex91bpYtNyAeerdPxparWO8mpdh/2e3zxKRDr0DeV.Uctjr40UNgC	\N	\N	\N	f	2026-07-25 09:20:31.271	2026-07-25 09:20:31.271	2026-08-01 09:20:31.267	8c2f017f-5bc4-431e-9e32-f46a0d21c63c
804	2	$2b$10$Y6INp9v/0ARqR4bawBGZs.gtd3h7f.vTWUdogy4.pPRMW76qYEc7G	Mobile Chrome on Android 15	::1	Mozilla/5.0 (Linux; Android 15; Pixel 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36	f	2026-07-25 09:20:46.312	2026-07-25 09:20:46.312	2026-08-01 09:20:46.311	7ad01120-c2d7-4a8d-971a-48645da04042
805	2	$2b$10$sH60MU37iNmHUtRHn5AGLeC80Hg3y9RdQfdkeXomfq5/Dj8nu4KzK	Mobile Chrome on Android 15	::1	Mozilla/5.0 (Linux; Android 15; Pixel 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36	f	2026-07-25 09:21:17.103	2026-07-25 09:21:17.103	2026-08-01 09:21:17.102	7a76fa7e-3570-4ba0-a8c9-c1194655de72
806	2	$2b$10$3M1hIO/305gtNKnCNMP3H.y2fhHeffymrFMb73hqZw2w0acc/iwBm	\N	\N	\N	f	2026-07-25 09:21:23.609	2026-07-25 09:21:23.609	2026-08-01 09:21:23.607	3432d259-c3a9-462a-b224-80ac377092d7
807	2	$2b$10$Z0sNzaD7JFMvwr1Y9SVSTeiemckimaHEGUPBRcCsuWgRv5MQrUoi.	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-25 09:41:48.715	2026-07-25 09:41:48.715	2026-08-01 09:41:48.711	5ae151a7-943f-4c17-ba72-247607efca26
808	2	$2b$10$11GrsjF/jF5od4lqSxvifeCJdscOZLjCoJGepJPYANMPVcR4CXPRW	\N	\N	\N	f	2026-07-25 09:44:01.182	2026-07-25 09:44:01.182	2026-08-01 09:44:01.181	1ce33ed3-1325-4425-ab14-e7adfc4e0c54
809	2	$2b$10$.VKhwnizQeuc6L03JuV4MuKjVmq5EsVg9bR/bQO.TofcciBrLCGNq	\N	\N	\N	f	2026-07-25 09:44:05.712	2026-07-25 09:44:05.712	2026-08-01 09:44:05.711	38d42653-266b-4c85-b5ca-e591ca19c9a1
810	2	$2b$10$em3AzYDduQZzP75mtZgBg.YpV0/FzGseX6FBkJC1kiuJyvyQjTDyu	\N	\N	\N	f	2026-07-25 09:44:10.494	2026-07-25 09:44:10.494	2026-08-01 09:44:10.493	d65224a1-3d59-4187-871f-7b8955136b09
811	2	$2b$10$seWfVabpjOqSXoCC8gxxRuZFoVUcHt0xY.QgNGzNRTPCts97RiCFu	\N	\N	\N	t	2026-07-25 09:44:21.425	2026-07-25 09:44:21.425	2026-08-01 09:44:21.424	e5ef357e-641c-4d8c-88e9-2bea25ced6e6
812	2	$2b$10$sYN7VDjXRCNa34ZKrJdFAOWtgfdyMMApKNVOn0bbjUWB4OwpsTZuq	Chrome on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	f	2026-07-25 11:54:02.216	2026-07-25 11:54:02.216	2026-08-01 11:54:02.195	02d76089-bd55-4d3b-9691-fe943ba5588d
813	2	$2b$10$hXrKqARpOpv72LuQvBPR6e/E5a1dE.RpzV5XpID0xPXc6ZzqOrUA6	\N	\N	\N	f	2026-07-25 11:54:13.396	2026-07-25 11:54:13.396	2026-08-01 11:54:13.394	a204b88c-255d-46cd-ab82-3b2390819ba3
814	2	$2b$10$lCinlqAcajdVz5S3iHsyLuwiQkFplP69i5e/dfjwk6qYaD2GT5Enu	\N	\N	\N	f	2026-07-25 11:58:53.607	2026-07-25 11:58:53.607	2026-08-01 11:58:53.606	c88081e1-e7a3-4237-90fa-0e85e07df56b
815	2	$2b$10$9NDdhQ3M0WPg6Z59tja8geyySijap/knF.85.ErOxz/zj4JCbtDGW	\N	\N	\N	f	2026-07-25 11:58:59.843	2026-07-25 11:58:59.843	2026-08-01 11:58:59.843	3485e12e-e684-4cb1-a0a8-93a2d2d175a0
816	2	$2b$10$mFLKWCm8c7IQhvQUv7wr5.RbL1aWi8uB8njW0.SsNdJhJjtGrXuzm	\N	\N	\N	f	2026-07-25 11:59:22.972	2026-07-25 11:59:22.972	2026-08-01 11:59:22.971	be813ecb-954a-4bc0-9078-58cf449485fb
817	2	$2b$10$cXhP13Mpc7dWTyeYo3Gequs2LboXRerBUUIyTzLB4QaURkmFV8QX6	Chrome on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	f	2026-07-25 12:01:48.405	2026-07-25 12:01:48.405	2026-08-01 12:01:48.405	d20d245a-bcd9-4854-8b5d-296df9f9956d
818	2	$2b$10$71TNVy4iBSZBIKL74K6tt.vkKIW0iOP1cwmiNrZAWJEGJStAO27v6	\N	\N	\N	f	2026-07-25 12:06:12.267	2026-07-25 12:06:12.267	2026-08-01 12:06:12.267	66b9b13f-c5a2-4b9c-b48d-4fa2b1c0b46f
819	2	$2b$10$pD9aKnSojjtipGraW0NXp.lvP2pkDuEw.R6fIobS2.YJ6XjOWMU8G	\N	\N	\N	f	2026-07-25 12:06:27.852	2026-07-25 12:06:27.852	2026-08-01 12:06:27.852	6e1ecbf3-ea30-4f22-a8a8-ab3fbce1a9f5
820	2	$2b$10$OhsajObez.gzlTCbej1GPOdkuZDpo4oPjuTchDWDzjVT0GDH/2J16	\N	\N	\N	f	2026-07-25 12:08:42.013	2026-07-25 12:08:42.013	2026-08-01 12:08:42.013	fef7676d-a669-40ed-95ca-b14bab2d7151
821	2	$2b$10$jIj3ZpI.urHAA7/6utdNbOqOcVEu4cln26PChuax6bLbagwqcWlSi	\N	\N	\N	f	2026-07-25 12:09:10.22	2026-07-25 12:09:10.22	2026-08-01 12:09:10.219	c2d359b5-ae34-4053-a61d-a0f2ad07bc13
822	2	$2b$10$XzTEv7pnNghylArnO2.k6.N0lniAyvAPgakIPJQq.lav1qQEamBA2	\N	\N	\N	f	2026-07-25 12:09:44.145	2026-07-25 12:09:44.145	2026-08-01 12:09:44.144	386fb9d3-153d-4dd8-b823-cc2559125f7a
823	2	$2b$10$Q9Le28W8zaNpW8znhSHiAuDII3Djs.IVSfOfleDz1XmcLlw0loSF2	\N	\N	\N	f	2026-07-25 12:10:06.859	2026-07-25 12:10:06.859	2026-08-01 12:10:06.859	a71c5afb-c253-4955-b0c9-bfd5b81b953c
824	2	$2b$10$w5s3dag6UXfmlRmmffPM5eR0gzC2iqNTW/pxa0FELi3DPu1rvt50q	\N	\N	\N	f	2026-07-25 12:17:03.687	2026-07-25 12:17:03.687	2026-08-01 12:17:03.687	070ded59-f0d6-4690-b9c2-e009292ced9f
825	2	$2b$10$SOzMdzIc5fpbjK6OgEGZKedBM4/IQOxWntpIyCHFOYVyVtZcoqy9i	\N	\N	\N	f	2026-07-25 12:17:15.294	2026-07-25 12:17:15.294	2026-08-01 12:17:15.293	b22ad48f-43dd-4e4e-9bd0-cd869c809d28
826	2	$2b$10$RhZ4k.4FcVEYBct6GOPmfuXg89isvqFY4CuAv.ppN5GvccT6ae9tS	\N	\N	\N	f	2026-07-25 12:20:09.94	2026-07-25 12:20:09.94	2026-08-01 12:20:09.939	5e83d8ee-fce1-43f5-be84-efd0cfebdae5
827	2	$2b$10$/4wFuog.tlWyGPcyqzoS1.aVV6kM7Ox3k8/51romP1HpDPxbIDEoO	\N	\N	\N	f	2026-07-25 12:20:12.842	2026-07-25 12:20:12.842	2026-08-01 12:20:12.842	cb590ea0-2b30-4b8b-b4a2-47afaad10e7d
828	2	$2b$10$m7gYfk3ySfXHDBXPCP8raepBefgzFvwI/1o0jPr6lN4ovCncmiWDG	\N	\N	\N	f	2026-07-25 12:39:48.385	2026-07-25 12:39:48.385	2026-08-01 12:39:48.385	6da15dd9-5633-469d-93e4-bd8d6590179e
829	2	$2b$10$fVk8ih3z2kqImqmoFg6P3OfbOfsGu4SVWaqtKW/0Gm2pyX5CKlORa	\N	\N	\N	f	2026-07-25 12:39:51.037	2026-07-25 12:39:51.037	2026-08-01 12:39:51.037	d36cc069-ca95-40a4-9d0c-109601d2b6eb
830	2	$2b$10$ToPrGjmwCNvgBJ7y87o4S.7HJ8DL1U9YcMAspzlU2jjmgyC1Ma4ry	\N	\N	\N	f	2026-07-25 12:39:54.079	2026-07-25 12:39:54.079	2026-08-01 12:39:54.078	14d154e8-6def-4eae-aa0f-282108feeacc
831	2	$2b$10$oZts7V6oSz88Sj9vN.AgGeKH.CNn5vjWF2NBFyUfGUBOC7Obyv0xC	Chrome on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	f	2026-07-25 12:42:48.275	2026-07-25 12:42:48.275	2026-08-01 12:42:48.274	5999fd18-8556-4dc8-969b-08ddd06776f2
832	2	$2b$10$GJktaf3vgN8qS0.pB9OZGerps78tdSfAPXKAJbkCYdvFsjhjlxDgG	\N	\N	\N	f	2026-07-25 12:42:48.942	2026-07-25 12:42:48.942	2026-08-01 12:42:48.942	651bfeb6-74fb-4c36-9852-2d711fde36e3
834	2	$2b$10$GuHdYxZh7gglTdwBO8Z4Rup6ki/NgLnzF9.OhtA3hddZG3Ep7hl5a	\N	\N	\N	f	2026-07-25 12:44:40.801	2026-07-25 12:44:40.801	2026-08-01 12:44:40.8	66f64355-cd0d-4f94-9fdb-4b0b5b76a402
833	2	$2b$10$OYER0d2epD9NIGi8msyIj..wNoUUF/HmHvehSZOJ/j7F.ZokOzgWO	\N	\N	\N	f	2026-07-25 12:44:22.394	2026-07-25 12:42:57.095	2026-08-01 12:42:57.094	ca7c29ec-8d87-40b6-b2b8-1af4682b7d06
835	2	$2b$10$O6U4ZCco9zSQlTqjol6SSOzHzmZbbni9H6yXmo4Dv5lQkV3vgNFbS	\N	\N	\N	f	2026-07-25 12:44:54.612	2026-07-25 12:44:54.612	2026-08-01 12:44:54.612	4144ba1e-a1ac-45ce-9431-88ca6f1009b9
836	2	$2b$10$RCRFiuxoljAocnjhIcEF/.NHf9k4rn8CXkh68/18XWtz9xdHc.4IG	\N	\N	\N	f	2026-07-25 12:48:45.538	2026-07-25 12:48:45.538	2026-08-01 12:48:45.537	c544631e-d3b5-42bf-b29c-550c9177c6b5
837	2	$2b$10$Ls7WtAcKjlhxPv3uUAEqzOZBs8Ds9he2KOBWbm7OHd/EMzlVmpb3q	\N	\N	\N	f	2026-07-25 12:49:13.223	2026-07-25 12:49:13.223	2026-08-01 12:49:13.223	b8fda10f-75d3-4bee-8b44-ccc7892abcec
838	2	$2b$10$rfii0B/ZigF2R4u.Wt4pkOr6oAYVqQhuXvev/1Aqg8Wl.TDBWRX/m	\N	\N	\N	f	2026-07-25 12:54:14.379	2026-07-25 12:49:35.122	2026-08-01 12:49:35.121	7edc6121-4b64-402e-a6fa-2346105324a9
839	2	$2b$10$BLcOXk9CEyb/FN/VokMJ8OTv5YGcF7p9KFTYB0lZc2CamgEoiajbi	\N	\N	\N	f	2026-07-25 12:55:58.585	2026-07-25 12:54:55.676	2026-08-01 12:54:55.675	4067a60b-ddb4-44fe-9052-5c11aa2c1990
859	2	$2b$10$fFx/VxXdfvsVYaCkG6RxU.a2xaGKGWTBlpt1WHJd8KGQW6r3WEkni	\N	\N	\N	f	2026-07-25 13:52:50.792	2026-07-25 13:52:50.792	2026-08-01 13:52:50.791	3dcc7568-9ec0-43fe-84e5-b624470519f6
860	2	$2b$10$yGEf57JW2Yuwlx2nEgGe.OFp9ZnZa93ayknu.TNpziTqgWSUkDec2	\N	\N	\N	f	2026-07-25 13:52:51.648	2026-07-25 13:52:51.648	2026-08-01 13:52:51.648	30261df3-f954-4451-83f8-2bde931c86a4
840	2	$2b$10$cKM9OKuzB/nDXVfGKF6xwOz2NyDll7r0A5u1RcL0tVMPD.quBjIUq	\N	\N	\N	f	2026-07-25 13:00:09.556	2026-07-25 12:56:14.139	2026-08-01 12:56:14.139	4bc6d9c4-ff7a-4627-b207-52c81be3442a
841	2	$2b$10$x/dEAQ/B4m0jSYuYUuDXLOw1Iuvvy58oxz/CfYLZght4xXgupF9bu	\N	\N	\N	f	2026-07-25 13:00:37.067	2026-07-25 13:00:37.067	2026-08-01 13:00:37.067	ecb3405c-c1e3-4ed2-8729-b0585fde591e
842	2	$2b$10$.XlqdUn3pveDGE9rW/hPy.WiZJIC/x6kKjzKKPtxHr7DdUyGgv/4.	\N	\N	\N	f	2026-07-25 13:00:40.133	2026-07-25 13:00:40.133	2026-08-01 13:00:40.132	43f1268a-7309-400f-b813-fd7330c178c5
843	2	$2b$10$luwon6ATBjpg3jmBGJI6z.pFNwttQN9rTM5n3Affei6LJ1w.qGTFO	Chrome on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	f	2026-07-25 13:01:41.222	2026-07-25 13:01:41.222	2026-08-01 13:01:41.221	44891eb4-1e75-4438-9211-c48ff37924d6
844	2	$2b$10$r8fbMOh/1RCEf7.1QjXpzevYBA8b0vfiS2xUu7HzeHt7eBPJV1bHq	\N	\N	\N	f	2026-07-25 13:31:07.715	2026-07-25 13:31:07.715	2026-08-01 13:31:07.715	d4cb1fb7-b5aa-49b9-9453-2a2007ef0f06
845	2	$2b$10$92pXfuiNGtSYQalE9wGuHueD2Fs9e.NzqbM4kqS.Tu8742LgriSka	\N	\N	\N	f	2026-07-25 13:31:36.148	2026-07-25 13:31:36.148	2026-08-01 13:31:36.148	d6f5377f-fab6-4a67-a3be-8db1cf25a61d
846	2	$2b$10$GPbC37BBxBkdnCZfj7GXBenCKHn5W3NiCMiY25crahP9qfLOblSK.	\N	\N	\N	f	2026-07-25 13:31:49.423	2026-07-25 13:31:49.423	2026-08-01 13:31:49.423	c180b785-8906-4b91-824f-ff66c1b427c9
847	2	$2b$10$N0CrqwdSOewR7kB/GoV9..Uj6DeP8NufzEgA7L2yT7WF0kdMnJQ7e	\N	\N	\N	f	2026-07-25 13:34:49.526	2026-07-25 13:34:49.526	2026-08-01 13:34:49.525	84611931-13b6-4fe1-92f8-c6af5c23671e
848	2	$2b$10$kGq00fl0z7heN.Nu2AUmg.HKxGMKiWXdoXjumIjkTMKb0sBcHosLK	\N	\N	\N	f	2026-07-25 13:36:46.607	2026-07-25 13:36:46.607	2026-08-01 13:36:46.606	a30ba1e6-fc11-4aad-9b39-cd2dfeb073e9
849	2	$2b$10$NhY5Vx/rBxjd2vrhZVXyX.bCPDGW5FVTEeefTdUUXB5rRu7KNqqTa	\N	\N	\N	f	2026-07-25 13:37:06.336	2026-07-25 13:37:06.336	2026-08-01 13:37:06.335	62f283c9-9772-4e5d-95be-a0f5ba9d8adf
850	2	$2b$10$qv.ACkTcKlWpgfC/iTqTAu4zxb2SXpvCOqXwsmVm62Uw4.8EuWJL.	\N	\N	\N	f	2026-07-25 13:43:11.19	2026-07-25 13:43:11.19	2026-08-01 13:43:11.19	043a8f63-e930-402e-92a1-a875f33ca7a6
851	2	$2b$10$W.rYDdN8JsVdQm3keRcF5Onxsa2fGry4mBVuq2pSXcoNnc7c09RWW	\N	\N	\N	f	2026-07-25 13:44:40.47	2026-07-25 13:44:40.47	2026-08-01 13:44:40.47	e10063e9-651b-49ec-b3bb-d75e693240d8
852	2	$2b$10$FQmKPyOahn9cufTYcg8f4eZZZSYiKYkLqoPao0EnykbuBnZML9INa	\N	\N	\N	f	2026-07-25 13:46:19.603	2026-07-25 13:46:19.603	2026-08-01 13:46:19.602	fa0ea0d3-d872-4c17-82b2-86de43d003b6
853	2	$2b$10$w1XNerszmTCRLCOusVz1Xe/hbM.53o1DzKmuj5M7lZtzGUovRhZY2	\N	\N	\N	f	2026-07-25 13:47:35.879	2026-07-25 13:47:35.879	2026-08-01 13:47:35.879	0a558304-040c-4519-8f5e-874a0f7f83de
854	2	$2b$10$t2R/UUoqGwYfBHTNk5GDPuYuyyeEeAMd8tv0VZ2eyLVqiGW3DG8Z6	\N	\N	\N	f	2026-07-25 13:48:01.456	2026-07-25 13:48:01.456	2026-08-01 13:48:01.456	6fb52c1c-db17-4ead-aa86-3f496694bbb5
855	2	$2b$10$mobWejW.XZW7LXu7dCPzL.oGeMy883S9lwmxaQqlgyzm88n42lcfa	\N	\N	\N	f	2026-07-25 13:48:17.861	2026-07-25 13:48:17.861	2026-08-01 13:48:17.861	2e20191a-87a1-48f3-8e76-891f0ecd1e9a
856	2	$2b$10$nKopKiPofX0MbRAcB4z8huyvfsz7xBfmO/EqYGyqr4XQzrkjdo/Qi	\N	\N	\N	f	2026-07-25 13:48:27.394	2026-07-25 13:48:27.394	2026-08-01 13:48:27.394	968121c3-1cd0-4c6e-8028-2332800a147b
857	2	$2b$10$KfshtGf/FSZI9AAnwtnYRuSHdkfnNS9EDdtpWoP0lAsH8sj1J0WCG	\N	\N	\N	f	2026-07-25 13:48:31.43	2026-07-25 13:48:31.43	2026-08-01 13:48:31.429	e74364fd-54b9-4026-9173-c1ea1e6efe3d
858	2	$2b$10$sZcQE8BTtxgd0nATTTPbB.jYN5ln.HQPh5oopQJDpuqtmHt7DK8Nq	\N	\N	\N	f	2026-07-25 13:52:34.884	2026-07-25 13:52:34.884	2026-08-01 13:52:34.883	1ba92640-0e48-4294-a39f-cd03e230305c
861	2	$2b$10$kAZ.iwxIjqkQ78CUoA9lLOq5h7a4Ru6JMWrch/g/d.eUM8dJEYK7m	\N	\N	\N	f	2026-07-25 13:52:53.45	2026-07-25 13:52:53.45	2026-08-01 13:52:53.449	2c3d97ef-aa2d-49a2-8215-652b323fbc4e
862	2	$2b$10$2S.EuyGvwND1B99H7YNSGuQmZdjoC2EfP8mq23TRvMA0/2V4IhgOq	\N	\N	\N	f	2026-07-25 13:52:59.418	2026-07-25 13:52:59.418	2026-08-01 13:52:59.417	b651ea3c-13f0-4552-bbb8-cf634019fed6
863	2	$2b$10$G6RT.lRtL.p8c/SA4yCZQeok7m5ARTSI0Kp.KstxXxzlCy3KmeaK2	\N	\N	\N	f	2026-07-25 14:04:23.683	2026-07-25 14:04:23.683	2026-08-01 14:04:23.682	fef761ce-df66-4c6d-a989-38b4405940e2
864	2	$2b$10$XiFDJ3jYhFon/MIfOytAXuZC0k.GWh2qs20tptU4G3Lvxvewj71m2	\N	\N	\N	f	2026-07-25 14:07:34.129	2026-07-25 14:07:34.129	2026-08-01 14:07:34.128	1b1abb38-51e1-4abb-ba0e-8e1d7a5da92b
865	2	$2b$10$iWp80EkuKTLX9QXeRVk9VuwrOM8JPY.5s1ZxdXmB.BFZMFKZ6omda	\N	\N	\N	f	2026-07-25 14:08:02.102	2026-07-25 14:08:02.102	2026-08-01 14:08:02.102	0aee5ee8-791a-4556-b7fa-d8fc176bdffe
866	2	$2b$10$.ZwAO8bI6qdrvCxirJHf4OESHMM8vkHvGPwpcuLcJ.ywJQDOWzHli	\N	\N	\N	f	2026-07-25 14:12:12.303	2026-07-25 14:12:12.303	2026-08-01 14:12:12.302	ce097db1-0e54-4846-ad07-44df9edf82de
867	2	$2b$10$6YjtMqO1D7F/Mehlqpig5eFilAqeoKNJOPEfXrdEgutF8APs8uwcG	\N	\N	\N	f	2026-07-25 14:12:40.62	2026-07-25 14:12:40.62	2026-08-01 14:12:40.62	ad9250f0-ed53-4296-aa6a-afffd35dc6d5
868	2	$2b$10$m0Kl1Zeo5nlyZTGHQNKKOOp34HWSXGwreykymi0yFPxvl9VIoWrWi	\N	\N	\N	f	2026-07-25 14:12:50.708	2026-07-25 14:12:50.708	2026-08-01 14:12:50.707	3f0b4f0e-5423-4c66-8b37-b68353b3c9de
869	2	$2b$10$74pVJ2GybgY/op1ZBeC2wOSChtMouSkUpqYM9NQ0gMwpot.lxM.Nu	\N	\N	\N	f	2026-07-25 14:13:14.359	2026-07-25 14:13:14.359	2026-08-01 14:13:14.358	82d56ed6-55c4-4029-9a4f-1d3c54576e7b
870	2	$2b$10$sf5eL4f19zk2TRUSu8mwv.hf2BKvkLiA4Cz08hyVPd3585/Hs5YB.	\N	\N	\N	f	2026-07-25 14:14:30.271	2026-07-25 14:14:30.271	2026-08-01 14:14:30.27	020fc6fe-d5b1-486d-ab51-473877dfcb1b
871	2	$2b$10$yvQhj5kpnggu7iZ9KbDzGOsXm..ArnzuNgBr1Dx7OGE6pPhS1O15C	\N	\N	\N	f	2026-07-25 14:22:58.808	2026-07-25 14:22:58.808	2026-08-01 14:22:58.806	1ecc782d-9f14-496f-a8b6-cce19ab4ec46
876	2	$2b$10$26bCpjvtIyOrjcrEvsq/3.9gZTmgtAHHiLw7H5euOD60kD2AyFsU6	\N	\N	\N	f	2026-07-25 16:05:22.26	2026-07-25 16:05:22.26	2026-08-01 16:05:22.249	a3834e5f-e3bd-45e2-9df4-b9a8debebe78
873	2	$2b$10$5/SLHuevK8TmNFEnk5ffA.f5NIDllns9qAb550/1hib0migc340Km	\N	\N	\N	f	2026-07-25 14:33:18.948	2026-07-25 14:31:02.741	2026-08-01 14:31:02.741	99f69e34-ec3d-4c52-840b-f3b14cc76f2a
872	2	$2b$10$SyVHVcs.3BFik.jSlHWNzeVdhDQHptscwoAA.504MKQ63V3xxFsEO	\N	\N	\N	f	2026-07-25 14:29:21.738	2026-07-25 14:23:23.763	2026-08-01 14:23:23.762	fb6bfb51-2137-433e-b371-02457c0f82e6
877	2	$2b$10$nbYKF1ByOxeQ2ZUBt/BMEOZMCJvSUMfDjO.qudqiAjQR5HPF9oNUq	\N	\N	\N	f	2026-07-25 16:08:07.959	2026-07-25 16:08:07.959	2026-08-01 16:08:07.959	9a9dc3dc-9a6e-48e0-b131-e0d9b8c6aa56
875	2	$2b$10$sGo/WBwB7o42UIhOkXVH0OenIOd9v6.wdmfy8xRfT3fPug.t51gEC	\N	\N	\N	f	2026-07-25 16:01:40.187	2026-07-25 15:50:17.865	2026-08-01 15:50:17.864	b5e34e29-02e5-4835-a211-ffb4e3db0066
874	2	$2b$10$B5rdw42vlT3ukEdcTtBiXeWtanR8xY.SWzCFIzuiFKnoLZtTsStce	\N	\N	\N	f	2026-07-25 15:50:09.826	2026-07-25 15:42:22.531	2026-08-01 15:42:22.531	02d19ceb-159b-4b02-b0c4-7d0c39ecd9e4
878	2	$2b$10$.hoPXrBOXJ0M7pFr.E3fAOlumW.TGp9Vp1DQXlr5KuCD6dAKH/hu.	\N	\N	\N	f	2026-07-25 16:08:22.703	2026-07-25 16:08:22.703	2026-08-01 16:08:22.703	c6505eeb-b0d3-40d6-b2b6-3dfe53de87bd
879	2	$2b$10$AHOk2mYszjSoVewGNOQc1eFm4AY25hMRAxsEXYuoVpIfHrOHWzF0y	\N	\N	\N	f	2026-07-25 16:08:25.842	2026-07-25 16:08:25.842	2026-08-01 16:08:25.842	7f490afc-37cf-41bb-9bad-20ea9b489e83
880	2	$2b$10$UfFGRzDqz9N3bReVyMZR1uXuMrZzMVmo2PcNSmKH9DnEsf.cAuWlW	\N	\N	\N	f	2026-07-25 16:08:49.184	2026-07-25 16:08:49.184	2026-08-01 16:08:49.181	8216094e-f9b8-4e6c-8cd5-b68c16ffc56b
881	2	$2b$10$G/y7R.p2K.3862DHMKjVaOdbzWOOmc3qLgZeXqU43wDovFdTueT62	\N	\N	\N	f	2026-07-25 16:09:10.847	2026-07-25 16:09:10.847	2026-08-01 16:09:10.846	e703c81c-1484-40d5-adfb-7408fef75941
883	2	$2b$10$Wc9UtfI2.cgo4vQn.4f7hegQ85vM5Yx0vqeH4O6m0yUWgWArUlc2e	PostmanRuntime/7.55.1	::1	PostmanRuntime/7.55.1	t	2026-07-25 16:34:52.748	2026-07-25 16:34:52.748	2026-08-01 16:34:52.731	394cd374-5663-48d4-8638-19feb78af17b
882	2	$2b$10$sgwMh6OyHfSshJq3tmowF.QEZ78brONtgFJ/IaoKBK3W13tn.20TK	\N	\N	\N	f	2026-07-25 16:09:14.763	2026-07-25 16:09:14.763	2026-08-01 16:09:14.763	cbe9eaef-c182-42a8-9ebc-a5714631d67d
904	2	$2b$10$j72BHjObFW4i1khMhsaRYuBB..GL0/EtFDfdXE0ldnyNpxilWwQY2	\N	\N	\N	f	2026-07-26 06:06:21.502	2026-07-26 06:06:21.502	2026-08-02 06:06:21.502	65c895f7-eb36-49d2-bfb0-5da880843610
884	2	$2b$10$2rT3.cezlx69T44.X0W66OGUu6/p0pLxoupidmSU7hhSPl.pbxSwS	\N	\N	\N	f	2026-07-25 16:54:54.468	2026-07-25 16:43:43.706	2026-08-01 16:43:43.704	ee9196d6-0164-4808-8bdd-e368b8487331
885	2	$2b$10$Wr2X1idDq6jXz1fR/RwtGeoIDccTyl0I6G8ckABuT6x09.4YvZD2e	\N	\N	\N	f	2026-07-25 17:00:00.771	2026-07-25 17:00:00.771	2026-08-01 17:00:00.771	66d11a68-6e9f-4a40-ba13-0b26d69fde23
886	2	$2b$10$aG4tInzijOCCn6zx0spasOCdY.YcAcGwQ98AGAGKn.y8LPL0wC3Gi	\N	\N	\N	f	2026-07-25 17:01:33.949	2026-07-25 17:00:23.4	2026-08-01 17:00:23.399	fb3ce880-a2bb-46a6-a464-ecb533dbadec
887	2	$2b$10$mjCZKrUCWRJq0NzckFN92u5Ztmp96HSJ.j2nF7O9V275KZHAlxH02	\N	\N	\N	f	2026-07-25 17:02:09.373	2026-07-25 17:02:09.373	2026-08-01 17:02:09.372	0e568137-0f8f-41bd-8b7f-77cf96af3cb6
888	2	$2b$10$J/n4aEk2bn9c9qDSUYvK1.Fz20vnJM/D8h2nPh4X8o/aY9bUorNdO	\N	\N	\N	f	2026-07-25 17:02:30.314	2026-07-25 17:02:30.314	2026-08-01 17:02:30.313	ecc1ac0c-3409-41ba-97eb-d13c219bb761
889	2	$2b$10$4VAD31eRxLYwSM9CAONkNubm4LtC/Q0YWYCKGZ8RKwA8DIOD2Ohc2	\N	\N	\N	f	2026-07-25 17:02:41.96	2026-07-25 17:02:41.96	2026-08-01 17:02:41.959	9e76c465-68dc-484e-b209-b5112d9e7e95
890	2	$2b$10$SjQh9UycnK1D.APOuof6CeJ.IDFx0195jgRz861uxak1oKe9UoUPq	\N	\N	\N	f	2026-07-25 17:03:03.44	2026-07-25 17:03:03.44	2026-08-01 17:03:03.439	473838f6-663e-4a2c-a7fe-9750500e004d
891	2	$2b$10$WMKzo5WdQiOFK.zOYZE1R./KV3JYn0Twr28pIblswjDJRHi7Z.6hu	\N	\N	\N	f	2026-07-25 17:03:26.969	2026-07-25 17:03:26.969	2026-08-01 17:03:26.968	03dc4da7-0de3-4d89-a626-68a906c85346
892	2	$2b$10$dacCCe7s0lm82NxmDY2CZeRDzZpmwytZNHS5AAfr3oqgVFNPYc/zO	\N	\N	\N	f	2026-07-25 17:03:43.234	2026-07-25 17:03:43.234	2026-08-01 17:03:43.233	b3d11151-d85c-4f95-b407-722554c31421
893	2	$2b$10$eXRICNSohbuLYavINO2g7.557zE3wgAo83gVqJnQsz6dMnPBFagtS	\N	\N	\N	f	2026-07-25 17:05:37.374	2026-07-25 17:05:37.374	2026-08-01 17:05:37.373	c5fc3598-a75d-4b9e-99ff-9a2151d4e569
894	2	$2b$10$rhLHpGtr2W2kD6R0zu4xoO0Ane0IiUBbOS1ZksiCwWKrO8uznDwUG	\N	\N	\N	f	2026-07-26 04:15:05.05	2026-07-26 04:15:05.05	2026-08-02 04:15:05.039	94c8f046-83ad-40a2-ba81-d31819cfa20d
895	2	$2b$10$kmjEuF6Sd2GO79AlAzILFuInUwOMf/HpsOZyyNnknSkMh4WDC4azS	Chrome on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	f	2026-07-26 04:15:34.069	2026-07-26 04:15:34.069	2026-08-02 04:15:34.067	154e5648-b51b-49bc-a9a8-350fe9d72b17
896	2	$2b$10$xcTY0696AnFDpLVbTVh61em4CfXIMXoA.sQagQmiQl6WmT/XFw/XC	\N	\N	\N	f	2026-07-26 04:18:10.423	2026-07-26 04:18:10.423	2026-08-02 04:18:10.423	ef7e10fa-dac6-4662-ace0-3bf394dab492
898	2	$2b$10$F0newAQevqBfuahWqjjGPu2kFlHr1UGXZJJLznIiyahNoaGFe37vS	PostmanRuntime/7.55.1	::1	PostmanRuntime/7.55.1	t	2026-07-26 04:24:44.203	2026-07-26 04:24:44.203	2026-08-02 04:24:44.202	b179eaf6-e759-4ad1-951b-a002fb958f8e
897	2	$2b$10$fMa6xbQGQ6o0M29M2exqm.nuR3Rlt.93QcHYTHTwyMJ8TirSxefUe	\N	\N	\N	f	2026-07-26 04:18:53.047	2026-07-26 04:18:53.047	2026-08-02 04:18:53.047	3d1cb01e-0311-46e8-9c2b-496e143b1e4f
899	2	$2b$10$PHg4vYAuqZEWTuGaS70/h.hJ4Kj.YY8Ou9njEQwbqo5Kyo6siaB1a	\N	\N	\N	f	2026-07-26 04:54:31.051	2026-07-26 04:54:31.051	2026-08-02 04:54:31.05	03a09338-73d2-4b4a-b6ae-57078ad2ed9d
900	2	$2b$10$g8Mqna1iOC5N/aaNbng/MuCZp9coPy9O9JVOOK66SntGukGF.7KJe	\N	\N	\N	f	2026-07-26 04:58:27.835	2026-07-26 04:58:27.835	2026-08-02 04:58:27.834	fa1a0a58-c3fd-4eb2-9215-745a9d2d02fc
901	2	$2b$10$c.cBXZkeT0umHKR0lKuHd.LhkV/I3uqcAC82/GtUZJndph1pcY/3.	\N	\N	\N	f	2026-07-26 05:23:21.289	2026-07-26 05:23:21.289	2026-08-02 05:23:21.282	13557bde-3917-4d9f-8c5d-46053a61adec
903	2	$2b$10$CB/D144MXEQxsK9IMi3cYedZ0Yt3VPhLXMxzHvirGZm6tYcpeL8F2	PostmanRuntime/7.55.1	::1	PostmanRuntime/7.55.1	t	2026-07-26 05:40:44.273	2026-07-26 05:28:54.718	2026-08-02 05:28:54.718	87efc99a-6ca3-4d8a-ab5b-7af773679ce0
902	2	$2b$10$6CQIR6TmPV3Ssk.x1gWWy.HViy3UMW4yIrQrNOfE3H3lNnidiYYwW	\N	\N	\N	f	2026-07-26 05:25:52.989	2026-07-26 05:25:52.989	2026-08-02 05:25:52.988	17da808c-cf12-46fd-af55-df8f4d70216c
905	2	$2b$10$hYtxXR9TvW/5k5UXpVetguNyxsxBcrPArv7L8p/nbtHcNx7MiWyqe	\N	\N	\N	f	2026-07-26 06:07:00.244	2026-07-26 06:07:00.244	2026-08-02 06:07:00.243	9fbf8c62-d243-4cbc-9bcc-04bd0e449aad
906	2	$2b$10$50duttzXO.SGsGK9urs20uPjlrS89CIuW4I7tfZs1O4KLcUfJ0q6e	\N	\N	\N	f	2026-07-26 06:07:59.417	2026-07-26 06:07:59.417	2026-08-02 06:07:59.416	d819b063-abe2-47de-912a-57f1917455a9
913	2	$2b$10$YxfxYXFOf9rXpS7E4IgWSuMaxMmiDjTjHS2/.5lU7x1//vzDhl5aa	\N	\N	\N	f	2026-07-26 07:31:36.492	2026-07-26 07:31:36.492	2026-08-02 07:31:36.492	1bb46a39-8bdf-4d87-a47f-88b98d7d1661
907	2	$2b$10$UX3H4IluKJsEsHR6SvDfk.m6VuHQqYUxXAeMc0GaZUjV1hW5w4.Iu	\N	\N	\N	f	2026-07-26 06:12:19.525	2026-07-26 06:08:09.652	2026-08-02 06:08:09.652	54740e97-d23f-4ef3-9418-a1dcd7f2dc15
908	2	$2b$10$tt9aK1HwNLM/8aEHGOkCbuKB3SX9wo/DsNvabXyhdO0pzM5bf40vW	\N	\N	\N	f	2026-07-26 06:14:42.557	2026-07-26 06:14:42.557	2026-08-02 06:14:42.557	92ef7eef-8f9c-4535-b8b1-1855ca4491df
909	2	$2b$10$jpojBVY3SXddjpHDIs9shuwhUDp85PIKbiaPpSk5ysyQPbPZ6Kkf.	\N	\N	\N	f	2026-07-26 06:14:55.641	2026-07-26 06:14:55.641	2026-08-02 06:14:55.64	f81a84be-5b78-4c39-8901-abe711c16f09
910	2	$2b$10$GPBYUn9JdVUdok9FtL/uXuvlgtqEOlnnUYL0VPtKpw1Q/vIdehMFW	\N	\N	\N	f	2026-07-26 07:25:43.491	2026-07-26 07:25:43.491	2026-08-02 07:25:43.478	e671b579-1c2f-4552-ac84-fb4547c11264
911	2	$2b$10$yY1/8XzdlypA73kD4zGPweeBbEuFx6imPSxiKCRxuxrMcDhxl2x82	Chrome on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	f	2026-07-26 07:25:58.299	2026-07-26 07:25:58.299	2026-08-02 07:25:58.296	f0ea105a-2274-4695-a500-335dd6bf8504
912	2	$2b$10$Vd6tHzqg7yuT65iejQuyu.MFhc4D25BMUIu8vRuflHPaIywqyFrDm	\N	\N	\N	f	2026-07-26 07:31:21.944	2026-07-26 07:31:21.944	2026-08-02 07:31:21.944	eb3ee01d-7cf9-4155-a789-7b3eb1d52418
914	2	$2b$10$q/shkO1s3l5ukPmR2tNex.vi5OABnKmGukyaBpkmtG/bwYI9MXX7W	\N	\N	\N	f	2026-07-26 07:35:13.663	2026-07-26 07:35:13.663	2026-08-02 07:35:13.663	c610c137-d49e-4982-8e7e-473444787049
918	2	$2b$10$vLb6mN6lqEOYdbQ4qFV1kezEKAaJq1d0z3WjUHnrAUjJ2Bb5oCYCK	\N	\N	\N	f	2026-07-26 07:42:33.092	2026-07-26 07:42:33.092	2026-08-02 07:42:33.091	6c762cb2-d498-4de4-b9b9-77358aa1c7df
915	2	$2b$10$vIkgFDqY2sdNyK7JszOHjupl.rMqcx2WiR3oZ.7Jg0l4BG5ItRfiW	\N	\N	\N	f	2026-07-26 07:38:46.889	2026-07-26 07:35:25.626	2026-08-02 07:35:25.625	ab7106a5-ec8c-4d2d-aaf5-a777eb5dc294
916	2	$2b$10$YD0KUfaCO24BYxjcAQQkr.yiGG5Q6fehdPhY96QjoRhAIFkNMtvnG	\N	\N	\N	f	2026-07-26 07:38:48.297	2026-07-26 07:38:48.297	2026-08-02 07:38:48.296	db594097-f886-4016-b70a-c507c758e42a
917	2	$2b$10$xCU6OampSSKlDIafBc.kgu1O1qZnVJ2GkjZYLtQWdtFICOC99aoMu	\N	\N	\N	f	2026-07-26 07:39:04.788	2026-07-26 07:39:04.788	2026-08-02 07:39:04.787	056892d6-de1f-412c-bbec-3538f8083843
919	2	$2b$10$y5YSirN0Uu2Pp0y4wHugEeNuzlirpQI1C2zhFXnEaWR3LtPoHGMFa	\N	\N	\N	f	2026-07-26 07:42:42.124	2026-07-26 07:42:42.124	2026-08-02 07:42:42.124	8578f230-96a3-4a20-b6de-8c459ce6b1ac
920	2	$2b$10$8ElMleP9nf67IgnkJe9xA.VL/VIKukyEUQRxR/en9JMTbzW5kmita	\N	\N	\N	f	2026-07-26 07:42:46.166	2026-07-26 07:42:46.166	2026-08-02 07:42:46.166	e2a08a9f-daa5-4129-adf3-de9503f8d6e1
921	2	$2b$10$1FNzKeDm6XuARSUsyANJxucVZvzJoXOBMXoGmxCPLmpVGi2VFVMyi	\N	\N	\N	f	2026-07-26 07:43:05.584	2026-07-26 07:43:05.584	2026-08-02 07:43:05.584	f1c30442-62a0-47dc-887b-4352deea2790
922	2	$2b$10$cV9oZHFCNQz3dRZVXo2uPOM0sG8oIEMw8ggEjcDmo/rQZ4mjGpsJO	\N	\N	\N	f	2026-07-26 07:43:29.669	2026-07-26 07:43:29.669	2026-08-02 07:43:29.669	b5102fb9-5f7d-4b33-855c-d9aac8769981
923	2	$2b$10$egu4Qh4YWjTr/7czt73P9.OPCEN0VZg3q11N/5Mu/Knv.h5nL8DV6	\N	\N	\N	f	2026-07-26 07:44:18.06	2026-07-26 07:44:18.06	2026-08-02 07:44:18.06	572e82b7-3d7a-48d1-b2da-9037fd129dd3
924	2	$2b$10$61hlhnzXMBKhEjHgDDxk.ehBDCsyKF7x2VaIEg088mOdASGSurBPG	\N	\N	\N	f	2026-07-26 07:46:56.716	2026-07-26 07:46:56.716	2026-08-02 07:46:56.715	98ab31ff-188f-4b28-ba68-5c83d8259bd0
925	2	$2b$10$KLbuiap9Roh2hSbrVL19FeEezI8Tox1HVQUU9otERR4uU9zfJhG/O	\N	\N	\N	f	2026-07-26 07:47:33.317	2026-07-26 07:47:33.317	2026-08-02 07:47:33.316	c23fbff1-7dcc-4c00-8ef6-13d89c9d92ce
926	2	$2b$10$D9aZEG81q15DFm6rW04TweplezVmrRORG4vBzyGc8WwSLzmNpt4JO	\N	\N	\N	f	2026-07-26 07:47:59.245	2026-07-26 07:47:59.245	2026-08-02 07:47:59.244	6daeb841-e237-4d58-89bf-722dba2a699c
927	2	$2b$10$MOO.8yy7r9lbRp6PhJ0dzuhgF5hs6dYTzO5mCoipBC3dcHPic0JZC	\N	\N	\N	f	2026-07-26 07:48:25.796	2026-07-26 07:48:25.796	2026-08-02 07:48:25.796	7b4b3475-6ef8-439c-b8df-7880fc266e7d
928	2	$2b$10$409iY8LhSTSrjTK0nkOMtO7dzEx/wlU73Rl9DzYZXXxfb.vFFScoW	\N	\N	\N	f	2026-07-26 07:50:04.792	2026-07-26 07:50:04.792	2026-08-02 07:50:04.792	b7d78a26-9e74-47bb-ba8e-eecf20820695
929	2	$2b$10$HuLaREvrSyG8ZbNy0DaoKu27xyZcGzxYlR8JwugKsRQhIf7uNqCc6	\N	\N	\N	f	2026-07-26 07:51:41.296	2026-07-26 07:51:41.296	2026-08-02 07:51:41.296	db395567-f0c8-49b8-aede-c31cf9426ede
930	2	$2b$10$3uAjPAP2xlpc3BJaP5iw8uj4nJgJyNPPac2Y5GvK3DoF1FgYBZ9fu	\N	\N	\N	f	2026-07-26 07:53:06.201	2026-07-26 07:53:06.201	2026-08-02 07:53:06.201	1178a4ea-6265-46a7-9575-468d6752f930
931	2	$2b$10$UjlzLzwzYF2WLyRiQTb5j..PjPvpvWDi3wfkjqxBaXRZ9r9xSmK9a	\N	\N	\N	f	2026-07-26 07:53:51.635	2026-07-26 07:53:51.635	2026-08-02 07:53:51.634	0db1e71a-fcc9-4b94-a416-4f531292f597
932	2	$2b$10$3FxTIaHhqBzmuj7048Dq6ul7RzEjwmuw0KEMOdTK1nJi1oAQUA.fC	\N	\N	\N	f	2026-07-26 07:54:03.684	2026-07-26 07:54:03.684	2026-08-02 07:54:03.684	dcdb2a4c-cd53-4031-855c-d5fdb30f110f
933	2	$2b$10$QVYuxLcJKl4z3F6mkletn.pBkb9I8g358Wn1AwLhGlcd0DyHd.xxa	\N	\N	\N	f	2026-07-26 08:56:35.593	2026-07-26 08:56:35.593	2026-08-02 08:56:35.592	8e78f03c-10dc-4660-8349-0faa667828ef
934	2	$2b$10$/jx930ZlUX91TtClHAAiIOwAG3QQvLJfYtFb4hnVl2Tlh5Ob4r9MO	\N	\N	\N	f	2026-07-26 08:59:10.61	2026-07-26 08:59:10.61	2026-08-02 08:59:10.61	342feda4-bc95-44af-b1f8-3eed5c35a491
935	2	$2b$10$2s9DEn8SGEb43irUx7pq.OpK93aXOSCAujQeIa4qZXWex0.qz1l0.	\N	\N	\N	f	2026-07-26 08:59:22.235	2026-07-26 08:59:22.235	2026-08-02 08:59:22.235	4f9462dd-5018-488b-b8b3-f0df2510ed86
936	2	$2b$10$HDiqyKiRfKsnrg4tnrxIfOaEwZBaRzogQqmVvYiOBZomTmTq/LHSe	\N	\N	\N	f	2026-07-26 09:03:49.155	2026-07-26 09:03:49.155	2026-08-02 09:03:49.154	c28f7cf8-610d-4e08-9609-0141af8d064b
937	2	$2b$10$N4EHgjyKxFuvm9W7UxD3a.oDaMelAWjm4DcEVwToPKyRfBgk8NiOW	\N	\N	\N	f	2026-07-26 09:05:01.932	2026-07-26 09:05:01.932	2026-08-02 09:05:01.932	69dfdbcd-b556-4916-9f34-9b60e7eb8bb8
938	2	$2b$10$9Ujsq2yIAMTziGD/lHOCaOskNbxJSPHRnfXC8z2baXqNWJUy9Pmfm	\N	\N	\N	f	2026-07-26 09:06:33.978	2026-07-26 09:06:33.978	2026-08-02 09:06:33.977	144729c3-1642-4202-a3b8-fd2376434201
939	2	$2b$10$JbpobqWLf5G4mGjG5qg.kez8x0x30CBkNMQlvkn5hNZ/zuL1uaxlG	\N	\N	\N	f	2026-07-26 09:07:33.818	2026-07-26 09:07:33.818	2026-08-02 09:07:33.818	26be5abe-22ae-47ed-b420-29138ec5b19c
940	2	$2b$10$TFkN8onRyIjJU4AcJnAzwuRMySA07tUoVt.PEcVMResBtaPMeAOT2	\N	\N	\N	f	2026-07-26 09:07:46.115	2026-07-26 09:07:46.115	2026-08-02 09:07:46.114	31ea3381-98fb-46a3-9d88-59f4da019280
941	2	$2b$10$BMmjAsd4tvaGQs2IBnY9M.Oq6GOz2UCprft8LIxYwQPFtBpyAD/za	\N	\N	\N	f	2026-07-26 09:08:07.446	2026-07-26 09:08:07.446	2026-08-02 09:08:07.446	c652a080-3803-4db4-b57d-cf5b3afa3247
942	2	$2b$10$hxbEL8.N2uJE7hn.55i41OHDybLwkrMYjLMFSqCGNGJVrwFGuPB9q	\N	\N	\N	f	2026-07-26 09:08:22.212	2026-07-26 09:08:22.212	2026-08-02 09:08:22.212	d6efe9b6-b93f-4bec-acd0-d293e1be92a7
943	2	$2b$10$zcnUY.0zwsDJNKgLsB.9QeQ18F60iMimxihAzmjDQVEVmHwUonpR2	\N	\N	\N	f	2026-07-26 09:11:04.39	2026-07-26 09:11:04.39	2026-08-02 09:11:04.389	300ea6a4-5168-4c1d-8d9b-81e132def912
944	2	$2b$10$sv5wk83Y0VJw/lSu8et3P.gA/3IpGprx02TidXOM9pbU4P0Sd8aEm	\N	\N	\N	f	2026-07-26 09:11:30.844	2026-07-26 09:11:30.844	2026-08-02 09:11:30.843	74d8d06b-a1d4-412b-9bc4-18e7e820d5b9
945	2	$2b$10$UpqItCnQRuB27cYOb8bRTOXiIO75GpjRRgdX9QPeU1k10vxy0MXqq	\N	\N	\N	f	2026-07-26 09:13:44.283	2026-07-26 09:13:44.283	2026-08-02 09:13:44.283	6c61ee12-7cab-4870-bc9f-31fb47f7a89e
946	2	$2b$10$RG1FLUSGO7eAlo079grznuwWoZz94H0.gACfXM.axt/Yf9ZpFGPG2	\N	\N	\N	f	2026-07-26 09:14:04.087	2026-07-26 09:14:04.087	2026-08-02 09:14:04.086	3c3cec90-d7f2-4da5-bf4b-56cddec5ce72
947	2	$2b$10$ZJ7qEnkWklTnr93MAH27luckmf44ivPgdY5YpwaHTQRAOnnFMxt8a	\N	\N	\N	f	2026-07-26 09:14:19.671	2026-07-26 09:14:19.671	2026-08-02 09:14:19.671	1649ae0d-12bc-4677-af02-06164772404d
948	2	$2b$10$3SUDiRtDSijnLUnGMzQW0.A.fbMpp9yYNhl/gWF6CMvC/u6ziScWW	\N	\N	\N	f	2026-07-26 09:14:46.199	2026-07-26 09:14:46.199	2026-08-02 09:14:46.199	d425353c-fcbe-4950-83b4-65bb4d395448
949	2	$2b$10$pMq0CyfTU2A3vXN9NfakFu8LbofQEaUKi4X9afKEvKNPrJWjsv8cC	\N	\N	\N	f	2026-07-26 09:16:06.388	2026-07-26 09:16:06.388	2026-08-02 09:16:06.388	877cc056-3bb0-4075-b813-3e9bd200e143
950	2	$2b$10$ep7usMN/i2UoPO6Jc3DSlObGPMikw.LcHReSnv0jhSpx9w/9q4kAy	\N	\N	\N	f	2026-07-26 09:27:29.649	2026-07-26 09:27:29.649	2026-08-02 09:27:29.649	f0c4b7b3-196c-4947-87d2-8e72f731590d
951	2	$2b$10$gPzNVFSXUFu2uoIFa.cb3OI54nSmqbpwt6cA2RdMTBNrEt0CfXXP2	\N	\N	\N	f	2026-07-26 09:31:39.015	2026-07-26 09:31:39.015	2026-08-02 09:31:39.015	9d94bdd5-98df-4f6e-94fa-7b19d24c05f1
952	2	$2b$10$xyHcPY.M5YBp7krj9tUtpeOYj3kwXNpHTfEVYA9TbW0kI6BZseODy	\N	\N	\N	f	2026-07-26 09:33:46.413	2026-07-26 09:33:46.413	2026-08-02 09:33:46.413	fedfb8d9-ba2c-4d81-bc61-860559823b6b
953	2	$2b$10$91zK2voVELvD9KC9ZZ7JTOlSrqozK830zuZWMNjDJ1yCGNo.AewNe	\N	\N	\N	f	2026-07-26 09:49:21.307	2026-07-26 09:49:21.307	2026-08-02 09:49:21.306	f6f698df-f1e9-42b0-9f1d-e1967537b697
954	2	$2b$10$rIi.fEH6RIOMM5jEZEydOuwymJBkWOSfwRPVPc518BDMWLmwYylRe	\N	\N	\N	f	2026-07-26 09:52:08.502	2026-07-26 09:52:08.502	2026-08-02 09:52:08.502	10b0a684-0707-48cf-a3d0-12fec674361a
955	2	$2b$10$QtZg265XZh.GlntpMRoiHO6HhlXTzhpQ0z2yWagIHH2YLw3.WZGv.	Chrome on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	f	2026-07-26 09:52:28.787	2026-07-26 09:52:28.787	2026-08-02 09:52:28.786	6c3ea176-dea7-4678-b869-17ab1dda9a3f
956	2	$2b$10$fWtK9VoBnkvbjTpVNZr0EOocalul7yGTesQUWwcUd2dUbnDZaLwi6	\N	\N	\N	f	2026-07-26 09:54:53.603	2026-07-26 09:54:53.603	2026-08-02 09:54:53.602	76747c51-1efe-4998-834f-8c14d3460a6a
957	2	$2b$10$UCR0AeqCN0wB2vpnzMm52.qR3ktiYU6ETqvuc3ML5qbsRy43c99Ka	\N	\N	\N	f	2026-07-26 09:55:47.358	2026-07-26 09:55:47.358	2026-08-02 09:55:47.358	a7c517fc-eb7b-49c5-a40b-2b12b51bc093
958	2	$2b$10$Ls2Kq0khkTvQimj1wglyHespOoOg4L1/tDVBcFHqQDn2qQ6GX/6F.	\N	\N	\N	f	2026-07-26 09:55:58.944	2026-07-26 09:55:58.944	2026-08-02 09:55:58.944	43254c10-6485-420f-9281-c470e6bdfda6
959	2	$2b$10$ALVjXnX8z2Bu2Uz3aN31teZxK8MAQ7ZhfH7NjhcXJIr/XKbZnBlhS	\N	\N	\N	f	2026-07-26 09:56:04.114	2026-07-26 09:56:04.114	2026-08-02 09:56:04.114	4c5b3571-6439-4b8a-ac7e-f15e15010220
960	2	$2b$10$7r42a94aBOEdaDHqhDWLa.QlCoKLt36P.P.OqRS3rm3L8nW/LYDda	\N	\N	\N	f	2026-07-26 09:58:56.901	2026-07-26 09:58:56.901	2026-08-02 09:58:56.901	0e6ca425-69b5-4a12-95be-3fee5276f7a8
961	2	$2b$10$weQFuxUzGgqM2pTp/z2yGu0yVfdUqcuDh/MiPmOwkbHMgQqK/6G9W	\N	\N	\N	f	2026-07-26 09:59:48.848	2026-07-26 09:59:48.848	2026-08-02 09:59:48.848	e5e35b8d-3691-45ef-8c95-fa5724661735
962	2	$2b$10$aJ7YVT/ZZAno6CjQglm6s.SxZohw0M.Rc0iifqdjx.1mHznivfRj.	\N	\N	\N	f	2026-07-26 10:00:00.608	2026-07-26 10:00:00.608	2026-08-02 10:00:00.608	6a5cb2a6-bb05-4310-a1a3-cfc40ba3d24d
963	2	$2b$10$FBCXPVq35gmHZLXikNCHfupPud0hb2xGh6QDXnaZ9t8kTZP8IuiE2	\N	\N	\N	f	2026-07-26 10:01:07.292	2026-07-26 10:01:07.292	2026-08-02 10:01:07.291	59ea7dd6-5d1a-4199-8315-fdc43bdde28b
964	2	$2b$10$nHZgCyLWb9UkTKDAAu7kdOKLvkRxftqX8teScKERYHc7ZYrGXnzTi	\N	\N	\N	f	2026-07-26 10:02:01.105	2026-07-26 10:02:01.105	2026-08-02 10:02:01.104	27d512de-5752-4e1b-b6d4-565ba5753266
965	2	$2b$10$O8oTEBd3IxipXXhH9hjC4ufTp2/NW33HqxSveg.4ce4A5b3KJjEIW	\N	\N	\N	f	2026-07-26 10:06:25.784	2026-07-26 10:06:25.784	2026-08-02 10:06:25.784	14b7d63c-b167-4861-904c-75876bc3ba9c
966	2	$2b$10$y5/wbwvsENfpx6cIPL4SX.bdqTUfMM/A2fnnm1dTvuOkao40dRMr6	\N	\N	\N	f	2026-07-26 10:06:29.556	2026-07-26 10:06:29.556	2026-08-02 10:06:29.555	97b3b35a-7479-40c6-aa7e-fcdede784539
967	2	$2b$10$JxPcW05tDRNlCfSWbyl4IO3poFBq90UX.xSilOWX2cCoRyW1Ontpq	\N	\N	\N	f	2026-07-26 10:10:11.279	2026-07-26 10:06:35.32	2026-08-02 10:06:35.32	aa2d7251-2a44-48bb-9210-f90a9b64fb97
968	2	$2b$10$3fG1fJCZC5INk3UcMj8kNeUuZO.cWyMqwZD6J3LXUUvJoar7yQwGe	\N	\N	\N	f	2026-07-26 10:10:12.357	2026-07-26 10:10:12.357	2026-08-02 10:10:12.357	123970df-c1cf-4888-99d9-edc05721ec6f
969	2	$2b$10$JiRIgRsGah1heywauiqco.kccBAKQG7PfGSFpYqKcMO3M3mABZmuO	\N	\N	\N	f	2026-07-26 10:10:29.113	2026-07-26 10:10:29.113	2026-08-02 10:10:29.112	204af54c-d838-4a3d-ade0-92fbcda87b97
970	2	$2b$10$FifSKqfGs7otJHdwsk/OLu6r4LLHCHu59wJjTPLkWn0vw0bTOlxeq	\N	\N	\N	f	2026-07-26 10:11:10.365	2026-07-26 10:11:10.365	2026-08-02 10:11:10.365	bfa72414-f1ce-4909-9a4a-f3f6fc580f1b
971	2	$2b$10$9NwUzaZz0nA/FZvVO.o94Odui2FsgYqpRWCkNQUyMexE6vvn5tTby	\N	\N	\N	f	2026-07-26 10:12:05.244	2026-07-26 10:12:05.244	2026-08-02 10:12:05.243	2c4f4e28-a3ac-4be6-bcf5-7053f5f17fc8
972	2	$2b$10$5tioavt3J7RHbZo7bhb6k.HPmu2gv52QFuwosy7ojuI2pKj1YGXl6	\N	\N	\N	f	2026-07-26 10:12:32.027	2026-07-26 10:12:32.027	2026-08-02 10:12:32.026	d03647cc-9db6-4c2b-9c75-910e0399f205
973	2	$2b$10$KUWieNxmCPEcNG9WeJysmugXk6qB8uIcEORLZvwwVTogNZcl9MmAu	\N	\N	\N	f	2026-07-26 10:13:58.802	2026-07-26 10:13:58.802	2026-08-02 10:13:58.801	6f7e6cd8-6dc2-4567-a2a2-a44f1113871e
974	2	$2b$10$LAD8jH2JtArVYzTZnhhGr.7cY/fy2qkiMb.DL7xcc54oYsHTfM5fy	\N	\N	\N	f	2026-07-26 10:17:02.579	2026-07-26 10:17:02.579	2026-08-02 10:17:02.578	bc00e584-96ac-4243-9e6b-66fc6e04bcc8
991	2	$2b$10$63YzwZIxUtRjAZN.1.0KTeZCWhg5h9JsyvE/AV7xPq7Nhhqd59Ism	\N	\N	\N	f	2026-07-26 11:02:34.087	2026-07-26 11:02:34.087	2026-08-02 11:02:34.086	f2d3bf6f-d7b4-4356-956d-7ed4a48d652a
975	2	$2b$10$kptToTlmll77rb.OKxR6KuulchRsC3Daib.kmhrOzBPtDD6/UJGVO	\N	\N	\N	f	2026-07-26 10:23:58.007	2026-07-26 10:18:07.895	2026-08-02 10:18:07.895	2ec6a497-9fe9-4b2c-bb9b-75d56beff0f4
976	2	$2b$10$O1pqC6VsQwLinkG0LXiRRegvCYdVgUQyPQoqFtcNyFDXiU8jMz.Yi	\N	\N	\N	f	2026-07-26 10:23:59.101	2026-07-26 10:23:59.101	2026-08-02 10:23:59.097	deb184b6-5537-4d89-9b32-3924708e2a24
977	2	$2b$10$XAqadOaiHqLedUqX1RzdxeE8UVCNYpR5J/VVIGhIx.IuZrr2R9Ev.	\N	\N	\N	f	2026-07-26 10:24:07.852	2026-07-26 10:24:07.852	2026-08-02 10:24:07.851	dc51e192-ec20-4a82-8bd7-ad754c7311e8
978	2	$2b$10$Rm476tL54tWVgYQzsVodHOVht1.fZJ5l1bC97sAf.Fl4KqFgJXbIK	\N	\N	\N	f	2026-07-26 10:24:22.903	2026-07-26 10:24:22.903	2026-08-02 10:24:22.903	5ee377dd-f7ec-40fd-96f8-062f960674f3
979	2	$2b$10$uG3QuDPgNTIe/Blq2E9Fi.FF527fuZVsp0lxq4cqz.cz7rzcoQ7.W	\N	\N	\N	f	2026-07-26 10:26:12.571	2026-07-26 10:26:12.571	2026-08-02 10:26:12.57	794e1395-286e-48f1-ae91-9bd9db906144
980	2	$2b$10$BqhQaR8c4w3ruW3EoO2FTeX.sqQish5ZSF8adP08UPYwXyGwtox3S	\N	\N	\N	f	2026-07-26 10:26:20.614	2026-07-26 10:26:20.614	2026-08-02 10:26:20.614	93097a5a-58fb-4ffa-b807-260fc113c560
981	2	$2b$10$Q0qzn7MYNgfZ2kqUO4NttuM9k2SPIAsr.CoNfSWPko5esOHb26Oli	\N	\N	\N	f	2026-07-26 10:32:27.606	2026-07-26 10:29:48.693	2026-08-02 10:29:48.693	61ee5e02-0088-439d-8516-de923f9d013f
982	2	$2b$10$AYOE5bha2ujOKqNRkDocl.DCDkOOu0xBFFi1AbgN7sFGkaCsyDCIe	\N	\N	\N	f	2026-07-26 10:32:28.899	2026-07-26 10:32:28.899	2026-08-02 10:32:28.899	a3f54a38-675e-480c-b6a4-7539f48a2224
983	2	$2b$10$t5CS1zGIYUPx6RNmRcWmrO1Vx4pWjeiOpQefEr6dEO3A/wXAklDWy	\N	\N	\N	f	2026-07-26 10:39:27.331	2026-07-26 10:39:27.331	2026-08-02 10:39:27.331	aff4d81f-4dcd-4561-9799-080d7ebb52ed
984	2	$2b$10$zfEwTh4zsVGYzbL05DtMVO6ojHQw9MwWzOp6Wgb9l6JW23oQOS4HS	\N	\N	\N	f	2026-07-26 10:39:35.164	2026-07-26 10:39:35.164	2026-08-02 10:39:35.164	d01bf3d5-e61a-4399-9e18-73dd39fa8885
985	2	$2b$10$UwKUiSZOppJbSe0AteMWFuI7xQ4qtxj3sK4lykLH6zvI1Vmy4z7lS	\N	\N	\N	f	2026-07-26 10:39:47.541	2026-07-26 10:39:47.541	2026-08-02 10:39:47.541	985ce591-3734-4500-bdf3-e9e94de4c0b7
986	2	$2b$10$UzMpr9EPu8D2Z/el.B9jTuAa/KllZt7IbkWnYQXJYPvWPovvCBdLO	\N	\N	\N	f	2026-07-26 10:56:24.294	2026-07-26 10:56:24.294	2026-08-02 10:56:24.294	6f886a38-9c20-4f64-bd26-43afe57edef6
987	2	$2b$10$pRuPOVdOU15CXw.4zMvjIe7EiJ9jmUX03Kmgri.FRPrY2TG1dz2Pq	\N	\N	\N	f	2026-07-26 10:56:26.766	2026-07-26 10:56:26.766	2026-08-02 10:56:26.766	8dbb68e4-885e-4f71-8ed1-b1b412a427fd
988	2	$2b$10$/jJDJ5x8OZudnbEtaZbxVuDmigI17x7DVhOuOR.3BuNWwXsTZZ7AG	\N	\N	\N	f	2026-07-26 10:56:35.193	2026-07-26 10:56:35.193	2026-08-02 10:56:35.192	f0e04277-40ad-4a3d-b3ec-ff1370e0755c
989	2	$2b$10$4rK5q3JIetZb6oPZ2Vla..ccH3ElwUsBwYDIw3tuf.Kc2lJrInr8G	\N	\N	\N	f	2026-07-26 10:59:48.886	2026-07-26 10:59:48.886	2026-08-02 10:59:48.886	d7a3c164-98ef-4fc4-84a9-90ab434b5cd6
992	2	$2b$10$k6MvaisPFraUdGXyHZxciuG4RgCxifCBytNHEc9vWmulQ9kQOeYOW	\N	\N	\N	f	2026-07-26 11:02:45.951	2026-07-26 11:02:45.951	2026-08-02 11:02:45.95	be50d49c-1e40-4499-9aa8-eb73389267c5
990	2	$2b$10$.R.TIa.Sr4ggg.KtFnOkduGCZPdVYaX4SH5V3lAbLhf9mz5KZE.kK	\N	\N	\N	f	2026-07-26 11:02:31.68	2026-07-26 10:59:51.679	2026-08-02 10:59:51.678	479f6518-51eb-4524-81bc-0bd6ef1f4cef
993	2	$2b$10$tO8teamH.6FGujtcStajl.napldtjgdxKdKoMPU9C2Ov8u1uNDbPG	\N	\N	\N	f	2026-07-26 11:07:41.652	2026-07-26 11:07:41.652	2026-08-02 11:07:41.652	1997dc93-756c-41c5-992a-599ed9579b65
994	2	$2b$10$3pnIXteso8TPoOIbtF.FpeTYrgpwd2hGJCms3awstTpz9N5zci7Pm	\N	\N	\N	f	2026-07-26 11:08:07.594	2026-07-26 11:08:07.594	2026-08-02 11:08:07.593	5baae99b-5127-406e-9abf-5ec54b7d382c
995	2	$2b$10$S7p2BFmSLb0nB3Q3GBnmdeYvffTgONivG9XRCq73VrE.8fZsQGZtO	\N	\N	\N	f	2026-07-26 11:08:23.448	2026-07-26 11:08:23.448	2026-08-02 11:08:23.448	35a76eb8-4540-41e2-8839-27eeecc8e415
996	2	$2b$10$kUPR3piDjnrAtfQlHVTfceugg7hlUW83bNk6jL5Wk014HI.O6LNwO	\N	\N	\N	f	2026-07-26 11:09:02.664	2026-07-26 11:09:02.664	2026-08-02 11:09:02.664	ef45b1cc-d0b6-42d8-b4a0-82e49c3d08f8
997	2	$2b$10$RNHJygm0FmAF60U53coJXe0//Vi3CsWFa4Bb8FvuL0mWqYrZ//YJu	\N	\N	\N	f	2026-07-26 11:10:01.784	2026-07-26 11:10:01.784	2026-08-02 11:10:01.784	57740e10-63b7-4336-8fae-efa32d54ed2a
998	2	$2b$10$/nKo/df8N5Me5hMnM0vBmuHDJOBwQF1GW2NFM22voFW6DSEelQTVy	\N	\N	\N	f	2026-07-26 11:14:06.615	2026-07-26 11:14:06.615	2026-08-02 11:14:06.615	cae25116-abda-4a65-83a6-78fd0adaa424
999	2	$2b$10$Hn8rUmCYpSCpD.RKhdaXQeB67WLs1Zd3xCClfz1K7C/b4W7sjTYqm	\N	\N	\N	f	2026-07-26 11:15:16.252	2026-07-26 11:15:16.252	2026-08-02 11:15:16.252	0942defc-bcc2-4092-8a77-dcb28f0e3d4d
1000	2	$2b$10$dBTlebRJ39abRw4sTOfjz.jVqLqVjteLe51kuB55i6TJ7TeI2p1EK	\N	\N	\N	f	2026-07-26 11:16:03.8	2026-07-26 11:16:03.8	2026-08-02 11:16:03.8	d1499025-3829-4cd4-9d98-9593c00d6189
1001	2	$2b$10$D4V7ZogQlerdQTtKkbYtc.Fda9iodgJtdD0aBmbfLYm0dSk/G6nKS	\N	\N	\N	f	2026-07-26 11:16:12.383	2026-07-26 11:16:12.383	2026-08-02 11:16:12.382	e978c281-2f07-4430-bea6-f0f8f832b043
1002	2	$2b$10$G8KSNFHrmVqeP6YXLWwCAe.EXBBox156SzGAnfwYF.O6iPqvwNbPi	\N	\N	\N	f	2026-07-26 11:17:45.885	2026-07-26 11:17:45.885	2026-08-02 11:17:45.885	eb7863ab-f793-4020-b695-5e76e3ba54aa
1003	2	$2b$10$t1AemI91S9e5cIKp/onb0u9kxopCXcbN4ElDUBklG84Ioy6dMujP.	\N	\N	\N	f	2026-07-26 11:22:01.763	2026-07-26 11:22:01.763	2026-08-02 11:22:01.755	9c4d3115-ae45-4283-917a-9167be77cd7d
1004	2	$2b$10$ctx0wCj6wDUNr8KZoQfHXexkZGhegCgV.yEzULhOFlBjTPUIFY4jW	\N	\N	\N	f	2026-07-26 11:22:27.546	2026-07-26 11:22:27.546	2026-08-02 11:22:27.545	68db1f07-aab3-4344-8f0d-95d8bed5fd8b
1005	2	$2b$10$jTUQcEri.fB4.iYgKI8hueZ1dEFYf/XkXnY1hiUgv5VVyPUzbFyfa	\N	\N	\N	f	2026-07-26 11:29:33.781	2026-07-26 11:29:33.781	2026-08-02 11:29:33.78	e07f749c-9d31-4d12-99ce-c8364ccb874c
1006	2	$2b$10$BH8u5tyTPvA0B7dKuQUYvuA/6kIS/g7XwidNDTwhAAUIt9DKC71CK	\N	\N	\N	f	2026-07-26 11:29:45.027	2026-07-26 11:29:45.027	2026-08-02 11:29:45.027	3632cf90-094e-4c28-953f-3e86c8307e00
1007	2	$2b$10$k8/TB4LN2EYegbRmG4ts/Oq5su0lwft.DJIbciuAJt3f2Qu3GL8Ta	\N	\N	\N	f	2026-07-26 11:30:01.654	2026-07-26 11:30:01.654	2026-08-02 11:30:01.654	5f012eda-0cfa-4b96-940e-9902b9341e5b
1008	2	$2b$10$HtrvIyqQjDtOXJQw8k7/BewROSV8l6Ovg3ZqQBbuustyzGMgz4GYa	\N	\N	\N	f	2026-07-26 11:30:04.25	2026-07-26 11:30:04.25	2026-08-02 11:30:04.249	55ac33cb-dc0d-437a-a09e-22bf38b4c8df
1009	2	$2b$10$tZLqvxPyOFkEvzBwyh90P.PH9pM8pa7b0KcxMdmTxt1q2O7UGRTsO	\N	\N	\N	f	2026-07-26 11:36:22.066	2026-07-26 11:36:22.066	2026-08-02 11:36:22.066	064ec0d0-ce24-47e2-8b3a-00fd015e8be3
1010	2	$2b$10$tkaNXO18TZdGWKBxbBTRe.22hx1N.XIAWpN9fBHdNe5oFwCT7V.ni	Chrome on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	f	2026-07-26 11:39:13.988	2026-07-26 11:39:13.988	2026-08-02 11:39:13.986	38ddf4c1-7161-46c7-8e9d-77447086cc9e
1011	2	$2b$10$L.yWOk.BbWVBEdg/NY0OceWnq6dk83fgITIqTlVkE7sjd3S5Yqo7q	\N	\N	\N	f	2026-07-26 11:39:14.74	2026-07-26 11:39:14.74	2026-08-02 11:39:14.74	7c8340ee-00c8-4507-a0ef-8d5127730f3c
1012	2	$2b$10$Q3DL2FcD0lGUXhgTsep3ye4ILnjCebEUNgX5VsdSoTSRuKVh9KTVa	\N	\N	\N	f	2026-07-26 11:40:58.543	2026-07-26 11:40:58.543	2026-08-02 11:40:58.543	2b3728e5-7ee3-440e-af9e-a9b71d17ceee
1013	2	$2b$10$utGJ6NjoJ4J0ja072d3apOH1T.QGdFzoA1EPROJ2QfhMSMIMHrCrO	Chrome on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	f	2026-07-26 11:41:06.253	2026-07-26 11:41:06.253	2026-08-02 11:41:06.252	c007d138-2ba6-4c3a-ac7a-f1b4badd38c4
1014	2	$2b$10$M9d1tmsP6GzGyNe/G/Lrdu848xCon3ht1Wvu9iX7tBah8HE3WbqfW	\N	\N	\N	f	2026-07-26 11:41:19.182	2026-07-26 11:41:19.182	2026-08-02 11:41:19.181	ee014f41-4db6-426f-9b09-a44baf856c43
1015	2	$2b$10$KlWyysRK4tQqXht5VZNvH.bYmJTEWaz1Q2wHdL.T5Z6Bt6R2OsWaK	Chrome on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	f	2026-07-26 11:41:53.906	2026-07-26 11:41:53.906	2026-08-02 11:41:53.905	995303ac-01ab-4f13-9e15-f400117a3dab
1016	2	$2b$10$uU4nIDgfLk/yxBDfU6/4t.cuLHUTSHqyf/0dYa.qb3K8lRxFfHlpu	\N	\N	\N	f	2026-07-26 11:41:54.353	2026-07-26 11:41:54.353	2026-08-02 11:41:54.353	32901df4-1e30-40e9-8f36-4275aa7fc23a
1017	2	$2b$10$Lix.vFHG7pInBLvsrRDLd.iezGCef5sIQsdx40jUW0SvnenbwAr0O	\N	\N	\N	f	2026-07-26 11:46:38.815	2026-07-26 11:46:38.815	2026-08-02 11:46:38.815	d856739a-7bbf-47dd-a7d7-9d1f48568b16
1018	2	$2b$10$DpCC2hi8w.dy.Y5NhRZFHeIK6D71NRotFgBe0YOTDWIs5D5mtB4be	\N	\N	\N	f	2026-07-26 11:46:55.372	2026-07-26 11:46:55.372	2026-08-02 11:46:55.372	562f7098-a98b-4084-9119-6ab132f1195a
1019	2	$2b$10$jZOPqxCW7ZYgHmBWeYMiYe7gJPe4W88wyGWn0cXlP4x/CDbpza/.q	\N	\N	\N	f	2026-07-26 11:47:26.597	2026-07-26 11:47:26.597	2026-08-02 11:47:26.597	97ff387d-2abc-4afd-b58a-42920e959468
1020	2	$2b$10$32.bdsjiRVmUZldiaSwDdu/gO7.VClS2TqrsZbg8pCsQsmH2cUUY6	\N	\N	\N	f	2026-07-26 11:47:40.869	2026-07-26 11:47:40.869	2026-08-02 11:47:40.868	6d8ad22c-fe84-4015-b7ef-76a94276ead7
1021	2	$2b$10$m4cNUS/tUfofTHLz8qtmKeltGSXOoJw0nB6sjsNYaGgr1CMYtezAe	\N	\N	\N	f	2026-07-26 11:47:57.159	2026-07-26 11:47:57.159	2026-08-02 11:47:57.158	a56159ba-cde3-4e9c-b1f5-4c5182f83991
1022	2	$2b$10$GpYH3aXd14OedB1xbk5k/eBv8Jv7ltsOpZUsMc9VUBLckBEnvhf9y	\N	\N	\N	f	2026-07-26 11:50:01.475	2026-07-26 11:50:01.475	2026-08-02 11:50:01.475	9dcd563a-6059-4e4d-b6f7-e032ac76049b
1023	2	$2b$10$cJBtqu0PUo6ZWoRe.tQ7Ou8JScjE09bXYW6CF3G13nFGbb6tk0E/.	\N	\N	\N	f	2026-07-26 11:51:05.646	2026-07-26 11:51:05.646	2026-08-02 11:51:05.646	6c1d138f-1ab4-4ef9-b8ec-a9304192617e
1024	2	$2b$10$DhQkKHGw4yhODYr5Y30mvuofd.Btw.g4j/zN3xkv45NRBoKJT9eki	\N	\N	\N	f	2026-07-26 11:53:00.221	2026-07-26 11:53:00.221	2026-08-02 11:53:00.221	1ed5e841-dfb1-4d81-a891-1a740156fc90
1025	2	$2b$10$lratCMfIJFqmu5vS1y20h.pt2lT6tyQ8uE7ecuAlUyoDlMS1XvhAe	\N	\N	\N	f	2026-07-26 11:53:06.556	2026-07-26 11:53:06.556	2026-08-02 11:53:06.555	2e61ba94-d84d-4131-b1f6-556c50d2c865
1026	2	$2b$10$Ox7eFXkjiH4PBiRaEKPvNe68xHHL/a2Xv/t77ivZOTXql4mUR616m	\N	\N	\N	f	2026-07-26 11:53:36.9	2026-07-26 11:53:36.9	2026-08-02 11:53:36.9	f7c418a4-007a-4039-8c16-26634337bed6
1027	2	$2b$10$2xxZSHnqSXHMdIIcGrW8B.8oFrWEQXyuFVSjEs5DufaOvgJZCjyzu	\N	\N	\N	f	2026-07-26 11:56:12.659	2026-07-26 11:56:12.659	2026-08-02 11:56:12.659	11e539bd-40b6-46f9-b1f1-a7ad64dd5d28
1028	2	$2b$10$o.fIkhvdT8vzAKTgBof9S.UH7Chb1u5xphRFoeP91uNF3KoXhX.He	\N	\N	\N	f	2026-07-26 11:56:17.853	2026-07-26 11:56:17.853	2026-08-02 11:56:17.853	2277e2b1-5008-40e9-a4b0-34862ffae939
1029	2	$2b$10$MyvTK5DMyiiDNwhr8ENSAuvOQTvMVujLUzEr9b3XnVuS5JKWoAMGu	\N	\N	\N	f	2026-07-26 12:35:55.437	2026-07-26 12:35:55.437	2026-08-02 12:35:55.437	7dc2ccdd-c0aa-40b3-ac45-b0dfb30289cb
1030	2	$2b$10$qtmzj7G8OOHZmwnw1NcTa.nVfsXk6s6EfmMjy1vcRlYWwYBX/ADs.	\N	\N	\N	f	2026-07-26 12:36:58.946	2026-07-26 12:36:58.946	2026-08-02 12:36:58.945	b8e66511-440b-409e-ae76-bfa10e0c9c21
1031	2	$2b$10$6gN9btcVoorVqh1jUvz0uuWFMXKAdEs9NBAHq1m/Z2VGbe/bfIIg6	\N	\N	\N	f	2026-07-26 12:38:28.805	2026-07-26 12:38:28.805	2026-08-02 12:38:28.804	a599f1df-4872-490c-8b99-6a7b6d98b13a
1032	2	$2b$10$kW/2LJx8ltux4iljHJxOROKHdg3cr0C5qYiXFfm9EK0QqU5jKkoJO	\N	\N	\N	f	2026-07-26 12:39:51.588	2026-07-26 12:39:51.588	2026-08-02 12:39:51.588	02e4f110-275e-4220-b38b-b407e29d577f
1033	2	$2b$10$EsJUeyGNXOMf9hw7tLSAdOf0BZ8fdp1vqZd2ye5/Nncdb.oooZHsu	\N	\N	\N	f	2026-07-26 12:40:01.254	2026-07-26 12:40:01.254	2026-08-02 12:40:01.254	015e51cd-c7ac-462e-bd2a-c3c785f3594d
1034	2	$2b$10$YaZT8eX1jvN0kVitzmyr9eK32t0a9M02KT./Rkpugk9aoupvGWsQa	\N	\N	\N	f	2026-07-26 12:40:20.422	2026-07-26 12:40:20.422	2026-08-02 12:40:20.422	0e363f41-a1d7-4f07-a0da-c1f74b591b0c
1045	2	$2b$10$If75DB9gJoaL3wM6H5P9o.GmEq.frP5PaX/De5VffBVDS/bwdmGK6	\N	\N	\N	f	2026-07-26 15:34:48.818	2026-07-26 15:34:48.818	2026-08-02 15:34:48.817	d1f325b0-5aa7-4977-a5ae-2218d3070bcf
1035	2	$2b$10$FqwBdkTAkn/LdaYJ/wHZpuAk0wfBKdRdNnLAG.Nm3BUe4yq704QAK	\N	\N	\N	f	2026-07-26 15:01:09.58	2026-07-26 14:57:29.539	2026-08-02 14:57:29.539	f4a22b08-6136-436d-acea-33a05baebd4b
1036	2	$2b$10$TFuU2kcvVFHsEdurqM1rYOqMdDMfZZQugelPYn1HrxVKoZiqpaMYu	\N	\N	\N	f	2026-07-26 15:01:10.947	2026-07-26 15:01:10.947	2026-08-02 15:01:10.947	df40d627-3547-418a-bd85-1e205c22f0e7
1037	2	$2b$10$gstqJSTSINhhzWtkzhkOJ.9hss8otb/nzDRsqw7TGRBX6HMSeZvwG	\N	\N	\N	f	2026-07-26 15:01:47.412	2026-07-26 15:01:47.412	2026-08-02 15:01:47.412	42127f6a-f8d1-422c-9109-4d78b9da055d
1038	2	$2b$10$6ZKH5k3h0QMZvHMkUgKbbet61FbtlyB7dI9yerBpvCgkfzAXJph2K	\N	\N	\N	f	2026-07-26 15:02:50.467	2026-07-26 15:02:50.467	2026-08-02 15:02:50.467	ca2ebece-df6c-448b-b349-7407a820521c
1039	2	$2b$10$8oiJqHgyIM5KWaLLFSAzTemY7jiqGhp.wKChbkDCWYzq6SxjU/0Y.	\N	\N	\N	f	2026-07-26 15:03:46.155	2026-07-26 15:03:46.155	2026-08-02 15:03:46.155	d95137e2-ac07-48e4-97ab-9b699c82dc24
1040	2	$2b$10$8dJ08A1SblTRI1IfVK1QFu.XLyLBZggBFfv5CxdBD36oSIcQJnDmu	\N	\N	\N	f	2026-07-26 15:04:16.545	2026-07-26 15:04:16.545	2026-08-02 15:04:16.544	7310290e-8ee3-4e7e-8a48-c176567b7aaa
1041	2	$2b$10$kjMhck/EyQUNA31n6sh86eEhEPolsOPi2981zB35Yqg/VS3f1WcO2	\N	\N	\N	f	2026-07-26 15:04:19.919	2026-07-26 15:04:19.919	2026-08-02 15:04:19.919	df66d2b8-292e-422e-b6b3-818cfc8f2d7d
1042	2	$2b$10$akgrY4RMjbm.iQpvH5nv0uzN.9sVW0wICstAe/RdmYx.nmgwD1Yoq	\N	\N	\N	f	2026-07-26 15:28:24.018	2026-07-26 15:28:24.018	2026-08-02 15:28:24.018	5fa1a916-90ff-4763-8613-6e8dd5e332b9
1043	2	$2b$10$d8pfC4sJXJbn3R/EP1mTEejpAMbjZpmIJnNo57gpP9NAWRf5oirUO	\N	\N	\N	f	2026-07-26 15:31:27.34	2026-07-26 15:31:27.34	2026-08-02 15:31:27.339	bd7b521c-5b33-4279-9cd2-089f8c57041e
1044	2	$2b$10$9Sx2HjM.RA2jQWbXI6jsfOoE6aJDyq0xtv7mZBlqhUF3DEofhAb7q	\N	\N	\N	f	2026-07-26 15:34:43.516	2026-07-26 15:34:43.516	2026-08-02 15:34:43.515	e1985081-5acd-460f-be65-c4b8995f3e93
1046	2	$2b$10$deFjSMqLtKa9Y4uDJ18QheVhhkR/vxLKVVqCblXvjzKH.18TLxU.S	\N	\N	\N	f	2026-07-26 15:42:12.916	2026-07-26 15:42:12.916	2026-08-02 15:42:12.915	4c9a260c-c81d-47d8-bfdd-400973cd8f50
1047	2	$2b$10$aC.L1Yy/Wx0k.MnxC4l0suerSZTOcOtdeuuZ9qo6Af8sIQqx8782e	\N	\N	\N	f	2026-07-26 15:43:02.969	2026-07-26 15:43:02.969	2026-08-02 15:43:02.969	baee268e-3f8c-4871-8c01-f4e9530709d8
1048	2	$2b$10$xLDwkrd4u/Laekmy.UqMreQ2alxJVk3SGG.8FOikglcHuvBH9XYf.	\N	\N	\N	f	2026-07-26 15:49:24.805	2026-07-26 15:49:24.805	2026-08-02 15:49:24.805	909d5ea1-b57c-4d82-9de3-d4592b970c97
1050	2	$2b$10$5.y3QtJmJdRUrwJ./jtmKuWWULd2tTdB3irTG4XE.Y9GEpW1UsM0C	\N	\N	\N	f	2026-07-26 15:55:46.418	2026-07-26 15:55:46.418	2026-08-02 15:55:46.418	6e1e791d-2fdf-4642-90de-234512b08a98
1049	2	$2b$10$LLxcQvF7HKDapyADIRixsevjr6oPC/QDFMiM1UYSt4teuLbOvOmwq	\N	\N	\N	f	2026-07-26 15:55:02.572	2026-07-26 15:52:44.12	2026-08-02 15:52:44.12	91a2d7e8-f34e-4dc2-b197-66c58263f241
1051	2	$2b$10$w9o1yU7DbUQX3cptvl8r6eCpgPzz1X7T/5/59/x3VcySWE2k1i.Wy	\N	\N	\N	f	2026-07-26 15:55:48.687	2026-07-26 15:55:48.687	2026-08-02 15:55:48.687	03b4e12a-c51f-40e3-863e-7d6672b26e7f
1052	2	$2b$10$Vd6MnmXUp5sIYrFaQr6SW.9JuBlYdLum9C0fBH9yoL4snyWZsPujS	\N	\N	\N	f	2026-07-26 15:55:53.19	2026-07-26 15:55:53.19	2026-08-02 15:55:53.19	ca50c572-8769-410a-a634-bcd1dec21a54
1053	2	$2b$10$Cacz/7er07uL/KrChwvwR.0MCeC1gq9uMmIQ19N24pAYUPENZeSmO	\N	\N	\N	f	2026-07-26 15:56:20.649	2026-07-26 15:56:20.649	2026-08-02 15:56:20.648	7ff8403d-bca6-4d37-8abf-92886fdc6bd1
1054	2	$2b$10$0O6n7akiTKjKA4b8imJrRuytIgyGLP8ctepwVM/A//6tt5n.FgDHm	\N	\N	\N	f	2026-07-26 15:56:23.57	2026-07-26 15:56:23.57	2026-08-02 15:56:23.569	c2092bfb-08b1-432e-a7eb-c81a39a24258
1056	2	$2b$10$8kTUwZna3Pr50mcsroCUHuYuFjaMpZWUJzRxx45DX5MXHUNd/nUVm	\N	\N	\N	f	2026-07-26 15:58:04.925	2026-07-26 15:58:04.925	2026-08-02 15:58:04.925	e33ffa3b-4eec-488e-ae8e-44b9b4d6bf8e
1055	2	$2b$10$OpHYyo2LKukLiH5ExxtZju0KqJ.5szRv8RMTNc1/Nww387M1VWSEC	\N	\N	\N	f	2026-07-26 15:58:00.792	2026-07-26 15:56:42.775	2026-08-02 15:56:42.775	c0f11b60-a69d-40cb-b882-b9adc24bd4ba
1057	2	$2b$10$1o95S98254ijGit2YEKAP.cqvmX7V2cy3mIkg7OFcxZKzfcBGrih6	\N	\N	\N	f	2026-07-26 15:58:37.329	2026-07-26 15:58:37.329	2026-08-02 15:58:37.329	05d5fc72-e83e-405e-aa66-44e50e49f142
1058	2	$2b$10$4j42ipYjVQIKJqbG4h5Sd.khQFPx3RujU6SSR7BSejqDo6g4iWo9.	\N	\N	\N	f	2026-07-26 15:59:03.526	2026-07-26 15:59:03.526	2026-08-02 15:59:03.525	89e0745e-c87d-4db9-90bc-c3e312d358b5
1059	2	$2b$10$HPr9Sh9ghXl9yn/zx4paEuBb8NV1.YIas4eO/WbQdxtOHE5IMaz/G	\N	\N	\N	f	2026-07-26 15:59:39.675	2026-07-26 15:59:39.675	2026-08-02 15:59:39.674	9eefb69e-e568-4c92-b64c-43dcbb8b4aaf
1060	2	$2b$10$e9tgYdC1purs8zZzv87Sgupuuio5oQOJEJUxfZD5qLP8gv.rrOLti	\N	\N	\N	f	2026-07-26 16:00:36.354	2026-07-26 16:00:36.354	2026-08-02 16:00:36.354	7c3acf69-65ff-4066-b066-9ba3a71499f3
1061	2	$2b$10$yvOXeNCbEMJM2TBJLFMkzeUJEb/KL0P38Y4l6fFnrW8BI5fEqrlk2	\N	\N	\N	f	2026-07-26 16:00:43.735	2026-07-26 16:00:43.735	2026-08-02 16:00:43.735	b32d0697-13a0-409d-a1b3-e0b06f77ebf9
1062	2	$2b$10$Mc3iT.3m3YhHfBOj1LxEGeqN9CK8qSz2t/FmOzd/jARdiFLQY/D.K	\N	\N	\N	f	2026-07-26 16:00:49.094	2026-07-26 16:00:49.094	2026-08-02 16:00:49.094	45973256-2a42-4a5c-8736-8d2d364310ab
1078	2	$2b$10$bL7rrxMMmGOFXZQFS1Dmz.THS/nm6ZH5IkiZUM8gGDLyO8e0e3Dpa	\N	\N	\N	f	2026-07-26 16:08:29.472	2026-07-26 16:08:29.472	2026-08-02 16:08:29.471	6740c400-bbc2-4eee-bb16-e1480ab93e46
1063	2	$2b$10$NLynH6tBqyS2/i/XsHvNN.CKl8J/HQpxI.mPdzYPZcrnG6kV2ek/G	\N	\N	\N	f	2026-07-26 16:02:17.367	2026-07-26 16:01:00.399	2026-08-02 16:01:00.399	7f164337-daa1-4a5c-abbd-121d3c28d0ab
1064	2	$2b$10$thyiicFYAhsMbTjj6qKPaO5jWryqD0bVMYB5AQTYZqw/IvAMihpWm	\N	\N	\N	f	2026-07-26 16:02:48.098	2026-07-26 16:02:48.098	2026-08-02 16:02:48.097	1616f6b9-2747-4a6c-9b8a-1614545dc443
1065	2	$2b$10$rjVSmcku0rsHyS1LJf8lruDTf0kK0B2yRpHuKkNdocbIZPSV/p2MS	\N	\N	\N	f	2026-07-26 16:04:09.406	2026-07-26 16:03:05.119	2026-08-02 16:03:05.118	31ccef47-52bf-4da6-aa6a-8a43cb2aa63c
1066	2	$2b$10$ac88AqWrisACfj58v9i7xuI7EJCQx1/nhd1fQ/MLcY0T7/hZhAQHS	\N	\N	\N	f	2026-07-26 16:04:14.623	2026-07-26 16:04:14.623	2026-08-02 16:04:14.622	253e050d-b412-48de-a945-b71a67fdd378
1067	2	$2b$10$1d63BLOfBQUrkGi/RVb1BOQHaw6oo4z76b6jws32EXemYVLcPzQD2	\N	\N	\N	f	2026-07-26 16:04:40.094	2026-07-26 16:04:40.094	2026-08-02 16:04:40.094	0e8cc825-fd41-424f-b305-618249bd5950
1068	2	$2b$10$EFCvORWJ/fxpmzTiwpY22eWULkL6IGnFRjJsXbm34bRpcmNh6TXdS	\N	\N	\N	f	2026-07-26 16:05:20.115	2026-07-26 16:05:20.115	2026-08-02 16:05:20.115	b3760a8c-fc04-4b02-b595-5f486e389b8e
1069	2	$2b$10$BU.OW1M.wA.L8CBbR9g5/utsr1YFRfEKafUjSyDsjmqVfc.Y6IDpq	\N	\N	\N	f	2026-07-26 16:05:46.785	2026-07-26 16:05:46.785	2026-08-02 16:05:46.784	41855262-a308-4170-b22d-63d89a6b6095
1070	2	$2b$10$aZimrz26CIGNJtf9tnYjfOtmjvYK7rtxP045DKVpsH/b/KI/YKdEG	\N	\N	\N	f	2026-07-26 16:05:56.837	2026-07-26 16:05:56.837	2026-08-02 16:05:56.836	43dfa67a-65a4-4cad-b97c-45a431301bf7
1071	2	$2b$10$hAz5/8uYToTBO564IJBc.e3CrPpA6wkNelhip9iZ.WSBsDJAtdCAq	\N	\N	\N	f	2026-07-26 16:06:26.718	2026-07-26 16:06:26.718	2026-08-02 16:06:26.718	aa7f06da-904c-409c-8096-cbd964ad7c28
1072	2	$2b$10$LMPm/HOVfrfJzoPaySpzP.rEuUoV0Ypn7piJmm8WJ7B6fZOWFJ8Iy	\N	\N	\N	f	2026-07-26 16:06:29.397	2026-07-26 16:06:29.397	2026-08-02 16:06:29.396	80910783-200c-44e6-adae-2239426f40e4
1073	2	$2b$10$WYk42Mme18D1nrTFgAT4KeygghkRINrzUrBg9NsKj5DQowVuhZ7cu	\N	\N	\N	f	2026-07-26 16:06:32.016	2026-07-26 16:06:32.016	2026-08-02 16:06:32.016	3d2319aa-3a88-40b9-b7b1-2025991ab652
1074	2	$2b$10$h8wnaQt.OIm47K/Ee569V.C5oP8SKr9hjUFacKoJjFTiip.UqazMW	\N	\N	\N	f	2026-07-26 16:07:09.617	2026-07-26 16:07:09.617	2026-08-02 16:07:09.617	a856c245-fbfe-4448-8730-39e9b70a8737
1075	2	$2b$10$7Sn7hj3QduRh.SdJtDOn3OrqB6DM6wjZt7NdHnWkd98993ObRxL3C	\N	\N	\N	f	2026-07-26 16:08:04.154	2026-07-26 16:08:04.154	2026-08-02 16:08:04.153	8b5854f9-4031-46c1-ad98-d6a4f9a68663
1076	2	$2b$10$G0uxixlm9NG.0mnAPfebo.Jv/iw0kqIGVpPA67sFusvsl9BxA9BgO	\N	\N	\N	f	2026-07-26 16:08:05.848	2026-07-26 16:08:05.848	2026-08-02 16:08:05.848	0843d3ce-da1b-491c-9985-7558881e64a8
1077	2	$2b$10$SKD83JidgGV2HiVuDn24ieeWuTfF.OyTeaE3IdEycWj0ioHI.dzpm	\N	\N	\N	f	2026-07-26 16:08:13.356	2026-07-26 16:08:13.356	2026-08-02 16:08:13.356	2f3c02d8-2acf-47b4-9adb-03befa333921
1079	2	$2b$10$PTri6f5tsuJzLTyWxlJ.Y.E8gPy2M0QwODN/McPmNJLSMbB3IXmOi	\N	\N	\N	f	2026-07-26 16:08:33.907	2026-07-26 16:08:33.907	2026-08-02 16:08:33.906	14d4d154-9bab-47a9-8f39-86325a8de9a1
1080	2	$2b$10$dkwjHZk69olzoz.5xfTxg.AjDhgPfblRZQo5ljPvpk2RYTMYIzRny	\N	\N	\N	f	2026-07-26 16:09:14.207	2026-07-26 16:09:14.207	2026-08-02 16:09:14.207	04d4216f-a415-40a3-a761-4077072f1da9
1081	2	$2b$10$/jITZKJ7jAlDwN3AlymjM.Rvz9Y5hBB9er9mfeGN5wcTgqE4TBcz6	\N	\N	\N	f	2026-07-26 16:09:44.045	2026-07-26 16:09:44.045	2026-08-02 16:09:44.044	52129566-ad95-4ec1-be65-0b9f66a31a80
1082	2	$2b$10$fUBYYu3HX7TiCMySkK0TxeXvF/4vkigmsX7nupBnabo94k5SDDUAe	\N	\N	\N	f	2026-07-26 16:10:00.576	2026-07-26 16:10:00.576	2026-08-02 16:10:00.575	988f397a-42a3-4a1f-8445-0eabea5e55f4
1083	2	$2b$10$VVvnbSzOlNi1VSvxLXkfpOdvYQk9waQ2K.N7pXfmQwhOHxpOKpp2.	\N	\N	\N	f	2026-07-26 16:10:03.68	2026-07-26 16:10:03.68	2026-08-02 16:10:03.679	837af987-24ef-43a5-9e19-0b5e7e011fad
1084	2	$2b$10$LUOWQWlNOeAXeKxcV16Fv.ow7y36fkAaWeeXYwZxnvC4TNI4vJmiO	\N	\N	\N	f	2026-07-26 16:10:53.023	2026-07-26 16:10:53.023	2026-08-02 16:10:53.022	32158cb5-b2d8-4502-a220-f6f3b6a6feff
1085	2	$2b$10$y.498Ivkunn9XAf46f8EferW7yHJX3Y0tv.LcWYxJcjfTsAiApDeu	\N	\N	\N	f	2026-07-26 16:10:56.055	2026-07-26 16:10:56.055	2026-08-02 16:10:56.054	0848a044-41d6-432b-93be-8a289bd18384
1086	2	$2b$10$fGS3wsZJTFhYp/7FuoYTB.vEkQJl.2JXm7Zdzb2VOnECBZOhJZzd6	\N	\N	\N	f	2026-07-26 16:10:59.751	2026-07-26 16:10:59.751	2026-08-02 16:10:59.75	2c0b7c2f-f463-4815-9a6d-a5c346449e73
1087	2	$2b$10$s8xPNA58DA.zvEtmu7Xz/O8hhxanARbFSvr6khL6pLuSlI2HdZX4i	\N	\N	\N	f	2026-07-26 16:11:54.276	2026-07-26 16:11:54.276	2026-08-02 16:11:54.276	b758253e-1fcf-4789-b31c-c298b23ffdc9
1088	2	$2b$10$Gn4sRBGtQuov6AQC0aq1veRVcvPGhJ4HtUx1NBQcRIqWBAIZFBfvu	\N	\N	\N	f	2026-07-26 16:13:09.469	2026-07-26 16:13:09.469	2026-08-02 16:13:09.468	6df00cf1-efd6-44f4-9afb-48ac5b2c562b
1089	2	$2b$10$MJ8IXLSXMuPIPPEMuJycSuWWwe.NTO74S/4pail0ZIivYyS/Vcree	\N	\N	\N	f	2026-07-26 16:14:56.836	2026-07-26 16:14:56.836	2026-08-02 16:14:56.836	b558edb2-21bb-44cd-aab0-3a8d93feb510
1090	2	$2b$10$o5yDKxFEk5ofdBntVEiBkOqYTf6fsaiGkgp.iKG87xujc4ftV.ZuO	\N	\N	\N	f	2026-07-26 16:15:03.574	2026-07-26 16:15:03.574	2026-08-02 16:15:03.574	79cd2171-6236-47aa-82f1-0cf83b575690
1091	2	$2b$10$HknPZZfhAXrvsH1/Mqly2OJwbol.kt5nsQDMN1f6CggUf95/YjUz6	\N	\N	\N	f	2026-07-26 16:15:07.297	2026-07-26 16:15:07.297	2026-08-02 16:15:07.297	e1dd6387-cb18-48c0-82b9-472507b1486e
1092	2	$2b$10$mdCiGmiIT5oFUHLbnshsp.8cw00iW9ZUZNdMI/AlC6i7XM/mtt5zK	\N	\N	\N	f	2026-07-26 16:15:56.477	2026-07-26 16:15:56.477	2026-08-02 16:15:56.476	9adcdd42-457f-4741-980b-d2a2aa656dd7
1093	2	$2b$10$zJjDfnYNkLVcPFh8WYOG..yr.B/I7dZ9u8CAJtQxCPY1VeyvBrqxi	\N	\N	\N	f	2026-07-26 16:16:45.333	2026-07-26 16:16:45.333	2026-08-02 16:16:45.333	52794e9a-285e-49ed-9075-3b697422b36e
1094	2	$2b$10$FGFuY4hdhE8Hh3GLFmlj1.av58tLktGmuSjUeizokLP88CTwcluQ6	\N	\N	\N	f	2026-07-26 16:16:52.07	2026-07-26 16:16:52.07	2026-08-02 16:16:52.07	1acd91ac-fad4-4cf6-8190-f5f2158ddfd3
1095	2	$2b$10$YkfwazmM18ggbJgxun0BuuxCyrYmUGosMY9arZolApd6x692VCpR6	\N	\N	\N	f	2026-07-26 16:16:56.482	2026-07-26 16:16:56.482	2026-08-02 16:16:56.481	ece4e08b-cabd-4535-b34a-0978433d8a95
1096	2	$2b$10$oUvyaSzksG1askGVj.JyOuIozo/AexeokXmlqN.tTLznL20A/28YC	\N	\N	\N	f	2026-07-26 16:17:34.562	2026-07-26 16:17:34.562	2026-08-02 16:17:34.562	d87fd72f-549c-45a1-b1ca-cb292b677980
1097	2	$2b$10$1R7i/UeodS8AEtAX/FAxGOSK8/nuFUO2pyWNZWaJ0Z45nTRnmMKpK	\N	\N	\N	f	2026-07-26 16:17:36.959	2026-07-26 16:17:36.959	2026-08-02 16:17:36.958	42a3f4aa-0a56-4c20-88a7-36ff4c3bd32c
1098	2	$2b$10$LDAQGD9Up/yeqXkYS2eFOOQViBfyRNz0syTAwGpJ.PErz1OjoNGpa	\N	\N	\N	f	2026-07-26 16:17:40.174	2026-07-26 16:17:40.174	2026-08-02 16:17:40.174	ac823b01-cf00-4253-9206-a3c232bd9db9
1099	2	$2b$10$P8uf67b7Dia.AN7uni69OuzZD94yxsGv9qrlm2Acs31Hh9C.j0NMS	\N	\N	\N	f	2026-07-26 16:17:45.117	2026-07-26 16:17:45.117	2026-08-02 16:17:45.117	44e8dcfe-fd1d-447e-a11b-daa1754b4de5
1100	2	$2b$10$BKV0x0IuBa/kIIKWfXljgugT.X/JfM.vr6dpw1W2r3AA.TSM.qBBW	\N	\N	\N	f	2026-07-26 16:17:47.352	2026-07-26 16:17:47.352	2026-08-02 16:17:47.351	80bca6d2-60d7-493a-ac0d-7905bd03f67a
1101	2	$2b$10$csmUaf60fyDTBPmn4wvMeuxJ23xjiM97PdnFQqaCrRPOpta19NRs6	\N	\N	\N	f	2026-07-26 16:18:06.469	2026-07-26 16:18:06.469	2026-08-02 16:18:06.469	e2867d69-906b-476c-a507-cb013b6ecca8
1102	2	$2b$10$cuw6.Ym3xbXAhjPMXyHue.jz4dTGcA0Z/K74Hg0cXO3eCiScF2Kty	\N	\N	\N	f	2026-07-26 16:18:08.366	2026-07-26 16:18:08.366	2026-08-02 16:18:08.366	8598bbbe-1f0a-4924-a29f-c928610abcc2
1103	2	$2b$10$1Bk0CvwOBOzrvWfMzPE2Je4SkGVGonDcvIcbkQNZS0NrMUG8xLoMa	\N	\N	\N	f	2026-07-26 16:18:14.257	2026-07-26 16:18:14.257	2026-08-02 16:18:14.256	ea8e6f6b-5558-4d6c-8089-bdfd5fb64dfb
1104	2	$2b$10$.1YTpZq2UN.bzr54UK7BYu.knZWXGIftNN1Vm18PghZGr7wothJUG	\N	\N	\N	f	2026-07-26 16:18:21.708	2026-07-26 16:18:21.708	2026-08-02 16:18:21.708	3f18733e-d953-4ec2-9c35-2b8ebf4e04f1
1105	2	$2b$10$mIrrEFUkomA4E4sFUhzIQeNMyE9HxqmgQ5PxnAn3CEec7MWcuTaKa	\N	\N	\N	f	2026-07-26 16:19:33.183	2026-07-26 16:19:33.183	2026-08-02 16:19:33.182	1ac5b03e-f2c5-4921-8a95-7c026808c831
1121	2	$2b$10$IC7oXPsZIuef2EMf5Ik5yealj3UJSYzuLf.NAe64l66B0K88SPMAi	\N	\N	\N	f	2026-07-26 17:07:26.967	2026-07-26 17:07:26.967	2026-08-02 17:07:26.967	e617cf15-5b7f-4f2e-a410-73957480d317
1106	2	$2b$10$dDJBkt4X6rDRCnGTv0rb3.7nuKLFD0/KdxLF9dhRmFNf0BljrCZA6	\N	\N	\N	f	2026-07-26 16:23:31.318	2026-07-26 16:19:36.295	2026-08-02 16:19:36.295	bbe3c591-ca9d-4470-a47a-ba34d3ceff7b
1107	2	$2b$10$fKH/VpBLqtb9N6dWyFc9kuPKbKB5cY6UywP1JSZR0McP7dSgiBo6u	\N	\N	\N	f	2026-07-26 16:27:03.044	2026-07-26 16:27:03.044	2026-08-02 16:27:03.033	73d116b2-793b-418f-916c-890663bfaa37
1122	2	$2b$10$NXdmsD1/N/LizIcJtjrN2eq4Z0bNmJMV.pZ0bfTPys6oXX31x46KO	\N	\N	\N	f	2026-07-26 17:07:36.446	2026-07-26 17:07:36.446	2026-08-02 17:07:36.446	e7921e73-5d92-4c5b-a347-02d3aae7b18b
1108	2	$2b$10$TirwKShuoKchinvSLw9jJuIMNSjdH3FKs6mk6R2QVM/7gzNO0EERq	\N	\N	\N	f	2026-07-26 16:30:01.598	2026-07-26 16:27:07.069	2026-08-02 16:27:07.068	32ea4739-940e-4841-a9cb-b72024b7ecb4
1109	2	$2b$10$PGehq/dy6w4zUyeAuQeDk.CCq1dVmfJPueAEpgPrwSjcoQcvcKdFS	\N	\N	\N	f	2026-07-26 16:30:24.387	2026-07-26 16:30:24.387	2026-08-02 16:30:24.386	a5b3c0b8-2ba7-4795-8734-5b85bc8df713
1131	2	$2b$10$a05CdJzex5SHxkwK.hehLe9r7LyUkoX9F.JPp/6.YeWZIU87.E7.a	\N	\N	\N	f	2026-07-26 17:16:41.99	2026-07-26 17:16:41.99	2026-08-02 17:16:41.989	08c57341-949b-427a-b49b-c079dbad7ee2
1123	2	$2b$10$NDvfm2JSOiwLhNDjD00X.ufZYa/r2mcfKwo.Rcelcno5vbrWsLgMW	\N	\N	\N	f	2026-07-26 17:08:49.707	2026-07-26 17:07:46.023	2026-08-02 17:07:46.022	23d524bc-300f-4090-9c4a-84172fd6582a
1110	2	$2b$10$MASt76NFbMhrUYE7LMUoXebLe61QiBEP6j4FRfxcvQQcOesAT0fNi	\N	\N	\N	f	2026-07-26 16:34:23.259	2026-07-26 16:30:37.937	2026-08-02 16:30:37.936	dfe0b330-afc9-4f7f-8187-dc88ed955d67
1111	2	$2b$10$M5up8Qdk7qTcC7tN1BrJdOSlVIAbZMFXAgyWTiP15C6sXOTgSXKAi	\N	\N	\N	f	2026-07-26 16:45:34.945	2026-07-26 16:45:34.945	2026-08-02 16:45:34.94	8eb88736-47b2-40cb-99c7-9f647c30a299
1112	2	$2b$10$ddO2ThaicSrs/2GB7h8UXuodI7kNpsi4ZkR9f8n9ZoH2pOz8W644i	\N	\N	\N	f	2026-07-26 16:47:23.813	2026-07-26 16:47:23.813	2026-08-02 16:47:23.812	3c6554fc-7c75-4162-a019-5b09f8e68bc4
1113	2	$2b$10$3LJR2Y838dTO/5Y/FRUHiOKfXMecu/GkKBfrac4ul/mlzvGQluIkO	\N	\N	\N	f	2026-07-26 17:02:33.758	2026-07-26 17:02:33.758	2026-08-02 17:02:33.758	a9834907-de29-4acf-940c-3f11d84217e9
1114	2	$2b$10$GsCmXdgCjs9uNobjnIAHNu5.XRFkvWj01xYCoKn.fH8b8QVEdD/IW	\N	\N	\N	f	2026-07-26 17:03:17.841	2026-07-26 17:03:17.841	2026-08-02 17:03:17.84	fbfaf112-60a5-459f-a40c-67c3909bad4d
1115	2	$2b$10$D.qe2PAOqpPt9PUnv9GhJuFLh43HU9knAKclAAvOuYcpObnqKS./u	\N	\N	\N	f	2026-07-26 17:03:26.227	2026-07-26 17:03:26.227	2026-08-02 17:03:26.227	d7391527-5b33-45b1-b786-4d2fd6a26ef3
1124	2	$2b$10$QaoyO3kFVRz2WtkgPFDG.OAa8hQ8EvpyLtAEPXIw1bhITZjlNMDU2	\N	\N	\N	f	2026-07-26 17:08:58.089	2026-07-26 17:08:58.089	2026-08-02 17:08:58.089	e7caf601-29fc-49d9-b94a-d65bb82efa12
1116	2	$2b$10$QQ0YutgJBQ0ydIUhObXJt.DmRTLHxv78YsGrxpQv87s4i52hnHzyu	\N	\N	\N	f	2026-07-26 17:04:51.656	2026-07-26 17:03:41.128	2026-08-02 17:03:41.128	22ac96ef-18c0-4fd3-a254-b51a7c869368
1117	2	$2b$10$F/7D/c84mTN0z/4n5./K7O036nVcHZNwMCWBoedNneMJxtBzSOtea	\N	\N	\N	f	2026-07-26 17:05:05.938	2026-07-26 17:05:05.938	2026-08-02 17:05:05.938	35be7b38-f961-4faf-bb3d-af3ba9a5a8f5
1118	2	$2b$10$PluGtXICcGpaC4FKRz3SVuNo.aFuQvbhnpOH11esmEdvtgxKN2Fgu	\N	\N	\N	f	2026-07-26 17:05:26.392	2026-07-26 17:05:26.392	2026-08-02 17:05:26.392	81b83b71-d19e-4ca1-9af5-e2e251f1cd9c
1119	2	$2b$10$KfXDCWxsaCzOtB3DZ/XJNe2zJhoC86l9EmjFly3.3TLhLrKwsQ3A2	\N	\N	\N	f	2026-07-26 17:05:54.291	2026-07-26 17:05:54.291	2026-08-02 17:05:54.29	11788997-f325-4ae3-8376-1a99a75131dc
1120	2	$2b$10$VJkg5I6N5uZRcDzRhFK.qeA5bL/jq86LhDbrhZftQz4j7nNQUfbO6	\N	\N	\N	f	2026-07-26 17:06:12.083	2026-07-26 17:06:12.083	2026-08-02 17:06:12.082	8d1abd84-d713-4191-afb5-fe93e47e6d45
1125	2	$2b$10$map85d8.w49qxz9Hn5Vp7eDDRbtgcDpqiWltRCeIwb6pMHxpESxuC	\N	\N	\N	f	2026-07-26 17:10:12.37	2026-07-26 17:09:07.698	2026-08-02 17:09:07.698	d0826ad2-fa9b-4377-97aa-27dbe0fcc070
1132	2	$2b$10$uS3yi6LSWGoITLGgvh1qpOntKznXGPTZaVdHKBATRXvAkLZ3kU63G	\N	\N	\N	f	2026-07-26 17:16:49.917	2026-07-26 17:16:49.917	2026-08-02 17:16:49.917	5648c296-67a7-4691-88a2-4161786dc48d
1126	2	$2b$10$dqGfqC5ZyL8XkbanzX2hvOH9nzJNh55gUsLxorsFrKFw4eH3ShuLC	\N	\N	\N	f	2026-07-26 17:12:24.356	2026-07-26 17:10:55.425	2026-08-02 17:10:55.425	57b159c7-a136-4d56-afc2-8526ff25da2a
1127	2	$2b$10$dBMUf1/sqGs98Bc8ihhNWeqPdX18J/g8b.YPi.grtPNqsln9HAq2K	\N	\N	\N	f	2026-07-26 17:12:28.042	2026-07-26 17:12:28.042	2026-08-02 17:12:28.041	fedd6c9d-1171-4c96-9a9e-3f6b5753ede8
1128	2	$2b$10$ywCEN3pLAauKPD/yEOPfJukd2DsvEDQrfPZZSTUw7jHguK0O6TwE6	\N	\N	\N	f	2026-07-26 17:14:18.296	2026-07-26 17:12:41.726	2026-08-02 17:12:41.724	8d4a477c-9d60-497d-98c1-952fdf561eae
1129	2	$2b$10$CNvkASIOp7RLJiUmOIo80e37dWRvyOALk9o/Yo5PAYraUDGSnRLoS	\N	\N	\N	f	2026-07-26 17:16:25.601	2026-07-26 17:16:25.601	2026-08-02 17:16:25.6	400bd59b-d467-448b-8586-60ab893f704b
1130	2	$2b$10$fFr5ZbQZt4lc1rbT83NMsed8Jp4u8eYIYsTucz/ISeEb7E4qdDp7a	\N	\N	\N	f	2026-07-26 17:16:29.437	2026-07-26 17:16:29.437	2026-08-02 17:16:29.437	cd94b7b5-5679-4c22-accd-c63343b0dc2f
1133	2	$2b$10$mJhXb080TMI4XmdClrL87etZBZCdmsH53aXcg52BH05PlNA5yfdRu	\N	\N	\N	f	2026-07-26 17:16:57.893	2026-07-26 17:16:57.893	2026-08-02 17:16:57.893	cc937caa-5cb2-4ff0-80af-3ff182b7647c
1137	2	$2b$10$eHJ6dWh22GdlgbcJLYnmeuYrMUn30RcdmQw5vUWCNuPQAzAVmC/4a	\N	\N	\N	f	2026-07-26 17:21:39.21	2026-07-26 17:21:39.21	2026-08-02 17:21:39.21	4ca7034c-e7e0-4553-92d0-1815fe045389
1134	2	$2b$10$0zx26OW.2IG9kBvi7Pmxg.hTSxQt8Wt4I/ZdgHaTY3KBWKEEo.TdS	\N	\N	\N	f	2026-07-26 17:19:25.054	2026-07-26 17:17:11.176	2026-08-02 17:17:11.175	0f801fc5-2d2d-454b-9321-6d543712adb5
1135	2	$2b$10$pREr4FrVwLUPKEliZ1/.bujjOgUlg9zd7xNDK2g1XoNXLoaBDytJq	\N	\N	\N	f	2026-07-26 17:19:40.844	2026-07-26 17:19:40.844	2026-08-02 17:19:40.844	ffdf0ed7-45f3-4930-939d-280e9fc98bb6
1136	2	$2b$10$kMhO9.lsmKZYPFCHFqWvruCN0HhLKtAJo2UCIDe0BpbCav.gKAdG2	\N	\N	\N	f	2026-07-26 17:20:35.16	2026-07-26 17:20:35.16	2026-08-02 17:20:35.159	167edf36-b4f9-4525-9553-18012f920c15
1138	2	$2b$10$RTZbFZya2rLmlPfAmSU5NOWBNJz9ih0k8HUrXlc7ttE/PVX7cETN.	\N	\N	\N	f	2026-07-27 14:07:52.06	2026-07-27 14:07:52.06	2026-08-03 14:07:52.048	6afa8c1c-2bd7-4dce-bc1a-08d77eba0f19
1139	2	$2b$10$wx/N2w1MU2pvfMiGVJ/B2eKIZZ0k4nFwUQ5p2xu1SBsGS8BZDHCFW	\N	\N	\N	f	2026-07-27 14:08:43.564	2026-07-27 14:08:43.564	2026-08-03 14:08:43.551	d638451d-cdd9-4401-b224-283af06a746c
1140	2	$2b$10$nMTDSSrJRz6eDmtasfD88ehPZo4edgvYQjNd8lRaVBTJavDCpv9pS	\N	\N	\N	f	2026-07-27 14:08:47.078	2026-07-27 14:08:47.078	2026-08-03 14:08:47.076	cc709845-8d0e-4283-a643-5b1245b2845c
1141	2	$2b$10$eLz26MeOekY/sttYVrtjCelML4GtfiHDoOBpPLnpt2SIs/..Zbt2u	Chrome on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	f	2026-07-27 14:09:14.388	2026-07-27 14:09:14.388	2026-08-03 14:09:14.386	92993d69-da98-45aa-8107-7ab589096ec9
1142	2	$2b$10$2DMTrjYRhippHgLWbeVCle2GH.XEOlY7yunsd38vVWONw2rKcwFcC	\N	\N	\N	f	2026-07-27 14:19:26.355	2026-07-27 14:19:26.355	2026-08-03 14:19:26.354	506f8390-c1d4-4beb-a91a-be31223eccd1
1143	2	$2b$10$7FwbBWGK8bstlS6C7yhscOHbPsAUdk381zJqAbvZ2G5cL/9dRVymO	\N	\N	\N	f	2026-07-27 14:19:52.786	2026-07-27 14:19:52.786	2026-08-03 14:19:52.786	fc492e60-2161-46b7-ba69-e4df772d7218
1144	2	$2b$10$oWIkL7Ip.oaVBC5u3SQS4uW1tCPKowyWmx6/EUaeWoUQ7HGC6bkfS	\N	\N	\N	f	2026-07-27 14:20:06.317	2026-07-27 14:20:06.317	2026-08-03 14:20:06.316	218ef9e0-3791-44ac-a42e-4ffbbd66a83a
1145	2	$2b$10$zEotbAgA34g32VzY.ru1We2Cpg4YPFh93D9GbeOjcJDWjyitryIiq	\N	\N	\N	f	2026-07-27 14:25:13.498	2026-07-27 14:25:13.498	2026-08-03 14:25:13.497	9b24c9d4-2eb3-4a5c-a375-ee8cc7f03e59
1146	2	$2b$10$5io5dfzWSRpQX73DgoHtC.VZ0yNRfLnfn.DN7lv1.8JKhBhGMCe2C	\N	\N	\N	f	2026-07-27 14:25:22.942	2026-07-27 14:25:22.942	2026-08-03 14:25:22.942	e854313e-de97-41dc-afe5-ce2724a21a3a
1147	2	$2b$10$tXPByOQ6iZZLFt31dC2DBOv1v.HivUdA4ciqStuuCKfRhDE2ToYQm	\N	\N	\N	f	2026-07-27 14:25:25.768	2026-07-27 14:25:25.768	2026-08-03 14:25:25.767	44f7fa7c-fc68-46ad-8bac-f64cfae43464
1148	2	$2b$10$V0RY/FiHk.V2ViXDtTLxm.QlVL2KOb.exqbZn9DJdecmwtQrJ9SV.	\N	\N	\N	f	2026-07-27 14:25:57.406	2026-07-27 14:25:57.406	2026-08-03 14:25:57.406	2110647a-0ace-4be8-b6ec-15aa6fcb4ee0
1149	2	$2b$10$IF8yq2TX0fFIpRkG3rILU.F3ejOLUSIvmg0GZM7FWJVTVP0M2YK/u	\N	\N	\N	f	2026-07-27 14:53:15.965	2026-07-27 14:53:15.965	2026-08-03 14:53:15.964	58974290-8eae-4021-8436-613e0ef863b6
1150	2	$2b$10$Q1j0EHEDkJx3U9SSQAEbauaBCGrWpzIcFyMs41k/kiQFinuqUxI4u	\N	\N	\N	f	2026-07-27 14:53:29.016	2026-07-27 14:53:29.016	2026-08-03 14:53:29.015	a5083c7e-5540-4465-b398-d19e675754dd
1151	2	$2b$10$GaGXzot.EZ0cGBt2hW7YXuIv3Y8wPBCpR9xsGX8wUCNicSg29fTQy	\N	\N	\N	f	2026-07-27 14:55:34.875	2026-07-27 14:55:34.875	2026-08-03 14:55:34.875	2b3af8b2-51a1-47c2-86b0-df3e74bfd5c2
1152	2	$2b$10$ZAJepWdleyfTovnpeoyqZOZD3GKzjwGmS.kUYOL8l5NdfmgppMl6S	\N	\N	\N	f	2026-07-27 14:55:56.316	2026-07-27 14:55:56.316	2026-08-03 14:55:56.315	afe7848c-448f-4758-be6a-3b0368ba8417
1153	2	$2b$10$G2CDSApoSGeVNgnFxWG1JebpQiNARnaoNGdrlQeTbCfnv5Y/amM1K	\N	\N	\N	f	2026-07-27 14:56:53.207	2026-07-27 14:56:53.207	2026-08-03 14:56:53.206	ef91b3ca-8c17-4bbc-8ea0-1d0dbf0af3d9
1154	2	$2b$10$6JjVAAgqXf5cAWz.gNPkqOuLdqJlKHecsN4VeH3dM.ld5n0StWcQq	\N	\N	\N	f	2026-07-27 14:57:05.873	2026-07-27 14:57:05.873	2026-08-03 14:57:05.873	c5eb8d53-013f-49db-8952-2c8d2e424979
1155	2	$2b$10$dfYPUdM5DBtHxcvuC.qEP.H26/jCjqEXFxw4sVxunds0J8jQcJW0m	\N	\N	\N	f	2026-07-27 14:58:07.522	2026-07-27 14:58:07.522	2026-08-03 14:58:07.522	7e6cef49-8781-46f5-975a-ff7778846352
1156	2	$2b$10$WOIBgMo08r955YKGdr.5ZeSQLK1q9QpfsS6QzxIT3GR3j/bBzmoG.	\N	\N	\N	f	2026-07-27 14:58:51.011	2026-07-27 14:58:51.011	2026-08-03 14:58:51.011	35089d72-811e-4105-bd61-d86e4e8a229a
1157	2	$2b$10$YB1AceN4rA0HNdOhfQdPkuG3SeUQJ3p2cB7XvG5YRGFYpfPdPPmJi	\N	\N	\N	f	2026-07-27 14:59:02.164	2026-07-27 14:59:02.164	2026-08-03 14:59:02.164	77b39bfd-0b43-4d0c-9b16-b5e7668870b3
1168	2	$2b$10$fEYNy8QTmzNKPCbh/FM1C.GYePgzg4AOlMccBc4aKqJmft9dOZ5bu	\N	\N	\N	f	2026-07-27 15:04:12.647	2026-07-27 15:04:12.647	2026-08-03 15:04:12.646	53c26ffd-d083-4d7c-bc64-b518446b8544
1158	2	$2b$10$A.DuNxzBd5h30.8QzdbXC.4UYTB3RlY3/wmdAUhQMj7/qNlVOK2Oy	\N	\N	\N	f	2026-07-27 15:00:21.195	2026-07-27 14:59:13.937	2026-08-03 14:59:13.937	d6dd8b33-3064-4d3a-b04c-528a400a741c
1159	2	$2b$10$2rPOOXOhl7rrop16UWeqY.RIOIx1P.jPqH7yX0Pmt5hrvlJgu.3Fy	\N	\N	\N	f	2026-07-27 15:01:02.798	2026-07-27 15:01:02.798	2026-08-03 15:01:02.797	b867f055-266e-421d-96cf-57dd3998cce2
1160	2	$2b$10$zoGvwacGxqZ6K6rr4SV2fO/0t/sc5vOvna1Kp/VqfBwDcJZgWZkZ2	\N	\N	\N	f	2026-07-27 15:01:12.328	2026-07-27 15:01:12.328	2026-08-03 15:01:12.327	2d4c2e6a-768b-426f-932b-1dc1997148c9
1161	2	$2b$10$LJdLfoSuwnkYFAdn1jDy9uPObaDOwY1cz5vBfeuDM7DCFhiO2s0CG	\N	\N	\N	f	2026-07-27 15:02:19.604	2026-07-27 15:02:19.604	2026-08-03 15:02:19.604	34f6bb66-8e09-4332-a9c8-e647edefd5fe
1162	2	$2b$10$bWlsV9XCdU.Y0xRmISrIQeE74.FWcrmzlBgtDodF7rfxKUR8NPBhy	\N	\N	\N	f	2026-07-27 15:02:39.499	2026-07-27 15:02:39.499	2026-08-03 15:02:39.499	13ce058b-44d7-452d-a7c4-9f65173be436
1163	2	$2b$10$ePeeg25jVCn6VekPAK4LVudS/1RucTJRa1hytOl/pSrC8kvlr6Zfa	\N	\N	\N	f	2026-07-27 15:03:17.669	2026-07-27 15:03:17.669	2026-08-03 15:03:17.668	fb6be7b1-520f-492d-b987-855234ca0e48
1164	2	$2b$10$d16i8cC/2AnSKnxbOjQ5HOBNGyj8DfA0Ydb/uUk5v/ExPzVKt72NW	\N	\N	\N	f	2026-07-27 15:03:24.077	2026-07-27 15:03:24.077	2026-08-03 15:03:24.077	2e25678c-770f-443d-86f5-59110bb915f0
1165	2	$2b$10$DR2LjQlFe1vXqnQNK4Bz9eUdx5ZjJ1g7L5jTNS9C4/gc6yDjrRO5e	\N	\N	\N	f	2026-07-27 15:03:27.875	2026-07-27 15:03:27.875	2026-08-03 15:03:27.875	0e1644be-f638-416a-b905-9f57aaad46c9
1166	2	$2b$10$0XDekPUSLyp9Ntpk0HihbOi7uOtbHqi7YnwbGKd.ItNZuubiw5eXS	\N	\N	\N	f	2026-07-27 15:03:51.922	2026-07-27 15:03:51.922	2026-08-03 15:03:51.921	df03d5ba-3ae7-4c53-852d-e93a7570a545
1167	2	$2b$10$RT5YswcXt.jUefcp9hhR7e7Oq.SuPrxkBvhWPtMlqfP0B0HYfLZR2	\N	\N	\N	f	2026-07-27 15:03:58.532	2026-07-27 15:03:58.532	2026-08-03 15:03:58.532	da0c22e7-da39-4990-a9a3-6c92643205dd
1178	2	$2b$10$tD1rJtABIhMhRY5B3uO7VO4qrrXbSdAIUwRr6n7x5ZdIrqLtF4C1q	\N	\N	\N	f	2026-07-27 15:12:52.404	2026-07-27 15:12:52.404	2026-08-03 15:12:52.393	2bfc545f-61ad-4a1e-bec6-1000118c8425
1169	2	$2b$10$VB5tuhlMoPQdF41yPs51S.FQzZMGct9O.EmW2e82o0sTH/GuZYCHy	\N	\N	\N	f	2026-07-27 15:05:24.556	2026-07-27 15:04:20.858	2026-08-03 15:04:20.857	29a1f5b9-c209-4c07-84f7-a874239e75a2
1170	2	$2b$10$MMnANfVkEfBIRv9yjfQSTOST4u2Cvjyb./dOWLAxtrNGKfbeG4FDW	\N	\N	\N	f	2026-07-27 15:06:08.327	2026-07-27 15:06:08.327	2026-08-03 15:06:08.326	52dcf57e-bd4e-4370-abf9-fb1a1436ebc6
1171	2	$2b$10$BonXw6mItrpkhxjIM/KcS.fKTfpHrtS7fOmgqct/xrBOWVAb1FXJm	\N	\N	\N	f	2026-07-27 15:06:26.728	2026-07-27 15:06:26.728	2026-08-03 15:06:26.728	71f3c233-6a03-416b-b81f-559aa09b335f
1172	2	$2b$10$OzMXscgrEKELc.29hOf.e.MKMEi2SatkDbKZu4AhY5um.uZmloPfW	\N	\N	\N	f	2026-07-27 15:06:49.177	2026-07-27 15:06:49.177	2026-08-03 15:06:49.177	2414a59f-439e-425a-8979-e31384f3bad0
1173	2	$2b$10$Wkue5tCbT6d3LZDvDvWJQekq3DdveO9fj1h5Tm.FloxmL/gULsJmS	\N	\N	\N	f	2026-07-27 15:07:40.308	2026-07-27 15:07:40.308	2026-08-03 15:07:40.308	0ac2f816-a828-46ab-90c9-c9e96bf974a6
1174	2	$2b$10$L3fI0vNeGBjlDby6pamdu.aX5wMTp04X6LSG4mSXrjFY7PTWnkeG.	\N	\N	\N	f	2026-07-27 15:08:10.741	2026-07-27 15:08:10.741	2026-08-03 15:08:10.741	ba7b676f-c302-4dd4-a337-83aab712a6f6
1175	2	$2b$10$b3.oxCSmEjedMZoiDzq6Oecz7JzgfcTd13AHaORS1g0aEr6I/FTkq	\N	\N	\N	f	2026-07-27 15:08:16.344	2026-07-27 15:08:16.344	2026-08-03 15:08:16.343	eff365d9-74c5-40c8-9fb1-217092eff70f
1177	2	$2b$10$VErUytmdx0qZ4g8IEC/oau0jzRtIEltQdD19eMNU3kuJ1ipqPYEtS	PostmanRuntime/7.55.1	::1	PostmanRuntime/7.55.1	t	2026-07-27 15:10:44.349	2026-07-27 15:10:44.349	2026-08-03 15:10:44.341	829d596f-aebd-453b-812f-2511fca0c4f6
1176	2	$2b$10$rfX8MNkppHmTCOthjgGonO0fC5YiNPkMZMcFcU3WMy84n4vpi2vVu	\N	\N	\N	f	2026-07-27 15:10:13.485	2026-07-27 15:08:24.804	2026-08-03 15:08:24.804	457c09e4-b4f5-4dbd-b009-8871f814e607
1179	2	$2b$10$kdmPnLCUoMgFjlVh2bPpveBv/xmbi8dSCfQNuHS2C4oGJpKL/FB1.	\N	\N	\N	f	2026-07-27 15:15:11.099	2026-07-27 15:15:11.099	2026-08-03 15:15:11.098	1ce5e04d-203c-4f58-ae48-36f8623a5972
1180	2	$2b$10$cdjm3oMxUc0xN4zHM2POP.mGJ2uGsaD6fKwsb7ylwd5F79U2Ga2rW	\N	\N	\N	f	2026-07-27 15:17:51.327	2026-07-27 15:17:51.327	2026-08-03 15:17:51.327	f60cd3c1-5f36-44de-87fb-767ca3a66673
1181	2	$2b$10$/3.al9005LjS29cAlmnFY.GGJ/E4Q5yov36Bd1Cg.Rhq1Toc.hFJK	\N	\N	\N	f	2026-07-27 15:18:09.577	2026-07-27 15:18:09.577	2026-08-03 15:18:09.577	a84dbbdf-8d11-4232-b716-a27995a3c91d
1182	2	$2b$10$yYiywTuPasfdkCxFlRCvJ.kW8Ghi1cTwKArZw3aKB/tZBvrEVIEDW	\N	\N	\N	f	2026-07-27 15:18:25.491	2026-07-27 15:18:25.491	2026-08-03 15:18:25.49	5a498afd-6666-470e-b1a1-5c75ad8730fb
1187	2	$2b$10$ZbF3PsLlgWPz8xIX2n75d.gvjVXYw13Nq8CS1cylpI83De33Wxvdi	PostmanRuntime/7.55.1	::1	PostmanRuntime/7.55.1	t	2026-07-27 15:50:56.727	2026-07-27 15:50:56.727	2026-08-03 15:50:56.727	81fd25cc-9209-4e60-a2ea-cfa3644d515a
1183	2	$2b$10$khXft/vFdNE4FgJkOrVQGOIzfzbQbgTh/fmv3iyEysy.7JAF4RI/G	\N	\N	\N	f	2026-07-27 15:19:52.827	2026-07-27 15:18:30.519	2026-08-03 15:18:30.518	6f0fff31-6244-42f6-bc79-ce68e78e8e13
1185	19	$2b$10$D1heaW8fe9uMNjM3tTYKa.n6n/9lWdeS857FHDzhog6FfwasnWWuq	PostmanRuntime/7.55.1	::1	PostmanRuntime/7.55.1	t	2026-07-27 15:47:14.857	2026-07-27 15:47:14.857	2026-08-03 15:47:14.841	eb5439d2-3fd2-4854-b5eb-1a5ac36f8443
1184	2	$2b$10$.4/Aenn7jb4cBR6KuZE2Wee4a/a6Z7hnpa3uyyP00BKk98xmHOQkK	\N	\N	\N	f	2026-07-27 15:20:14.982	2026-07-27 15:20:14.982	2026-08-03 15:20:14.982	c3026423-bfc7-4970-ae28-e1a1642b6d19
1186	2	$2b$10$w3jPnP6sxWeDxHqFtz3hYOr7.uZ4gF2d8NjGLifPdbqysxjTMzxge	\N	\N	\N	f	2026-07-27 15:50:41.114	2026-07-27 15:50:41.114	2026-08-03 15:50:41.113	87c22770-c0f7-4345-b882-f78ee598b999
1188	2	$2b$10$XsHmN3dnVFtRT1SzPF3sD.0nHY4oiLnkczMkrxbbfBvrP34paPVf.	\N	\N	\N	f	2026-07-27 15:56:27.218	2026-07-27 15:56:27.218	2026-08-03 15:56:27.218	7d2a7e6d-267a-4fcf-b318-cd4920fc7b48
1189	2	$2b$10$0jzlfTEB2KtvWmaZScHk...fT0WC9PNqrX80BWJwb6Zx2hX70.pXe	\N	\N	\N	f	2026-07-27 15:56:39.617	2026-07-27 15:56:39.617	2026-08-03 15:56:39.617	cee1285d-29a5-4177-bc9a-b1824513eb02
1190	2	$2b$10$rllgLg/6kpa5MagMjzjPsO2zxrYwZhpPLf5wLPgLXw.gqOM0KsPdq	\N	\N	\N	f	2026-07-27 15:57:00.605	2026-07-27 15:57:00.605	2026-08-03 15:57:00.605	f76a47ff-72f1-49fd-872a-6596dc436099
1218	2	$2b$10$5rkNTcB7Nk8lqEFGkbZ8G.6MVrdWiEFwDnSJLL7568FCNvosQLTQy	\N	\N	\N	f	2026-07-28 15:25:38.847	2026-07-28 15:25:38.847	2026-08-04 15:25:38.847	25cd0ea6-b67a-43ac-92ae-0afefb927f9d
1191	2	$2b$10$o70OTIMvifknhDJyvBgmiOuxaqwZhy55p1SUDwuBIt8dWke3sADpS	\N	\N	\N	f	2026-07-27 15:58:55.028	2026-07-27 15:57:30.24	2026-08-03 15:57:30.24	434fb9ef-e464-4679-a5e6-d08414903cd5
1193	2	$2b$10$OSpfJhiut1B4TEkHXM2yIucfnMokTpOSBE39Wsr6wt4y3CzSz5l8q	PostmanRuntime/7.55.1	::1	PostmanRuntime/7.55.1	t	2026-07-27 16:15:52.7	2026-07-27 16:15:52.7	2026-08-03 16:15:52.683	92b89883-6307-4179-8726-92c45eaec744
1194	2	$2b$10$9alVJNNmxnbiFCK773a0YOmtbAmP0F2RsHBrN/N.jPpsnSMUu6sLq	PostmanRuntime/7.55.1	::1	PostmanRuntime/7.55.1	t	2026-07-27 16:44:34.405	2026-07-27 16:44:34.405	2026-08-03 16:44:34.39	2eaf00ed-ebe1-4093-8fb2-dfbfe456aa5b
1192	2	$2b$10$LH/i6cvi74d.6HNaMLA8Bu1muiPqHGNGXcMnvzpIMbP.ymN7NJo0i	\N	\N	\N	f	2026-07-27 16:06:54.674	2026-07-27 16:06:54.674	2026-08-03 16:06:54.673	6487c53f-04f4-4092-82a3-570257fa3010
1195	2	$2b$10$Pq3IsQhVL7gqiiBjf9ZDReJHhSKz1aNjZfSP9F67CZUZkD63WMTPO	\N	\N	\N	f	2026-07-27 16:47:37.201	2026-07-27 16:47:37.201	2026-08-03 16:47:37.195	16cb95e8-acd0-48ab-a7c8-56918933f2b4
1196	2	$2b$10$dc6oFVW7/xm3UkzUGTs6GObdi8Ay/VwfWvbwlySn.9hRMHDYIIlci	\N	\N	\N	f	2026-07-27 16:50:26.139	2026-07-27 16:50:26.139	2026-08-03 16:50:26.139	7e67cffd-c51c-4f5b-8f63-7fea72b3dad3
1211	2	$2b$10$SRCwJRWV5QXX8YrFBf70SeoV.T/mae.yZwbSB31PCOpnAEZyC6Tzy	\N	\N	\N	f	2026-07-28 14:19:47.991	2026-07-28 14:16:48.373	2026-08-04 14:16:48.372	985b97ed-e259-49c2-8cf7-2cd582e09e9e
1197	2	$2b$10$KslCftwyiih4RaMJFVtEXOfLp8SQg7cJ164vwZWVdsJym8llbfCje	\N	\N	\N	f	2026-07-27 16:53:28.527	2026-07-27 16:50:32.605	2026-08-03 16:50:32.605	db5a631c-4626-4a1b-bc0d-5cd561057e64
1198	2	$2b$10$DnyDYxalDtfJpcLF0.6JNOEDMuy.jzOUwex0NmmWM7mpvYNoJbVs2	\N	\N	\N	f	2026-07-27 16:55:32.932	2026-07-27 16:54:29.868	2026-08-03 16:54:29.868	27094b3e-c337-4b61-a9df-77b2b602f7ae
1199	2	$2b$10$dvqApq74D34c5.y4bpfYaehCSqFeVVk2onOO3OQCsDiqoKrDDGTL2	\N	\N	\N	f	2026-07-27 16:55:33.858	2026-07-27 16:55:33.858	2026-08-03 16:55:33.857	dc700eb5-ff15-4730-837a-e30d90216a38
1200	2	$2b$10$bMis6JAZ0ey/PL715eejD.IaHoZSa0IY3jS4VAnYCEhJwBm/bYhme	\N	\N	\N	f	2026-07-27 16:58:32.111	2026-07-27 16:58:32.111	2026-08-03 16:58:32.111	7c3fea51-970d-4e10-a4c6-e1194981040d
1201	2	$2b$10$brapRxRlWVHw2lOrq8TsHu46um/ZOx9bFjTf0nIo//nv7yzo/kYiu	\N	\N	\N	f	2026-07-27 16:58:50.344	2026-07-27 16:58:50.344	2026-08-03 16:58:50.344	ffa8f36f-8fa0-437b-a6b1-f3b4da3a401a
1203	2	$2b$10$jsF6GNkcCWJ3Kwv7qR6dkOrVcWC1XS4w.1wpxVmHKU4mxz3rE1uDG	PostmanRuntime/7.55.1	::1	PostmanRuntime/7.55.1	t	2026-07-27 17:03:47.162	2026-07-27 17:03:47.162	2026-08-03 17:03:47.16	8d6ba84e-7b35-4284-a3f5-b9f289005500
1202	2	$2b$10$03U9SXCBGL0LqmbWbN0By.Arrg3zlKAb5jFHvo3EzdBcMaV8IZgc6	\N	\N	\N	f	2026-07-27 16:59:19.555	2026-07-27 16:59:19.555	2026-08-03 16:59:19.555	72aeb0ff-0a52-445f-8c2c-3d8e115205b6
1204	2	$2b$10$TX.cd/pLFHpU/xIwRHP0r.ZhRrAxTk1CVsGKTmpyYh9uOFec/DJ0e	\N	\N	\N	f	2026-07-27 17:09:31.595	2026-07-27 17:09:31.595	2026-08-03 17:09:31.595	030ff6c4-28ae-4fa0-bfef-c69642f5c2fb
1205	2	$2b$10$wv9HFIBoW9QIR4CHTYHmSueTyRhF7yxyMLplA7vSx7vYz2ryGGEwm	\N	\N	\N	f	2026-07-27 17:14:43.383	2026-07-27 17:14:43.383	2026-08-03 17:14:43.383	f80ffe6b-6556-4356-a8bc-061d1273ebbf
1206	2	$2b$10$4EWc11UY4kWVZy2VkOQou.tRiR2foG/RRHsdeq8DJio0UCo53K4ey	\N	\N	\N	f	2026-07-27 17:15:04.024	2026-07-27 17:15:04.024	2026-08-03 17:15:04.024	67918153-d730-4ca0-8b8e-65d836edf3f7
1207	2	$2b$10$aebcQjoJrYKcKPpH6Wc5Y.c1G1HiMovFCvOPtWdildI078SMVuRxO	\N	\N	\N	f	2026-07-28 14:13:47.185	2026-07-28 14:13:47.185	2026-08-04 14:13:47.176	0ed4f9b9-afc1-4302-a30b-f73e3b3f1508
1208	2	$2b$10$gSlcddgGEZQgfRwbFcq/fuAtB4FppM3CAqF5.OfLOIS80dAy/4cdq	Chrome on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	f	2026-07-28 14:14:11.467	2026-07-28 14:14:11.467	2026-08-04 14:14:11.465	ee18039c-af62-4b00-9b65-cfce6fe23f33
1209	2	$2b$10$p0N8/YETLp1bIOYY5LqbUORpKnAA/w0p0L0Qk1f.Cg2Jqzqg1spM2	\N	\N	\N	f	2026-07-28 14:14:26.479	2026-07-28 14:14:26.479	2026-08-04 14:14:26.478	44ee7f31-4707-414b-8fc4-b8b3bc42b066
1210	2	$2b$10$L4s.9LPwT/rtxE1Umiw9MOfunkMW8kgXB6Mi3O/iwF40Z9QjzkQLG	\N	\N	\N	f	2026-07-28 14:14:40.853	2026-07-28 14:14:40.853	2026-08-04 14:14:40.852	e931b89d-dccf-4854-bdd9-8c64e260da5b
1212	2	$2b$10$eWiIpiNXtP8HaBK9Rdy76Oc24XW1MJdlcBPh1MFz8k1zjQbE6bPPy	\N	\N	\N	f	2026-07-28 14:20:03.993	2026-07-28 14:20:03.993	2026-08-04 14:20:03.993	fe8b3e5a-75af-4fdd-9399-be283dd422dc
1219	2	$2b$10$0Pa815iums.Tchwo3r/dqemn8P.38RO.I/qVv2TgrcyNrmuHUza7q	\N	\N	\N	f	2026-07-28 15:26:01.177	2026-07-28 15:26:01.177	2026-08-04 15:26:01.176	3d5ff056-53c1-4f41-9a70-255a5660ff16
1220	2	$2b$10$IyUM5vljiJwr.xKuewUYDOpEkZaImaip2lE9t8bmo.E9/fDSfEfc2	\N	\N	\N	f	2026-07-28 15:27:06.274	2026-07-28 15:27:06.274	2026-08-04 15:27:06.273	3a75e28b-9690-4336-a526-4f3c8115b67d
1213	2	$2b$10$Dc6IdT.jUfhixc6R4C1EUOFeiv.m/LdRQjTkvRTYIZbdkDJ1Sm3ii	\N	\N	\N	f	2026-07-28 14:24:37.2	2026-07-28 14:20:34.585	2026-08-04 14:20:34.584	689ee054-3cb8-463b-8e9b-7244491b43de
1214	2	$2b$10$HGTPqL5VjpNrBmVXUbq9SO5yFa6/kb/bEm53mtOtavPH.Kj3nLo4G	\N	\N	\N	f	2026-07-28 15:03:48.906	2026-07-28 15:03:48.906	2026-08-04 15:03:48.905	71d6941c-70eb-4ab2-b476-98260a03f8a4
1215	2	$2b$10$D6fpIvJIA2VuYMjRa9LYXeAv99vcBMun4UCxeYPLwC8oxssU/pZY.	\N	\N	\N	f	2026-07-28 15:22:26.124	2026-07-28 15:22:26.124	2026-08-04 15:22:26.123	86e7c48d-5a9e-4208-a0b9-f6dcb4eea23f
1216	2	$2b$10$aftc0/mForuWL5Jsmaq6JeYFQrk6mrYtEun25cULf.6TEWQEvh3HS	\N	\N	\N	f	2026-07-28 15:24:53.555	2026-07-28 15:22:43.945	2026-08-04 15:22:43.944	278853d2-1c94-483e-bc06-76b54dd42a9a
1217	2	$2b$10$MPY.5COk0cvH5ZrY/8Pn3u9Hzq3nuaAwxnenD6mKCONbtM/n.SiLW	\N	\N	\N	f	2026-07-28 15:25:05.205	2026-07-28 15:25:05.205	2026-08-04 15:25:05.205	3f76bbbd-98c9-40bf-9842-9c289a502fe9
1223	2	$2b$10$HdeT2/HPS1126.iMRSfjKeIb6AaV1UwPmikzVgVgqLtefh6SAItku	\N	\N	\N	f	2026-07-28 15:35:25.636	2026-07-28 15:35:25.636	2026-08-04 15:35:25.635	35bdfb55-5eb7-461c-8b18-eaefb92b42c1
1221	2	$2b$10$ljs6oI7R2bMoo1/SOq6DTu3wzWJs8C6mRSwSoC0sdxr2Hyd4SoZeC	\N	\N	\N	f	2026-07-28 15:28:26.295	2026-07-28 15:27:24.956	2026-08-04 15:27:24.956	e2972bea-79a2-496d-adba-7930b0a4ef7c
1224	2	$2b$10$hHsDSWv6vvSYcake3DVnk.7S2K4QeZ4zdr8jSPxMhS7v/MOPU.0Qm	\N	\N	\N	f	2026-07-28 15:37:06.396	2026-07-28 15:37:06.396	2026-08-04 15:37:06.395	de81b096-1a3e-4272-8ea1-593e346df38c
1222	2	$2b$10$rdR5z7s4zo7Nd6IlOVXH/.bmNxajLOA8lTQk9XWcgMP5E.pI0YBsa	\N	\N	\N	f	2026-07-28 15:35:18.259	2026-07-28 15:28:48.902	2026-08-04 15:28:48.901	2895f272-70a7-4f78-a2a3-9d1b554c6a02
1225	2	$2b$10$LA6qu1byvvBFAKpnQQV3LO/dWDewYBRo1dCGa.D8TPJd0/atKevha	\N	\N	\N	f	2026-07-28 15:39:11.172	2026-07-28 15:39:11.172	2026-08-04 15:39:11.171	1a0be3f2-5461-4385-bffa-86351339a1df
1226	2	$2b$10$rn8/pe95XWTXWrS9uJlcX.atpaVDcRYtj9KnNpDEjTW6nbWzqkXxe	\N	\N	\N	f	2026-07-28 15:39:17.278	2026-07-28 15:39:17.278	2026-08-04 15:39:17.278	83a05d16-5463-4aa1-a659-723be8274359
1227	2	$2b$10$tY7TWFEadKD6JS6LIladc.xROSk/6LGbNCS8q2XIX5MGxp.9e/iB6	\N	\N	\N	f	2026-07-28 15:40:26.285	2026-07-28 15:40:26.285	2026-08-04 15:40:26.285	de89c57d-416d-4fb8-8a19-22c0f93b6067
1228	2	$2b$10$d33jWVb4nrGQ..bsQk2HyuAy91nDEZIG8a7Y271fL4zNafyHs5txS	\N	\N	\N	f	2026-07-28 15:40:30.727	2026-07-28 15:40:30.727	2026-08-04 15:40:30.727	f5f70b9f-6b03-4237-97f6-0d40a2ef5f3e
1229	2	$2b$10$R6LqyCDyt0JuuoJC1MocOu9MwYUTzQd/UmuEwXDqnM7uv4K4m98Mi	\N	\N	\N	f	2026-07-28 15:40:34.685	2026-07-28 15:40:34.685	2026-08-04 15:40:34.684	80223137-266a-4ed2-93fc-d19027b81467
1230	2	$2b$10$FoJM8PG5AC0TfLwWeGD6HuOAw7jwy7SCA7usLL/ea1QPW.X4/vzHS	\N	\N	\N	f	2026-07-28 15:41:56.382	2026-07-28 15:40:37.674	2026-08-04 15:40:37.674	495ff6db-ac02-43ff-8036-9b0cfb454cbf
1231	2	$2b$10$Q.swspdH1XFezMKHL0J9sOPbgnahgJnUJysA5h9HEoTzJQbtuH4AS	\N	\N	\N	f	2026-07-28 15:43:20.13	2026-07-28 15:42:17.346	2026-08-04 15:42:17.346	962d9a0f-9aba-4ac4-ba17-4b8d5c97eb60
1232	2	$2b$10$56Ts8nUN/Z2Ip/MzgIgyzulkWAa23lYDoPGNk4QvDAEXiFY9ioM.O	\N	\N	\N	f	2026-07-28 15:44:27.597	2026-07-28 15:43:26.259	2026-08-04 15:43:26.259	e0f9957e-ff1c-4287-b61f-8518c0bba122
1233	2	$2b$10$jikLuHKzd.az.9Cn.7QAO.ajYRJOS36SeXyt6klBSL2INPVowIfrG	Chrome on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	f	2026-07-28 15:45:24.341	2026-07-28 15:45:24.341	2026-08-04 15:45:24.34	a028e587-01bd-44d1-8bb2-e1d9e21b5775
1234	2	$2b$10$bh7Iz6NBjcRboYYKyrqPQ.bWj6mEcLJhYpmvSmjCc3iZq1jsRfURK	\N	\N	\N	t	2026-07-28 15:51:04.288	2026-07-28 15:51:04.288	2026-08-04 15:51:04.284	9bf6a004-3c01-4e2d-b0dc-3c3c437933e4
1235	2	$2b$10$NrqPDOvRJAFSWWcsdb4uPuJCJwQtPEEDuxLOZ6/o7Rp30.AHxoBQ2	\N	\N	\N	f	2026-07-28 15:51:04.289	2026-07-28 15:51:04.289	2026-08-04 15:51:04.289	191e068d-d126-421c-a775-e896e5a377d0
1253	2	$2b$10$U1UFZexsXfdu6OagWoWlMOSpHDbfitYr0EGez.1NjoKS2VPUx9jyC	\N	\N	\N	f	2026-07-28 17:01:05.88	2026-07-28 17:01:05.88	2026-08-04 17:01:05.88	51da8d8c-5f80-4187-b77d-231b5d2c4162
1236	2	$2b$10$lu4m5GnBfv5YXrerbr/JB.gqgY/piXwSbpiv.QE6HEm/RvUYRUspa	\N	\N	\N	f	2026-07-28 15:52:49.268	2026-07-28 15:52:49.268	2026-08-04 15:52:49.268	923b96e1-4119-47e8-9046-6170ba8a3123
1238	2	$2b$10$V9RmYU9g7Cr3oV4gYtjNyeqIvicoD2fP4orGYa7S0.nv5kgdezYmO	\N	\N	\N	t	2026-07-28 15:58:42.252	2026-07-28 15:58:42.252	2026-08-04 15:58:42.252	e916b421-1805-4bfb-91ea-58967ac685c1
1237	2	$2b$10$0FUFk3Wuf3dcdT1jFqqhTeImX.ZaqsvWuGUQPYcahgAhH/PUvjzze	\N	\N	\N	f	2026-07-28 15:58:42.251	2026-07-28 15:58:42.251	2026-08-04 15:58:42.247	353d04c9-e9a3-46e3-a93e-1898cfe4e6c6
1239	2	$2b$10$j/Glh/MjxnIyG8wUGjIGVuUmw7B2q6AbER6FYGZyuIoZj25cDAUKG	Chrome on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36	f	2026-07-28 16:00:46.286	2026-07-28 16:00:46.286	2026-08-04 16:00:46.284	c24bd9f1-346e-482c-87f2-8e6eace45910
1240	2	$2b$10$5mfuclGRbkLtfkrYhvye/uOoHe/QuLBWolJ2QPZ3I9XvoCpPz1QDq	\N	\N	\N	f	2026-07-28 16:00:47.252	2026-07-28 16:00:47.252	2026-08-04 16:00:47.251	b08cbf71-22f5-42b9-a16c-0ec121e730b8
1241	2	$2b$10$PqS0MEyjG74nRoeFsUOzaOTWdvDwCJNjuEfTsfJj5gH5eGU2v28KC	\N	\N	\N	f	2026-07-28 16:33:14.994	2026-07-28 16:33:14.994	2026-08-04 16:33:14.981	f5349d8c-3d7f-4109-bf4b-03454af54bc5
1242	2	$2b$10$BYOIv6R6J9tcEEuqFPBWI.iAaW/uU3rPfDlk/c4ak/VBYCvfdLJse	\N	\N	\N	f	2026-07-28 16:37:21.026	2026-07-28 16:37:21.026	2026-08-04 16:37:21.026	52696b4f-7782-47ea-8263-33be98fb69d2
1243	2	$2b$10$mn7Wrd9Bp0W9qtMqVm4hG.07psugtTHIwEkiAyclV45OzuslEzSMS	\N	\N	\N	f	2026-07-28 16:43:24.472	2026-07-28 16:43:24.472	2026-08-04 16:43:24.465	cbb90132-774f-4012-9319-30b8e3220373
1244	2	$2b$10$Kxl8M.GShbaLF5J2dTTNUO0NmShGYAjZlGq0aG0oE1TB8iuO2cC5O	\N	\N	\N	f	2026-07-28 16:43:40.486	2026-07-28 16:43:40.486	2026-08-04 16:43:40.486	ea8767ea-5816-4f37-a323-1af0d4e91798
1245	2	$2b$10$3KZOCcUb/L7wWu.xyRtR9u0T3wxbjrTyjh//D.IMTWX.GFKHUD7ae	\N	\N	\N	f	2026-07-28 16:44:05.048	2026-07-28 16:44:05.048	2026-08-04 16:44:05.047	589708ba-f183-4af3-84fe-cd1519ba108d
1246	2	$2b$10$BZJ2M6IteHKaPbxsBMNJMuVLODv634.J5QRFS.Tlv7kkhdacOBRxy	\N	\N	\N	f	2026-07-28 16:44:34.274	2026-07-28 16:44:34.274	2026-08-04 16:44:34.274	c079cb2c-1966-4dd6-8799-08630d84f7c3
1247	2	$2b$10$8WdORrcg.9V0mcnXrsP3jeFBkmjUCZYV8cxVmDVzZBWi/5XyJlC7q	\N	\N	\N	f	2026-07-28 16:45:38.412	2026-07-28 16:45:38.412	2026-08-04 16:45:38.412	d9f48ce3-73c1-4207-b9ff-c2148e4feb01
1248	2	$2b$10$tO/nidxK2QW2cU7ja/dq3us8PXXn1d2K7ZJV1rqGSvqbw3g0hXPJS	\N	\N	\N	f	2026-07-28 16:45:51.8	2026-07-28 16:45:51.8	2026-08-04 16:45:51.799	4e45f8a1-5bef-4989-9565-3e36a37a157c
1249	2	$2b$10$TK8gx8aAWPu9MqY6QDSHL.N6WJ8d8wl601fGyT70F21YY1EyETAYi	\N	\N	\N	f	2026-07-28 16:45:57.082	2026-07-28 16:45:57.082	2026-08-04 16:45:57.082	c0703065-5899-4d8f-a740-7da95e690a96
1250	2	$2b$10$Sw0kFTZeSuVFoj2ybOFvcuqNKk3gxKToqWfYX0AEJU2Rv9vla48je	\N	\N	\N	f	2026-07-28 16:47:40.029	2026-07-28 16:47:40.029	2026-08-04 16:47:40.028	ecf52214-9f6c-4f8c-9845-ea7198f3bb32
1251	2	$2b$10$OJNe/AhwPCuNa3TdbpPd7.qSGbS2TlHicqika6L3jKoX91WGt0mOK	\N	\N	\N	f	2026-07-28 16:49:47.501	2026-07-28 16:47:46.577	2026-08-04 16:47:46.576	8bd1b8c0-4a90-410c-9b0b-ddc6d6c76fa6
1252	2	$2b$10$Ql40dZxz0PljO3KUCgFvfuuYwAlJ.2Dqi6qunkBYhZ13.YOhZXQJi	\N	\N	\N	f	2026-07-28 16:58:44.763	2026-07-28 16:58:44.763	2026-08-04 16:58:44.762	06a4151c-dd9a-4566-b14d-25f0bbc56acd
1254	2	$2b$10$DDCpz7e8rNvPQdpO2V9u6ekt3aiRTlTD/Go17vkEmcpX5PD9geT4i	\N	\N	\N	f	2026-07-28 17:03:02.804	2026-07-28 17:03:02.804	2026-08-04 17:03:02.803	83137b23-016c-4280-8ad5-7d587199d556
1255	2	$2b$10$tnyy2AxzzkyjXH9R/TwQg.hqudY7AqaxD/bOtAzZMAtL2wAmw2H0C	\N	\N	\N	f	2026-07-28 17:05:05.593	2026-07-28 17:05:05.593	2026-08-04 17:05:05.593	de6bd8ad-a883-4a87-9114-6f4ea16c2c3b
1256	2	$2b$10$CNN2VxkX8gWKiigTsWZ61eUiYWBVMXddk/7sXhFWYxhoIURQKIqc.	\N	\N	\N	f	2026-07-28 17:05:24.11	2026-07-28 17:05:24.11	2026-08-04 17:05:24.109	c903aca5-cd0d-4ce8-b898-ee0121e621e5
1257	2	$2b$10$j1sPDlXb24G4W9wZ85afZOiXL2nIUpqDQa27rSl88oNexyB3ddrTW	\N	\N	\N	f	2026-07-28 17:05:53.269	2026-07-28 17:05:53.269	2026-08-04 17:05:53.269	1db9c34e-8087-40ca-ba46-d922130383ee
1258	2	$2b$10$MotQFQwX7pFgxv2ExukEweX3TObDR.D3JUsuI.8ywzOLiXkLpk7Va	\N	\N	\N	f	2026-07-28 17:07:19.593	2026-07-28 17:07:19.593	2026-08-04 17:07:19.592	dc1a68ec-d8fe-4223-81c0-65089d8eddcf
1259	2	$2b$10$VJNQMT8beHYZab2bQYB0suYS0Jy1xgw22wzzxblQBN4xx3GDiVyJS	\N	\N	\N	f	2026-07-28 17:08:10.76	2026-07-28 17:08:10.76	2026-08-04 17:08:10.76	6dfd27ae-6a88-45c7-8475-166cdb13ec91
1260	2	$2b$10$HeCG2fsnbEzDmbjtLdYCEeOrpXnOBWfQT0SzVI4HBKbcM0FEZkDm6	\N	\N	\N	f	2026-07-28 17:09:37.35	2026-07-28 17:09:37.35	2026-08-04 17:09:37.35	d5e0c196-8119-49ba-b988-fcb20988767f
1261	2	$2b$10$Lp26iIdWyPx99O7ZuHVVBemZNaQgNiJYZ8VkB4OLcL4cy83tcv/gm	\N	\N	\N	f	2026-07-28 17:13:23.698	2026-07-28 17:13:23.698	2026-08-04 17:13:23.698	48ef340f-f7b7-41b2-8510-712acef42dfe
1262	2	$2b$10$PMrPY/48ArIwTDdKAzrSIu86R2H7ofWdWXYGs/KsOzzpmOFm3YZJi	\N	\N	\N	f	2026-07-28 17:13:39.838	2026-07-28 17:13:39.838	2026-08-04 17:13:39.837	ec80e32a-969e-45ff-823a-6a048e5cfd4e
1263	2	$2b$10$Usu7/kNQhkbnnBYOypgF9.k0U7klvUWL0dlCNwcXaOkDuEQm6Ng3i	\N	\N	\N	f	2026-07-28 17:14:42.608	2026-07-28 17:14:42.608	2026-08-04 17:14:42.607	fb5ec390-de5f-4d41-805e-2058470419cd
1264	2	$2b$10$T5KuVvOHOTv1ZKEGEcXDTOKY3Sd2nu8ZP2NPmyLhKEqdWa8fgkXXu	\N	\N	\N	f	2026-07-28 17:15:55.268	2026-07-28 17:15:55.268	2026-08-04 17:15:55.267	93ddcc0c-26a5-4586-9b21-8db58dfb0e8f
1265	2	$2b$10$zSdTI.4xVmwjUbGQ2EKaRuNLOHqIbKjBzm8ipEt.M0/rzDSYVnI4G	\N	\N	\N	f	2026-07-28 17:18:08.283	2026-07-28 17:18:08.283	2026-08-04 17:18:08.283	98ad5c82-0682-4898-9fd7-6a15306b3215
1266	2	$2b$10$VioY2ed5Tsdaj86fbrmxXehPwDbfGGa1wwY/yzuddrfF0rmQhaB7W	\N	\N	\N	f	2026-07-28 17:26:36.853	2026-07-28 17:26:36.853	2026-08-04 17:26:36.846	cf884b52-7d08-4827-9972-ff1407c1a007
1267	2	$2b$10$BzvSys80JvJdC6WxxQzqxO80kIZOcQ0WrI41Br6BxKgMfRBUwCuIS	\N	\N	\N	f	2026-07-28 17:27:26.802	2026-07-28 17:27:26.802	2026-08-04 17:27:26.801	2c2883b1-40c6-4573-9286-861a8d9558df
1268	2	$2b$10$BDtqizEWH4ObI/7XtzlIO.6who1Ri5CQuQDj75z5qhUtzLT7Pj/rm	\N	\N	\N	f	2026-07-28 17:28:13.991	2026-07-28 17:28:13.991	2026-08-04 17:28:13.991	ebe240c4-234a-407d-add4-920fe8f36a8b
1269	2	$2b$10$WRMDjFKmeCgFyslpdhGycu/2pJFBByFGySCvsmndigJuaF77Mhf02	\N	\N	\N	f	2026-07-28 17:34:37.28	2026-07-28 17:34:37.28	2026-08-04 17:34:37.28	265aa781-6e9b-4862-98d2-5fd873c221c2
1270	2	$2b$10$DaTUPwQ27yey3aeI/rSDuOZ5CewjTWwB5RDDkeJnTA8Cl8CdNU0Uu	\N	\N	\N	f	2026-07-28 17:36:22.776	2026-07-28 17:36:22.776	2026-08-04 17:36:22.775	5c847cac-4496-4599-bc08-d02c91c9be60
1271	2	$2b$10$alYCfT0fIXAOJdcqBHBnT.Q4NGyqCtZzOOl/qEeZPr3Q4ettBV9TC	\N	\N	\N	f	2026-07-28 17:36:40.798	2026-07-28 17:36:40.798	2026-08-04 17:36:40.797	e4203ce0-f231-4045-8248-b2ae3b6fe360
1272	2	$2b$10$n0F7JVwsLVsSZ2t98uV7BuJ6WxcWeaheP/Mc.lLjRSMGaCKVFK7I6	\N	\N	\N	f	2026-07-28 17:36:41.766	2026-07-28 17:36:41.766	2026-08-04 17:36:41.766	c3b5a175-af62-45f8-8717-3a425084de61
1273	2	$2b$10$3Emknp425Z5eYGJFRLMKM.9zn.YU/jWUGdGYtin.YHsxNU2DMIzIO	\N	\N	\N	f	2026-07-28 17:37:14.918	2026-07-28 17:37:14.918	2026-08-04 17:37:14.917	6bfa3f74-f922-481b-9518-618dfab3c341
1274	2	$2b$10$8yk9z.8Zu.aJ9OlCnc5oGusamNEKxWUhjsz5tP4I6eyPhwwfKu3c.	\N	\N	\N	f	2026-07-28 17:37:16.869	2026-07-28 17:37:16.869	2026-08-04 17:37:16.868	47dba80b-616e-4a5d-8748-04dc56d841bd
1275	2	$2b$10$1pOzyJr8Td41LUBi4BPFt.3w0vMEi0V7ljhN7g7.rfJn5hykxfRf.	\N	\N	\N	t	2026-07-28 17:38:46.702	2026-07-28 17:38:46.702	2026-08-04 17:38:46.702	95765f50-26c9-4de1-bb40-ade6b0cc1794
1276	2	$2b$10$XKNq./29sht/fEG19fwOL.7aZDl/DKTk.jJOu98EuvS9YpWpNgTSe	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-29 04:19:05.385	2026-07-29 04:19:05.385	2026-08-05 04:19:05.365	437c3ab7-2efa-4c2c-bef8-b3de10251ddc
1277	2	$2b$10$dMUqylaXXwbWmLRd5wF6XuhZ4CTtqdFB/b.bdhWeoRUf4er9l7fye	\N	\N	\N	f	2026-07-29 04:19:06.035	2026-07-29 04:19:06.035	2026-08-05 04:19:06.032	b2008cd7-0c58-498f-85e9-7ec53aed2f8f
1281	22	$2b$10$IOEyTMGxhtJ/cTwQOdpvpOaP7ubj5m9b5OMzD8s86Z.IzNsHW5DWW	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-29 06:16:36.624	2026-07-29 06:16:36.624	2026-08-05 06:16:36.622	b4919a09-39eb-44e7-a5d8-e4d3d6a36842
1282	22	$2b$10$14en6UGBk55OFXFNv93Oa.GkR4vjmRfLhGcb0GTI6bhXpCfa..2z6	\N	\N	\N	f	2026-07-29 06:16:37.655	2026-07-29 06:16:37.655	2026-08-05 06:16:37.654	29c796f4-9424-4882-b606-06f14337bb61
1285	2	$2b$10$/BgXPiXKQ5cVv0l.p7QNLuVaxLc6Np3r8930O/h8uI3EvAeO.qU5u	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-29 06:20:59.47	2026-07-29 06:20:59.47	2026-08-05 06:20:59.469	8fd4559d-1286-4f9d-a466-8d8ebe502257
1286	2	$2b$10$wQicxsDoILeeU.DM.z2tDOKZIhwfQ2YWXmTHEtHF8/snutZ0AiDyC	\N	\N	\N	f	2026-07-29 06:20:59.876	2026-07-29 06:20:59.876	2026-08-05 06:20:59.876	3f384c05-8bbb-46c6-9deb-bafe08893982
1289	2	$2b$10$eyU56Nq9T2b.Ga0G3pSKI.C502tFqhn4y5XO4wbqtchHCzsAApSie	\N	\N	\N	f	2026-07-29 07:49:31.745	2026-07-29 07:49:31.745	2026-08-05 07:49:31.741	3b974296-2f2f-4a0a-8f04-b629b905409d
1292	2	$2b$10$/Sa5H76sHNvIceRyI5zrZua5FAAU1bxY4cVcmR2WHxqxKz/0RonFa	\N	\N	\N	f	2026-07-29 08:46:19.095	2026-07-29 08:46:19.095	2026-08-05 08:46:19.094	d53085bd-35a8-4fba-96cd-e1724778464a
1297	2	$2b$10$WgyfztRNHEl5yTnoKUbXhuv3W0WuJtMm21KcjI2wIA8B.mhiK3vly	\N	\N	\N	f	2026-07-29 08:51:11.928	2026-07-29 08:51:11.928	2026-08-05 08:51:11.928	56e5ab0b-e02f-4f51-90a0-6506fe20cc74
1298	2	$2b$10$kA33Z4TH5xxWQp2Z970GreQXIDswfIjDIOYyIVnn8hleh2yk0iEz2	\N	\N	\N	f	2026-07-29 08:51:13.354	2026-07-29 08:51:13.354	2026-08-05 08:51:13.354	ca9fccfd-f520-41db-ab58-43d1442b00c3
1318	2	$2b$10$eVL4VPa/rdxhWNjVKAq2aOslcqQ/MUxUude6SG4H9xSKEUKA117nm	\N	\N	\N	f	2026-07-29 09:26:25.047	2026-07-29 09:24:13.38	2026-08-05 09:24:13.379	2d813512-4e0a-4266-b18f-b7a74b1875c1
1299	2	$2b$10$peVotLwT40eo3iW7/2.zYOscn6Fri9PoQiTxpH0IdjP9tIoI4ECmu	\N	\N	\N	f	2026-07-29 08:55:10.374	2026-07-29 08:51:14.766	2026-08-05 08:51:14.765	48ad0026-25d7-4588-a8ba-04c30de389e2
1303	2	$2b$10$HJbzgDwdx6.bFgkv9VROlu8v1aelWZUdEsOrj.Ti70zUNTT6ngu3i	\N	\N	\N	f	2026-07-29 08:58:10.97	2026-07-29 08:58:10.97	2026-08-05 08:58:10.968	c8e0a6f0-2d02-4814-a5fb-eb889d3216cc
1306	2	$2b$10$SCncdyAVNhTWr145AK.WF.4FwiDeTYYCycPPs1IMEY1NHh2jxs4SS	\N	\N	\N	f	2026-07-29 09:05:05.803	2026-07-29 09:02:23.417	2026-08-05 09:02:23.416	32fb05ad-24f2-4ebc-981d-7bd8e0fa6f26
1321	2	$2b$10$uFzDXUacNEYvtbwn4DHEluvA2xiQsPECEgOrQtj4PH3vNlxglzwXO	\N	\N	\N	f	2026-07-29 09:28:27.648	2026-07-29 09:28:27.648	2026-08-05 09:28:27.647	850a283c-4bb2-4bb2-b448-8d392349f681
1309	2	$2b$10$71/qUu9f6AUOoIDD28w7dOPyk/3/CMqvd86TgnqE.BRkALYPVU08K	\N	\N	\N	f	2026-07-29 09:18:38.754	2026-07-29 09:14:00.996	2026-08-05 09:14:00.994	02dddffe-2d7e-43fa-8c40-b0897fce6cfd
1312	2	$2b$10$QnYGNDhWeuaXmveE8aBBG.yQaQhPrxEIlBwGI/gpH.cjolUiZaW0K	\N	\N	\N	f	2026-07-29 09:22:01.369	2026-07-29 09:22:01.369	2026-08-05 09:22:01.369	fe739aef-53b5-4552-9f95-36351633a825
1315	2	$2b$10$60js.i1d8qKXzpmhDZ6ztuJ8Kot3fJAjaYzscEnMht9V8KeNLl1hG	\N	\N	\N	f	2026-07-29 09:22:43.389	2026-07-29 09:22:43.389	2026-08-05 09:22:43.389	eaf47e68-50be-41fb-95a8-bcded60bd5b8
1352	2	$2b$10$ToSnZ4s1c/RXgd2Z1yX1pe4/pIJhdKq/w0z/rorHIowu2UXfVqYry	\N	\N	\N	f	2026-07-29 10:00:26.649	2026-07-29 10:00:26.649	2026-08-05 10:00:26.648	2a1af79f-88cc-44c8-84a9-ceba50d22aa1
1324	2	$2b$10$rnXaawe0WE6rrYLn3xM1ceCAqW5TEF6Fh7B9XsGG/BwidhmGJVHRO	\N	\N	\N	f	2026-07-29 09:30:21.948	2026-07-29 09:30:21.948	2026-08-05 09:30:21.947	e3816178-e594-4f73-a4a4-c2a578b5d2fa
1327	2	$2b$10$s1O/MW9FogDev7F4YZjruuVv1PlJ1PKdud.0bP9xba8gSO.zoUfj.	\N	\N	\N	f	2026-07-29 09:34:13.41	2026-07-29 09:32:27.78	2026-08-05 09:32:27.778	a09dc1e5-21a3-40f2-bcdb-cb17dd7ce527
1330	2	$2b$10$0eyhnxdfNltxN8NqitHjU.d3p9y6j9B/4/w2Wm.UFfHYibxP.vy1K	\N	\N	\N	f	2026-07-29 09:40:20.049	2026-07-29 09:40:20.049	2026-08-05 09:40:20.046	d1ad27fc-10b6-4f41-a2bf-cea9487970ec
1333	2	$2b$10$L/Y0Rie3/WuzAiMrGgDIUuapO6DPPS8hr11xRE77w6f5xsnYngzi6	\N	\N	\N	f	2026-07-29 09:43:35.07	2026-07-29 09:43:35.07	2026-08-05 09:43:35.069	17f56ca5-a243-4719-a655-01b089567a32
1336	2	$2b$10$ctLL4WyVZrWgPpdPBkLt7.j8TkE/gbUvg1FRUhBCd4e9BdW9L/vW.	\N	\N	\N	f	2026-07-29 09:45:33.466	2026-07-29 09:45:33.466	2026-08-05 09:45:33.462	30a88dcc-b008-457f-b4d5-6b317943440b
1340	2	$2b$10$5NLmFRy.gaqZqs1jZM51BeFkgoa.YqYdGEZteH.nmKArlfW.zwGHq	\N	\N	\N	f	2026-07-29 09:49:34.756	2026-07-29 09:49:34.756	2026-08-05 09:49:34.753	bbe93986-b13e-47be-a6c3-90673505e030
1343	2	$2b$10$5hhT/YL0OcoVT01GaczU9Oy0bvmBHsiigVFugO53lNj.oSeH6Kgy2	\N	\N	\N	f	2026-07-29 09:52:16.83	2026-07-29 09:52:16.83	2026-08-05 09:52:16.826	c5e22854-f0e2-460e-a1bd-f4f33f1077a9
1346	2	$2b$10$rm8jRc57j/xNUN4Tiq7ZKeHdtEtUl6qo1UmMs9GT3j9jLdPEUsE3G	\N	\N	\N	f	2026-07-29 09:53:58.859	2026-07-29 09:53:58.859	2026-08-05 09:53:58.857	da0433bf-7d03-4882-aa03-615078c1dd92
1349	2	$2b$10$S/wRx31PoBPOl1lH3nNx4Odwhkd/9542r2tP0SQiXrK.5O90PvX.y	\N	\N	\N	f	2026-07-29 09:56:28.301	2026-07-29 09:56:28.301	2026-08-05 09:56:28.297	6a47c900-9537-4f21-a667-daab2b1d86a9
1374	2	$2b$10$fyxsVwbtZE0jdFeO9UoMcO2iSBhcjqzzAaGFFS373CGj3pXKXhM32	\N	\N	\N	f	2026-07-29 11:29:46.971	2026-07-29 11:27:48.964	2026-08-05 11:27:48.963	129ee58e-0f00-438f-a159-de2e9a58a126
1355	2	$2b$10$bFDiY40rfNUX/RV.33HWY.SS32BuJgN3RNx1RRcyIMqXW5.bqVo0C	\N	\N	\N	f	2026-07-29 10:03:35.801	2026-07-29 10:02:09.858	2026-08-05 10:02:09.855	820ed1e2-ec9c-4343-a1f3-3fd3b668b1c7
1358	2	$2b$10$LawpiSm5a.YO63zhXiHHTuk2ZbG1h6rryUW6VrAtHALpdcN9Ymqc6	\N	\N	\N	f	2026-07-29 10:05:25.047	2026-07-29 10:05:25.047	2026-08-05 10:05:25.045	20ecddd9-b09e-475a-8d8e-332a1dc00d1e
1362	2	$2b$10$6p2euXyZNpF.lfRaYHzA7OhN0qJAyi1lN2T9WvMmW5PHYzEFybTwa	\N	\N	\N	f	2026-07-29 10:45:50.973	2026-07-29 10:45:50.973	2026-08-05 10:45:50.971	f11b8287-a90e-414e-876b-29c597dedd60
1371	2	$2b$10$b/CmC73gHzIbXORfIDHkkOZT.alwXx682hONOL.EX85hst7z23Tm6	\N	\N	\N	f	2026-07-29 10:49:23.929	2026-07-29 10:49:23.929	2026-08-05 10:49:23.927	09d727b9-d1f4-45dd-8421-991bb544a94c
1377	2	$2b$10$rcNeZosBBGXaFkCW3XRCD.i9d7ohNbolVng2YkKWi0j8a2faBuW6S	\N	\N	\N	f	2026-07-29 11:30:57.589	2026-07-29 11:30:57.589	2026-08-05 11:30:57.588	f9a5d69f-ab88-4dea-9a2e-5602f2e794c8
1278	21	$2b$10$fZLwmG53qiwGu7VkYA3L6OwwEUURaSl38Gj6rDOGhpc6YoblYytZq	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-29 06:04:42.979	2026-07-29 06:04:42.979	2026-08-05 06:04:42.977	edf68513-3a58-4378-9264-209e6179edd7
1279	21	$2b$10$T8QTBv/a2oVMne/s34tsRum82q2PgHIbeTruQKO/L64qsOwqcR1Re	\N	\N	\N	f	2026-07-29 06:04:43.964	2026-07-29 06:04:43.964	2026-08-05 06:04:43.963	9ca1a4d0-2a1c-4942-a39e-f49e0eef9b79
1322	2	$2b$10$FHqyyC7cpU5YdtdyzfzB4OQIC7f25wvWTzQaOvmUnFI.pQ0V35vHW	\N	\N	\N	f	2026-07-29 09:29:51.862	2026-07-29 09:29:51.862	2026-08-05 09:29:51.858	fac1e4dc-1061-4fda-b1f3-5da40e184ccf
1283	22	$2b$10$FHl8wO7mlHug.VbXeOmMCOFrSAvKDwG9OYSaBfQbaMUPnz2MBfhvK	\N	\N	\N	f	2026-07-29 06:19:25.236	2026-07-29 06:16:48.284	2026-08-05 06:16:48.283	346a7b49-4353-48df-9792-fe60f0c08275
1287	2	$2b$10$YKLqJiIga6I.kWh2HbhS4e4trdZOURmtSzUZDBNbGvEGnc4FFWsXq	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-29 06:31:57.383	2026-07-29 06:31:57.383	2026-08-05 06:31:57.381	ec36ace4-da53-4f20-86b4-762add201e7f
1290	2	$2b$10$HiRQ.aghZfdHxpi5CGlz9.2S1HJ//o5qmnZdEUAmlcLBp4Rv0CMV.	PostmanRuntime/7.55.1	::1	PostmanRuntime/7.55.1	t	2026-07-29 08:07:33.735	2026-07-29 08:07:33.735	2026-08-05 08:07:33.727	993fda09-a215-4957-aabb-d266ae6713a1
1293	2	$2b$10$mRySlpMsGilrpkpYWhaQ2.Zmi4mv4DGCUSgPXZbefNnNFwiP4oIx2	\N	\N	\N	f	2026-07-29 08:49:40.964	2026-07-29 08:49:40.964	2026-08-05 08:49:40.964	ca162f7a-9e0b-4f5e-8b35-ff20ef5cd583
1294	2	$2b$10$LSKLMA8ehOrLOwNJkZa9jeBwlwm7N7.MPU85GuaAuXuOBjia7QuV.	\N	\N	\N	f	2026-07-29 08:49:42.708	2026-07-29 08:49:42.708	2026-08-05 08:49:42.707	34b209ec-3329-440c-a2f6-9759a2daf20a
1325	2	$2b$10$7xbK2CawOeHIEcl3oXB2rOj.MgyiqFpb1wEFgwajsqswqELJXqlRK	\N	\N	\N	f	2026-07-29 09:30:25.693	2026-07-29 09:30:25.693	2026-08-05 09:30:25.692	eab222e3-dd54-4cdf-aa5c-0561abbbe51a
1295	2	$2b$10$ui5PAThHajX44Wc46dbYB.siRbvRX8khah6bdmPJgDZ6hcZfVN59e	\N	\N	\N	f	2026-07-29 08:50:48.355	2026-07-29 08:49:46.137	2026-08-05 08:49:46.136	f9a08b48-c7f5-4324-9913-1893be08a594
1300	2	$2b$10$znFR4lAdc2IeMx9blb3b/Omq7vlGWTXmnK0JvFb1OC79KsvI6d7Le	\N	\N	\N	f	2026-07-29 08:55:22.003	2026-07-29 08:55:22.003	2026-08-05 08:55:22.003	917f4e16-ed53-4f1b-a3b5-d7a02850a906
1301	2	$2b$10$2vTkeH8YkYZT0m2Cqn/3T.AE/hz.K8eyOwd6W48HU4dYd7Z0P3Q7m	\N	\N	\N	f	2026-07-29 08:55:32.106	2026-07-29 08:55:32.106	2026-08-05 08:55:32.105	987249a2-99f0-426a-9a59-4dfdbe852be1
1328	2	$2b$10$3vp3StLI8WYVsRapBgEEVuMJsfiMb2KLQw/3MGS.RzU44ycFMh3bq	\N	\N	\N	f	2026-07-29 09:35:02.788	2026-07-29 09:35:02.788	2026-08-05 09:35:02.777	c9f51c6e-bd0a-4cc3-8536-8b9843d95ef2
1304	2	$2b$10$MgkM618oQNW00Y.JkJr7keJT/qBzkWCOPIU1c2rnzV3sMvT5MUI7i	\N	\N	\N	f	2026-07-29 09:01:37.037	2026-07-29 08:58:47.385	2026-08-05 08:58:47.383	455f8a99-68a4-4890-9129-e6da766366db
1307	2	$2b$10$Ci67sYqD8FLxDi7jSdoB7..zYSXExp76tqVZEoMEOCxrF5tPejsH6	\N	\N	\N	f	2026-07-29 09:05:07.068	2026-07-29 09:05:07.068	2026-08-05 09:05:07.067	4116d14d-bd2c-479b-abf6-d5d059fbac87
1331	2	$2b$10$U4tKEWoJAafQLtmznjDTee1oyXmRIw7D59yb9Xq4lvOPJCFIuFAlO	\N	\N	\N	f	2026-07-29 09:40:57.167	2026-07-29 09:40:57.167	2026-08-05 09:40:57.167	94ba3706-8e4e-4b44-a939-0673a7221654
1310	2	$2b$10$jMdymp8QmvDelEFKhF8WMOxwFTnp.iej1sKs5hhON.nt6Eww1yD.e	\N	\N	\N	f	2026-07-29 09:21:25.987	2026-07-29 09:18:44.951	2026-08-05 09:18:44.95	f035e260-fac6-4d88-8f97-e5e2cf7d9f31
1313	2	$2b$10$iORRQiIWN/g7t33Iomjd0e9/wO.a1lqKWpmHvG2QjcQeRLSQu2s0y	\N	\N	\N	f	2026-07-29 09:22:16.032	2026-07-29 09:22:16.032	2026-08-05 09:22:16.032	9ca9ec94-8139-45d7-bf39-6a5c381c039a
1316	2	$2b$10$KVZwwoknE6XB.IWWriKJ8OOOpof98hDXHOuFif8drGhEmYzwto2au	\N	\N	\N	f	2026-07-29 09:23:28.715	2026-07-29 09:23:28.715	2026-08-05 09:23:28.714	285ea5c7-17c1-476b-8897-7f46d59cecef
1319	2	$2b$10$AuX6U1D2xuzPVxJRidHkMu0G1KgTMZXEDi7UWXBmX3.dciZgp3lkK	\N	\N	\N	f	2026-07-29 09:27:52.325	2026-07-29 09:26:34.845	2026-08-05 09:26:34.844	ad7fd649-be0c-4898-ba26-0065b9396507
1334	2	$2b$10$DCX9Z7Nr5NJMiF6M8nHtRePJHW.tYONezF3ASAT60O08aq.mbpUZ6	\N	\N	\N	f	2026-07-29 09:44:31.57	2026-07-29 09:44:31.57	2026-08-05 09:44:31.569	9dcd4396-c6ac-4e5e-9298-97b7db2e2921
1337	2	$2b$10$JuWUlsS6d0HiPf6GgT7UIOUIrzuwIMwG7KFNEe4.JEq6BIAZwDYQi	\N	\N	\N	f	2026-07-29 09:46:35.896	2026-07-29 09:46:35.896	2026-08-05 09:46:35.894	a8bd3e1a-651a-428e-abef-8a6250161862
1338	2	$2b$10$hK9TC7axCXH.nfLjN.MwyO4KL7V10o4tCBe48W4Tx2LbxTNugakZq	\N	\N	\N	f	2026-07-29 09:46:40.951	2026-07-29 09:46:40.951	2026-08-05 09:46:40.95	5fc8ddf5-6dd0-4404-a7af-75335bcede19
1341	2	$2b$10$0p5IiE8rMpxeoeCergNNR.U2URD7EARtR3TuRehNT/VuD8UeTLlHC	\N	\N	\N	f	2026-07-29 09:50:18.331	2026-07-29 09:50:18.331	2026-08-05 09:50:18.327	76ff1640-507a-46a3-82b7-c1e94bffa494
1344	2	$2b$10$qkRciKjpGzJOIB7mXE01lOD8CGqwX.z0T/0AHKBRWxYAn336nfh/a	\N	\N	\N	f	2026-07-29 09:53:27.472	2026-07-29 09:53:27.472	2026-08-05 09:53:27.469	30919dc5-bc84-4603-b72b-e35b3076531c
1347	2	$2b$10$q.6JfCf.ABeLW4kdNzcB7.77UbZgwg/7VnrmPBt7Hl5VwtbHzyK3i	\N	\N	\N	f	2026-07-29 09:55:10.098	2026-07-29 09:55:10.098	2026-08-05 09:55:10.095	33b910a6-2f68-454f-abbc-e49d9cc08b25
1350	2	$2b$10$YmqrcVDac2T6VAzUr80TsOmJj525LmJ57.O1T7CwibLxLKXzg8l0i	\N	\N	\N	f	2026-07-29 09:57:55.195	2026-07-29 09:56:50.024	2026-08-05 09:56:50.021	6738b2b2-a672-4fbe-b536-19ef67803adb
1353	2	$2b$10$dlzCH/NkLyOjkQEf2jckW.nJisFGMmqWJo6M141JDC2kzRQu3PIay	\N	\N	\N	f	2026-07-29 10:01:00.476	2026-07-29 10:01:00.476	2026-08-05 10:01:00.475	97066ef5-dff3-46cb-aef3-1e1fc1b9e11d
1356	2	$2b$10$VMyeH5P7o6rk/kb.Nb9VV.kVSQI0jPtQe3A/tsb7NqIIc7NDMzrM.	\N	\N	\N	f	2026-07-29 10:04:08.755	2026-07-29 10:04:08.755	2026-08-05 10:04:08.751	b63393a9-1a09-4b4e-8b4d-d6499a8ab3b5
1359	2	$2b$10$Q9JfzYG3oVaRXgdTmZBTeetfk9bO07wVq6wdOVYEZESwk.P8Faut.	\N	\N	\N	t	2026-07-29 10:05:36.738	2026-07-29 10:05:36.738	2026-08-05 10:05:36.738	947f0288-ff38-4dd1-bae7-2f37eedf0de1
1363	2	$2b$10$hFvtcTnA8Vt9M75pM6Wic.MseRf6JhCttTSUDPIYTybwrzkXeMG3S	\N	\N	\N	f	2026-07-29 10:46:15.173	2026-07-29 10:46:15.173	2026-08-05 10:46:15.172	271c913d-d5d4-4c57-927b-2d6e5f29afb3
1364	2	$2b$10$e/aSZ.vVQAisY52oCXpzieGePi36PHVPS5tpELRGwk0NB5bRufPwO	\N	\N	\N	f	2026-07-29 10:46:17.419	2026-07-29 10:46:17.419	2026-08-05 10:46:17.416	afef7d93-8ac6-457b-8aa6-0ef21b8d8c58
1365	2	$2b$10$1sLgJmHK9/ISTjnVwuHJQeDCg3e/IyCAJLpXj44GZigU/aajRQ8Ny	\N	\N	\N	f	2026-07-29 10:46:20.778	2026-07-29 10:46:20.778	2026-08-05 10:46:20.777	ec711464-3ffb-4da7-9947-d6faeee8b863
1366	2	$2b$10$36z1stC7SlsusOGep1dQ8uMlYjBinA91A8fMgyKFiZtN/7dyxdEXi	\N	\N	\N	f	2026-07-29 10:46:24.75	2026-07-29 10:46:24.75	2026-08-05 10:46:24.749	e57fb97a-25dd-4e17-95f6-143fcb18c6e1
1367	2	$2b$10$YRdiU9kbkNawIpTF1ZSU6uDYtEX1Nt6xxa5nnafGRk0e0WsNeJaki	\N	\N	\N	f	2026-07-29 10:46:27.559	2026-07-29 10:46:27.559	2026-08-05 10:46:27.559	f4ea34a7-5ff4-4a42-becf-96d641c17ff4
1368	2	$2b$10$4jJ9.OlTUC/ePIV5p8VTQuVuJKlgXp0BYs6AbZP1k89Ji.ctu73Gq	\N	\N	\N	f	2026-07-29 10:46:30.443	2026-07-29 10:46:30.443	2026-08-05 10:46:30.442	20a6815e-131f-492e-86d2-be51db85cc2f
1372	2	$2b$10$MCWGOStO/WcBV0lE.u2sJ.MGzFWstTqLosOzZo/Hwdq.Onp1VkJZ6	\N	\N	\N	f	2026-07-29 10:49:27.118	2026-07-29 10:49:27.118	2026-08-05 10:49:27.118	7cab662c-057f-441a-b715-778575e1d45c
1369	2	$2b$10$PJCpY18/txILwaX7Po/GweIVVBA5MeZyfChxb5qzHVWKZkko5FNAK	\N	\N	\N	f	2026-07-29 10:47:37.716	2026-07-29 10:46:33.392	2026-08-05 10:46:33.392	b35f1c5b-3e0c-4358-a600-72c3e573960c
1375	2	$2b$10$K.fbBFlVJ8M0mNlosJhrPONRp9vEh4bvVusEWRp/vxwf3Hb5rQDMa	\N	\N	\N	f	2026-07-29 11:30:23.788	2026-07-29 11:30:23.788	2026-08-05 11:30:23.788	2f6e277f-a76d-4a0f-b800-b0e8121ef0e5
1379	2	$2b$10$ozcuHq/hBzU5LcsGeliE8.kup2i74r96aN809RmXRTdF7E21IxA2K	\N	\N	\N	f	2026-07-29 11:31:37.953	2026-07-29 11:31:37.953	2026-08-05 11:31:37.952	50b71917-467a-45b1-90c2-6550ae09ef3a
1280	2	$2b$10$vIIUb83zpgktfW0Nx1jWWe8iKDVAye5WcMG3.wWr6lpt9QpBLDXWG	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-29 06:06:14.908	2026-07-29 06:06:14.908	2026-08-05 06:06:14.908	aa18a648-97e3-4e0b-a15d-7f7ec1cbd765
1284	22	$2b$10$NDIcpkVNEKPNIb87ESGDr.Iigbb9tXZpiODis8Xwyz6il3/eBNAB6	\N	\N	\N	f	2026-07-29 06:20:14.825	2026-07-29 06:20:14.825	2026-08-05 06:20:14.823	c867bb4c-e2eb-483d-a11e-733541bdf393
1288	2	$2b$10$wUBA7JiOLRoNUIqlYLv5wOnAC3asNESqEg6ECTDn/nkyXjs/3t2kG	PostmanRuntime/7.55.1	::1	PostmanRuntime/7.55.1	t	2026-07-29 06:33:56.947	2026-07-29 06:33:56.947	2026-08-05 06:33:56.889	7742dc23-f7d8-4f1b-ba61-d060049cc141
1291	3	$2b$10$bxSCzvE5PXbKc6pIBi2ayewpNFHjMxzUS.02eEnqYk5FXxcTnrzLO	PostmanRuntime/7.55.1	::1	PostmanRuntime/7.55.1	t	2026-07-29 08:16:13.6	2026-07-29 08:16:13.6	2026-08-05 08:16:13.598	d4e7b1e1-22bb-4d68-a2cf-2e7c9ffc7fac
1296	2	$2b$10$nC341Y3p3pzgDj3ifyZ2ruPHasU6pbF6bveL2NleRSfrx3wWnQASa	\N	\N	\N	f	2026-07-29 08:51:00.456	2026-07-29 08:51:00.456	2026-08-05 08:51:00.456	4a1ba661-3a91-4759-83bb-bb9b4de356d2
1302	2	$2b$10$58XzPcTh.PrhD2MgAQMiJumU8OqfGTaTrbNxvanl6CCpTIbqPuZv2	\N	\N	\N	f	2026-07-29 08:55:40.797	2026-07-29 08:55:40.797	2026-08-05 08:55:40.797	6a097be7-c1b5-4568-8b03-f712476cac6b
1305	2	$2b$10$dbdnApiWaOWrpKP1cVRAaewAnsrlAQufN8mAGT83Yp2pLAs.s1vfG	\N	\N	\N	f	2026-07-29 09:01:57.67	2026-07-29 09:01:57.67	2026-08-05 09:01:57.669	c75dbe42-cde5-4154-92c2-60c8a516261a
1308	2	$2b$10$FYzmTncFaWLXr.rpzsdhVuwKPZ6JCUcaXJg.qyvV5Aj4oMuEeGZi6	\N	\N	\N	f	2026-07-29 09:13:20.636	2026-07-29 09:13:20.636	2026-08-05 09:13:20.634	50065025-00d5-4d2c-9c26-3eb99e13122c
1311	2	$2b$10$W/yXkkgd9vdn/4qvBMUSY.PRVD8E5DTvxsSK2K6h9WLAWlsOQo96i	\N	\N	\N	f	2026-07-29 09:21:56.786	2026-07-29 09:21:56.786	2026-08-05 09:21:56.785	aeb28cfd-16fa-45ef-8f1b-f4597b8878cf
1314	2	$2b$10$8J4vmRj5QqNQMVJ6zBrpfeC2OBxuRhcKdc82ALvnt06Ia4CH7Tmki	\N	\N	\N	f	2026-07-29 09:22:29.397	2026-07-29 09:22:29.397	2026-08-05 09:22:29.397	e0a2ec49-314d-4569-a9c3-45b15be997b2
1317	2	$2b$10$57DgE0Fh.3NzaB3Cj1m/YOI1BW3PSHBgvwNMQqQ6Cw6Nr2F56gLrO	\N	\N	\N	f	2026-07-29 09:24:04.198	2026-07-29 09:24:04.198	2026-08-05 09:24:04.195	ba0edb99-2e9b-4f4d-90f0-3461953c40e3
1320	2	$2b$10$IIFl4K752xEHYDjEhpYDv.Pu5mwUpvwKrABMcA2DTVcEwlU4tHQra	\N	\N	\N	f	2026-07-29 09:28:22.563	2026-07-29 09:28:22.563	2026-08-05 09:28:22.561	7b7e0b40-39df-4542-b11d-b2dd9359ddc1
1323	2	$2b$10$txP5Ah4cRSpq66Wa/sEqfuEx3u6Qy1jie3xZzBDZqK3uNv.hOFxby	\N	\N	\N	f	2026-07-29 09:30:01.681	2026-07-29 09:30:01.681	2026-08-05 09:30:01.68	be5617ce-2a89-4281-a5e7-7378e2478f73
1326	2	$2b$10$8MHIHdmPdjTi5wk1T2Ek5.Z/8mxkuF1NgPbnnbL3jT1C7R542SiFG	\N	\N	\N	f	2026-07-29 09:31:05.069	2026-07-29 09:31:05.069	2026-08-05 09:31:05.068	b8db6cd6-2339-42da-aa77-4cb2478ebcbc
1345	2	$2b$10$JYuLsLQlhjcfiOgDQTCKhuxC2k37Lq.AXjp.QjkykABH3FXUR.GOi	\N	\N	\N	f	2026-07-29 09:53:39.045	2026-07-29 09:53:39.045	2026-08-05 09:53:39.044	c85c5819-b0ab-48ed-91cf-5219d0b918a6
1348	2	$2b$10$O4jWe7krSEXaVQpd0FQxSuGckVZxAcSqcZoQIBC5UjrSmJ6e62GfK	\N	\N	\N	f	2026-07-29 09:55:41.05	2026-07-29 09:55:41.05	2026-08-05 09:55:41.048	65839750-6fb8-4ccc-ac37-c6197d63621d
1329	2	$2b$10$czj/V6WOT.suGzbEiC9agufgI0yYDaVe2yi043pzeNwJ7oMge74AW	\N	\N	\N	f	2026-07-29 09:39:58.995	2026-07-29 09:36:16.715	2026-08-05 09:36:16.713	d6e3b451-6cd4-4d6a-b537-95f0d1453183
1332	2	$2b$10$FNBRItLPR9BiZNgNRFXsX.f/oDe6Fav.XaRL0cN2gJV37mEIq7ZuG	\N	\N	\N	f	2026-07-29 09:43:12.888	2026-07-29 09:41:17.94	2026-08-05 09:41:17.938	c5b4c7ac-0813-4a4f-a4a6-77405677005b
1335	2	$2b$10$VOBncCWnvIYRTE4XpBRp3uYF7D6uRPYTIop/xfp/e4YEB3lwfvuzu	\N	\N	\N	f	2026-07-29 09:44:44.525	2026-07-29 09:44:44.525	2026-08-05 09:44:44.524	72ac4b5a-55eb-492f-b4ec-fc298c9909c9
1339	2	$2b$10$G8NCYABSpvloA3D/5BBhLOTb9SGE//wo40tkIUNOoGbAeeDTKtlom	\N	\N	\N	f	2026-07-29 09:48:52.005	2026-07-29 09:48:52.005	2026-08-05 09:48:52.002	aba60d00-e2b1-4ca4-9d9c-d330446ba69b
1342	2	$2b$10$dK53szNZY1q1xcpcn0.jKunyS6YvfSg4eG1TU1rNlAXm1ozXxLfqK	\N	\N	\N	f	2026-07-29 09:51:04.845	2026-07-29 09:51:04.845	2026-08-05 09:51:04.842	18fc3670-d270-416b-83c2-18e15f716b1d
1351	2	$2b$10$sR1r9Z6laB.kTm/bkSzg3OuCSDw.clbOcQimAFBFMBrPrV7VNOGru	\N	\N	\N	f	2026-07-29 09:59:30.73	2026-07-29 09:58:15.048	2026-08-05 09:58:15.046	2272d775-d923-4044-b9d4-f3ec1388ad50
1354	2	$2b$10$44qVxNIvbjirBFH3HUQ9COLCiU..J1p2o9wBSwmmVEpXuVLSWZbB2	\N	\N	\N	f	2026-07-29 10:01:37.776	2026-07-29 10:01:37.776	2026-08-05 10:01:37.773	f2ffa516-2573-49e3-aeca-4b27d51d61d8
1357	2	$2b$10$xzabtoJItIeUP9XVhcLx7.YJKg94vvkaWKwi3STQpthNfjWaFsXhW	\N	\N	\N	f	2026-07-29 10:04:37.758	2026-07-29 10:04:37.758	2026-08-05 10:04:37.753	3a7995c8-4fb0-4653-88c6-ea2203c935cb
1360	2	$2b$10$91aBW2jf2WN3RDMb5HNHOuQOAHd8fDGjDqtdWdACMg7uvSubsKVhm	Edge on Windows 10	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0	f	2026-07-29 10:35:34.562	2026-07-29 10:35:34.562	2026-08-05 10:35:34.53	f2271327-7a14-4c9c-8ab1-f73eacd44fa7
1361	2	$2b$10$yds1GPFzBd039F1CiBruSO70r5pQTERFu9XUAZpbR.wxMuWN.SVZa	\N	\N	\N	f	2026-07-29 10:35:37.881	2026-07-29 10:35:37.881	2026-08-05 10:35:37.878	e4218f27-f738-4ca9-acaa-87e8d79c4db6
1370	2	$2b$10$G2.gr5wrmA1oLIF.BilTR.hRU9Mcy/rV5bTylAHtnnxI.QLHNtSNm	\N	\N	\N	f	2026-07-29 10:48:30.108	2026-07-29 10:48:30.108	2026-08-05 10:48:30.107	7e8abcdf-5a3a-4259-ba63-6495e160bc24
1373	2	$2b$10$k.W7Anwn2cIqd0qfHSPK8uSn0QrYzhfeIqzahQYvhISl98E.GE2mq	\N	\N	\N	f	2026-07-29 11:27:46.005	2026-07-29 11:27:46.005	2026-08-05 11:27:46.004	85fc1878-d848-45ed-98ff-c5c9354ed189
1376	2	$2b$10$CqWv6im71GfGpRtilxhLA.KXoHkzbrWtl11DY.B9HYLLUI6rjou6u	\N	\N	\N	f	2026-07-29 11:30:48.458	2026-07-29 11:30:48.458	2026-08-05 11:30:48.458	c35e36de-ea98-433c-9230-dca48a5cf667
1378	2	$2b$10$apnY12WktJwDb0vdAOepQu0kv8uSuab2Hg3ilo4t3TGTVib2lgldS	\N	\N	\N	f	2026-07-29 11:31:01.984	2026-07-29 11:31:01.984	2026-08-05 11:31:01.984	89ce3044-5f64-4464-a0fb-9ce82b59e086
1380	2	$2b$10$.n1jG8bqHqcFy29TP3lHS.C.CvV7T3ua5WufMNzRz69wlfwyKuqs6	\N	\N	\N	t	2026-07-29 11:33:03.036	2026-07-29 11:33:03.036	2026-08-05 11:33:03.035	ae7a9526-e461-4bc3-82e9-f4a8a64e39ee
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
3afbf743-80bb-4c8f-bd6e-fd54b3cbac7f	07f307a1ca7a06dae0ded769798a6744df626e006009463bd260d08f21e7ff02	2026-06-13 11:21:40.463418+05:30	20260613055140_self_relation_checklist	\N	\N	2026-06-13 11:21:40.417555+05:30	1
54838640-ea2f-41ff-ba8e-2b3065f6e60e	b4402850a3c6541219bfcf25bf8ca80f005bea894d948f42b1c0392836b4c7ab	2026-05-27 15:43:11.52598+05:30	20260510102600_init	\N	\N	2026-05-27 15:43:11.503766+05:30	1
1b794e6d-1001-4907-9328-fa882cfe8fd5	6cf8851451c4178c2bfa78fde77fd3294f47438833db367100553e6ff2070dbf	2026-05-27 15:43:11.728392+05:30	20260513161309_schema_created	\N	\N	2026-05-27 15:43:11.527143+05:30	1
4e61a481-52f7-4b9b-ac82-6f4e4d2640f7	73b60d7d6f5ad21e94e75e40bc8f157d57cafcc88ab52e7242c5b50d8eaf1dc0	2026-05-27 15:43:11.735367+05:30	20260516104029_change_enum	\N	\N	2026-05-27 15:43:11.728653+05:30	1
afd1f646-26ad-47b5-8a8d-38da02094d9a	983b569ebf602ffdab1b880064e63915500ca83424ac55e6a31d7410373b2f53	2026-06-13 11:23:36.302043+05:30	20260613055336_parent_id	\N	\N	2026-06-13 11:23:36.273882+05:30	1
5cadf90b-8a1f-4c8e-9b29-d803a7a042a4	e0efb9853f985db93912089420b7963e205b711966a000f06894e042e87f6f3a	2026-05-27 15:43:11.742661+05:30	20260518083631_changed_role_enum	\N	\N	2026-05-27 15:43:11.735655+05:30	1
919595c5-8d44-4981-b165-858c00ced962	42162cf8d0b9f2d5b4adb688cc8957899531df60adcca992e8b04fc727003f14	2026-05-27 15:43:11.749298+05:30	20260519051129_add_jti	\N	\N	2026-05-27 15:43:11.74303+05:30	1
6401857d-004d-4129-85a4-20907f7c7a13	c69831e974c57f607e53f6c15c19f3daa461034d3ed6eb96a198ccd33b8f4072	2026-05-27 15:43:11.753676+05:30	20260523073200_password_reset	\N	\N	2026-05-27 15:43:11.749569+05:30	1
e3bab796-d0ed-4b6c-ac64-c087dfc8d8c9	f79a7787a8026c38f8fae0f9956eb03fb20e90180119279e1db6d85c8834ed5e	2026-05-27 15:43:11.7592+05:30	20260523114054_emailverification	\N	\N	2026-05-27 15:43:11.753948+05:30	1
86f998aa-0d6f-487d-b9e7-f95bb33e1093	7d00d4e6fc38168ad9fa65491d5e8fef16919517da489358dcbe0e079987a372	2026-05-27 15:43:11.762725+05:30	20260525003618_accept_invitation	\N	\N	2026-05-27 15:43:11.759536+05:30	1
d21f9caa-e2d9-42be-a267-80044c624cc7	1c219de35db2852f0e0fbea8c795e265d75f0f65a0cbed2ddde7cf255fdf27c3	2026-05-27 15:43:11.764196+05:30	20260526095154_add_logo	\N	\N	2026-05-27 15:43:11.763006+05:30	1
ab4d9e42-2ebe-407e-a254-8d169a9bb738	a31ea9b42a86d895a7f164fe2d71b75b7880dd09f5971e05baccd2ae5ae53419	2026-05-28 14:30:27.816084+05:30	20260528090027_add_uniqueness	\N	\N	2026-05-28 14:30:27.764168+05:30	1
aecfa4d2-a838-4c43-b4cb-f5e55a354810	5d7ed9757f075cdce423645261de0220d3941ee5dc8d88e590be124009d995e7	2026-06-05 10:27:23.170992+05:30	20260605045722_equipment	\N	\N	2026-06-05 10:27:22.952003+05:30	1
77fa00d0-c80c-45f6-b226-a0682862a3fd	137ccaeea0a9f1206e24020b8dc5825b624e7a41323233836d2accd96cd727e7	2026-06-10 14:45:27.256064+05:30	20260610091526_checklist	\N	\N	2026-06-10 14:45:26.991122+05:30	1
38ce2c71-e14c-4c9d-b6bd-efb12074640d	229b9b770220cffe5cd67964772619a54c033c9aa8d5fe5ad4dd086929872c97	2026-06-13 10:53:57.757869+05:30	20260613052357_checklisr_parent_id	\N	\N	2026-06-13 10:53:57.665698+05:30	1
7cd59ab1-23dd-4dd2-a528-a1d7e95c44e5	e54efe5eefada6cd3db71536721cb9d32ad4a97bfc1c5eddab72255af14a8c2e	2026-06-13 17:25:52.753946+05:30	20260613115552_checklist_parentid	\N	\N	2026-06-13 17:25:52.706916+05:30	1
d2d5037e-4c36-47ed-a7ca-85684bb49532	f119af7878a2ffbcba4dd8fc29e211a2819541e241d3c1669a35626aa824364a	2026-06-13 18:33:01.719448+05:30	20260613130301_parent_id_not_optional	\N	\N	2026-06-13 18:33:01.672448+05:30	1
c2954958-2518-4277-b3cd-1c6fdb6c355e	983b569ebf602ffdab1b880064e63915500ca83424ac55e6a31d7410373b2f53	2026-06-13 18:40:51.658809+05:30	20260613131051_parent_id_optional	\N	\N	2026-06-13 18:40:51.643445+05:30	1
845d26d1-5b08-42b1-8475-91bf0befa2bc	143ed34989d8b9a9b612a434c78554ba5a89d007c5ad776497f2545c1b40fe00	2026-06-14 10:21:22.011105+05:30	20260614045121_pm_schedule	\N	\N	2026-06-14 10:21:22.002346+05:30	1
cfb557d5-1484-450d-9366-7177c281133d	d39d29ff573f89313554c40f476767d0b5f465882bac0ea1c7e7a1761ea9b792	2026-06-24 09:12:50.163033+05:30	20260617095236_pmtask	\N	\N	2026-06-24 09:12:50.110323+05:30	1
a65fe948-56a8-4ce4-bdc0-f26429ae7d23	f0f0f90a8ee5a63a3de47aeb8d1092b9e9245c915e344acef6c1a7aa31d14d38	2026-06-25 19:49:43.877021+05:30	20260625141943_options_checklist	\N	\N	2026-06-25 19:49:43.86013+05:30	1
3082472d-3bcd-4cf4-ab26-09926632336e	b260794a25bceadda4eee10dc63cd2b7adf88a8e3d233b625d44637fedc9fab6	2026-06-28 17:50:54.5997+05:30	20260628122054_breakdown_root_cause	\N	\N	2026-06-28 17:50:54.574518+05:30	1
95254914-aea6-4f40-854b-356c840c0b10	28d5954caba6b03ac325021b6c5bf54c69ae7626cdf371063907e29f019ef345	2026-07-01 23:19:29.44787+05:30	20260701174929_notification	\N	\N	2026-07-01 23:19:29.380256+05:30	1
c778c177-86d5-47c4-a7a8-884bea8e9204	f6f55ee5225cd339db18722edcb3f16117e6f20b1d67e17008a77c10571bd879	2026-07-03 16:19:08.24057+05:30	20260702152102_notificatioon	\N	\N	2026-07-03 16:19:07.944893+05:30	1
21175abc-a95f-4038-82b5-7a655a10b29f	425d957ed76439ba865cc4b449f44dced0e92461b0aa281a645b960f7ed7746b	2026-07-03 16:19:08.24715+05:30	20260702155906_notification_enum	\N	\N	2026-07-03 16:19:08.242225+05:30	1
75945410-9f17-47cb-ac50-3185e19e4873	0d876e75118a86de971c5951ec51aeab9acffd87df7347d75b7efa616334d53a	2026-07-25 12:55:01.717432+05:30	20260725072501_organization_step	\N	\N	2026-07-25 12:55:01.623109+05:30	1
06be3304-45b2-404e-af16-e1853c63467a	abfb6773d52d6284aa1e7686df324921030d3d39a8167f701784d8be8fb20914	2026-07-25 13:15:55.050156+05:30	20260725074554_organization_setup	\N	\N	2026-07-25 13:15:54.971734+05:30	1
08f28bbf-36fc-4dd3-a245-fa78655d400d	03614fd992461a0d747d0bc71c85bc306fcc2c7d6e29d4ce1f2eff11618d2151	2026-07-25 21:42:35.652634+05:30	20260725161235_onboarding_setup	\N	\N	2026-07-25 21:42:35.611121+05:30	1
\.


--
-- Name: AuditLog_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."AuditLog_id_seq"', 1186, true);


--
-- Name: BreakdownAction_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."BreakdownAction_id_seq"', 12, true);


--
-- Name: BreakdownReport_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."BreakdownReport_id_seq"', 9, true);


--
-- Name: ChecklistItem_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."ChecklistItem_id_seq"', 127, true);


--
-- Name: ChecklistTemplate_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."ChecklistTemplate_id_seq"', 56, true);


--
-- Name: Department_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."Department_id_seq"', 16, true);


--
-- Name: EmailVerification_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."EmailVerification_id_seq"', 18, true);


--
-- Name: EquipmentType_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."EquipmentType_id_seq"', 9, true);


--
-- Name: Equipment_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."Equipment_id_seq"', 14, true);


--
-- Name: Invitation_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."Invitation_id_seq"', 11, true);


--
-- Name: Location_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."Location_id_seq"', 9, true);


--
-- Name: Notification_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."Notification_id_seq"', 13, true);


--
-- Name: Organization_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."Organization_id_seq"', 10, true);


--
-- Name: PMSchedule_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."PMSchedule_id_seq"', 16, true);


--
-- Name: PMTask_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."PMTask_id_seq"', 24, true);


--
-- Name: PasswordReset_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."PasswordReset_id_seq"', 21, true);


--
-- Name: Role_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."Role_id_seq"', 5, true);


--
-- Name: TaskChecklistItem_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."TaskChecklistItem_id_seq"', 125, true);


--
-- Name: UserDepartment_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."UserDepartment_id_seq"', 5, true);


--
-- Name: UserRole_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."UserRole_id_seq"', 36, true);


--
-- Name: UserSession_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."UserSession_id_seq"', 1380, true);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."User_id_seq"', 23, true);


--
-- Name: AuditLog AuditLog_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."AuditLog"
    ADD CONSTRAINT "AuditLog_pkey" PRIMARY KEY (id);


--
-- Name: BreakdownAction BreakdownAction_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."BreakdownAction"
    ADD CONSTRAINT "BreakdownAction_pkey" PRIMARY KEY (id);


--
-- Name: BreakdownReport BreakdownReport_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."BreakdownReport"
    ADD CONSTRAINT "BreakdownReport_pkey" PRIMARY KEY (id);


--
-- Name: ChecklistItem ChecklistItem_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."ChecklistItem"
    ADD CONSTRAINT "ChecklistItem_pkey" PRIMARY KEY (id);


--
-- Name: ChecklistTemplate ChecklistTemplate_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."ChecklistTemplate"
    ADD CONSTRAINT "ChecklistTemplate_pkey" PRIMARY KEY (id);


--
-- Name: Department Department_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Department"
    ADD CONSTRAINT "Department_pkey" PRIMARY KEY (id);


--
-- Name: EmailVerification EmailVerification_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."EmailVerification"
    ADD CONSTRAINT "EmailVerification_pkey" PRIMARY KEY (id);


--
-- Name: EquipmentType EquipmentType_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."EquipmentType"
    ADD CONSTRAINT "EquipmentType_pkey" PRIMARY KEY (id);


--
-- Name: Equipment Equipment_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Equipment"
    ADD CONSTRAINT "Equipment_pkey" PRIMARY KEY (id);


--
-- Name: Invitation Invitation_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Invitation"
    ADD CONSTRAINT "Invitation_pkey" PRIMARY KEY (id);


--
-- Name: Location Location_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Location"
    ADD CONSTRAINT "Location_pkey" PRIMARY KEY (id);


--
-- Name: Notification Notification_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Notification"
    ADD CONSTRAINT "Notification_pkey" PRIMARY KEY (id);


--
-- Name: Organization Organization_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Organization"
    ADD CONSTRAINT "Organization_pkey" PRIMARY KEY (id);


--
-- Name: PMSchedule PMSchedule_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."PMSchedule"
    ADD CONSTRAINT "PMSchedule_pkey" PRIMARY KEY (id);


--
-- Name: PMTask PMTask_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."PMTask"
    ADD CONSTRAINT "PMTask_pkey" PRIMARY KEY (id);


--
-- Name: PasswordReset PasswordReset_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."PasswordReset"
    ADD CONSTRAINT "PasswordReset_pkey" PRIMARY KEY (id);


--
-- Name: Role Role_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY (id);


--
-- Name: TaskChecklistItem TaskChecklistItem_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."TaskChecklistItem"
    ADD CONSTRAINT "TaskChecklistItem_pkey" PRIMARY KEY (id);


--
-- Name: UserDepartment UserDepartment_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."UserDepartment"
    ADD CONSTRAINT "UserDepartment_pkey" PRIMARY KEY (id);


--
-- Name: UserRole UserRole_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."UserRole"
    ADD CONSTRAINT "UserRole_pkey" PRIMARY KEY (id);


--
-- Name: UserSession UserSession_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."UserSession"
    ADD CONSTRAINT "UserSession_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: BreakdownAction_breakdownId_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "BreakdownAction_breakdownId_idx" ON maintix."BreakdownAction" USING btree ("breakdownId");


--
-- Name: BreakdownReport_assignedTo_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "BreakdownReport_assignedTo_idx" ON maintix."BreakdownReport" USING btree ("assignedTo");


--
-- Name: BreakdownReport_equipmentId_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "BreakdownReport_equipmentId_idx" ON maintix."BreakdownReport" USING btree ("equipmentId");


--
-- Name: BreakdownReport_organizationId_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "BreakdownReport_organizationId_idx" ON maintix."BreakdownReport" USING btree ("organizationId");


--
-- Name: BreakdownReport_status_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "BreakdownReport_status_idx" ON maintix."BreakdownReport" USING btree (status);


--
-- Name: ChecklistItem_templateId_order_key; Type: INDEX; Schema: maintix; Owner: -
--

CREATE UNIQUE INDEX "ChecklistItem_templateId_order_key" ON maintix."ChecklistItem" USING btree ("templateId", "order");


--
-- Name: ChecklistTemplate_equipmentTypeId_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "ChecklistTemplate_equipmentTypeId_idx" ON maintix."ChecklistTemplate" USING btree ("equipmentTypeId");


--
-- Name: ChecklistTemplate_organizationId_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "ChecklistTemplate_organizationId_idx" ON maintix."ChecklistTemplate" USING btree ("organizationId");


--
-- Name: ChecklistTemplate_parentId_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "ChecklistTemplate_parentId_idx" ON maintix."ChecklistTemplate" USING btree ("parentId");


--
-- Name: Department_organizationId_code_key; Type: INDEX; Schema: maintix; Owner: -
--

CREATE UNIQUE INDEX "Department_organizationId_code_key" ON maintix."Department" USING btree ("organizationId", code);


--
-- Name: Department_organizationId_name_key; Type: INDEX; Schema: maintix; Owner: -
--

CREATE UNIQUE INDEX "Department_organizationId_name_key" ON maintix."Department" USING btree ("organizationId", name);


--
-- Name: EmailVerification_expiresAt_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "EmailVerification_expiresAt_idx" ON maintix."EmailVerification" USING btree ("expiresAt");


--
-- Name: EmailVerification_token_key; Type: INDEX; Schema: maintix; Owner: -
--

CREATE UNIQUE INDEX "EmailVerification_token_key" ON maintix."EmailVerification" USING btree (token);


--
-- Name: EmailVerification_userId_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "EmailVerification_userId_idx" ON maintix."EmailVerification" USING btree ("userId");


--
-- Name: EquipmentType_organizationId_code_key; Type: INDEX; Schema: maintix; Owner: -
--

CREATE UNIQUE INDEX "EquipmentType_organizationId_code_key" ON maintix."EquipmentType" USING btree ("organizationId", code);


--
-- Name: EquipmentType_organizationId_name_key; Type: INDEX; Schema: maintix; Owner: -
--

CREATE UNIQUE INDEX "EquipmentType_organizationId_name_key" ON maintix."EquipmentType" USING btree ("organizationId", name);


--
-- Name: Equipment_equipmentTypeId_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "Equipment_equipmentTypeId_idx" ON maintix."Equipment" USING btree ("equipmentTypeId");


--
-- Name: Equipment_organizationId_code_key; Type: INDEX; Schema: maintix; Owner: -
--

CREATE UNIQUE INDEX "Equipment_organizationId_code_key" ON maintix."Equipment" USING btree ("organizationId", code);


--
-- Name: Equipment_organizationId_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "Equipment_organizationId_idx" ON maintix."Equipment" USING btree ("organizationId");


--
-- Name: Invitation_email_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "Invitation_email_idx" ON maintix."Invitation" USING btree (email);


--
-- Name: Invitation_organizationId_email_key; Type: INDEX; Schema: maintix; Owner: -
--

CREATE UNIQUE INDEX "Invitation_organizationId_email_key" ON maintix."Invitation" USING btree ("organizationId", email);


--
-- Name: Invitation_token_key; Type: INDEX; Schema: maintix; Owner: -
--

CREATE UNIQUE INDEX "Invitation_token_key" ON maintix."Invitation" USING btree (token);


--
-- Name: Notification_organizationId_userId_isRead_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "Notification_organizationId_userId_isRead_idx" ON maintix."Notification" USING btree ("organizationId", "userId", "isRead");


--
-- Name: Organization_slug_key; Type: INDEX; Schema: maintix; Owner: -
--

CREATE UNIQUE INDEX "Organization_slug_key" ON maintix."Organization" USING btree (slug);


--
-- Name: PMSchedule_assignedTo_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "PMSchedule_assignedTo_idx" ON maintix."PMSchedule" USING btree ("assignedTo");


--
-- Name: PMSchedule_equipmentId_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "PMSchedule_equipmentId_idx" ON maintix."PMSchedule" USING btree ("equipmentId");


--
-- Name: PMSchedule_nextDueDate_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "PMSchedule_nextDueDate_idx" ON maintix."PMSchedule" USING btree ("nextDueDate");


--
-- Name: PMSchedule_organizationId_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "PMSchedule_organizationId_idx" ON maintix."PMSchedule" USING btree ("organizationId");


--
-- Name: PMTask_assignedTo_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "PMTask_assignedTo_idx" ON maintix."PMTask" USING btree ("assignedTo");


--
-- Name: PMTask_dueDate_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "PMTask_dueDate_idx" ON maintix."PMTask" USING btree ("dueDate");


--
-- Name: PMTask_organizationId_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "PMTask_organizationId_idx" ON maintix."PMTask" USING btree ("organizationId");


--
-- Name: PMTask_scheduleId_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "PMTask_scheduleId_idx" ON maintix."PMTask" USING btree ("scheduleId");


--
-- Name: PMTask_status_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "PMTask_status_idx" ON maintix."PMTask" USING btree (status);


--
-- Name: PasswordReset_expiresAt_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "PasswordReset_expiresAt_idx" ON maintix."PasswordReset" USING btree ("expiresAt");


--
-- Name: PasswordReset_token_key; Type: INDEX; Schema: maintix; Owner: -
--

CREATE UNIQUE INDEX "PasswordReset_token_key" ON maintix."PasswordReset" USING btree (token);


--
-- Name: PasswordReset_userId_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "PasswordReset_userId_idx" ON maintix."PasswordReset" USING btree ("userId");


--
-- Name: Role_name_key; Type: INDEX; Schema: maintix; Owner: -
--

CREATE UNIQUE INDEX "Role_name_key" ON maintix."Role" USING btree (name);


--
-- Name: TaskChecklistItem_taskId_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "TaskChecklistItem_taskId_idx" ON maintix."TaskChecklistItem" USING btree ("taskId");


--
-- Name: TaskChecklistItem_templateItemId_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "TaskChecklistItem_templateItemId_idx" ON maintix."TaskChecklistItem" USING btree ("templateItemId");


--
-- Name: UserDepartment_userId_key; Type: INDEX; Schema: maintix; Owner: -
--

CREATE UNIQUE INDEX "UserDepartment_userId_key" ON maintix."UserDepartment" USING btree ("userId");


--
-- Name: UserRole_userId_roleId_key; Type: INDEX; Schema: maintix; Owner: -
--

CREATE UNIQUE INDEX "UserRole_userId_roleId_key" ON maintix."UserRole" USING btree ("userId", "roleId");


--
-- Name: UserSession_jti_key; Type: INDEX; Schema: maintix; Owner: -
--

CREATE UNIQUE INDEX "UserSession_jti_key" ON maintix."UserSession" USING btree (jti);


--
-- Name: User_email_key; Type: INDEX; Schema: maintix; Owner: -
--

CREATE UNIQUE INDEX "User_email_key" ON maintix."User" USING btree (email);


--
-- Name: User_organizationId_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "User_organizationId_idx" ON maintix."User" USING btree ("organizationId");


--
-- Name: BreakdownAction BreakdownAction_breakdownId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."BreakdownAction"
    ADD CONSTRAINT "BreakdownAction_breakdownId_fkey" FOREIGN KEY ("breakdownId") REFERENCES maintix."BreakdownReport"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: BreakdownAction BreakdownAction_performedBy_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."BreakdownAction"
    ADD CONSTRAINT "BreakdownAction_performedBy_fkey" FOREIGN KEY ("performedBy") REFERENCES maintix."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: BreakdownReport BreakdownReport_assignedTo_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."BreakdownReport"
    ADD CONSTRAINT "BreakdownReport_assignedTo_fkey" FOREIGN KEY ("assignedTo") REFERENCES maintix."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: BreakdownReport BreakdownReport_equipmentId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."BreakdownReport"
    ADD CONSTRAINT "BreakdownReport_equipmentId_fkey" FOREIGN KEY ("equipmentId") REFERENCES maintix."Equipment"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: BreakdownReport BreakdownReport_organizationId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."BreakdownReport"
    ADD CONSTRAINT "BreakdownReport_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES maintix."Organization"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: BreakdownReport BreakdownReport_reportedBy_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."BreakdownReport"
    ADD CONSTRAINT "BreakdownReport_reportedBy_fkey" FOREIGN KEY ("reportedBy") REFERENCES maintix."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ChecklistItem ChecklistItem_templateId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."ChecklistItem"
    ADD CONSTRAINT "ChecklistItem_templateId_fkey" FOREIGN KEY ("templateId") REFERENCES maintix."ChecklistTemplate"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ChecklistTemplate ChecklistTemplate_equipmentTypeId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."ChecklistTemplate"
    ADD CONSTRAINT "ChecklistTemplate_equipmentTypeId_fkey" FOREIGN KEY ("equipmentTypeId") REFERENCES maintix."EquipmentType"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ChecklistTemplate ChecklistTemplate_organizationId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."ChecklistTemplate"
    ADD CONSTRAINT "ChecklistTemplate_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES maintix."Organization"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ChecklistTemplate ChecklistTemplate_parentId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."ChecklistTemplate"
    ADD CONSTRAINT "ChecklistTemplate_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES maintix."ChecklistTemplate"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Department Department_organizationId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Department"
    ADD CONSTRAINT "Department_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES maintix."Organization"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: EmailVerification EmailVerification_userId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."EmailVerification"
    ADD CONSTRAINT "EmailVerification_userId_fkey" FOREIGN KEY ("userId") REFERENCES maintix."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: EquipmentType EquipmentType_organizationId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."EquipmentType"
    ADD CONSTRAINT "EquipmentType_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES maintix."Organization"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Equipment Equipment_departmentId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Equipment"
    ADD CONSTRAINT "Equipment_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES maintix."Department"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Equipment Equipment_equipmentTypeId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Equipment"
    ADD CONSTRAINT "Equipment_equipmentTypeId_fkey" FOREIGN KEY ("equipmentTypeId") REFERENCES maintix."EquipmentType"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Equipment Equipment_locationId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Equipment"
    ADD CONSTRAINT "Equipment_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES maintix."Location"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Equipment Equipment_organizationId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Equipment"
    ADD CONSTRAINT "Equipment_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES maintix."Organization"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Invitation Invitation_departmentId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Invitation"
    ADD CONSTRAINT "Invitation_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES maintix."Department"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Invitation Invitation_organizationId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Invitation"
    ADD CONSTRAINT "Invitation_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES maintix."Organization"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Invitation Invitation_roleId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Invitation"
    ADD CONSTRAINT "Invitation_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES maintix."Role"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Location Location_organizationId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Location"
    ADD CONSTRAINT "Location_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES maintix."Organization"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Notification Notification_organizationId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Notification"
    ADD CONSTRAINT "Notification_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES maintix."Organization"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Notification Notification_userId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."Notification"
    ADD CONSTRAINT "Notification_userId_fkey" FOREIGN KEY ("userId") REFERENCES maintix."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: PMSchedule PMSchedule_assignedTo_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."PMSchedule"
    ADD CONSTRAINT "PMSchedule_assignedTo_fkey" FOREIGN KEY ("assignedTo") REFERENCES maintix."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: PMSchedule PMSchedule_equipmentId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."PMSchedule"
    ADD CONSTRAINT "PMSchedule_equipmentId_fkey" FOREIGN KEY ("equipmentId") REFERENCES maintix."Equipment"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: PMSchedule PMSchedule_organizationId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."PMSchedule"
    ADD CONSTRAINT "PMSchedule_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES maintix."Organization"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: PMSchedule PMSchedule_templateId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."PMSchedule"
    ADD CONSTRAINT "PMSchedule_templateId_fkey" FOREIGN KEY ("templateId") REFERENCES maintix."ChecklistTemplate"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: PMTask PMTask_assignedTo_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."PMTask"
    ADD CONSTRAINT "PMTask_assignedTo_fkey" FOREIGN KEY ("assignedTo") REFERENCES maintix."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: PMTask PMTask_equipmentId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."PMTask"
    ADD CONSTRAINT "PMTask_equipmentId_fkey" FOREIGN KEY ("equipmentId") REFERENCES maintix."Equipment"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: PMTask PMTask_organizationId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."PMTask"
    ADD CONSTRAINT "PMTask_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES maintix."Organization"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: PMTask PMTask_scheduleId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."PMTask"
    ADD CONSTRAINT "PMTask_scheduleId_fkey" FOREIGN KEY ("scheduleId") REFERENCES maintix."PMSchedule"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: PMTask PMTask_templateId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."PMTask"
    ADD CONSTRAINT "PMTask_templateId_fkey" FOREIGN KEY ("templateId") REFERENCES maintix."ChecklistTemplate"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: PasswordReset PasswordReset_userId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."PasswordReset"
    ADD CONSTRAINT "PasswordReset_userId_fkey" FOREIGN KEY ("userId") REFERENCES maintix."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: TaskChecklistItem TaskChecklistItem_taskId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."TaskChecklistItem"
    ADD CONSTRAINT "TaskChecklistItem_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES maintix."PMTask"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: TaskChecklistItem TaskChecklistItem_templateItemId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."TaskChecklistItem"
    ADD CONSTRAINT "TaskChecklistItem_templateItemId_fkey" FOREIGN KEY ("templateItemId") REFERENCES maintix."ChecklistItem"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: UserDepartment UserDepartment_departmentId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."UserDepartment"
    ADD CONSTRAINT "UserDepartment_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES maintix."Department"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: UserDepartment UserDepartment_userId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."UserDepartment"
    ADD CONSTRAINT "UserDepartment_userId_fkey" FOREIGN KEY ("userId") REFERENCES maintix."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: UserRole UserRole_roleId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."UserRole"
    ADD CONSTRAINT "UserRole_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES maintix."Role"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: UserRole UserRole_userId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."UserRole"
    ADD CONSTRAINT "UserRole_userId_fkey" FOREIGN KEY ("userId") REFERENCES maintix."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: UserSession UserSession_userId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."UserSession"
    ADD CONSTRAINT "UserSession_userId_fkey" FOREIGN KEY ("userId") REFERENCES maintix."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: User User_organizationId_fkey; Type: FK CONSTRAINT; Schema: maintix; Owner: -
--

ALTER TABLE ONLY maintix."User"
    ADD CONSTRAINT "User_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES maintix."Organization"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

\unrestrict KOtde6URrTUTGi027FpLRAGN8tdPGhssbow1CWaFjTeyIhHY0efeWpM4g5fTDnL

