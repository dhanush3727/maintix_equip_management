--
-- PostgreSQL database dump
--

\restrict mwd9jMsf1gABA94PTXjIPshXJbvub5fZp7cXQHFRJNC9saQtaijDt2XV7pyl5MA

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
DROP INDEX maintix."Notification_userId_idx";
DROP INDEX maintix."Notification_organizationId_idx";
DROP INDEX maintix."Notification_isRead_idx";
DROP INDEX maintix."Notification_createdAt_idx";
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
    'TASK_DUE',
    'TASK_OVERDUE',
    'BREAKDOWN_RAISED',
    'BREAKDOWN_ASSIGNED',
    'BREAKDOWN_RESOLVED'
);


--
-- Name: ReferenceType; Type: TYPE; Schema: maintix; Owner: -
--

CREATE TYPE maintix."ReferenceType" AS ENUM (
    'TASK',
    'BREAKDOWN'
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
    "logoPublicId" text
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
\.


--
-- Data for Name: BreakdownAction; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."BreakdownAction" (id, "breakdownId", "performedBy", action, remarks, "createdAt") FROM stdin;
4	5	10	Newaction3added	\N	2026-06-30 15:02:52.745
5	5	10	Newaction4added	\N	2026-06-30 15:03:26.454
6	5	10	New action 5 added	Remark for action 5	2026-06-30 15:04:20.545
1	5	10	New action added	this is a test action	2026-06-30 15:01:29.823
2	5	10	Newaction2added	New remark added	2026-06-30 15:01:43.162
\.


--
-- Data for Name: BreakdownReport; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."BreakdownReport" (id, "organizationId", "equipmentId", "reportedBy", "assignedTo", title, "rootCause", description, severity, status, "reportedAt", "resolvedAt", "createdAt", "updatedAt") FROM stdin;
4	3	5	3	10	Update Breakdown	\N	Update the description	HIGH	OPEN	2026-06-28 15:42:39.491	\N	2026-06-28 15:42:39.491	2026-06-29 07:33:41.108
1	3	1	10	10	Update the breakdown	\N	Update the description	CRITICAL	OPEN	2026-06-28 12:55:42.286	\N	2026-06-28 12:55:42.286	2026-06-29 07:57:16.678
2	3	3	10	10	New Breakdown 2	\N	this is a new breakdown for testing purpose	MEDIUM	OPEN	2026-06-28 12:59:17.218	\N	2026-06-28 12:59:17.218	2026-06-29 08:00:02.276
3	3	7	10	10	New Breakdown 3	\N	this is a new breakdown for testing purpose	HIGH	OPEN	2026-06-28 13:00:14.176	\N	2026-06-28 13:00:14.176	2026-06-29 08:30:05.79
5	3	1	10	10	New Breakdown 5	\N	this is a new breakdown for testing purpose	LOW	IN_PROGRESS	2026-06-30 15:00:20.264	\N	2026-06-30 15:00:20.264	2026-06-30 15:01:09.501
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
\.


--
-- Data for Name: EmailVerification; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."EmailVerification" (id, "userId", token, "expiresAt", "createdAt", "isUsed") FROM stdin;
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
1	3	6	Screw	07	UNDER_MAINTENANCE	2003-10-09 00:00:00	2003-12-01 00:00:00	TATA	Screw v2	2026-06-06 10:23:48.286	2026-06-30 15:00:20.287	EQ-10	10	2
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
\.


--
-- Data for Name: Location; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."Location" (id, "organizationId", name, type, address, "createdAt") FROM stdin;
1	3	Plant A	PLANT	73 ammankudi	2026-05-28 04:30:43.325
2	3	Plant B	PLANT	 no 69 daniel road 	2026-05-28 04:30:55.751
7	3	Warehouse A	WAREHOUSE	No 18, ESP Street	2026-06-02 10:31:41.259
\.


--
-- Data for Name: Notification; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."Notification" (id, "organizationId", "userId", type, title, message, "referenceId", "referenceType", "isRead", "createdAt", "readAt") FROM stdin;
\.


--
-- Data for Name: Organization; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."Organization" (id, name, slug, "industryType", "companySize", country, city, "logoUrl", "isActive", "createdAt", "updatedAt", "logoPublicId") FROM stdin;
2	DC Equipments	dc-equipments-faab32	\N	\N	\N	\N	\N	t	2026-05-27 10:16:53.948	2026-05-27 10:16:53.948	\N
3	CD Equipments	cd-equipments-cdd0a4	MANUFACTURING	SMALL	India	Chennai	https://res.cloudinary.com/dxzdsnaye/image/upload/v1779949167/maintix/f9yjgge0y1ninitib9aq.png	t	2026-05-27 10:17:22.492	2026-05-28 06:21:57.983	maintix/f9yjgge0y1ninitib9aq
\.


--
-- Data for Name: PMSchedule; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."PMSchedule" (id, "organizationId", "equipmentId", "templateId", "frequencyType", "interval", "startDate", "nextDueDate", "assignedTo", "isActive", "createdAt", "updatedAt", "lastGeneratedAt") FROM stdin;
7	3	7	56	DAILY	1	2026-06-26 00:00:00	2026-06-27 00:00:00	10	t	2026-06-26 15:32:19.874	2026-06-26 15:40:00.151	2026-06-26 15:40:00.149
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
3	Charu	dhanush7825@gmail.com	2026-05-27 10:17:22.496	t	f	\N	3	$2b$10$ZMdO7/xBGcpbjpOEU3hxnOoJvDXiVixFAaS0zhIf6FbFdK7IvlrUG	2026-06-04 05:23:27.672
2	Dhanush kumar	dhanush3727@gmail.com	2026-05-27 10:16:53.958	t	f	\N	2	$2b$10$2SNQJ2nd4P5upH.pYYHOt.pi1a0BJn1wKZTIi2edxKs96GhW7Mh0e	2026-06-04 05:31:01.546
4	John	dhanush1@gmail.com	2026-05-29 09:38:54.476	t	t	\N	3	$2b$10$2EzMpYFNkHk5RHqpnFsnL.6.UemjscxnL7096o4NQ1dTjNtoJXIWW	2026-06-04 09:05:53.889
5	User 1	testUser1@gmail.com	2026-06-14 05:27:12.389	t	f	\N	3	$2b$10$hKEzkNAeK0XYYrDoW.h...P.yx1bEqABLZ/iya.YlRVwPRdU5m2Ni	2026-06-14 05:27:12.389
6	User 2	testUser2@gmail.com	2026-06-14 05:28:32.113	t	f	\N	3	$2b$10$XkFDj0EmrHyITM//ttHs6O7cdtxoTpHnKD/OJiVXlhSDo3WYdzCl.	2026-06-14 05:28:32.113
10	Technician	technicianuser@gmail.com	2026-06-14 05:30:29.028	t	f	\N	3	$2b$10$BtSEWR4XrT..SGAYjROEhuXeJ4AYrIDEPonUH/RHnqXj.JIQwI1Dm	2026-06-14 05:30:29.028
11	Inspector	inspectoruser@gmail.com	2026-06-14 05:31:00.273	t	f	\N	3	$2b$10$cM5etnJ9Lpi/EKPburdAtOldJ4VhMfkvNK1FgrcyA6TODH8HPGB9i	2026-06-14 05:31:00.273
12	Engineer	engineeruser@gmail.com	2026-06-14 05:31:20.084	t	f	\N	3	$2b$10$Ho569/B9zMvGBMcbSrad/eDadqGnvzlpsFvsiT8p7AXp4vXTbHm06	2026-06-14 05:31:20.084
8	Manager	manageruser@gmail.com	2026-06-14 05:29:51.247	t	f	\N	3	$2b$10$3v305YccmwWvChAKqkbOouZemgi4zSB5EtBhjQ2tKoDkwvv3xyDBu	2026-06-14 05:29:51.247
\.


--
-- Data for Name: UserDepartment; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."UserDepartment" (id, "userId", "departmentId") FROM stdin;
1	4	11
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
\.


--
-- Data for Name: UserSession; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."UserSession" (id, "userId", "refreshToken", "deviceInfo", "ipAddress", "userAgent", "isActive", "lastActiveAt", "createdAt", "expiresAt", jti) FROM stdin;
195	3	$2b$10$3OB3s5.WkOBlVpAaMf/vmuPsT0cTqGeuRQlPhUR.7dARw1U97hCoO	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-04 05:23:27.681	2026-06-04 05:21:11.279	2026-06-11 05:21:11.253	bbcfd5a0-f09a-4c33-923b-dd1e08ec98e4
1	2	$2b$10$j5XG9ThCAGlwjRSJBHj.YOI1qptNLhXJt3s1Tp5/NBy5QvcjUX1yq	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-27 10:16:54.103	2026-05-27 10:16:54.103	2026-06-03 10:16:54.098	dc8092f6-8f8b-47b2-8266-25f5cf38fc38
4	2	$2b$10$7KjyhtjcrPcQdT2RnkXECu5Oz41j3OuSm.ONSfr5kEoVbdhM5mdxi	unknown	::ffff:127.0.0.1	unknown	f	2026-05-27 11:01:18.763	2026-05-27 11:01:18.763	2026-06-03 11:01:18.754	cf314cbd-2f97-4c9e-a35e-05c12b05f530
6	2	$2b$10$qHkEWFg.NlCsChW3v8Y51OSo7DuOOy2o3/nGSa0YsR7E.qNJOMXju	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-28 04:34:03.228	2026-05-28 04:34:03.228	2026-06-04 04:34:03.207	936d9e54-7ddc-406c-9f6b-5d37847eb714
212	3	$2b$10$jRyM.DQXdfZL.B/6YZlNn.xhWNmvCtHMiCiAMTSQBpltN.Z4fNlHy	unknown	::ffff:127.0.0.1	unknown	t	2026-06-04 09:05:52.87	2026-06-04 09:05:52.87	2026-06-11 09:05:52.864	9e6c4d37-59e8-48c4-bc4e-755157cfc57f
213	3	$2b$10$BpSR6kjId/fToC7BHss7VuXrBL3O6xywCZNEInwEJU42SjGwKjXCC	unknown	::ffff:127.0.0.1	unknown	t	2026-06-04 09:05:53.1	2026-06-04 09:05:53.1	2026-06-11 09:05:53.099	93b61ee5-5f68-462a-924f-0fa2f846eba2
214	3	$2b$10$PfdkfVwR7XBLYSZHIkonhOylJUmWO93sug4nXJVhdKlKnLTwoeJ5C	unknown	::ffff:127.0.0.1	unknown	t	2026-06-04 09:05:53.228	2026-06-04 09:05:53.228	2026-06-11 09:05:53.228	795891b8-f8c2-4936-8199-42c24af1b488
215	3	$2b$10$lBA5XgFmQkY8lTBWErBS0.0QcQCnQXUWrE/Pkdnp6v1SnB21Wkd6e	unknown	::ffff:127.0.0.1	unknown	t	2026-06-04 09:05:53.355	2026-06-04 09:05:53.355	2026-06-11 09:05:53.354	b38eaa4f-777c-4dc8-a8a7-c3c8a9cada09
223	4	$2b$10$8PU9g1.qGyP.ovoWMB4p6.bS1ZfCj1fy0o3JkgTJQhxYrbgCs/nCS	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-05 06:22:28.036	2026-06-05 06:22:28.036	2026-06-12 06:22:28.029	983f0027-c2e5-49bd-80f8-7c25ad59579d
239	3	$2b$10$.FEqo59PTRF2dPFhVFWSmeMVOBvKkKNmuOYYJzqPt0uQCRhFBN6si	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-05 08:52:14.527	2026-06-05 08:43:31.204	2026-06-12 08:43:31.188	7d300cc7-c7e6-488a-b2f2-2f979e3561c2
252	3	$2b$10$V4eb5OgnvpWGs9dka0Na1uQYPaH8LRmBiZ9dXQJ/21oZutOSsXLR2	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-05 09:14:20.303	2026-06-05 09:12:59.944	2026-06-12 09:12:59.932	b5da29f0-4b53-438a-bcb2-c9a202179bbe
260	3	$2b$10$OOd.JCGqvmIjoYO2pocUyOMvsFQ0l4d7RateNEKcSMZn7ylH0aS/6	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-06 05:00:22.476	2026-06-06 04:54:13.18	2026-06-13 04:54:13.157	ec59c96d-f9dd-4a7b-a62f-6cfbc77a9dda
270	3	$2b$10$B3mshUfyExo/ZadViB04kecu1wXmD3eaQjf93EXwHNOxMLnQjwm/O	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:02:35.429	2026-06-06 05:02:35.429	2026-06-13 05:02:35.427	4b44faed-45a2-463e-8b50-7b1561616786
279	3	$2b$10$wrOr0cQRiZJAew8yOwHxSeBj68X/QbJk5WaWj0sWF97Us0Utf14Qa	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:22:30.378	2026-06-06 05:22:30.378	2026-06-13 05:22:30.375	0d68f28b-8f47-4985-87ac-43f7fe85cbb3
280	3	$2b$10$9qz5zHtg8V.rTYJkYRzhKOvhzRnMmuF1VkXNKlOHJfnYQfwbBFlLG	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:22:30.667	2026-06-06 05:22:30.667	2026-06-13 05:22:30.667	110860d8-73ef-4cd5-8a65-8282fa84b049
293	3	$2b$10$90OEPCpJe8itQOnoYEjpj.m78dCj8L9KDe9Z.FzY6eEvJYXpBGi6i	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:14:05.75	2026-06-06 06:14:05.75	2026-06-13 06:14:05.749	a38fae89-c500-4d38-83bf-0e1807dd7cda
294	3	$2b$10$3mF1WRN9d2.E1IZVevlvxezL2Y9/ElMngBDowiOeRKjO4jM3G2y.G	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:14:05.927	2026-06-06 06:14:05.927	2026-06-13 06:14:05.927	9bda17ee-d89d-4945-9f0d-b2f72659b88b
309	3	$2b$10$AMclO6uR6X5Nk7qO4.8keu0Yamv1d7klUAYN9vlPlVoygw100GZlu	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:15:29.737	2026-06-06 06:15:29.737	2026-06-13 06:15:29.73	bcb4ebb2-c178-43e3-8a8f-22e9765e0baf
310	3	$2b$10$BqYh3OPv1rZ7Y8dmEB3b5.IVVNWyAvNEnnENR0BPAsCjhUMEqgre2	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:15:30.159	2026-06-06 06:15:30.159	2026-06-13 06:15:30.158	d8a6bad7-d8ba-4d66-97ab-4a73ac99a8ac
324	3	$2b$10$bLvjhBDBQoWvW.aYTO3sbO.t8xW8ds0HFWJd/pDKM8am2l.lVZ1Ia	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:15:32.853	2026-06-06 06:15:32.853	2026-06-13 06:15:32.852	43894fe8-a0db-4908-a44e-b313cea5813a
325	3	$2b$10$5LV/6IXhOCtlj3OD3cEMQueRbCmy6V/JJe4Du.1ShktkwPRXD54Iy	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:15:33.004	2026-06-06 06:15:33.004	2026-06-13 06:15:33.004	81753f8f-5e80-4623-af28-08ec7f141300
326	3	$2b$10$rfcO.oLVgDVvbwXipR8fc.G937OeInCwbz6oFHWCxH/x1m.2Y5ZHS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:15:33.128	2026-06-06 06:15:33.128	2026-06-13 06:15:33.127	8e5a41cd-1d72-4887-8161-2a8d4f5f4f54
339	3	$2b$10$6nEdfwp5GHZf51J2.cFzbOxU0ZPW1k4y.5AQiahlP0q9C5.7LOarC	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:17:34.027	2026-06-06 06:17:34.027	2026-06-13 06:17:34.027	a9886c48-0087-45b2-b382-10ae8a259c47
340	3	$2b$10$l7Lu3Jz5efiTnBHkAPRn7urHGTt1mR8/v69vgO3vtjkPIeqxLaY/S	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:17:34.219	2026-06-06 06:17:34.219	2026-06-13 06:17:34.218	38d3c20a-de82-4573-9d1e-5100b94be2a4
341	3	$2b$10$NypcMGf7dpP3UX8TNgMDHuaQDWH8OG6NldyGAQDwdGKlB/VsVTRlS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:17:34.334	2026-06-06 06:17:34.334	2026-06-13 06:17:34.334	6dbe4a15-0947-46fc-b66e-93bc4f0b8dde
348	3	$2b$10$2yBJHzavbMxpS/fPnpwUKO6ksNXBjZePK8eT9cIQl19KzbfKQ8Faa	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:05:34.913	2026-06-06 11:05:34.913	2026-06-13 11:05:34.906	a89ffa53-bb7b-4b77-881a-33b07ad59917
349	3	$2b$10$WXtJ6QH6Y75AR9eh6/DS/.zcHMwKkCjvUVcZq0fDZCacFc0vGWMfC	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:05:35.262	2026-06-06 11:05:35.262	2026-06-13 11:05:35.262	6f728826-7ab9-41ed-820a-f19ce4ebe19d
350	3	$2b$10$LXDZ01o00aVyRMzwmImmhOB4Jyoh5ozza2DydtcCQaCJ0IioxxWYu	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:05:35.386	2026-06-06 11:05:35.386	2026-06-13 11:05:35.386	251aca29-774f-4ca8-bc6c-dbff63dcc1d6
351	3	$2b$10$BLQmoPxlzLH.rXHxBeCeAeK7m5Cqulwo3UwsyA52QPg8.kkvC6G4.	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:05:35.508	2026-06-06 11:05:35.508	2026-06-13 11:05:35.507	2861bfab-925f-450a-a8d3-734d97d415dc
352	3	$2b$10$RvpsxoF.WCU.uWY/c2sGNe8qtbZFAehPqIHvKK0MnThzGzoS2hFVq	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:05:35.635	2026-06-06 11:05:35.635	2026-06-13 11:05:35.634	63c38239-a31d-49f3-9b48-5bee63dd8ede
353	3	$2b$10$Phc6M86AImQxSeWIHtM.SO5QNgFpjwyDklMb4ADfMBVZc3Cb8EMwe	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:05:35.762	2026-06-06 11:05:35.762	2026-06-13 11:05:35.761	84bfa21b-6d46-4b85-8c4d-ab3bc520285f
198	2	$2b$10$EsHgz/upnveTxBVmUeF50OY.SQgtSBbQanKUe62TqOWUqlHXssqba	unknown	::ffff:127.0.0.1	unknown	t	2026-06-04 05:31:01.422	2026-06-04 05:31:01.422	2026-06-11 05:31:01.422	d05895db-f2a2-41a8-a499-878a05fb6151
196	2	$2b$10$W17ixl0aL/KZFu5ZEaVNfeH.4ReNexZeYn4IIQMroUCYiXmWMhaou	unknown	::ffff:127.0.0.1	unknown	f	2026-06-04 05:31:00.962	2026-06-04 05:31:00.962	2026-06-11 05:31:00.955	094cd141-c497-4b99-92b2-3cb671b4ff90
197	2	$2b$10$Q0EM6CduOZYJlaw.lerN.Onv94vJA2u8937yRnWkw5g1K9YxQaSwy	unknown	::ffff:127.0.0.1	unknown	f	2026-06-04 05:31:01.296	2026-06-04 05:31:01.296	2026-06-11 05:31:01.295	7f263d13-c23e-41a8-9cea-d1d23617dc28
199	2	$2b$10$AZMD3h0p0hp6EVohptXomeo3tKNvmDaqWAS8sc6zIPVyPXBZSDXoi	unknown	::ffff:127.0.0.1	unknown	t	2026-06-04 05:31:01.669	2026-06-04 05:31:01.669	2026-06-11 05:31:01.669	1565deee-4d3b-442e-96d0-abdb76f4e801
200	2	$2b$10$SyYVb9mtk3yGaUgX4//L6ewAp39eE37hCJJk78i6OF23j/nUQT/im	unknown	::ffff:127.0.0.1	unknown	t	2026-06-04 05:31:01.798	2026-06-04 05:31:01.798	2026-06-11 05:31:01.797	0d42239d-9fef-45e3-a47f-33e6fd8c1a6e
201	2	$2b$10$KgbaL3jQPucKZD7vR.VfVeRmdWq5C8j9LdC4t1aBHjzATezgio5Gi	unknown	::ffff:127.0.0.1	unknown	t	2026-06-04 05:31:01.928	2026-06-04 05:31:01.928	2026-06-11 05:31:01.928	e295d46b-da36-4cee-a0ec-a9fc80ace78d
202	2	$2b$10$WfjQ3vc6oTZ2ZbAB9cRZH.beopGW7RCJv56JNSwUdlim5iEoIHkKW	unknown	::ffff:127.0.0.1	unknown	t	2026-06-04 05:31:02.062	2026-06-04 05:31:02.062	2026-06-11 05:31:02.062	d390671c-c941-45f2-8c21-ca7379ccd3b8
216	3	$2b$10$zdF0/VEcF4ueWIv9dclOK.vznnndVUufKbm1VKXHn7OQM5AzpHoNK	unknown	::ffff:127.0.0.1	unknown	t	2026-06-04 09:05:53.811	2026-06-04 09:05:53.811	2026-06-11 09:05:53.81	1068cdd2-4d8b-4d53-bae0-95e740d47396
217	3	$2b$10$uEK79nOALeJL6wWU7iAt/e0t/.XSmeziqhNTY00vDU8Sq/W5z9azG	unknown	::ffff:127.0.0.1	unknown	t	2026-06-04 09:05:54.022	2026-06-04 09:05:54.022	2026-06-11 09:05:54.022	d62d5521-4e33-4553-b81f-c16409039810
218	3	$2b$10$LCoMUMbM9bL76UKLQmATe.nJqz6GO0EyMZYEcrMy9UhYIPoLCMqm2	unknown	::ffff:127.0.0.1	unknown	t	2026-06-04 09:05:54.174	2026-06-04 09:05:54.174	2026-06-11 09:05:54.174	47a100e6-4f48-4731-baec-6ca3b9aadf7e
224	3	$2b$10$FzKlLsC8UM7Tte91fz6Kpeys3YWyNqSbgEOn7MBOqN2UAwbZj/QkO	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-05 06:24:57.377	2026-06-05 06:24:57.377	2026-06-12 06:24:57.376	a602af7f-2c46-4746-830f-c0db7e10f209
240	3	$2b$10$q6Bc3822ettgC4VMA5Kw/etuDEYUEJw/ofFF7x6Q.5Tf6LSMi.iEO	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 08:54:06.173	2026-06-05 08:54:06.173	2026-06-12 08:54:06.166	5fb4db4c-2ef7-44e1-be09-c9e4637f1f73
241	3	$2b$10$I8Z55yKnYBKd/PRn3DMHJekizIiAB.k2NZ562jm5AyHnHHaEgjR3W	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 08:54:06.579	2026-06-05 08:54:06.579	2026-06-12 08:54:06.579	a16dbb49-817c-4127-b660-9df1a2050f0b
242	4	$2b$10$SRhIlecUKWd8YUd.tZcuWOn.I4YInVg/jW.oPftjyiVhnEb11.DfK	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 08:54:06.738	2026-06-05 08:54:06.738	2026-06-12 08:54:06.737	4746f492-2776-4c9d-bc55-2bcf2aca5bb3
243	3	$2b$10$I2AG9g12U066La/2GG2eTOxlrYX6WS39muNWB9IU3Y4NJ3wOy.ryi	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 08:54:06.887	2026-06-05 08:54:06.887	2026-06-12 08:54:06.886	df846d79-2cb6-4f1c-a441-410322f18156
244	3	$2b$10$caJaKzWCh9jLq9ARwlN5MOpNbfSGisT4tYDh99Z3Nee0WS1cXKN4i	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 08:54:07.041	2026-06-05 08:54:07.041	2026-06-12 08:54:07.04	2d56a69d-e7e5-4d58-8e5e-3cf8f1f69820
245	3	$2b$10$uAtqEIPo2BvdQeBOlu9hU.ECKy7cl3Nh5llipX5N8O9tG7DNLkaZG	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 08:54:07.152	2026-06-05 08:54:07.152	2026-06-12 08:54:07.152	775bbad1-1a20-4fcf-b5c5-4cfa20a9c27c
253	3	$2b$10$Zq4mjo7ERIiIGSX0uGXNfOvAu.Wvoernx4eA3bH89VtgvZ8XeqBj.	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 09:19:24.655	2026-06-05 09:19:24.655	2026-06-12 09:19:24.649	bcefc721-8dff-4ba0-a8b7-c8dd3fa5b112
254	3	$2b$10$/P1SnpO37qW1WdjfIHij2eD9v52F9SlKTFb.wiWdfDgq2vcgG22Fe	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 09:19:24.878	2026-06-05 09:19:24.878	2026-06-12 09:19:24.878	4c020769-cb5f-4ee2-9a88-3661023b796c
261	3	$2b$10$D4ktIdlnfCO7qPRGqbD3ZOL0AraD3k35aDIhnVAFaXzwnXLZqyaBy	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:02:11.001	2026-06-06 05:02:11.001	2026-06-13 05:02:10.993	d6060e3e-40ea-49b1-b872-579cffeda7fd
262	3	$2b$10$Dx/Ydc0Dt9UtAEuC83cUA.fhSGLHnnwO9rb9F3gTmIyk.Z4COCjXe	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:02:11.412	2026-06-06 05:02:11.412	2026-06-13 05:02:11.412	f0f8cf7f-7004-4ff2-9fd2-beee79cf46e3
271	3	$2b$10$VZj6kXbHlLzli6xu.2cB0uoEzuaCanaihu5ZNPuesJ.Fq8uweIj5e	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:03:36.979	2026-06-06 05:03:36.979	2026-06-13 05:03:36.973	372e14c4-6342-49e3-9569-f84ac7336ff4
272	3	$2b$10$4imXlwfR.laZu30Dqwu3iufvxNlycVI9hr7.D4uS3DC/H0VGuVhWa	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:03:37.418	2026-06-06 05:03:37.418	2026-06-13 05:03:37.418	d7c23128-a87e-4f08-b70a-de1dc4d6c029
281	3	$2b$10$2tVY6awq8nIXay7.duaJg.kMEQxr15us5oPwThs4YGu3qMXR1SrZG	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:22:30.953	2026-06-06 05:22:30.953	2026-06-13 05:22:30.952	cd5c2e43-9386-4912-a830-59d99f063f23
295	3	$2b$10$/r3YObeOmyJbAXqPaQDFAOZVP4f6bE5PxJTUGnh2i9L4SFOmhvxOW	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:14:06.152	2026-06-06 06:14:06.152	2026-06-13 06:14:06.151	c634742c-62df-496f-bfff-195b6e66bd3f
311	3	$2b$10$CiLJKvZ.Pym9Rd3iW62GDuX9ZwhCOqYAQg7DiNXucF8LmTcZrGxjS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:15:30.378	2026-06-06 06:15:30.378	2026-06-13 06:15:30.377	9d74d0f3-7546-4a94-acaa-ab4cd6bed5cd
312	3	$2b$10$IZ8jl3ebvfsfZpLldn7XseHOjkrU8xu7TxoSpK/QN7k.sOG7oAz2a	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:15:30.558	2026-06-06 06:15:30.558	2026-06-13 06:15:30.558	645a78f5-669a-414e-91b0-e0e247093aa7
327	3	$2b$10$TCAJolpGXtHHT73M39kkp.B8b6W4D5uJCzIB1gbUFEaTXnPXYMJU6	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:17:31.671	2026-06-06 06:17:31.671	2026-06-13 06:17:31.665	f5911fad-e650-4537-8eea-214c9c870079
328	3	$2b$10$UtAj8upB5UuGajFoXYdJeOsyi8dLvjZho4d6lWnUi1BW//eEerene	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:17:31.919	2026-06-06 06:17:31.919	2026-06-13 06:17:31.919	be8c431a-5d41-4267-b599-b970e68757eb
342	3	$2b$10$xYJq0MyswawEHq5arGhCPOlSKRPzkp.kqCgogN5E7fHguKryhE8kO	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:17:34.535	2026-06-06 06:17:34.535	2026-06-13 06:17:34.534	5e736f38-893c-4a25-9328-588d7eaac2a6
343	3	$2b$10$D.sWxNuVKqbnedc.Nt2bd.JkOfDZLl3DMk3I1xle5YndBlz5Q4162	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:17:34.719	2026-06-06 06:17:34.719	2026-06-13 06:17:34.718	1a7d5686-6062-42ab-92a8-b90b240b3bba
344	3	$2b$10$yHQ.11AxlpHWMU0IIK72deR2ZqRnbn3uQWrjo8OJfN9TXUdy/f4vG	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:17:34.831	2026-06-06 06:17:34.831	2026-06-13 06:17:34.831	35c8fb92-31d1-4516-9f27-6d5eb18872dc
354	3	$2b$10$B6auUoFhds8APacmVVRcD.rpq2HaxvKJPING6vvlHCLUWwVWdPULi	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:05:35.912	2026-06-06 11:05:35.912	2026-06-13 11:05:35.911	00768633-9500-4b34-97b3-f6b4a540a2ee
355	3	$2b$10$wCpQaZlCfozFPOdxDr9.5.fLJI59qs1lEBm1Go8K/mIDRJNNo1XX2	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:05:36.041	2026-06-06 11:05:36.041	2026-06-13 11:05:36.041	fcc84700-b79d-4fb7-924a-a22cbfaf076c
356	3	$2b$10$8TZ.yEWnxp3gkKr.V9RvB./NcnlZLO0uxGo1Y3dcYrruY4PSRwVOa	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:05:36.176	2026-06-06 11:05:36.176	2026-06-13 11:05:36.176	ca97d97b-ec60-4744-bacb-0dcab421fc97
357	3	$2b$10$bz9ozBxAwYE9jBB04eoZ.uZ1puJlvn8O.SlK9GuDF9P82t.TB6F/y	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:05:36.287	2026-06-06 11:05:36.287	2026-06-13 11:05:36.287	31093eef-fc38-4774-b569-3a9f4864c68f
369	3	$2b$10$ZJdCzizuxkiv7Japw0wGueek8rPNr35NMJAgFx1KnDHpBn0HRDdtq	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:14:31.229	2026-06-06 11:14:31.229	2026-06-13 11:14:31.223	2f19c97e-94ec-4a87-a4ea-bcc8e00efc7d
370	3	$2b$10$jtYMV4ipY/fyx2auSNwCDes2mFN9ghuEKxPc46SkanSJeH95HpJ7O	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:14:31.466	2026-06-06 11:14:31.466	2026-06-13 11:14:31.466	02632cff-5a08-4d66-8285-8271fd03b7b5
371	3	$2b$10$SVftEE.Gyi21DpvujXBi2.BKEMtPEWoK68IfQPGRIrjVmUA163q3q	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:14:31.613	2026-06-06 11:14:31.613	2026-06-13 11:14:31.612	129d18ea-ac53-4ffb-969c-2013989692b6
372	3	$2b$10$SIySQTENDXjBbMW2w2V.n.4ON2iiiK3tFsLlIwNCGkmb/eidg/m2q	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:14:31.735	2026-06-06 11:14:31.735	2026-06-13 11:14:31.735	902e096c-8da0-4415-a10f-81a98ff71adf
41	3	$2b$10$gTpLNeG/y92q5QoJp7F6TuNcgVbqyzPNgmb/gxaERSymW5xnwXR5C	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 08:03:40.759	2026-05-28 08:03:40.759	2026-06-04 08:03:40.759	cf86bde1-fd97-4672-aafb-0fa3c5fd7fa5
143	2	$2b$10$QqYGiEd4uiEtpUxIrbTXl.xWY405q/3IOl5H7QZLOcxKq2I1XzTh2	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 05:07:04.634	2026-06-03 05:07:04.634	2026-06-10 05:07:04.634	c56257a4-a6b4-4124-a85c-41b23de50572
203	3	$2b$10$qWZZ.45WHVyaunlXEYyYNusqLkaYGzKaC6B5aH66OtO6fvWkOe872	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-04 08:12:07.702	2026-06-04 08:12:07.702	2026-06-11 08:12:07.685	10de9add-ff69-43d1-b6ab-935452e09698
106	4	$2b$10$zhzGyXSaNGumD/uBlFFWcOXTjiw4AyQXNXW3ifysMUHrI/3C3dbzi	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-29 09:39:22.534	2026-05-29 09:39:22.534	2026-06-05 09:39:22.534	ee031ba2-c6ac-4daf-9bc9-7148dc48af98
219	3	$2b$10$YdWZ6VzZqdCe8rK3AmzoVeJyFffADmPf6nHsYNIn34yeGW1H20oeq	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-05 04:06:10.049	2026-06-05 04:06:10.049	2026-06-12 04:06:10.013	caaf67a0-920b-40b3-bb4f-10589bf8109d
225	4	$2b$10$bQAP7O0kRpY/7NHT8hSZUutRnyN/q3AXxzWfqzX87msFvQJlHw5WK	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-05 06:25:45.708	2026-06-05 06:25:45.708	2026-06-12 06:25:45.707	00c1be23-38b5-42cf-a4d6-9c1264a7c11a
246	3	$2b$10$0rBbM5IZz1ZegtJTfVwuW.73U431luFy5VQXjOHgbrLp/MgHjM6Qy	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 08:54:07.368	2026-06-05 08:54:07.368	2026-06-12 08:54:07.367	14cb84f8-7daa-474d-93bc-6ec245fd5dcd
255	3	$2b$10$wU1l3a0tmzbq8SpB16gUEu1uldTTdo9HoaAQMpo26I51rcp9f8LPS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 09:19:25.098	2026-06-05 09:19:25.098	2026-06-12 09:19:25.097	38e7cc13-d919-4f4e-9d63-e99e0629abf3
256	3	$2b$10$ml2vS1J3E.AopBgLPmlpX..jamQPu3EAYDOHqa3XUv5rDQXxGA5BS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 09:19:25.279	2026-06-05 09:19:25.279	2026-06-12 09:19:25.279	5a17921c-4c8e-41b2-93fa-f55e1d5cf98d
263	3	$2b$10$aQrKlnyOYLVwDQtsboJGaeHTT56Qays7D7/oEp1H02798qujMGYG.	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:02:11.695	2026-06-06 05:02:11.695	2026-06-13 05:02:11.694	e55a06ad-0bd2-4e67-a585-3c5d690e2395
264	3	$2b$10$Z6E2dn20ERtt.dM3bZF2KeMY9vsa5paj/VzdAUuGHE.rcFZ/zwc9.	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:02:11.928	2026-06-06 05:02:11.928	2026-06-13 05:02:11.928	d396f4b5-01ef-4504-8614-63c238adc57b
273	3	$2b$10$cpzMobVw2SnbjwPw.l.tfOeidhh14wgjM/BbkBOPtRqOD2GQELxCC	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:03:37.649	2026-06-06 05:03:37.649	2026-06-13 05:03:37.648	414388aa-843f-46d6-a8df-728b3afc581e
274	3	$2b$10$Tjovihk3RIMPe8/BVtmzY.WjqQgvWe5Hj8EQKHXWd3x92OyUtmfkq	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:03:37.93	2026-06-06 05:03:37.93	2026-06-13 05:03:37.93	590ec68b-cd28-48fd-91de-472962db8a47
282	3	$2b$10$HTTC076oEzUnGXFUBhMNQe8ZAsZ.5VxJolP4fvhRrvSLnkLOJpG9O	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:22:31.488	2026-06-06 05:22:31.488	2026-06-13 05:22:31.486	fc83fd4d-b376-4a30-bef4-c335f8f73d30
283	3	$2b$10$17fO81GxR7xzxiZZvtmYbOGq5HrA7pqatWE4dAIIYmjeh6sfM9Zt2	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:22:31.878	2026-06-06 05:22:31.878	2026-06-13 05:22:31.877	26d6d31a-9861-43c0-8f86-7ac65d8b65f0
284	3	$2b$10$Oa7TOXTJAOfRjNd66CIZ7uUF4Ve6noj9Xy7GzpBybLkkxA3k6sfNe	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:22:32.047	2026-06-06 05:22:32.047	2026-06-13 05:22:32.047	eff3bb4e-f3be-4c80-9fd8-735e4f5f0739
285	3	$2b$10$q5rp5ZedhXFVdgK2tnKKUe.uKx1Qle7W6AXEoPHpDwfV5yH5zrBCG	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:22:32.224	2026-06-06 05:22:32.224	2026-06-13 05:22:32.223	3e421796-a4d4-4f58-af6d-ba006283b456
286	3	$2b$10$uLcRBfSuC55/854mucs7JuI9QO5Y/ZiJyoNE9uCaIMtoIyPz/47hm	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:22:32.372	2026-06-06 05:22:32.372	2026-06-13 05:22:32.371	6e84a173-0a82-4f8d-b837-9acd51f01b46
287	3	$2b$10$ICayavl2cfP30H/c3DYc7udzJoR35Hz3T2A5Z.5JW304pi3P0SGBm	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:22:32.538	2026-06-06 05:22:32.538	2026-06-13 05:22:32.538	efdcdf0b-f1aa-485a-b5c6-63e5b12e8a69
288	3	$2b$10$8ZKrUkY8bh.xW5j.sKTeuuzBqnGCg3rLScuEgAq3dkkUxZQfvrvoi	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:22:32.759	2026-06-06 05:22:32.759	2026-06-13 05:22:32.758	3bbfc40a-7d87-44d5-939c-3fae9c8b39a6
296	3	$2b$10$G3.BQFa3olUCPLmvgP9eXeBOKP2pnAmdxp.sHn0..c6y2prtlkiAS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:14:06.452	2026-06-06 06:14:06.452	2026-06-13 06:14:06.452	55c84ed0-d704-45c0-b9ce-676edef17080
297	3	$2b$10$8LeBXpJWGdyanCEVfkz3kOJQTxw0ASq0i2RuzT.m5jUTeCJZ/0BRa	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:14:06.655	2026-06-06 06:14:06.655	2026-06-13 06:14:06.654	62c01d1d-93b1-4127-89ad-722d2eb854cc
298	3	$2b$10$4r0cW.Rxl64wLm7fL60o1OifKRp6hNHrgOJdJGz.ayx70FHJwQQYm	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:14:06.767	2026-06-06 06:14:06.767	2026-06-13 06:14:06.766	949576c2-d2d3-40de-93fc-76917f29210d
299	3	$2b$10$Td7hfIaWm62rkmUmqsauyuZ/Cs.7/hwYxUmgE97FCAZJij0t5H8A.	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:14:06.876	2026-06-06 06:14:06.876	2026-06-13 06:14:06.876	c8ce5812-55e7-48f8-a4b9-e48350f6e185
300	3	$2b$10$P5AeWPCxJZUvledBMptOQO53/s1LYheFK78LVABIeJ2ZMZXmi.Cvq	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:14:06.987	2026-06-06 06:14:06.987	2026-06-13 06:14:06.986	e3534442-dcd8-4299-b7f8-cfb5ab77c84a
301	3	$2b$10$r7tow1uSRjW9WKV.cx47Y.8UK8LZEky.wyZuuDgxz94lVFgEJKp2G	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:14:07.097	2026-06-06 06:14:07.097	2026-06-13 06:14:07.097	f139255d-ba4e-4444-89d3-84043a4503b2
302	3	$2b$10$nJrQyScDt7TOtDdEmyBhiuUb99pPTAbSJHcvxT4dCj09JdIC0dJJK	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:14:07.207	2026-06-06 06:14:07.207	2026-06-13 06:14:07.207	e47a50e8-7474-4a9d-b5f5-e600f4cd96d0
313	3	$2b$10$80tsKXOQKWeEne39CjE/VeQDqBaKSvpGexhYRzVrKLGvlj0ygoF.S	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:15:30.833	2026-06-06 06:15:30.833	2026-06-13 06:15:30.832	3c72cb1b-3c13-4798-860b-7dc5eff6b5f3
329	3	$2b$10$2pZzlVozkJE6qUJ6mcFeUeEXYT5wpvrfES4zIiQ3loWu/Uv3PMcgC	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:17:32.108	2026-06-06 06:17:32.108	2026-06-13 06:17:32.107	59168b3f-44b4-4d6f-b261-da655b42d2eb
104	3	$2b$10$vDxXqWKNmhDGVXHAeiUFd.XmuOL9VU968iHG16NK1cA.OGQ3jZe.K	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-29 09:31:36.44	2026-05-29 09:20:19.675	2026-06-05 09:20:19.663	5ee278dc-8a8b-4861-812c-879dbeb7ad76
105	3	$2b$10$RfwdAyOLRYg9zFWWD7KXIuk7FpqtPp3lHJ1Mtm92YYOz2GFFqx0Q.	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-29 09:36:50.988	2026-05-29 09:36:50.988	2026-06-05 09:36:50.983	1dca8763-8b64-4f99-9df3-dd0c8caa574d
330	3	$2b$10$dDZpJ.LcLTHjWBBdu5FeE.GSGg2iluoz6ONpoWhvCg/Gh52zAqG7i	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:17:32.305	2026-06-06 06:17:32.305	2026-06-13 06:17:32.304	bb1f7cf5-cf94-4c02-837c-2298aa30329c
345	3	$2b$10$LezYBQIgrE9Xs7S7ZPNLweGjhqEzJ4trsgvcuHEV.YYOeenYuAbDG	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-06 10:07:51.496	2026-06-06 10:07:51.496	2026-06-13 10:07:51.485	f8c773ae-01fe-4d2e-bb84-002d12309b58
358	3	$2b$10$EvDqTe.84uBtWWIQd/7lHuuEA9cR7c5d3YzlByb7ojr/lIp6YovEW	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-06 11:10:14.296	2026-06-06 11:10:14.296	2026-06-13 11:10:14.286	eb115ef5-dd60-4f9c-8e44-9ab3503b965d
373	3	$2b$10$ssQwLHcrmy23mTd93MFmOeuhZi7K9MS7cr5zBpVFDA74jP3A8pdey	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:14:31.983	2026-06-06 11:14:31.983	2026-06-13 11:14:31.983	3fde9afe-2040-4266-8bd7-0110ef55dfee
374	3	$2b$10$BN1MQe193TrG5BGsGTwXNeXMSLsT6Ij6SgviZUHiRfE6IT.sU6kjW	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:14:32.266	2026-06-06 11:14:32.266	2026-06-13 11:14:32.265	55999a1c-d158-4fa2-92ff-67ef7bda00ee
375	3	$2b$10$6Rnp1SiAdLew1SZUAGizHeHyIZ2KS0Ew8L8dWPzwBUP9orDrlWNoW	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:14:32.384	2026-06-06 11:14:32.384	2026-06-13 11:14:32.383	acefba0e-c9ab-42e5-894b-b24d469f6fcd
376	3	$2b$10$ftQ9GQXQxHA/1YMslE63Q.v6kuTAxQbPVb6jPFOWddC6SPYuqFBSG	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:14:32.501	2026-06-06 11:14:32.501	2026-06-13 11:14:32.501	b8563a0a-0f8b-468e-bde9-05ab871dcd18
80	3	$2b$10$nB0mJmhaRiJiSdOkJzd/nuBAOqRCuVR7RI30w9yinXmZ84kaIxKqS	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-29 07:32:11.697	2026-05-29 07:32:11.697	2026-06-05 07:32:11.688	4c6be315-0649-4723-b6e7-faa7bbf7bed5
132	2	$2b$10$Pn.Wu5dxBW1nAcqjbiJiN.cs.0.SHnjcJzZe8GDZNQUcBABfk6GzK	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 04:47:18.909	2026-06-03 04:47:18.909	2026-06-10 04:47:18.902	272d1d4e-b7b3-4b91-b53a-4442f28e2f77
135	2	$2b$10$s9klbhSRIUmIvCRaD24FcuMO3PPzCIJsxhXhKsiZ2O3IWtkQ9bAYa	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 05:04:15.365	2026-06-03 05:04:15.365	2026-06-10 05:04:15.357	24852a88-df48-4cf1-aa6f-e9c6e08b53d1
136	2	$2b$10$uvUpBIwGm/iksGGYtZxq7OwkA1cQXfkhwELqh6Nv2lO7AMSBD1SBS	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 05:04:15.565	2026-06-03 05:04:15.565	2026-06-10 05:04:15.564	e6283e25-de0b-48ff-855e-cbfa27b56831
137	2	$2b$10$IFJ2hShmjRiDUjY9G62eO.TtyD6kFpGLfvH46L1gZqFgXjQpZ3eIW	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 05:07:03.766	2026-06-03 05:07:03.766	2026-06-10 05:07:03.76	28544699-5d52-45fd-93c0-3ec8e3e024b1
138	2	$2b$10$x8x53M.Wf/aZzN33ans7TOWT.4neMJx9sNm8Vd9uOMeFtJoS/EAaS	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 05:07:03.972	2026-06-03 05:07:03.972	2026-06-10 05:07:03.972	b60b9a4c-fe31-4cdf-aa96-afc34b8f31c6
139	2	$2b$10$bWNEbGSncEIa2UyYPGRzougzAUTOiiUooPuTQ02y8YTBqa4CMNAHW	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 05:07:04.186	2026-06-03 05:07:04.186	2026-06-10 05:07:04.186	6878dc86-14a4-471f-8a16-c15906544291
140	2	$2b$10$YGVwGpTWwCncvAn.4u2AXuUZ4Zp.xKJtX81eiFZKGU5NJ5qRgCmDi	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 05:07:04.298	2026-06-03 05:07:04.298	2026-06-10 05:07:04.297	1ba9e0c3-8914-4b8f-8095-0c98708bafae
141	2	$2b$10$dx7z3Fd894NkaMgulbErmu8Mor8lJ/3v4T6vG6G4cy1ysBHwWBGTO	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 05:07:04.409	2026-06-03 05:07:04.409	2026-06-10 05:07:04.409	c0d71ab0-1abf-44eb-8daa-e51943dfe2b2
142	2	$2b$10$OW6Rz91awjOGXG.gbzfbXeZkxzAmBdo3qDZHCXOQDU9LUwFTLjbp.	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 05:07:04.52	2026-06-03 05:07:04.52	2026-06-10 05:07:04.52	4850e550-2ea6-4c91-9189-95e13743dd27
204	3	$2b$10$uVVDru5FmWHYwoJVZBFeQeGVUAbKKCFUPhtH.AJ4npYKBt62XI11S	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-04 08:34:44.751	2026-06-04 08:34:44.751	2026-06-11 08:34:44.735	08451bda-462c-48e4-a7cd-d49ef2463f6a
315	3	$2b$10$dVjlRjbj.6XiP3gFu8g0a.RvSt.Z0GRuBjaytJRbKRl92PNLURQkq	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:15:31.32	2026-06-06 06:15:31.32	2026-06-13 06:15:31.32	a24fd5d5-3231-4db6-9166-a49dc45565aa
316	3	$2b$10$OIpjKRP3hphnHwDzmSOJK.Vtkjbi88rVEJ1MSSZVhqXb./pVk9ocS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:15:31.443	2026-06-06 06:15:31.443	2026-06-13 06:15:31.443	0c6b4d49-6486-4618-86e3-daf3819ab568
317	3	$2b$10$zBu3fS9FZRwwzriARyvpQuGyfQ6dM7X0zmDXQ1uKeVLTCDRfF6Bc.	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:15:31.578	2026-06-06 06:15:31.578	2026-06-13 06:15:31.577	bfefaf29-0139-46e6-ae89-9f146b6446f0
220	3	$2b$10$kEHPcL5fwx/pdETI8c6GrOWp/fAbPwEdTQ98U6UX1RxfsOoJY87/W	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-05 04:17:29.152	2026-06-05 04:10:22.536	2026-06-12 04:10:22.535	1ac3d34f-1e6d-453c-a5fd-b35eaf748b33
226	3	$2b$10$8v6pOfyiADLajSwHpp16AOOynNxKu48yyV7DR3OVRpKWNwbLO09le	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-05 06:48:21.174	2026-06-05 06:48:21.174	2026-06-12 06:48:21.171	8a90cddb-4d7a-4091-b3db-291eb342c98e
247	3	$2b$10$B71PUrWnWhqBxwScVPUwcOsOl7G./AAmvXie8Q7ovQjpB9g73tmKm	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 09:01:34.152	2026-06-05 09:01:34.152	2026-06-12 09:01:34.146	322a06f3-2b03-4296-b95f-b8347767d01f
248	3	$2b$10$Mtvn9PTo3e5Cx0i7JzO1quNUxzTrHuaqJOSMNAhxOimFEL9YAwEdO	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 09:01:34.418	2026-06-05 09:01:34.418	2026-06-12 09:01:34.418	1b0f9074-d22e-4eb6-9965-01601785245b
318	3	$2b$10$9.gI7T2uS7T14zxQxQCAYe0iYgPIrjWsohAktHj2i.s69SxNh86Se	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:15:31.696	2026-06-06 06:15:31.696	2026-06-13 06:15:31.695	fc486ee5-dd1a-4fde-a40f-db3b2fb41aaa
257	3	$2b$10$mK9u5oRX4leoXTnVMuqJw.D3Fbx3dFZm1PQZRMmoZH79ARWBQuEZW	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-05 09:34:36.511	2026-06-05 09:25:01.658	2026-06-12 09:25:01.647	16480fe1-4355-489a-a8ba-e08a2db7defb
265	3	$2b$10$3MiiyqGkWf9ZHh6vmlPVweGnHzqHE4Vh0F6vUEHowTAqwfO86EVAS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:02:12.213	2026-06-06 05:02:12.213	2026-06-13 05:02:12.212	11a132d4-190b-4220-b20b-88dc1b2143f1
275	3	$2b$10$EvD4e8cwq7oPTXHLzidVN.wDVZ10b/yVWOQTtv42ZWXrScfaYfLsO	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:03:38.252	2026-06-06 05:03:38.252	2026-06-13 05:03:38.251	e4603a91-5c7b-4be1-8e11-bcde1a2a393a
289	3	$2b$10$MxZOMS9iKXQUqJtcU4R/neVJ0z1cm53OH./jGHMl0GcDw3pBtjiKW	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-06 05:48:36.265	2026-06-06 05:48:36.265	2026-06-13 05:48:36.244	713bf330-950c-4a57-96dc-6d165332a0b3
303	3	$2b$10$YhCB8FLyFs3zXX/PnbFXmue9IXfcwKAyFQ9YTHA9GY1Dlq6vrQPTe	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:14:07.529	2026-06-06 06:14:07.529	2026-06-13 06:14:07.529	34fa694b-2d46-4956-bf58-836cec33f780
304	3	$2b$10$/GAq3ApzOohEXicaTkwMOuUzU0X8ogqP0Qdr6lIiVQKWISwV8Lnte	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:14:07.669	2026-06-06 06:14:07.669	2026-06-13 06:14:07.669	a43dcdf6-bfe7-41d4-ab23-4ade6adfa233
305	3	$2b$10$mNEamZeh8fOkZ8qxqc8DqeBUnjytZz.NCtAnjeY1YtX0tLwnW61pq	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:14:07.779	2026-06-06 06:14:07.779	2026-06-13 06:14:07.779	275772be-056b-4db4-9aae-e395bc69cce2
314	3	$2b$10$C3Bm7rHuCLT.qHv.Fvi9yOqoIodROiQRa3CbWhW5s8pxzWVq.8OIq	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:15:31.14	2026-06-06 06:15:31.14	2026-06-13 06:15:31.139	25182960-b314-4a42-93ae-607e20e10778
319	3	$2b$10$UK2O8wyoV7GGw/5UuSx.9ewrdIeTla.FS4/7EF3rB.ZLJxhz3G4KC	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:15:31.81	2026-06-06 06:15:31.81	2026-06-13 06:15:31.809	ee75606e-d984-439d-9c30-4417313bd66f
320	3	$2b$10$JGQQko8TdQHW6lFueojEzul3BwTM5tG5IKm5qj0TVNNAjkdhS/ppS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:15:31.922	2026-06-06 06:15:31.922	2026-06-13 06:15:31.922	0f0262cd-2144-4947-9177-04bcf85c4730
331	3	$2b$10$B.TkzlYv/t8vhwhNmJ1IZeQNktOHjF61M1nBEaGTOJX0B/AtNNiL.	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:17:32.546	2026-06-06 06:17:32.546	2026-06-13 06:17:32.545	0c9f69d3-0529-4ce6-ab33-787e961478e3
346	3	$2b$10$ssdaTVeq7wg5Z7Q7RZvax.lMa36uzglGXKWMn8hjyJXcfE4xUhNlu	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-06 10:25:45.745	2026-06-06 10:22:57.395	2026-06-13 10:22:57.378	1f99f4f7-d7ba-4c6c-9819-f288b8d548fb
359	3	$2b$10$4wFxYWRsywdxwt300cLVDupu4RVBpUYzux7YfdVLp4tFTQ98DMkRS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:13:39.985	2026-06-06 11:13:39.985	2026-06-13 11:13:39.979	752709f8-c0e3-4b26-a170-59a4da027d74
360	3	$2b$10$hqEY322lsmd6gZlB2vhBheP4lo4ioq0q6u2b7c4kucgrgFUmWCMpS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:13:40.325	2026-06-06 11:13:40.325	2026-06-13 11:13:40.325	ae4635cf-cdba-4f6d-8fc0-16057d9e66ae
361	3	$2b$10$WRI3UegqRjb4MUMMKToKv.oK3OWE9VqhHWWXc/PRTUH4Y8rpO3zaC	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:13:40.443	2026-06-06 11:13:40.443	2026-06-13 11:13:40.443	2f5e7aef-fb5e-4668-b358-101867e87d8b
362	3	$2b$10$E4I8CFGA4usKiNXHQpdNi.bjhGoCsxnWZrXzom5imS7YzxokiZY4G	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:13:40.562	2026-06-06 11:13:40.562	2026-06-13 11:13:40.561	06bb6489-88f9-4351-a066-0d8f7f09f657
363	3	$2b$10$zWS4/sMfOD93ULQrbF48/egD2TZ9gInVFZANMey1e7S1UgXXdbCHW	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:13:40.676	2026-06-06 11:13:40.676	2026-06-13 11:13:40.676	2907c929-0d6f-4d83-a46c-18333f47941e
364	3	$2b$10$0lB5.43J35yzxV9vHmGsoOKfEy6cZm7EupBD80kggHKJc/Rs8MC2a	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:13:40.793	2026-06-06 11:13:40.793	2026-06-13 11:13:40.793	ee8213c0-0f56-42cf-b8ed-dfa08c4ca98f
365	3	$2b$10$yqT5WcNJVUYjld9Qvhl20OEwDEh/w9ElnSCMQ7H0hqyRdubwrx55W	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:13:40.907	2026-06-06 11:13:40.907	2026-06-13 11:13:40.907	a9bd2796-baa8-402d-afb2-cc9ba7408cbf
366	3	$2b$10$qwLMMlYxttlCs97uRFWcz.xufYXEH8zSOdCnNXNRkGxvY496FPkgi	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:13:41.023	2026-06-06 11:13:41.023	2026-06-13 11:13:41.022	80d346bd-d59a-4747-bda7-4565cb34e6c5
367	3	$2b$10$11mppHmKzuzTHkOXwEn/w.rU5QD6y9c427aH05lkoM45lSgCBFpdG	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:13:41.14	2026-06-06 11:13:41.14	2026-06-13 11:13:41.139	45c37917-beee-4a2f-a082-cb358eae4fac
169	4	$2b$10$5C5cD9q2W8WdLPTLKgKbOOKrXvaVDq7QUVkpwUBJm485j/3VFF0f6	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-03 10:32:01.552	2026-06-03 10:32:01.552	2026-06-10 10:32:01.533	f389dee9-7cad-42c5-8d7b-f2194e0a7128
205	3	$2b$10$jrmX9ve9CerWKxtTugdjQeRQfkcJUAnRXZOi0X7riQ3OssN/BsSrK	unknown	::ffff:127.0.0.1	unknown	t	2026-06-04 09:04:57.168	2026-06-04 09:04:57.168	2026-06-11 09:04:57.154	5123c485-bc6b-4919-b30f-750fd78c83f0
206	3	$2b$10$YK6pfEjL8HAj6wCvBcQnOuJz4CtykMIFgr9Q1Cy8axQc0Me9LV4G2	unknown	::ffff:127.0.0.1	unknown	t	2026-06-04 09:04:57.491	2026-06-04 09:04:57.491	2026-06-11 09:04:57.491	afdb6226-d45b-427f-a92f-ef17eb7ca047
207	3	$2b$10$fYidoZXu.MhwSrRhbeHiU.wmC.CI1NNDUo/yfin8U5dx1Pwi08fcC	unknown	::ffff:127.0.0.1	unknown	t	2026-06-04 09:04:57.611	2026-06-04 09:04:57.611	2026-06-11 09:04:57.611	e1a4df19-8f29-413f-8ed6-8b00fdde1d6f
208	3	$2b$10$TdooD6O2CRogC3QmL2P1MeEqTpu/6ENouCn8A5b5uL91fr1Gfhm0.	unknown	::ffff:127.0.0.1	unknown	t	2026-06-04 09:04:57.735	2026-06-04 09:04:57.735	2026-06-11 09:04:57.735	f786073b-897a-4bcc-b39d-b88b69586fab
221	3	$2b$10$teexYrORsbbCD8MGuO2SU.VjPxkEM..ijDJcOlRbxKY8qB2VciudO	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-05 04:34:26.789	2026-06-05 04:33:14.76	2026-06-12 04:33:14.733	1619d5a5-fe70-4c37-ad91-81f358a25c14
227	3	$2b$10$emxUiLfWWIWZwRfkdu08d.3BlfujGiwoe8KYJM5N9T/6fISi.Me8m	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 06:52:08.419	2026-06-05 06:52:08.419	2026-06-12 06:52:08.413	f74d5f16-176e-49df-99a1-ed93ae2ea4ac
228	3	$2b$10$dvrWoMjQpk3Vn.Ag9z5Y5uBNjQwytI6CF2S6Ms5xYF9yCM0f3lqie	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 06:52:08.587	2026-06-05 06:52:08.587	2026-06-12 06:52:08.587	50da2362-d57e-4e9a-b0d9-3dc159dc80d7
229	4	$2b$10$q5GEknGe8kyFpZxNhajHHeN2TjN.NXocpv2t3p4RImupkiJukH0KO	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 06:52:08.711	2026-06-05 06:52:08.711	2026-06-12 06:52:08.71	6349be4c-a6ab-4ba5-85e3-83c2412421cc
230	3	$2b$10$mKEz.eLcx/wu/BUoBtRF8.IaXOAob.SwGZ7GSjLUxHRFQAgSVxNxa	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 06:52:08.845	2026-06-05 06:52:08.845	2026-06-12 06:52:08.844	cdab3b3f-7a07-481b-acaf-a1355834a8c0
231	3	$2b$10$h0ouUK9HPGIlXpJgyMCqEOlkSYb7H9h1d8Xp4D9fxSrJctL8SIiDC	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 06:52:08.967	2026-06-05 06:52:08.967	2026-06-12 06:52:08.966	c95b672a-8f34-4e7d-90f1-cf757e0a7c7a
232	3	$2b$10$L7oMZpMcdTmZL3sqLFkf.ebmlHlKCLHePiIiSl.wd/wh1ZFwThWVa	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 06:52:09.095	2026-06-05 06:52:09.095	2026-06-12 06:52:09.094	7af650e5-ef7f-4113-b09f-c4e80cfff102
249	3	$2b$10$rQk9c4OZdI1.dU949YSRTeWoCgwVHbsgDwv5rCjL0XXokuMF3rkWS	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-05 09:02:42.818	2026-06-05 09:02:42.818	2026-06-12 09:02:42.803	8141c32c-d0a3-4bb9-a9e2-602f95da87d6
258	3	$2b$10$0l14gyuWBQ2.zbay1V.JUOawOLVefYF0KPxMVczyr/Pxp40OMzMHq	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	t	2026-06-05 09:32:56.01	2026-06-05 09:32:56.01	2026-06-12 09:32:55.988	e02c6543-9b12-42fe-ad9b-8956eaf4afae
266	3	$2b$10$xM/q//k2dvbiaxMnEkQiMedhCvs8AL4KgJDDlnVSE/X7KsqG8iwJ6	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:02:34.192	2026-06-06 05:02:34.192	2026-06-13 05:02:34.183	00a02848-d137-4b4d-878e-b17411dbf628
267	3	$2b$10$wlqToHpuGFn2nksPTwU97OmcppW9E8mMqddCy9GUpnHt7aLUfXUz.	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:02:34.51	2026-06-06 05:02:34.51	2026-06-13 05:02:34.509	a3ec4b90-2b89-4d51-ad94-86fbc1954f40
276	3	$2b$10$wonWUeV9F7aTF3sZFQLlX.KS46nOoCrJtS3TUf787jGAyuXnpu5e2	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-06 05:09:02.546	2026-06-06 05:09:02.546	2026-06-13 05:09:02.52	ea5aef8d-d691-436f-9139-0e2e5db9c774
290	3	$2b$10$szygiiNOL3kn6785Y89kduk4Ej.3P2keeavdgCq1Y2lUoBgyJWD0q	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-06 05:58:23.281	2026-06-06 05:58:23.281	2026-06-13 05:58:23.264	16c296bc-bdda-483c-874c-240be443be8d
306	3	$2b$10$vsYaIVBDCHevLctJo9TJNesLaqKC2lSdKN8E5Az5BwqURxhYp/Csy	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:14:07.992	2026-06-06 06:14:07.992	2026-06-13 06:14:07.991	e0c71f3f-bc34-4be9-9805-e80c2c87afab
307	3	$2b$10$DBBDKXW4CzIYIxRCRMKncOKfOU4q/AEC13VyqnWYdxSv69Ofatc8W	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:14:08.133	2026-06-06 06:14:08.133	2026-06-13 06:14:08.132	5ce38f78-8f9f-44c2-b800-3e48b74a89c4
308	3	$2b$10$fLryPIP84sDwSpKSWXWUx.masGKBCyXP65vCD1d0rzWmPy2Aoo9Ku	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:14:08.253	2026-06-06 06:14:08.253	2026-06-13 06:14:08.253	2ac6ad0c-a300-453e-bf7d-64afe264582a
321	3	$2b$10$4mS8/3DNlnj6jbjZHknN6eLgcvGewmsvvv7E1DgSCxJ.P/3pfqB2q	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:15:32.248	2026-06-06 06:15:32.248	2026-06-13 06:15:32.248	369affb0-3eb1-4fec-851c-05381261039e
322	3	$2b$10$hJSxL4AKtOUVcm4VFOaOveBjR/kFo8xSh73cmMdcHQLBWvrLsgsai	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:15:32.502	2026-06-06 06:15:32.502	2026-06-13 06:15:32.501	75b414d5-9640-4ca0-b7e1-9633d0fac2cd
323	3	$2b$10$aFX7zjvbb/1dfLISTEjok.p8HDV/b1J56IlVJyZQDivrBKRbxMvSK	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:15:32.626	2026-06-06 06:15:32.626	2026-06-13 06:15:32.626	b6b43c04-1715-421b-a22f-d76f9baf1837
332	3	$2b$10$x6YZt9jiTj2VZqCIf/T4WuvpitWPNbzWbPZzdbWcVyCatzWZTFmxi	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:17:32.974	2026-06-06 06:17:32.974	2026-06-13 06:17:32.973	48f1aa87-c7cc-4477-9d7d-ec19f86471a0
333	3	$2b$10$ryAHuMuCyW/uxufU86gp7efhaPZozXK03mBWt4n8VEjOfbftS3RCS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:17:33.152	2026-06-06 06:17:33.152	2026-06-13 06:17:33.152	ea750597-77c8-458f-8e2f-6cda7c75e77b
334	3	$2b$10$z8qdaqcgrgCqoearrPXu7uh6fMdViYCR6f2zJ/yCrXOkv44QgdtPi	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:17:33.265	2026-06-06 06:17:33.265	2026-06-13 06:17:33.265	2f1922ee-cf79-4dee-8868-e28aa20d1b0f
335	3	$2b$10$oezwz17kpTyu/cdo7rqa.erdQH34J.HoSePEs94ITwgguxMFfXgDe	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:17:33.383	2026-06-06 06:17:33.383	2026-06-13 06:17:33.383	277c6dcb-627d-44ad-8e0f-7ca64eb87bec
336	3	$2b$10$7773R1vKXYJuMf4.vaVSF.jfDt98WPYFqDvOGynTePrIuSYMUnrGm	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:17:33.509	2026-06-06 06:17:33.509	2026-06-13 06:17:33.508	c2a3e90c-48e3-42d2-a350-10f26b6bd52d
337	3	$2b$10$9Jtmcy358CV515z4HiJrHe3l8NYpHzuKBWcjxUEoKd81brDdv9w26	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:17:33.638	2026-06-06 06:17:33.638	2026-06-13 06:17:33.638	245b83aa-0d78-4c15-862c-7c19ac5a00f3
338	3	$2b$10$vMeaCRjBKghUCSCpM0ZFnuII5FwF5W207cgRmdcAWv8Z9MGzA6xEC	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:17:33.749	2026-06-06 06:17:33.749	2026-06-13 06:17:33.748	fb2e58d6-ccb1-41d0-be24-48e030b3ddca
347	3	$2b$10$dEewpdhRkRh/Y2pX5umu8ugbNLCd5F9gEfi1bnpkKebcM/z4vanqi	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-06 10:52:31.54	2026-06-06 10:52:31.54	2026-06-13 10:52:31.533	55549935-f21b-43ce-8f16-bf23a45ccbe0
368	3	$2b$10$RjtZ560aovrBf5Zpoq7j..NZwTb.Mb.uMU6WuNx3Jesc4cuKclTNq	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:13:41.257	2026-06-06 11:13:41.257	2026-06-13 11:13:41.257	514bd6f4-8ac4-41a0-bbc7-41e830803085
377	3	$2b$10$mmmpzEn3Sd5O2ZQOzzOEou/QsYzjjDK3Q/0HSATcIoYKzS.Vwd1Om	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:14:32.628	2026-06-06 11:14:32.628	2026-06-13 11:14:32.627	3707ece3-3732-4c3c-99f9-86b591eed563
378	3	$2b$10$6V6zeNRtSWU6Zq9y1IMp4.mzlSocBlI1AH5EbVcIaRD58vllzJIh6	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 11:14:32.742	2026-06-06 11:14:32.742	2026-06-13 11:14:32.742	c8a454ad-5630-4316-9891-95d76bd44cbf
379	3	$2b$10$WU2gviAzLFvApNW.HPnyaufM8i3KgaSVxDav8hfp6jBk9jO8LbCgS	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-09 04:11:25.414	2026-06-09 04:07:03.377	2026-06-16 04:07:03.352	7ad27d59-333e-4e79-8091-1bb3adf5305f
380	3	$2b$10$nWp/bpgX8YdBLbUAJZr0tO5qnP60mUCYISZb4aFJijm70w1s0.glK	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-09 04:38:10.15	2026-06-09 04:26:17.117	2026-06-16 04:26:17.112	97421118-40c7-4502-946c-05328edd3d9a
381	3	$2b$10$6/D9QNpvWZD8XK7BOTgFduKWK/NqMsnby6DrXEnyuNDxsihcPt5W.	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-09 04:44:33.215	2026-06-09 04:41:57.042	2026-06-16 04:41:57.009	ff9a8053-bd33-42ef-be7f-881ca2400ba3
387	3	$2b$10$4bXMbH9myDiikA5cyx2eQu.dh0GyCdU8vlw7BObosZ41o7IFQX5hq	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 07:27:06.366	2026-06-09 07:27:06.366	2026-06-16 07:27:06.36	962aeedd-8cc4-4ee8-ab0f-d0e633e4e374
388	3	$2b$10$KAo6CEDDdWoLDjT0cgo6bOoqWml9agqTBLqS/PNAH57YnYxlj80Rm	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 07:27:06.626	2026-06-09 07:27:06.626	2026-06-16 07:27:06.626	aded3bdb-6862-4d22-88c3-4f9eafadf816
209	3	$2b$10$xDn92dI.TroGcpHkHciEoe6moenIn1t20D7fvxtr9zvWGSW8k2mJm	unknown	::ffff:127.0.0.1	unknown	t	2026-06-04 09:04:58.11	2026-06-04 09:04:58.11	2026-06-11 09:04:58.109	6e3b1cba-224e-403e-95a5-06006c818e4c
194	3	$2b$10$7STX67rP.tOhCyZ1hR0ABuY2xyE5rbkuZubC5C/dmXUoi1L2r0B7u	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-04 05:19:08.837	2026-06-04 05:04:25.08	2026-06-11 05:04:25.046	8b94e193-b3a4-4113-9612-8b4eb560988e
2	3	$2b$10$iPKscfW9.4VVGTgmNlTIl.sFHjiePR9e/kONaqX0Tw7WvJm70TEIe	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-27 10:17:22.612	2026-05-27 10:17:22.612	2026-06-03 10:17:22.611	776f8f93-33ce-4c79-a93b-0b8e8e31d8f6
3	3	$2b$10$NiTfJFA4DQz6GFfrzqXIaOVnuKy7YRBkST9T.RQTVs0pp15/eNdBm	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-27 10:41:16.057	2026-05-27 10:41:16.057	2026-06-03 10:41:16.048	ffcc853b-a139-46f0-8bc2-06b0f58d6a3e
29	3	$2b$10$WQ3x3vLoXgvxJgJY0uq3D.XRDf/nTl.6vdfSPCQMG10lYtO0hXH4y	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:43:02.705	2026-05-28 07:43:02.705	2026-06-04 07:43:02.704	a8ded86c-0049-4669-afe0-4130d00afeb3
5	3	$2b$10$q9y9K3DTe2yqiYcdJIezS.mGMlfpqRrVdSV0rP6zQDe8sRzMueKja	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-28 04:32:27.68	2026-05-28 04:30:18.994	2026-06-04 04:30:18.971	00f8c5a5-ef15-46bf-ab15-ada3de4b6017
30	3	$2b$10$WSfwb2AvLf1X1/642zG5XuMtR1PqJXc85nd58Y6J0KjRMh/cC3Hb6	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:48:40.617	2026-05-28 07:48:40.617	2026-06-04 07:48:40.611	b435deb7-d412-4882-9ebc-803945ff373e
7	3	$2b$10$qW77g6Bxt75TsVZieCSRbu8VGmQkJATmCaTkQDYAKQc1HkIWNhdhi	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-28 05:48:02.119	2026-05-28 05:43:16.42	2026-06-04 05:43:16.395	63d91bef-372e-4c7c-9dbb-97a898309ae4
8	3	$2b$10$jL0yfICA5WnVsqcZfqYwSO18/FDLsq5dV30/FqUwZ0mK9.LrczUEO	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-28 06:05:14.944	2026-05-28 06:01:20.646	2026-06-04 06:01:20.623	121a74bb-0530-4ddb-a8ae-e24d9db28681
31	3	$2b$10$uqjSp.Rgh/gvesUvK.4s3ON.g4IW.yZS6iz4WstVaXWmVFay26onm	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:49:00.325	2026-05-28 07:49:00.325	2026-06-04 07:49:00.318	c3ada3c4-fbcc-4693-960b-c47eb7aeb872
32	3	$2b$10$8RyhnTh7YzlgvqNO5loLs.CZqYfIHBHeIe2pZZrmNzho5tjAnF4jm	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:49:48.594	2026-05-28 07:49:48.594	2026-06-04 07:49:48.585	b250b918-e2aa-49b4-9183-c60d5e6f6ad1
33	3	$2b$10$whlCJVvcjLyYu7.YV8HJaeJW0cN2Snrnx7koOkFKxh0DMqMPgALky	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:50:17.124	2026-05-28 07:50:17.124	2026-06-04 07:50:17.118	8cdc8ac0-b425-4ad6-ad39-95b708beb0dc
9	3	$2b$10$3KK/9/2rvxB3dGhpNZ03FOuyLcpNEiZhRg.0KpywDktOHp2VYToK6	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-28 06:21:57.99	2026-05-28 06:16:27.951	2026-06-04 06:16:27.93	ef599eca-b2cc-4b6a-a8b5-4637b72eb496
10	3	$2b$10$wF80yP/gopdsG8GStA.HmeVas2V3KOHI7CRQhOCCIlV0n.zOovki2	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-28 06:25:10.269	2026-05-28 06:24:03.626	2026-06-04 06:24:03.6	c36731f5-1aa9-4336-be0c-ae7c27c83ea5
11	3	$2b$10$/uuKNtKhRoVGMwcwYLu9tuuZ1RifGHcNN5bfcw2byZG83blt.bbsG	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:37:05.005	2026-05-28 07:37:05.005	2026-06-04 07:37:04.997	71d28819-b9b0-4508-adec-8c05d814c1a0
12	3	$2b$10$bmsDTnCzQrqkKQQgCL60UuBYC/kphGbi.Sw44Re6AXuHsO0pyxWuG	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:37:05.448	2026-05-28 07:37:05.448	2026-06-04 07:37:05.447	a984f25a-3bd5-47d0-9ad5-ba36f5b28dff
13	3	$2b$10$OrHiQWvil1y6eMc0wxvBD.Z9aXN5N6MEk5EIRTSXlo6C/ZMLqVkKi	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:37:05.578	2026-05-28 07:37:05.578	2026-06-04 07:37:05.577	376f0c97-f496-48d8-a053-e7587183a62b
14	3	$2b$10$JsPqa6HOfCdwJ2Q7TeMrj.DPfPLLMSS7SUy5M7v8YFq4s2J9RFTgO	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-28 07:38:21.169	2026-05-28 07:38:21.169	2026-06-04 07:38:21.15	f09c6722-772d-4087-8569-909d72b31385
15	3	$2b$10$dvH6.RU2NDNEy.ttJwHNDuRSVox.X.FIBtbgEc8dcUSZxJwCEZ.Au	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:39:01.927	2026-05-28 07:39:01.927	2026-06-04 07:39:01.917	a16a6f64-b652-4c05-bb37-b9ab3ffedd32
16	3	$2b$10$hXTFo3h/JjLwmshqrEovPu8K8/lefvi95Up2I2YqZuJ9cOc6bDwuO	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:39:02.209	2026-05-28 07:39:02.209	2026-06-04 07:39:02.208	5494524a-a9f0-44e7-8c9c-5db564537bfd
17	3	$2b$10$UOw8BBYJGvH8FTqEwCuN5uMgrf907LBil.qnK2wKZEiO9L7S1505C	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:39:02.346	2026-05-28 07:39:02.346	2026-06-04 07:39:02.345	03c822cc-83fc-4996-8e1a-e5afbe27b05d
18	3	$2b$10$xFRndQYAKQVxE7odMwWLgerjU4.BSKk1d/FQWufsZLFiCr.XdwE0u	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:39:45.666	2026-05-28 07:39:45.666	2026-06-04 07:39:45.656	d6aebae1-f46e-41c3-9bec-368a2fca7b16
19	3	$2b$10$13WQwhNp5DojIz/2IxgEm.GtBhwmhrNFvI57jTwDRERqFJ2VJVcKq	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:39:45.892	2026-05-28 07:39:45.892	2026-06-04 07:39:45.891	6fed6c20-494d-40d4-98b4-d79bf638f23f
20	3	$2b$10$gg0Nptj2xB0IqBmXltOvIel26vlKrM8Goqq/HBLzEgf1PgbOf29Jm	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:39:46.011	2026-05-28 07:39:46.011	2026-06-04 07:39:46.01	8eb36d5e-4ce6-45d6-9bdf-888338156eec
21	3	$2b$10$aQjXNsvYYx6okO78XOR4Pus8t1HDf0w3Quh/UnJDavJRVWsQSpYVS	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:41:40.028	2026-05-28 07:41:40.028	2026-06-04 07:41:40.022	d01813dc-30ec-49e6-b6b2-3457cf467ba4
22	3	$2b$10$2NFUldYYB6rhEa2BsGI//eilZC7QYBiUkO740psRcAsOSy5hARJeS	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:41:40.276	2026-05-28 07:41:40.276	2026-06-04 07:41:40.275	0d803859-96a9-4178-9a7d-3bb55071224e
23	3	$2b$10$s6FBoaiQIKwhGStQAvUWQOtAcXF.kdAZeGssrvSeqWZntT8L/naiW	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:41:40.398	2026-05-28 07:41:40.398	2026-06-04 07:41:40.398	3b0067c6-e4c3-4bcc-86f3-8a764cfed711
24	3	$2b$10$mqEu3tgWcyFdXN1nNknkI./UC3LVWz.2UhJrlMhN7tKzUF.NR0d.G	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:41:55.567	2026-05-28 07:41:55.567	2026-06-04 07:41:55.556	428fd347-45dc-4084-9dcf-6d9e82f692da
25	3	$2b$10$MiukMkjB8JHupb0CPbOaBugaZ2mtirfTAHiTY280CwsIg2yD/vJ5a	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:41:55.79	2026-05-28 07:41:55.79	2026-06-04 07:41:55.789	80c1e1be-ecfd-44ed-b7c2-7b5aff865f44
26	3	$2b$10$pK5Q12ZRYLAbKdkAvr6t.uiSGJETHJsA8EHMxPY89Zq4zAVA7xEOS	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:41:55.913	2026-05-28 07:41:55.913	2026-06-04 07:41:55.913	271a2613-fec2-485a-ae08-ef0281a947e2
27	3	$2b$10$AZrhktuW7/VQFypT6n45/O0kDpCEXI6jEllzm28fR7m6/mezUUW5i	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:43:02.395	2026-05-28 07:43:02.395	2026-06-04 07:43:02.39	533c3572-b5a9-484b-a5e2-faa240e4cc91
28	3	$2b$10$QlvFzTNveHeQ18UMHkscyuNGrcY5ruoXTnpbPwz80WFjmwiucON8e	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 07:43:02.588	2026-05-28 07:43:02.588	2026-06-04 07:43:02.588	3e23d15e-8a36-44c5-987a-82c7bc8be415
34	3	$2b$10$mGaCRub5lJPpGFGZkb7Tn.x4t8V8jd01uy80DqlunIl4Dk8TC4TuG	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 08:00:04.312	2026-05-28 08:00:04.312	2026-06-04 08:00:04.302	61d723db-832e-413b-a5cc-935c3dd953f6
35	3	$2b$10$dwN1z047KRS37PABQjrnpO1i9Yah0U2sFEO7tImYa6P2UpFAXgs9G	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 08:00:04.905	2026-05-28 08:00:04.905	2026-06-04 08:00:04.905	5d242c66-5a50-40d8-a74e-006e47c00dd5
36	3	$2b$10$0U9Y3GJIUBGDgXrJKHu9GewszWxBHgZZiJFIwi7PntRcUnC0wW5wO	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 08:00:05.12	2026-05-28 08:00:05.12	2026-06-04 08:00:05.119	ed2d462e-a272-4d24-bc65-7b20a4689f03
37	3	$2b$10$ef8kgIJsJAhk1ZPCv2EMruhiIhfzHTkj2s2BXPclqLKuCGT6QDdyW	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 08:00:05.404	2026-05-28 08:00:05.404	2026-06-04 08:00:05.404	1dd4a89d-eeb6-4545-a344-1830d6ef67b1
38	3	$2b$10$rHclAX/5KrU3bCXViwvAFu0Ok5zZRUUkyOlfqNTcrYzVshMVm3dBq	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 08:00:05.59	2026-05-28 08:00:05.59	2026-06-04 08:00:05.589	95e6c6ab-a859-45b5-8191-e1568198a641
39	3	$2b$10$9yHc/mNoUCEBzQpt/o9d9.HJNhnzkOF/ys.Lg0Sz7DaH8mGZ97c3G	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 08:00:05.892	2026-05-28 08:00:05.892	2026-06-04 08:00:05.892	c4f1f72b-dc9f-4891-9c81-5d19ff2357f8
40	3	$2b$10$WqcjecDhVVys3Qkp7SH98ezOYwphEAeZEz1O5njvl0jZOCwzxE3su	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 08:03:40.516	2026-05-28 08:03:40.516	2026-06-04 08:03:40.51	a17d8338-8b21-4f73-960c-346bc34ba43d
210	3	$2b$10$rXOHZhArDPHXloS9EdVGLeJsmvFMyJZmTOf2LbQ3rfiNkdqMvMXQm	unknown	::ffff:127.0.0.1	unknown	t	2026-06-04 09:04:58.427	2026-06-04 09:04:58.427	2026-06-11 09:04:58.427	dd84dcbc-bcd0-410c-8e7b-7d403e402c75
42	3	$2b$10$cV/ssAuZVzIGqalzO65ct.8qZE/cKAmGVxVjY1G7/iPcQtq69zNRW	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 08:03:40.88	2026-05-28 08:03:40.88	2026-06-04 08:03:40.879	ef493b69-98e5-4dac-ad18-90daa77edc7b
43	3	$2b$10$LMpCzhwqNZLlv9JyVPy0Q.QUdvWelA6q6j/s1shi4kw/MGec.S6Z6	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 08:03:41	2026-05-28 08:03:41	2026-06-04 08:03:40.999	f436892d-2716-4dc9-ab58-3816549de723
44	3	$2b$10$6SVsFveu9TeY0E1MFuVxNuq7sw8GKk/qiqvJpxW4EziY3qdHw/0XG	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 08:03:41.117	2026-05-28 08:03:41.117	2026-06-04 08:03:41.116	b301e8a5-7ac8-47c2-867b-323b292a44c0
45	3	$2b$10$fJCyMFov2931HrfOxmTzP.0gbkugxS.GzL3C20qs19cnLPC7PQXLO	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 08:03:41.232	2026-05-28 08:03:41.232	2026-06-04 08:03:41.232	2c79ed3f-c29d-4b55-9b5d-5704ebdcbc44
46	3	$2b$10$XfJ59GvUphzrG.7DNzL/IORzRUEHcYsOo/O0NrhL1iphuYRpljhX2	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-28 08:17:47.659	2026-05-28 08:14:51.113	2026-06-04 08:14:51.103	4f1d282e-0ae7-4739-8feb-3bc189a9b784
47	3	$2b$10$fk9AeAj8FBLLDLch4lxEx.Z4owd36osdnkt.KTpDmxrhIJ7eO7KNG	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 08:28:59.155	2026-05-28 08:28:59.155	2026-06-04 08:28:59.149	8b1c80dc-021d-40d2-a3ff-63d6c8c360c9
48	3	$2b$10$GZNs/C82Ye4np0GdjzZUWuJcr/HkM0JUZJtfibw2IEgbgh/9DwPqW	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 08:28:59.407	2026-05-28 08:28:59.407	2026-06-04 08:28:59.406	2653c371-2ceb-4219-994a-017e8694062a
49	3	$2b$10$Q.u8SScbOnTlnfwF9peOKujqrifxeMcfuPndTKLPV2Ixu9lZVlfqe	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 08:30:54.129	2026-05-28 08:30:54.129	2026-06-04 08:30:54.123	f2e1c0a8-e95b-45ef-a9c8-5f8063280c97
50	3	$2b$10$fuldrqa6.tILssi78rQ.ourQdEXoZNaeVohCvxGLltyJLPvYWqdLe	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 08:30:54.413	2026-05-28 08:30:54.413	2026-06-04 08:30:54.412	dd1b172a-fa1a-4e26-b8c4-861fb77cae8d
51	3	$2b$10$TRbkjA2oPPOTgDH8lNLAPuMJOFJlq1J67htmOZCBZRp3almXDm0CO	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-28 09:14:04.464	2026-05-28 09:14:04.464	2026-06-04 09:14:04.453	ca73ebae-6085-418e-abb9-d527d363d65a
72	3	$2b$10$urB6hL1zVg6TUE5IHhwUxeSffve..d4ydwXdDQKaMxmlnCI.h2nSC	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 11:25:01.9	2026-05-28 11:25:01.9	2026-06-04 11:25:01.899	52c53cd0-7116-42bc-b5ef-5bab402a72e3
52	3	$2b$10$y0ljKmusSgF9xf7nZdWFN..6R7Sk0P5QAMhhIjB5MH0MFnMtRaHQe	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-28 09:17:12.968	2026-05-28 09:14:48.887	2026-06-04 09:14:48.886	c296ef88-fd18-4604-8871-15910d1aabc4
53	3	$2b$10$lTzpIQz/..RlwQaYH.QdEeHDf32XGTSF6YpwD1pxAyXa.HtUHs3be	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 09:28:56.678	2026-05-28 09:28:56.678	2026-06-04 09:28:56.671	6f0c8b4e-5b6e-49a8-bb7c-32d48418296a
54	3	$2b$10$CYUhTiizL4awSdy9dcNwgOIVuey0xwxy65TAyLjvCUBXh1sxUAEei	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 09:28:57.056	2026-05-28 09:28:57.056	2026-06-04 09:28:57.055	7492dcab-b35e-4406-9d5e-be7a95f37ed8
55	3	$2b$10$nmcOUAT3R53d/zEl3fjDJu0YWK9XljHqubH344o26Yt93vZYbmb.G	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 09:28:57.374	2026-05-28 09:28:57.374	2026-06-04 09:28:57.373	59a21214-62a9-48e7-87e1-8a1660ee8ef5
73	3	$2b$10$jkXGeZF1uK4nPrbFNis1Ye5vqysyUO7E9fE1VKYj28sOxzJ3kdlpy	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 11:25:02.023	2026-05-28 11:25:02.023	2026-06-04 11:25:02.022	38c0c76c-e44b-49c3-b36b-c506ba30b740
74	3	$2b$10$IfuZWnSOehNiMiUN130iheoDpaWoRXxYxY189.4FiClZSoj3nh.dm	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 11:25:02.137	2026-05-28 11:25:02.137	2026-06-04 11:25:02.137	c8d136c2-f049-408e-a042-3d85b760f000
56	3	$2b$10$nS18Y3D4Jf6LhFI0qk79JeJbIAJDSefo6nJeec6e99IBO3kO1IEF6	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-28 10:01:32.458	2026-05-28 09:52:19.978	2026-06-04 09:52:19.965	8bf61028-a705-49d2-8826-d6257750a01e
57	3	$2b$10$I9KMRFeFeNfQZkVu/2pZyezWGO4IE/jCM5ejJDSzdwYr4dzz0WKu2	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 10:03:43.221	2026-05-28 10:03:43.221	2026-06-04 10:03:43.213	5439b4a0-e9cd-41c0-ad64-e317d0569732
58	3	$2b$10$ipHzsYFVw7SQqWom6/qvIe0PO3RHKK1eVOKhmKDxCHfz2kXZIvk2C	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 10:03:43.588	2026-05-28 10:03:43.588	2026-06-04 10:03:43.587	ca113d04-d924-4147-a041-b92e669b66d3
59	3	$2b$10$feOIfFVO2Bbqguq.J9QLHu0.BKILhLIPfg84I/jLhzqMxg6BbscAi	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 10:03:43.712	2026-05-28 10:03:43.712	2026-06-04 10:03:43.711	cfeaffc8-4f7a-4b97-ab67-0c2aa36957a1
60	3	$2b$10$QP/h8BOq.zJcL95piv4dyuBJVgdbY3FOQdEoMyI6MblxXbrJYo4Wu	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-28 10:50:44.05	2026-05-28 10:50:44.05	2026-06-04 10:50:44.037	a4a4356c-37de-41ea-a8b9-7645610d31d4
61	3	$2b$10$mu1w9cemVAZVfOrnRTEjkeXrvsXeBJ6kSsmIqvW68yFPPVaX6PE/C	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 11:23:00.109	2026-05-28 11:23:00.109	2026-06-04 11:23:00.102	1dc58de8-2d09-4666-8fec-b18bfa14242a
62	3	$2b$10$1o2uxCLD9e.p.ZhZrTnfO.LXVpBfmGtQvv2oP7j5r.UM62uPrsj3q	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 11:23:00.424	2026-05-28 11:23:00.424	2026-06-04 11:23:00.423	998c720b-b788-4056-9281-529c270b3661
63	3	$2b$10$FsDYgdvHVN5HH9DqaBA4.OUns0BwnzxCp1NYB30hm06PD9gL9/x5O	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 11:23:00.602	2026-05-28 11:23:00.602	2026-06-04 11:23:00.601	da3e4657-880c-4870-9e4c-12f905f10652
64	3	$2b$10$RTCrlTlmrFK8hPmVaXIVe.hQO4b26jqoHkE9CTMzmccmnE8P9H98q	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 11:23:00.754	2026-05-28 11:23:00.754	2026-06-04 11:23:00.754	f71aa4c0-0302-4a0e-94fe-584b67073c2d
65	3	$2b$10$YqQ3U6Pxg4VFaBlhOooPGuJTdBhsHRkacKYl17eOx294hrYtdxiIq	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 11:23:00.885	2026-05-28 11:23:00.885	2026-06-04 11:23:00.885	ea2f3d01-e6ad-4c96-bf79-77f81ea56800
66	3	$2b$10$/exrIm3wDzkoqr4ULwNbkeWypYgzLzflNAHbyECZ6gvDK.z8wk5PS	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 11:23:01.038	2026-05-28 11:23:01.038	2026-06-04 11:23:01.038	5d944fed-d2aa-4a44-a8b4-84ab701fef8f
67	3	$2b$10$4AGgIjrEhz2kr/ylCmrApeJgWv/KWYWtvgKufQfHXMIeoHvBUAmIC	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 11:23:01.351	2026-05-28 11:23:01.351	2026-06-04 11:23:01.35	0909abeb-4014-467b-a9a4-2fbc5e63aadf
69	3	$2b$10$3aygHrFFgm9lPNiTgHj3Du0UTYyioRF1eVxSrV7IDD02TRepD9Z9a	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 11:25:01.393	2026-05-28 11:25:01.393	2026-06-04 11:25:01.384	57720521-dfdd-4a84-bc8f-c321b7017239
70	3	$2b$10$Ygp3zbLCu06r.f5GQKbLwus7aUfoyVLkdrbkFK1kb7qYlXrjWEjO2	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 11:25:01.633	2026-05-28 11:25:01.633	2026-06-04 11:25:01.632	4ba042df-7199-46eb-a340-d9fe6f4e628d
71	3	$2b$10$gip6NrCLOUmXT7aVN0U6y.Nx.PLpJ7OBn7MD7gT2AzOQwsALXt5q.	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 11:25:01.765	2026-05-28 11:25:01.765	2026-06-04 11:25:01.765	1bbc1aa9-3ccb-4e8f-ae48-ec11fa6007eb
75	3	$2b$10$lW2/mcucxHkFNt3NzxUUWeFqIzokC0whRHtZ5WS388Q0.wTHniZQ2	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 11:25:02.411	2026-05-28 11:25:02.411	2026-06-04 11:25:02.411	9ca2475b-3bab-4543-a2ef-df293f7b0894
68	3	$2b$10$6mwCkOrTLP0xHz6oce5yveanMQXylozk5AK/arle5Ts6R1xT3hHGO	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-28 11:32:12.661	2026-05-28 11:23:59.596	2026-06-04 11:23:59.587	d4c9bdfb-af5a-4da3-ac4f-664087fb08f2
77	3	$2b$10$dlY.gTgtUP6.x7g61ToqpOonzNfOGA7CRgF2nh8M9KJ.IGnh2NI56	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 11:36:01.221	2026-05-28 11:36:01.221	2026-06-04 11:36:01.22	bad2608b-603d-45df-9f65-282166d78302
76	3	$2b$10$IqYE41L25FlVH6ibeGWOpOleGoarYzCJTo6iZ9BQVKZqsGOKt4xNq	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 11:36:00.984	2026-05-28 11:36:00.984	2026-06-04 11:36:00.977	2cf8aa9e-4b27-4a83-9c60-5639a7472388
78	3	$2b$10$GZHSBaDVk/udjLMQFWtaVevS0sbTajwOrciBQyDT/TW8MhMfeWoDK	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-29 06:18:30.364	2026-05-29 06:15:21.898	2026-06-05 06:15:21.87	562bff18-bb63-4d9b-a169-ef90d47f69c6
79	3	$2b$10$3RRDxYZ8.r.yLpu1.dF3guvPIcHo2AtzfiTMJpE79mepO1DUW5lju	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-29 06:40:08.465	2026-05-29 06:38:13.896	2026-06-05 06:38:13.881	847de57a-34ef-4b78-8fc6-e67f80edbeac
81	3	$2b$10$nVIwPNGhe3kNLWoVD8ZFcOOWDsRX/VePw3QepWL7mRXbULit48dKW	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-29 07:57:35.494	2026-05-29 07:54:08.669	2026-06-05 07:54:08.656	633a81b8-741b-44ce-9f93-22f401c3faf1
83	3	$2b$10$27x59q02vIuy6qeEHwTehOEII2JGXeVSKGkflFVOe0QEjO/6lI2rC	unknown	::ffff:127.0.0.1	unknown	f	2026-05-29 08:21:56.299	2026-05-29 08:21:56.299	2026-06-05 08:21:56.293	0fe47e27-3789-46a1-b43b-7ed7672ae889
84	3	$2b$10$HgRAOGCq42Oney5mmV4WqObyzpHKb7cO/oIg4y3okcVwrbvHgVBWm	unknown	::ffff:127.0.0.1	unknown	f	2026-05-29 08:21:56.47	2026-05-29 08:21:56.47	2026-06-05 08:21:56.47	8997fbe7-2038-4695-af91-1b5bbd8cb16f
85	3	$2b$10$c711Xua8s7ZYJNL4Oj3smupF6hOW6z3e.TKo6P3k8rE8cddVOvIrW	unknown	::ffff:127.0.0.1	unknown	f	2026-05-29 08:21:56.588	2026-05-29 08:21:56.588	2026-06-05 08:21:56.587	c623c8ef-5798-41cf-af55-697d068057d5
86	3	$2b$10$g8idxWHfe8O9rAAj/SMDw.Jiyaocd.6.NREHmi0Tv2IKAM2FeMDWe	unknown	::ffff:127.0.0.1	unknown	f	2026-05-29 08:21:56.704	2026-05-29 08:21:56.704	2026-06-05 08:21:56.703	471ad0b2-2452-4f87-8394-b8ce9d8044ea
87	3	$2b$10$nqX7wCSvoZ0wi1A2xFzTVOdCTsyyNrqcbKZAl9gBp3yy/MWCM61Cq	unknown	::ffff:127.0.0.1	unknown	f	2026-05-29 08:21:56.822	2026-05-29 08:21:56.822	2026-06-05 08:21:56.821	b0bd5df1-5312-4418-ba0b-8bad8861d718
88	3	$2b$10$Q1cxoXSYXNIW6ds/YDWzMeoOCMj3PMmtDrSET4cYbLTPXOXXF1Pc.	unknown	::ffff:127.0.0.1	unknown	f	2026-05-29 08:21:56.945	2026-05-29 08:21:56.945	2026-06-05 08:21:56.944	660a19fc-691d-471e-8cfe-55782323f646
82	3	$2b$10$9IU9YXYjfCYtd1TSQ7K5fuffll5ZVdFcDLOG.c9t359L3Bt.Z4vHe	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-29 08:23:54.272	2026-05-29 08:13:10.676	2026-06-05 08:13:10.649	bfebe672-334e-4164-a68d-b746e8807dd3
89	3	$2b$10$GOjvCRUtui7QJ.HHGw9ne.xDaVy7HSJg45VjPGy9odiYHTflXEyDy	unknown	::ffff:127.0.0.1	unknown	f	2026-05-29 08:26:53.417	2026-05-29 08:26:53.417	2026-06-05 08:26:53.412	b8353921-ccb6-4900-9244-46031f4a25d3
90	3	$2b$10$XK4qFxnkFB8PvirXV7WXaesKzkzhcCxlFftiDu4456whcqQE2FmwO	unknown	::ffff:127.0.0.1	unknown	f	2026-05-29 08:26:57.944	2026-05-29 08:26:57.944	2026-06-05 08:26:57.944	a84398ea-e18e-410c-8767-7de2f6ac07cb
91	3	$2b$10$vBoDVrNQglMYG8bLeeGsIeXeQOmVgs27.Lq0.CKkIXN762/IBDfGm	unknown	::ffff:127.0.0.1	unknown	f	2026-05-29 08:26:58.07	2026-05-29 08:26:58.07	2026-06-05 08:26:58.07	b25d1163-3164-41c9-b47b-bdc1acc0a1eb
92	3	$2b$10$wTZG7wsQXC/JRM8p6P.yH.55Xme50V16GnTgvAwrYX5.UNEfn/vry	unknown	::ffff:127.0.0.1	unknown	f	2026-05-29 08:26:58.198	2026-05-29 08:26:58.198	2026-06-05 08:26:58.198	6557c747-73f4-43cb-bfee-8d152321b556
93	3	$2b$10$JE0DgobEoMOKV.iGioC7l.aqhxPmalwFXdIrurxioJuBxsKts6u8.	unknown	::ffff:127.0.0.1	unknown	f	2026-05-29 08:26:58.338	2026-05-29 08:26:58.338	2026-06-05 08:26:58.338	d0dea778-826f-4fea-b2d4-97f085b553c9
94	3	$2b$10$pJkd7UhMtgMveirV5CsKseFkfCjhrCax.c1BB3yxekGQUBv8ep9SO	unknown	::ffff:127.0.0.1	unknown	f	2026-05-29 08:26:58.469	2026-05-29 08:26:58.469	2026-06-05 08:26:58.469	0226dd52-9edc-4b7c-921d-54496768e9b7
95	3	$2b$10$mH.ZV9zrpdcJtZwr.7j2keykKu8w9N/fKwnNf0OBU5to8UnSdZNDC	unknown	::ffff:127.0.0.1	unknown	f	2026-05-29 08:28:24.65	2026-05-29 08:28:24.65	2026-06-05 08:28:24.644	68b25de5-a3be-4480-8da7-5114d6172f9e
96	3	$2b$10$cOIcbtnJnEcGzSo5lQw3W.5wI9Qfrc.cSOjD5etI7r1NLwTzQQiGa	unknown	::ffff:127.0.0.1	unknown	f	2026-05-29 08:28:29.471	2026-05-29 08:28:29.471	2026-06-05 08:28:29.471	943c0071-12f0-4c27-a253-ffd9d7503eb8
97	3	$2b$10$sk1gFz.Ds21C7oTLMb7XZu8A2fKtiyvKTQtVRjsLa9CsJhNq9cPxO	unknown	::ffff:127.0.0.1	unknown	f	2026-05-29 08:28:29.605	2026-05-29 08:28:29.605	2026-06-05 08:28:29.605	4bf44a3d-7c8d-4945-934f-0c1a4d1501ed
98	3	$2b$10$Sn6N.D3LxZn4Utwvs9Edwe1aAdlqzorZVqF8ybRi4KKJNYQkIcDtK	unknown	::ffff:127.0.0.1	unknown	f	2026-05-29 08:28:29.727	2026-05-29 08:28:29.727	2026-06-05 08:28:29.727	c12c88b3-caa4-4bad-824d-2a72eda007f7
99	3	$2b$10$GhnvQb/U9iy5EbkFZ1EIPu3qQbtciHRpfqNjpjMmlKYZ5qkvrozZG	unknown	::ffff:127.0.0.1	unknown	f	2026-05-29 08:28:29.866	2026-05-29 08:28:29.866	2026-06-05 08:28:29.865	73179199-7db8-4428-b7df-08f9d17b82b8
100	3	$2b$10$IdHNC/Or/3lP9PMhACu1Tu3FYp0O8kgaskLXtC1f51mCXCFNki1LS	unknown	::ffff:127.0.0.1	unknown	f	2026-05-29 08:28:29.992	2026-05-29 08:28:29.992	2026-06-05 08:28:29.991	09fcdde6-1e1b-4d3e-a36c-83f6497d0ab2
101	3	$2b$10$1RCCEdJUeJFxcAorutaDCOT8Wix6FN.2QLu3FH6Tj.eQk.r82bATK	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-29 08:39:42.807	2026-05-29 08:30:01.533	2026-06-05 08:30:01.532	519dd5d8-017c-4c74-9fa9-09a227a81c24
102	3	$2b$10$TDkTA0vLpaMBH17pb6pAUuE8Gn1dexmQtZDGJpRFgnLf31SbQftr2	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-29 09:00:58.312	2026-05-29 08:47:12.378	2026-06-05 08:47:12.363	9091a1e3-4180-4c7b-9e2b-96c8852923b6
103	3	$2b$10$XCzoM08VXXfWGTi4uYGfRujMyavyLtlm8J60G3gy6QsfRC6vxJ6Ve	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-29 09:19:07.493	2026-05-29 09:11:57.62	2026-06-05 09:11:57.61	3062eeb8-c133-48c3-a837-ec64c20d2f56
107	3	$2b$10$X9NjabTfMzVOwMJ3vEdZQuVRZYIA20vHp88Zyg/TaYyVrNWAAVbZy	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	f	2026-06-01 05:07:29.894	2026-06-01 05:07:29.894	2026-06-08 05:07:29.879	350d4bdc-65dd-49a3-b4b4-62b679b04467
108	3	$2b$10$0jzTEahmCWhQ8www3xsxSuaG6Vnm7Dh7qJkPO4zocEeDw5QQi.XWu	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	f	2026-06-01 09:17:12.501	2026-06-01 09:17:12.501	2026-06-08 09:17:12.492	bcf9a0fb-10f9-48ee-a142-52c0907e8286
145	3	$2b$10$EUFSQmbLjSOOTzR32mKFg.xSWoMsDvf1iIkx55TSO.W86IH/Z7jIm	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-03 05:51:29.642	2026-06-03 05:51:29.642	2026-06-10 05:51:29.621	6465727f-9823-4766-b834-0fe63f245dfe
146	3	$2b$10$wH35mwaLVedO6MjFn3kd6OcZMWOyUaK8.WuRQAR7sVi6PAWh2Kaye	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-03 06:02:28.283	2026-06-03 06:00:48.097	2026-06-10 06:00:48.077	7142c353-5057-4ba9-bd57-96799ca1ec74
144	3	$2b$10$JbzG0Dr.uzXxQEZ6mx/t2ucXaiNYvPZj31rqvtBKrTf7c4owJ5PyO	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-03 05:31:07.427	2026-06-03 05:18:11.87	2026-06-10 05:18:11.866	2d55df9c-5760-40f4-9b35-89076edac16b
147	3	$2b$10$bC.xqia00J30M2DD2bcOLua.gafP6XoZc.3bwzcrr.PicSxZP7EWi	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-03 08:14:21.984	2026-06-03 08:07:40.428	2026-06-10 08:07:40.416	30e9bda2-46a6-4ba6-b8ed-e9e4c8dcb519
148	3	$2b$10$J1ofLhdFeK5t5S.xZpZrNOyMsy.NnLY2OsR5bh4pVlN09hot3hXOu	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-03 08:22:51.116	2026-06-03 08:22:51.116	2026-06-10 08:22:51.079	167d9d5c-b238-455f-a625-1ad7128c8a49
149	3	$2b$10$dvWVoZsPB1jvJirVrsavYeriN6VhABRHwA9mfxCtArIemlfRLwGp2	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 08:33:08.377	2026-06-03 08:33:08.377	2026-06-10 08:33:08.372	74e1d3a5-2fe2-4734-b597-b4adf9032c75
150	3	$2b$10$UUamKL026iTlHN8R86u08OkZxcc/B1JiG/e9lKJTfA3IU5CqarkMG	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 08:33:08.6	2026-06-03 08:33:08.6	2026-06-10 08:33:08.6	24fd02a3-5791-40a5-b8b0-17a575cad912
109	3	$2b$10$3p1.fji8V2u4kz4tzrSuYudlBY.pixEp76Sw18q4fgTvaA.4uwtr6	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	f	2026-06-01 09:23:26.572	2026-06-01 09:23:26.572	2026-06-08 09:23:26.57	caf9d7ee-c170-4f46-a590-9d24cca05f8f
110	3	$2b$10$Ynz8uH4Bcsx4GG5SHF0MB.HBqa58k57RR1hr3nwYGah5V33Y7id2S	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	f	2026-06-01 10:00:16.701	2026-06-01 10:00:16.701	2026-06-08 10:00:16.676	d4bb69f1-fcd5-435d-8733-444a50c3ac8a
111	3	$2b$10$Mxifw5R.xnIfHDzmKHiz1ep2vND.7TL/m2kZQ5ewdpuh/W.2wA04C	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	f	2026-06-01 10:20:51.638	2026-06-01 10:18:27.202	2026-06-08 10:18:27.181	b4b92f1d-ed34-4a88-853d-cb424c3eeb92
112	3	$2b$10$j3cVpBjqI1FVxutwpv7PnuoMF.x500mRsjktAxCDcEhP9Lq8U.EkS	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	f	2026-06-01 10:25:46.39	2026-06-01 10:21:50.562	2026-06-08 10:21:50.542	6e75e5d9-6de4-4330-84fa-6604c5193fce
113	3	$2b$10$Uq1Ht.DY3jyfPiQxZal4Gu7YTZnqc3KHZ9yt4tB3cEhPJSNdTvyDG	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	f	2026-06-01 10:33:05.309	2026-06-01 10:27:47.199	2026-06-08 10:27:47.177	d75de436-545a-44c7-840f-426fc234e38b
114	3	$2b$10$oK7U6dfz1GIFxk8kcXNGPuOxaqgxBO.juWUuFix5irYF/PwyKdHGO	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	f	2026-06-01 10:40:29.908	2026-06-01 10:40:29.908	2026-06-08 10:40:29.886	7bcaf398-cc30-4189-95ae-6792a7e28dc7
115	3	$2b$10$R4Tik60wVw44rzKHOT0kwurKbVLnvczaCLE8MvvVlugEM1R3fQ.VK	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWeb	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36 Edg/148.0.0.0	f	2026-06-02 04:24:17.762	2026-06-02 04:24:17.762	2026-06-09 04:24:17.75	2af87d10-e790-4195-ab26-ade1ba3fa741
116	3	$2b$10$gdlpDSVz37lyX3MNJEUpHulQZ2k1pDY6qOxH4DcN166fy/MSnljsG	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-02 04:26:53.613	2026-06-02 04:25:44.07	2026-06-09 04:25:44.066	46608336-44cb-417a-a811-f7492a95f3ff
117	3	$2b$10$yt7kYy6VTwgUY5YGnyXWYugvV5L8tbHfxEB/RbhUIZG0ak8xiTlgS	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-02 04:41:44.721	2026-06-02 04:41:44.721	2026-06-09 04:41:44.718	99825c43-4d95-40d4-ab09-77af0562f89d
131	3	$2b$10$I/kHDuyqoTm6weN5oMsfG.gvHEtd6lNlAhf7gPUPrixcP4/zgHXcG	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-03 04:34:53.988	2026-06-03 04:33:10.205	2026-06-10 04:33:10.202	de54ee9d-9b00-4ac5-8cbd-9df889280bb0
118	3	$2b$10$qBczy2HRw3x6wrYUJzvLgOuUcssqwOHeT3JqietxVKzg/kFCxpwzy	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-02 06:48:20.269	2026-06-02 06:41:38.885	2026-06-09 06:41:38.866	a44a14fe-805a-4b3d-877d-0d7c11784bc7
126	3	$2b$10$HuL/PwsXbyGBv9LRiJVPJeYcaYxHB4hsK0JNoGE/ZqzsLvGDtkpXC	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-02 10:20:24.497	2026-06-02 10:07:52.595	2026-06-09 10:07:52.571	c17cf1e2-8ce3-42bb-957b-7b9646a98a24
119	3	$2b$10$JQEZWh5DmfSYG/HHiM3N1.m4EypyBsKDrXchlWFGl1YwzHykRrFGa	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-02 07:00:58.939	2026-06-02 06:58:30.749	2026-06-09 06:58:30.733	6bad837c-33b6-4389-8950-983fcb6186e1
121	3	$2b$10$Rs/n1qKixpKnOJMGTdSQcelZL1ChF6J1gxnFqIi4k6CkIUYO.IEoS	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-02 08:00:45.049	2026-06-02 07:50:38.806	2026-06-09 07:50:38.787	77f6a114-13af-4421-90db-37f50300991e
127	3	$2b$10$xvp3.g1aQagW9ZrrEr/x4O6k1QU3OtsRtEll3K591S3RJ8jn3izGS	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-02 10:26:55.341	2026-06-02 10:16:42.172	2026-06-09 10:16:42.154	af9e4658-3181-43d9-8cbc-58b18fcda9fa
122	3	$2b$10$guohQNGqAfdZYxWIxewwEu1HW0A.h81guqUxMi1eFqmGedeo9gW5e	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-02 08:22:36.655	2026-06-02 08:07:45.333	2026-06-09 08:07:45.304	42a1cb98-93d7-4d1f-b883-16e1c6e5756e
120	3	$2b$10$CBbl57V4ik0bshVVLF28FuPsxVW/4Ci1MnUj7yqoLYSVlu2aAow5y	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-02 07:43:47.64	2026-06-02 07:33:34.669	2026-06-09 07:33:34.647	a01e0b20-c4d0-4783-84bb-4bf30f4d463c
123	3	$2b$10$jdBcr2trGaYshG3g/E3qguVn0PXwzWLLg8i6wuZYNVLyPoBJJxK.C	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-02 08:28:20.681	2026-06-02 08:22:53.308	2026-06-09 08:22:53.297	3ddfe072-cfb1-40cf-a426-658c13111238
124	3	$2b$10$k7G.L1rPZVzB12DYMnQQSe7uwuGJLdKwR7pit40ZJKEl5hOYGQ9Sa	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-02 08:38:57.703	2026-06-02 08:37:50.442	2026-06-09 08:37:50.428	ff4542ed-b42e-4146-91f3-b8c7d8666bc3
128	3	$2b$10$fYKBZZlvAswJm1PhkCSP6uJMtdUSJJv6YVsueLSdotYHRwlPYshwu	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-02 10:31:45.829	2026-06-02 10:25:13.632	2026-06-09 10:25:13.601	2dbbd959-f1ec-47fc-9541-261204068719
125	3	$2b$10$VjTKwJqZbUmiIiLj/VudEuyB6AMPr8hOlD9Z.0kCujVrcsycpZZWe	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-02 09:36:29.552	2026-06-02 09:29:11.723	2026-06-09 09:29:11.699	ca11b5da-21e8-4e69-9660-8b91afac8446
134	3	$2b$10$qGCWT/OwGFeyYphcPiscMOmGS6/8MZBXcOtCvCOVq8LeUFLE4165C	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-03 05:03:24.852	2026-06-03 05:03:24.852	2026-06-10 05:03:24.851	a9edfb1b-ef7d-4b0e-95ec-f78ae77c6a3f
130	3	$2b$10$RHs6rviqr9oi.66NIrIhSODhUxjaOfqFpMPhNvPFyT9E5Xc26eOci	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-03 04:29:41.009	2026-06-03 04:29:41.009	2026-06-10 04:29:41.007	c73c184d-12f0-43b6-9b71-638a127b2b58
129	3	$2b$10$dM.77Rxgjq.5QXf3RogK7.8aidZt1hKwJEnxHc4uljeHGLaxmsMfK	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-03 04:32:59.125	2026-06-03 04:28:17.845	2026-06-10 04:28:17.82	f9f5d730-189f-48d6-b3f8-17129ae7bd29
133	3	$2b$10$iuuWd2TEoV5lZz/YbX68oOAAs/jRGlQZJyZO.5OSks3dzVE1IbOLa	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-03 05:03:41.637	2026-06-03 04:50:00.058	2026-06-10 04:50:00.038	0cebd045-da4a-4e9a-94cb-0b3b610ed155
151	3	$2b$10$DXTBwNNbDnbg3Jxut7VCqu4.fFFNebC1UThzZk6L2Z.txazbg.qjy	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 08:33:08.719	2026-06-03 08:33:08.719	2026-06-10 08:33:08.719	9fa8ff2e-d9a4-4db6-9e17-0b0c58088b75
152	3	$2b$10$T2m.bHrTymjjRm1/3nW9D.fY9vk3DcUxeqQB0SRpjQVNX4.OgtA7.	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 08:33:08.837	2026-06-03 08:33:08.837	2026-06-10 08:33:08.837	172ea8b4-e729-4c7c-99c3-c99cc9bf7c83
153	3	$2b$10$X6NQg3URuEmbB2mcynJLPOI/N0A7eEmkvt6JMC/exXRBFEgHtA2Ga	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 08:33:08.968	2026-06-03 08:33:08.968	2026-06-10 08:33:08.967	bb26a813-2109-4218-988a-1076eff3d540
154	3	$2b$10$JhfcULEJwmYQlwJjlHrEC.Tekx1D9Vx6LbuGxLjq9Ri5kyfNJFXjW	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 08:35:48.89	2026-06-03 08:35:48.89	2026-06-10 08:35:48.883	39e711ea-a32e-4b0a-8fa7-57849308e1f6
155	3	$2b$10$LiF5P9r3HGAaoG5rx8ltMelpbgbT/p7YApreiDWPGa9eAbdnRfEpW	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 08:35:49.263	2026-06-03 08:35:49.263	2026-06-10 08:35:49.263	f9d735ef-dfac-41af-bb91-692eba8d0ed3
156	3	$2b$10$s/1GiH/gl3aZfAqeZW6acOgeiZjNRRTauh7F3cjbqQ9k0J.qF1Lju	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 08:35:49.392	2026-06-03 08:35:49.392	2026-06-10 08:35:49.392	e409cd61-8456-44f7-8a01-9968cd5540a1
157	3	$2b$10$FM36Fm51HfG.KTnC.R/sROGmZ4DB6L/xLsqvj4wWBZJ0QXE/dkTAu	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 08:35:49.546	2026-06-03 08:35:49.546	2026-06-10 08:35:49.546	c5200386-0461-4247-85d1-d358cc790994
158	3	$2b$10$IoT22Q84Bzy1YzceXPSaWOdLwFyIwen9UjbxGGrV8vRpIUvspEcmq	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 08:35:49.689	2026-06-03 08:35:49.689	2026-06-10 08:35:49.689	2aeff585-ab78-4226-a76a-3306beb5ff1e
159	3	$2b$10$z7exG0IjCRcSixs/Io99aeQzjC46JSv4IoQPt2k11633Hc3iJwmOS	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 08:36:33.855	2026-06-03 08:36:33.855	2026-06-10 08:36:33.824	cbbcb9d4-edb9-4be6-9962-397b73ca71cb
160	3	$2b$10$4ddmXsUaZsbJsvpgWzkUWu7HkNL4qIleZDTY17quY/XVmdbx3tqlu	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 08:36:34.672	2026-06-03 08:36:34.672	2026-06-10 08:36:34.67	fb46ab49-2b30-47e1-b9a4-0b3547768011
161	3	$2b$10$urOhBFTKEQ0GJ6YCr/aWMulQ9vyLP0ULLya3RQYQ0EId8JPoIiW/a	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 08:36:34.959	2026-06-03 08:36:34.959	2026-06-10 08:36:34.958	4663f1cb-15e8-4656-84c7-17d649d7d2cc
162	3	$2b$10$ojJl1E8lLJwXzs9S1TP97.hcWnyB8h3tl2kBbXui/RaVZH52QkA46	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 08:36:35.28	2026-06-03 08:36:35.28	2026-06-10 08:36:35.279	a80aef2a-8d60-4740-be53-c63e82b999fb
163	3	$2b$10$JVtBNLEDsWqqS5wLFn3/6Oeq.jVbd/at0SYh8Q00jXh21yW3cQV3.	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 08:36:35.665	2026-06-03 08:36:35.665	2026-06-10 08:36:35.664	4a05a9fd-5f82-4988-b17f-2e0333bfbe39
164	3	$2b$10$RBdfF0Y8ZsLlsngR21.FF.1JV6/LZNGw7nrcTjVHgRDzxeFx7SgP.	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 08:37:03.506	2026-06-03 08:37:03.506	2026-06-10 08:37:03.496	7d755155-41b5-471f-9f79-b92fd594188c
165	3	$2b$10$bDFG1O1kk.33bFYZZKJp1OM4mxYa9GLdaK9W/mzbcXAYCeDDlOwNK	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 08:37:03.771	2026-06-03 08:37:03.771	2026-06-10 08:37:03.771	1be21823-5199-46c1-b18e-e5ed6abf29cd
166	3	$2b$10$Oj6RIe0Pkhi7Iezhqj373OkmtVD1lcHN97nBAYylihQX6erg1bjai	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 08:37:03.907	2026-06-03 08:37:03.907	2026-06-10 08:37:03.907	703f08a5-18cb-43d4-b037-949cc5125ae4
167	3	$2b$10$5ibXFR29MoDF.dApirk3Ru2d/CskSJEYd.sZLOSbfqpqnG75YnhJS	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 08:37:04.043	2026-06-03 08:37:04.043	2026-06-10 08:37:04.043	39686a6c-3eb8-406b-907a-9717f0885f3a
168	3	$2b$10$IFNG/RH3VHbyid98Wpry5OblM0mrXWeDnPFebuS2Co5qOYHZihXxW	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 08:37:04.187	2026-06-03 08:37:04.187	2026-06-10 08:37:04.186	3c6d832d-5fc6-48a4-9ad0-8bace3c9577d
187	3	$2b$10$.HmaZUWjLslD88Suonj3Req5fVhIH6IFQYmfpjnNkf7HFfWIVV0PW	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:35:49.656	2026-06-03 11:35:49.656	2026-06-10 11:35:49.656	07654797-175e-4bfd-855f-98a9f93e92b3
188	3	$2b$10$QOYDsKQc8OQE.6w6xM5RZ./Vk9Rl8gI.HF18rT/TtZxrp0Z7gGnsm	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:35:49.767	2026-06-03 11:35:49.767	2026-06-10 11:35:49.767	95a840f0-c91e-4a9e-a721-c3b342eeb614
189	3	$2b$10$MoawDs5QADZNKsLRv1.Nm.8W7KP8mNpokmpYUxb/a7jpFF77Omzya	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:35:49.876	2026-06-03 11:35:49.876	2026-06-10 11:35:49.876	27262308-4275-4491-9247-38fda6d8323c
170	3	$2b$10$hCivmFWBMFuiP13BPZnEoetuAFcSjKXd3j3aK0XIrwdVopMb/XRgK	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-03 10:58:07.412	2026-06-03 10:50:07.754	2026-06-10 10:50:07.735	08e595c9-d35c-49b7-b9a0-e14c9dbc81a2
171	3	$2b$10$hWUXZ77TTNLSdlKC.7dM1Ock3yTTiIs/mTNrDuJIlgQU53EnWitFa	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:06:47.48	2026-06-03 11:06:47.48	2026-06-10 11:06:47.426	2d498834-2ca2-4b78-b814-0b80b9cf2c9d
172	3	$2b$10$Wu4gngaj8OmgK2BItBkGqO2ECYmodZhJ/k5u8thaVJRb6t.wjKQdW	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:06:48.15	2026-06-03 11:06:48.15	2026-06-10 11:06:48.149	939292f6-151b-4726-99e9-ab7ae2e6d1fa
173	3	$2b$10$OtfBMAUaCbZ4aBcB9cqC1uxMTf3xXhDbchq76bHdfWc5znkTqxJDq	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:06:48.348	2026-06-03 11:06:48.348	2026-06-10 11:06:48.347	4d5244d2-31ad-4ec9-949a-d1b91cf13369
174	3	$2b$10$l/2kyHBdOkCSfzoN7VNFu.pArwTZIkRQeezfAa8FsCsF6maNCXAnO	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:06:48.55	2026-06-03 11:06:48.55	2026-06-10 11:06:48.549	e9200dfe-4cb5-43e3-8998-2f76c2816884
175	3	$2b$10$luVUSXelDe0JRVxS9AV2LekX5caHUqBHcn72R4xFjSasQVP8HbANG	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:06:48.783	2026-06-03 11:06:48.783	2026-06-10 11:06:48.782	4ee40743-bfd1-4135-9d2f-fa4c30e61628
176	3	$2b$10$eDJOztwb879VOxb2cKYg1.NM.NClbCGcJVMPY1cVTx9K4zWGdTQ3i	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:06:49.28	2026-06-03 11:06:49.28	2026-06-10 11:06:49.278	7c262920-ab8f-4197-bc9c-e8ddbddd83ac
177	3	$2b$10$eQS09taBChl9aQ6anp9fYuzaqqNpmJj6g8/HBgQGiF/0ca.VXDUFi	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:06:49.646	2026-06-03 11:06:49.646	2026-06-10 11:06:49.646	d1f475d3-1964-4c84-96e5-60c428d6e3ed
178	3	$2b$10$CucXbmIpsVGkxR3/TPXcvOc949ghIx/U4533CWfQXnf9d4yGxdzbC	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:06:49.893	2026-06-03 11:06:49.893	2026-06-10 11:06:49.893	498f2813-8c76-4f8b-b94e-dc9528d5e3f3
179	3	$2b$10$2MUOXtPyt60Y/bQfmjAxnOXPhOAESTjJSLbE3hkJVdUJuUbl79v4y	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:06:50.155	2026-06-03 11:06:50.155	2026-06-10 11:06:50.155	a69f81a6-3a75-468c-8b71-67f6fc3b075a
180	3	$2b$10$LmlXXEAtwKnJNmHr.aorFeHtmrxGLPQcFxkBPHrPeZLpYLRojhyR6	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-06-03 11:27:10.775	2026-06-03 11:27:10.775	2026-06-10 11:27:10.761	f87bcaad-35c9-4d79-bf13-9b5e9477d6a0
181	3	$2b$10$KFHQDAS52YIykeXGgeTJ2.JX73O7svudqtZc3OThRtfBOHAkSGXEm	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:35:48.704	2026-06-03 11:35:48.704	2026-06-10 11:35:48.699	61722f75-fe4a-4071-b211-1370638398f9
182	3	$2b$10$fiIWiEy4KA086.0MZxeiHeha/E0z9CKmMslADwKyNpNI3uRtIVbQO	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:35:48.896	2026-06-03 11:35:48.896	2026-06-10 11:35:48.895	afe03c13-01e2-4a06-8c6e-0defc277905c
183	3	$2b$10$HE7AH4wgnly5bhd0Xoqz3u.OotVxdaxz4X2E68MEDhRRclYSRHxwe	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:35:49.015	2026-06-03 11:35:49.015	2026-06-10 11:35:49.015	e0f1edde-a69d-42f5-8398-5bf5aac1b0c2
184	3	$2b$10$ZjTlk4xMhMq5KjfNJIaJZu3rb9RP/zot69i3wCQu8JDgJL8cgkmZS	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:35:49.129	2026-06-03 11:35:49.129	2026-06-10 11:35:49.129	4531a1b9-fa2b-40b2-9aa2-9194d24794ae
185	3	$2b$10$e7D/CSLAqrj6vOk8D21N1eZp/1xaapLUP.nkehcGqFDdqyXsTxkfe	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:35:49.247	2026-06-03 11:35:49.247	2026-06-10 11:35:49.246	9918fb7e-af68-4a24-b259-d549cd00ce86
186	3	$2b$10$K08/EyyBXkYylI./7i3PeeKZDIXcLz1nNcOTJy0eXCpzLio.O65fq	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:35:49.469	2026-06-03 11:35:49.469	2026-06-10 11:35:49.468	e4cbe565-fd9e-4b4e-8079-a83f85c87e49
190	3	$2b$10$5q7.NgreQK5XH9MkOOSHxeWgrhbo2yBiNQDm27RON8oY7akTt14MC	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:35:50.05	2026-06-03 11:35:50.05	2026-06-10 11:35:50.05	b2526eed-6ab3-4b7a-b04e-7311a6a5d501
191	3	$2b$10$Zo1.miaZrCr4XdGS0/kbLe3wVoShUiU1Ek5yyA5KCDILiP14GZ.US	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:35:50.226	2026-06-03 11:35:50.226	2026-06-10 11:35:50.226	04abdf36-bc78-4339-9988-e9bb411102d8
192	3	$2b$10$NJydLrQoUZV6kbI60uPxY.K98iA.mZIhNIni10o9kVc2w16YToudS	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:35:50.338	2026-06-03 11:35:50.338	2026-06-10 11:35:50.337	3ffc9656-3f1d-433b-9e47-e1cf52dacb8e
193	3	$2b$10$U0NmDtKVgAoQEJbRt7yiOO88X2vVgx79iqOnRY4DLAAL3DRQx2Zre	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 11:35:50.454	2026-06-03 11:35:50.454	2026-06-10 11:35:50.453	62c0b667-f52c-4b6a-8742-f9bd154791f3
211	3	$2b$10$VDUZrENvJYx3rlCX1z38iuDlRGkPKVd51aOFSCJJfAyOJFnX0LW2u	unknown	::ffff:127.0.0.1	unknown	t	2026-06-04 09:04:58.572	2026-06-04 09:04:58.572	2026-06-11 09:04:58.571	c7f800a9-3a82-4d02-ac66-f84f326235c8
222	3	$2b$10$SwqooeBhsonq/yfl/lq0qOmKr4neA5tN/72l.q8lsRQ2qwliT9bV2	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-05 06:21:32.27	2026-06-05 06:20:21.359	2026-06-12 06:20:21.333	0f63fbd5-f55a-4243-b356-869989d013ce
233	3	$2b$10$OA5Ji5dZG3.760KAxYicS.F6CA81I9NDgUQx.580E3L4Vhw2ghlj.	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 06:56:02.185	2026-06-05 06:56:02.185	2026-06-12 06:56:02.178	a54a4ebf-17f8-46e6-b551-d320f7df22f2
234	3	$2b$10$LtB7EZXt9Gdtdu82GURYiubeX10hzK1Uyh1NZHwWbk65Y0DJ8SGxS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 06:56:02.404	2026-06-05 06:56:02.404	2026-06-12 06:56:02.404	5a1788de-1fc2-4c1e-b629-5b410b099b5b
235	4	$2b$10$StxNu9AsMrCiqYUimyWUju.yRnBBbXNHAh2EVNAwytV8DJ5nYl8Q6	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 06:56:02.656	2026-06-05 06:56:02.656	2026-06-12 06:56:02.656	61b8b35d-552d-47d3-821b-bfde881577e2
236	3	$2b$10$Jga9Z5Qewff90LfLxC4cx.xxYQRlN8aplSKANep6RHKC7lPGAiHLy	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 06:56:02.803	2026-06-05 06:56:02.803	2026-06-12 06:56:02.803	c9163b47-1801-4328-b04b-7a3e65ba3c1c
237	3	$2b$10$ozjmlB1W1wBldqMzNBjfBO3uanlo3CCt7TJCkaQueaaDu3gYrKWyW	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 06:56:02.922	2026-06-05 06:56:02.922	2026-06-12 06:56:02.921	a021aefb-d4e7-45e7-a916-3a63166d145b
238	3	$2b$10$iHySg8Hu/TljDOjZrolBJe5Bi0jtadsXGrSkWAnSrW/n7Y90W/kOm	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 06:56:03.034	2026-06-05 06:56:03.034	2026-06-12 06:56:03.034	cf79580e-13d5-4b25-ba87-8f1593239aae
250	3	$2b$10$UQU/LFmNPEaWB2Qg0beGaOad79yjEwnA33PNOeCzyTY9Lx27zjngm	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 09:03:26.338	2026-06-05 09:03:26.338	2026-06-12 09:03:26.333	689e7be9-7694-466b-9708-99e449a52865
251	3	$2b$10$WBsXgIpN1DZQJ9ET.iSpLOguL1jOWPIf6TuRJSaSojD.rctoIPOKK	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 09:03:26.694	2026-06-05 09:03:26.694	2026-06-12 09:03:26.694	d8fe892a-208e-409a-9226-1f4c8d9e4b7c
259	3	$2b$10$/q7QaRkPl142hzRgxNYan.xMSQIIzXIIU0ocX.eRxfrfKNnfC2i0y	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-06 04:35:45.197	2026-06-06 04:31:14.987	2026-06-13 04:31:14.967	ca441c53-ce47-462d-9859-149a61d75c3e
268	3	$2b$10$dcDWwMFMqYklxsyVqMJYKe8DFEfxPSCG7VxUGtKPQEvWthrTbGb2e	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:02:34.718	2026-06-06 05:02:34.718	2026-06-13 05:02:34.717	1d288ce9-429f-4e56-ab59-0ae8b1980cc8
269	3	$2b$10$jOSWvTQ0q84E7KSiA9ByFOEfavqjRwAIH6PC24j2z4mWD77Ke/6Ku	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:02:34.935	2026-06-06 05:02:34.935	2026-06-13 05:02:34.935	329a3a02-d9b2-4e1f-b885-2a8b59c0afaf
277	3	$2b$10$8CHrerdpgTduewmjsO4MeeyBXgNf4BIcK4lREBqs8wi86UOW0QADC	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:22:29.556	2026-06-06 05:22:29.556	2026-06-13 05:22:29.548	86b81de2-7690-48d6-9ca8-af4286674bdb
278	3	$2b$10$IREp2AfXTpkyoJwAgJh4H.INbiHi/SHbvl/TPD9RVhme3rosDj4GO	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 05:22:29.96	2026-06-06 05:22:29.96	2026-06-13 05:22:29.959	62fa89dd-3a22-4de7-b44d-bd04f5369a51
291	3	$2b$10$vfGflJFO.h5SVQcVszV.3ujZ.OLEOTg3hNPoMAzCRx00bfjiROd0q	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:14:05.32	2026-06-06 06:14:05.32	2026-06-13 06:14:05.314	ea9a2414-7fa2-449d-8513-b6ff9a37e4f9
292	3	$2b$10$M5CaGoIwfTMu6Po9tE5PTuLNHw3Hu16QZVtoCYfvZLcwqbpvWF58u	unknown	::ffff:127.0.0.1	unknown	t	2026-06-06 06:14:05.54	2026-06-06 06:14:05.54	2026-06-13 06:14:05.54	10903ec3-f70f-4311-aa81-74f36cabc6ff
382	3	$2b$10$Dp/ufr02pFfoGpNHIeUziOSFgi9Jk3L8UVuCiVZDxDKPOVOrG8LbG	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-09 04:57:27.041	2026-06-09 04:52:31.14	2026-06-16 04:52:31.116	7cf2c18f-74d6-4c0e-bd23-15119e2bda4b
383	3	$2b$10$E2Eqo9TmRVWeh03hh4fQ3OhVNguNYQAf.YervFqLbnZt3yQtKo3Be	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-09 05:18:18.463	2026-06-09 05:14:21.943	2026-06-16 05:14:21.922	1105259a-6c41-4049-8298-726466988513
384	3	$2b$10$pprQ1jXmZ/mSmW.VSy7ITOaXrzKznAEh6t1QF/YauLfoayegJGnhC	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-09 05:33:12.33	2026-06-09 05:29:30.409	2026-06-16 05:29:30.392	3b626cb6-3358-43e9-80bb-5325ca4d509f
385	3	$2b$10$If2axyh7IQtwv2YoFOItBuIxte3Pv3i04apolisOjOka.4wTyOB16	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-09 06:33:09.39	2026-06-09 06:19:34.88	2026-06-16 06:19:34.856	dbde6d45-c3ab-462e-9ac4-bf102e45c233
386	3	$2b$10$xi32W1svgG8tvN6dT5Hkx.H35fEpt5nfDiXzyg2snG/gjtHN8kHS2	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-09 07:08:34.932	2026-06-09 07:05:05.344	2026-06-16 07:05:05.28	8f01fce7-fe0a-4909-bce4-cf5a24353cde
389	3	$2b$10$1VPoS881Ji/2uX3tknihYeObyQSQsBPOE2cCtgrQloiFMmUpZX73a	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 07:27:06.754	2026-06-09 07:27:06.754	2026-06-16 07:27:06.754	542f4760-434f-477d-aa1f-4055dbd061c1
390	3	$2b$10$IvZBorsuUapfcmjXwJZoHOJ2/TAe6nrarirCBhUfS1Aj10BZG1/YG	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 07:27:07.021	2026-06-09 07:27:07.021	2026-06-16 07:27:07.02	1eabb199-d68f-4e0b-8f24-7add5990f9cd
391	3	$2b$10$ZjFtnv64olNEW8LnyJy7WezGlVFuGEP9ur0lKHSk5nsa5NXzy.kNy	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 07:27:07.161	2026-06-09 07:27:07.161	2026-06-16 07:27:07.161	3e9f8878-012a-413e-b2d4-8436caa13d23
392	3	$2b$10$Dhg0Fo3TfYwV6EzdD.21SuLxXrLqRrVSYirCyeMoDGJjV3yPVLuVW	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 07:27:07.302	2026-06-09 07:27:07.302	2026-06-16 07:27:07.302	44ab7d65-56f1-42c0-868b-d6278e330ef0
393	3	$2b$10$spk5HO4FnVAdoVLG9VCju.evv3ypUGuh3sIGkcwP4XXTOsIWUcsPG	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 07:27:07.485	2026-06-09 07:27:07.485	2026-06-16 07:27:07.485	f0f935fb-3cc6-4d4c-bba7-9a401586e004
394	3	$2b$10$JzxeIqDZWuHRUCf.pOpc4.x2rsvYn2M8UgF1pzGBzAjN93O73I7IG	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 07:27:07.616	2026-06-09 07:27:07.616	2026-06-16 07:27:07.616	5d6ade99-1b90-4704-badb-eaedc1920fdd
395	3	$2b$10$m9PRK/YddouVsmbiTnJy.uRL1.BwV8hAJgICJk.W40Icu73crW8dC	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 07:27:07.811	2026-06-09 07:27:07.811	2026-06-16 07:27:07.811	a07f3e9d-2304-4f61-a525-358115c31d8d
396	3	$2b$10$xfNspOYWc.Mn7TTREdd54eKvzngmx382En4CmJ50Af.LOp0Xpjuve	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 07:28:35.634	2026-06-09 07:28:35.634	2026-06-16 07:28:35.626	ec7867c9-52ef-450c-82fc-a8662b2bc038
397	3	$2b$10$OyaOZZeCS2y2D1gr2VmL8.5eONtS0oEf5C0r3nJBfts95IKQD/8Ta	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 07:28:35.925	2026-06-09 07:28:35.925	2026-06-16 07:28:35.924	0081364b-04c5-4d65-addc-b1cd6b23049c
398	3	$2b$10$X90qUl99aZnIKbOto5XiQehkNZE8n5reUMGv4zSSeD5E3fvuzku1i	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 07:28:36.048	2026-06-09 07:28:36.048	2026-06-16 07:28:36.048	eed0ede0-81f8-4a4f-85b7-75ab2faf4f00
399	3	$2b$10$UjK2kduGvKetZuJXKvjsm.3QLqpiirXVhn08NdlPUclr1d414hLri	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 07:28:36.236	2026-06-09 07:28:36.236	2026-06-16 07:28:36.236	c30ca124-2020-4c38-a335-f683b6836375
400	3	$2b$10$pUTbm1.kL9yzqTpyNvkgt.OXnD52t8dv2K5TGg/Hcqy3ijFMPrV6W	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 07:28:36.5	2026-06-09 07:28:36.5	2026-06-16 07:28:36.5	4da8c0ff-2dd2-4a31-bc28-f436223e277a
401	3	$2b$10$xBN4zUKyfB6FaCzlKhoXKuhFjJfMvyVhshLlIgMA3nfGbyV8JF74W	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 07:28:36.662	2026-06-09 07:28:36.662	2026-06-16 07:28:36.661	2b5ed909-6aeb-4a42-9ffc-8dbf627ab989
402	3	$2b$10$FymgXcp1dsHpOZ7sNfnLuuJKcLlX.l/GuA1BEJRHwxNRm7kNAP1/O	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 07:28:36.782	2026-06-09 07:28:36.782	2026-06-16 07:28:36.782	f619167c-442c-47e0-bc9c-a876bdeafbdd
403	3	$2b$10$C6lWjCV/CA5xjaFtP6ejJusqleBbTFRVd0UGG9YnAs5vcIdze1XC2	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 07:28:36.907	2026-06-09 07:28:36.907	2026-06-16 07:28:36.906	425bbc19-82f1-4e7b-994f-80a1041709fb
404	3	$2b$10$3Q746p1pdcrQMD2FPyGyZOAofyNXt31ts2jvW5igDpxNAX74nGF0K	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 07:28:37.025	2026-06-09 07:28:37.025	2026-06-16 07:28:37.024	a5dae06e-d5af-4739-9057-1a6c31e1a815
405	3	$2b$10$FEIPTVsG1jqLg00B3sFiCOVe5OgGIbAy38yL933RD4b9X8ttTSDqy	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-09 07:46:27.421	2026-06-09 07:46:27.421	2026-06-16 07:46:27.394	726ddaf3-8300-4b3f-9e4c-2eed1d3b83ee
406	3	$2b$10$wjr1gOBQxVM6RO/aY9Jj/uLIDAGPScnnLUS9GCXnpMpoNqeqgMVgK	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-09 08:41:50.003	2026-06-09 08:28:04.755	2026-06-16 08:28:04.733	3afbc92e-4537-4d34-86d6-19918baac29e
407	3	$2b$10$Z9kCeZcs2lQfk3TnSzSAXecheBssug2ISGvEu.fLnmGwOR0NatRoi	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 08:50:14.007	2026-06-09 08:50:14.007	2026-06-16 08:50:14	f8af4a6d-7d54-460c-a8b2-e11a3351e1a1
408	3	$2b$10$xEBe.42yRXT/TBa/41I6kewBUjARGt0uc9KGitkKNlJDXqBPAQuUC	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 08:50:14.356	2026-06-09 08:50:14.356	2026-06-16 08:50:14.356	7c841c89-fe99-412a-9acb-1ba2337c0cb1
409	3	$2b$10$fHqoHAlbiY0T6pSplIKYuugKmUKh44P5iFkPjBr4ilt5Nda.qPD22	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 08:50:14.474	2026-06-09 08:50:14.474	2026-06-16 08:50:14.474	b3df6f81-fe80-4f83-91d5-de7a520094db
410	3	$2b$10$Sx8KU0XnKGS2XDSjxN1bbuaVMrf/FDPSO19e2uuNqVOIOItxr8vSu	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 08:50:14.72	2026-06-09 08:50:14.72	2026-06-16 08:50:14.72	cd7f5933-e5ff-4513-b021-f37024361079
411	3	$2b$10$L0rPMqUo85U19DBFN5rZCu2Bf/FXivw36MZc0ju10I206ko54tlqy	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 08:50:14.92	2026-06-09 08:50:14.92	2026-06-16 08:50:14.919	00a69bc4-5ebb-4a89-9406-6e099bb25dba
412	3	$2b$10$Ya0AQVLKInxMp9jx7x778OkIP6rBdwTe.m1pkAP.oX65WSDKoJQVG	unknown	::ffff:127.0.0.1	unknown	t	2026-06-09 08:50:15.031	2026-06-09 08:50:15.031	2026-06-16 08:50:15.031	a2bdc495-ac96-4e48-aeb1-2afbdd547d31
415	3	$2b$10$gc9UBAHyEj7Ci.lSqz9NPuC7VSt1SP9tw/lczfvQOsUH.jqUEAuBq	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-11 06:25:17.217	2026-06-11 06:11:05.167	2026-06-18 06:11:05.153	3e31a75c-187e-475b-abd6-f30e363b5400
413	3	$2b$10$iQXUMxHf3t9hDWYNWMm38e69uNXAp6dR9t5yGUyXMj9BrioQRFkJC	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-09 09:06:45.006	2026-06-09 08:52:29.988	2026-06-16 08:52:29.969	136fe119-4ef0-4061-968c-b72c9806b605
416	3	$2b$10$.XAu4CMmGeFwuIouS1nQHuFGiuqgU/boN6EQRzRb0hPl0MehbaV8y	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-11 06:36:55.001	2026-06-11 06:26:19.974	2026-06-18 06:26:19.963	00453cb7-bb89-480c-b0fb-8f20482fabeb
414	3	$2b$10$QtF91mq1Pm0mEbSYneYLtepIgyDj/8HgNGJ87wyiWfoExl1dqVhri	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-09 09:10:04.186	2026-06-09 09:07:34.649	2026-06-16 09:07:34.636	a6e772a4-8499-474a-b24d-31710f2b57b7
417	3	$2b$10$n1hpBlKuZi6Gp4.SJ4uMNe5Zv05MNHI0P.QuwQNccQaOukJXqFaO2	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-11 06:41:28.045	2026-06-11 06:41:28.045	2026-06-18 06:41:28.038	f7224b58-ee44-4a19-8d27-f08a242fd5f7
418	3	$2b$10$HnUfIZK9nC76j.AoLXvQiuQdqXRAnnw3ehxwhmR1zWxU1krDhmxbG	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-11 07:42:57.706	2026-06-11 07:31:22.818	2026-06-18 07:31:22.8	1a979e3b-87a4-425f-838a-2373e7b9b374
419	3	$2b$10$3oMAPG4S5aKUNQ8NAPZQ2uAkltpBGTcUligtc1zRChn.Ox4oLXS8C	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-11 07:54:27.74	2026-06-11 07:48:22.284	2026-06-18 07:48:22.276	07aa8b48-7bb2-4a52-890c-a30b8399f812
420	3	$2b$10$CpXLJNeQ4vKzH4Bv.uIONO5E25NTgOUeva8f0l6lVyMuFaTdDDyWa	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:41:13.114	2026-06-11 08:41:13.114	2026-06-18 08:41:13.099	2313f525-9d5f-4d02-857e-baa26628429f
421	3	$2b$10$DRhac6lkRJH6rK3/4mx2g.dEqltlZp/gP343jG8uV3aSelauGhHyG	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:41:13.385	2026-06-11 08:41:13.385	2026-06-18 08:41:13.384	09a92b99-6c0e-4409-8885-7ca32a9406c2
422	3	$2b$10$mVnK8VzEWn.xK0PVsDVHMeGJLNntR3zWpz/Eq//8ILWHvyyaQ33aa	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:41:13.836	2026-06-11 08:41:13.836	2026-06-18 08:41:13.834	d16b038b-7f76-49de-b39c-e35127fdfa43
423	3	$2b$10$xXhwj6rKRAoJ/4J6eFXn7OdBMWZvKOqZ6WS9De0h39JGmtq.ECl7q	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:41:14.012	2026-06-11 08:41:14.012	2026-06-18 08:41:14.012	41dc703a-20ff-4077-aa65-bbb76d31a241
424	3	$2b$10$gdqjKT6mepvYau7tiHbOR.juBASwsEYPoSi2YubuWBIT2J5kqjdsG	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:41:14.142	2026-06-11 08:41:14.142	2026-06-18 08:41:14.141	6dcb9e38-54de-4401-8ccb-2ee627fa1c66
425	3	$2b$10$A1yrI3AgPMBwlmK9Wbq16e7f8z8xF7/kP2UeDUw./SoxuF3vm7lp.	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:41:14.275	2026-06-11 08:41:14.275	2026-06-18 08:41:14.275	cb012e75-530e-40aa-8810-2ffcb449423a
426	3	$2b$10$0cFzxhi19twTTHGG65W4Euhkd3csZtiMktvMhXgv6XZPkH4UI2H.6	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:41:14.544	2026-06-11 08:41:14.544	2026-06-18 08:41:14.542	87305d01-842e-47e7-a351-8efcc2578add
427	3	$2b$10$xj9euLCogxXtNY97y.488OOvVPTMkX3cIoUHhhc8/WuxtnAxEEnmy	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:41:14.733	2026-06-11 08:41:14.733	2026-06-18 08:41:14.732	4180a273-8f87-4c27-8bd5-8f48006a6389
428	3	$2b$10$Cxg.Ow1b1XoL84Zm0oe54uh4e.ES83MqLzOBvniQkkqaTtljhAsYO	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:41:14.876	2026-06-11 08:41:14.876	2026-06-18 08:41:14.875	3d260c2e-33d1-4ff6-900d-b14e0784d608
429	3	$2b$10$Mu/5WcNv4X9Eqnucun3nkOkSpYYX.XyZoalMqNW89wPfrEI8EhTiW	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:41:15.023	2026-06-11 08:41:15.023	2026-06-18 08:41:15.022	9e2d3012-4c46-4ed3-beab-75f020866a47
430	3	$2b$10$gmSY0c7uunwDJnDJFhrL6OTLJ7Wz9RtacouniOHBIkZMgU6ynbGLG	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:41:15.434	2026-06-11 08:41:15.434	2026-06-18 08:41:15.432	90a06b30-f423-48e2-8a5b-8071560e9327
431	3	$2b$10$X87cl6jBDxk0uxS92q1DdObqd7ScDiskleDDKXInKe9K7RrvDMkt2	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:41:15.617	2026-06-11 08:41:15.617	2026-06-18 08:41:15.616	a3b2d5d8-c6c3-474b-baf7-bd9dd3c4aafe
432	3	$2b$10$jYaVCJkdb284qu3OrxDnuOYfBoz8NON0sMXJlO2pRcVQ3ScoLSwQ2	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:41:15.758	2026-06-11 08:41:15.758	2026-06-18 08:41:15.758	d39655af-5bda-4ed2-b88a-71a739fd38c9
433	3	$2b$10$on4BC5cM4Wu7JxVobkInOuJFVN1VfA/8tNPYNlNCvBWSH729Tag9O	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:42:01.825	2026-06-11 08:42:01.825	2026-06-18 08:42:01.817	730ec640-6f4a-4815-8e36-e03d014f8a75
434	3	$2b$10$qDb81/mknuyQZhC50oEj5O40BnUg.stbM1WuWNmJaxn/X2saCgx5a	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:42:02.339	2026-06-11 08:42:02.339	2026-06-18 08:42:02.338	08c72dd0-554f-48a9-952f-c1837e3de8ad
435	3	$2b$10$UPiSyGTW/4YLEc5tPgUn7OtfHwE0k1bZ1h5m/bRRjqsTtfK0ByXYq	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:42:02.692	2026-06-11 08:42:02.692	2026-06-18 08:42:02.69	411d8ef2-e29a-4d0d-abb9-6ea01600adce
436	3	$2b$10$LTUMKnkZMc819Hof0ihpK.NYLfrBqyUBpkDSeYcEsZO68uBuB4HHC	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:42:02.941	2026-06-11 08:42:02.941	2026-06-18 08:42:02.94	b7855b3d-8511-4f8f-bc44-1e8d9c9d9369
437	3	$2b$10$ZUMijfntzXNxwzIpurMQTeg/TqUCyu4cZYpgMYwU5PFT3.H7S9REy	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:42:03.079	2026-06-11 08:42:03.079	2026-06-18 08:42:03.079	5b8839be-ff31-4626-bd95-2e899059f572
438	3	$2b$10$QmmUSfa4xFybbRRwJ6swfO6nW0KYUH5O//eD1RqIyvMnTRctqqkYS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:42:03.251	2026-06-11 08:42:03.251	2026-06-18 08:42:03.25	057bc635-e66b-4579-87a2-ac64782269a6
439	3	$2b$10$kwNTp.ktlCATJyxdDN2InOqyGw3yiVKVVVk0ex6zL2aMqQGOqDLC.	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:42:03.704	2026-06-11 08:42:03.704	2026-06-18 08:42:03.703	a12e1bfa-c23c-444f-b5dd-d31094065797
440	3	$2b$10$tTbN6NNSplEaW7JqstkdXOYOAgSnMMk27kFqJETVaYxUp4FeSmTDO	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:42:03.997	2026-06-11 08:42:03.997	2026-06-18 08:42:03.996	f67e8178-6bd0-4341-856b-47826c3062a2
441	3	$2b$10$SzfN6Yvnh/4IK93l1Z5k7uETP0SRKIDOvvc21wUYIVdP2gdjtq3/.	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:42:04.152	2026-06-11 08:42:04.152	2026-06-18 08:42:04.151	ede2b85b-e8b4-4219-8598-5ebb66406bf7
442	3	$2b$10$7sM9jLpBIeobutyKQW8ZOedJeFcRuhP2ZpPfX4bYIAmBNusJRORcu	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:42:04.317	2026-06-11 08:42:04.317	2026-06-18 08:42:04.316	61cadad5-c31e-4c01-a7db-874706d30ccb
443	3	$2b$10$qHfBRAzZhOOR0R8rodyEmuHcbQtNDBa81uoWPc1Z9E/HvUuegqVLW	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:42:04.579	2026-06-11 08:42:04.579	2026-06-18 08:42:04.577	215da666-2e63-4435-82bd-8c1f0644eefb
444	3	$2b$10$iv90ihHtlf6ColT/2PTDme2eae.M8NdprmQ0uBPkgs13lrWzPeZtS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:42:04.939	2026-06-11 08:42:04.939	2026-06-18 08:42:04.938	5e4322a1-175b-4ccf-bdb1-602478e626c3
445	3	$2b$10$cVrPU/eh6oEdhDcGysc77e4JoNUcx/mDUq6BNxjALl55dViX9/w/m	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:42:05.057	2026-06-11 08:42:05.057	2026-06-18 08:42:05.057	8f106a77-764b-4e5a-a7bd-231e53721e49
446	3	$2b$10$nLFveSpRqSQ/dPyM8aXb1OWut0txqFT0qWNwcl3eskGmeEsV/RxyW	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:44:09.466	2026-06-11 08:44:09.466	2026-06-18 08:44:09.46	31ffd4ed-23da-47a5-8f6e-ee5fa9a70da5
447	3	$2b$10$0iC0iUvAqFivW35trR8ujuq58wqvw7N2B03w82vzW.ypJsQYKEtqS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:44:09.788	2026-06-11 08:44:09.788	2026-06-18 08:44:09.787	6d866606-7755-4a1b-86e7-c689e1c70220
448	3	$2b$10$AA8YasADnLacLnFsTA7o3eBKhyMzbCepMM0zaLIOIM38B1LI2CDjq	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:44:10.116	2026-06-11 08:44:10.116	2026-06-18 08:44:10.114	83f8df5d-a221-458f-a888-bff80781d61b
449	3	$2b$10$k.PpnI2BDbvy2YioBMGeIet03Tay0Whb/uA8/okOETA8e22oYGfN.	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:44:10.348	2026-06-11 08:44:10.348	2026-06-18 08:44:10.348	0cc22637-ce36-4dc4-9c76-db264e8cacc2
450	3	$2b$10$2GLncSw5pK/6XeE65O50Ju6uvKQR0c8Y68Vp9.KwEoo94YpJsVW3W	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:44:10.478	2026-06-11 08:44:10.478	2026-06-18 08:44:10.478	5965b869-dfaa-4680-ae86-828d31675efa
451	3	$2b$10$pgPxmZPK2rQh4iJAO7K23uyjoD29Digf5A0i/oYs5Cn3AdHHdDx.u	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:44:10.598	2026-06-11 08:44:10.598	2026-06-18 08:44:10.598	6c8e09d0-4b91-43af-a7ec-0e26c2dd34d9
452	3	$2b$10$.djUw8aw8UqY45kZd11SgeQyFAZF9d0PP4h2vMfjzrNazHPh7ZoOO	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:44:10.875	2026-06-11 08:44:10.875	2026-06-18 08:44:10.874	e3d401be-d998-475a-8385-31a74adcc546
453	3	$2b$10$fH9.iWjS4F10mWrp4u3Wl.74yYefHd5Mn6L9j2s8GBbDl/PiJBTHe	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:44:11.117	2026-06-11 08:44:11.117	2026-06-18 08:44:11.117	8f2f0487-4a19-4aef-887a-2401f719624d
454	3	$2b$10$/sqJBctYOQQ58xTISv0rneb/TtNCG2FgRYk8pqP0uON.2TGgau/Y6	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:44:11.253	2026-06-11 08:44:11.253	2026-06-18 08:44:11.253	3aa4ba55-d5c4-448a-9718-c17e60875f1c
455	3	$2b$10$EmXHWDKFaU/2a4Cl7VBIvONvtlSZFJ7Np.sCz7JOnLZxYj3K0Avuy	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:44:11.388	2026-06-11 08:44:11.388	2026-06-18 08:44:11.387	2232141f-69fc-434f-8bae-5e2ec0da293a
456	3	$2b$10$DdAQ04OcTcc5E8yilMuoBuIjIRUdQnOOaZzQErHuYBG5ytvtuJFQ.	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:44:11.671	2026-06-11 08:44:11.671	2026-06-18 08:44:11.669	ac55e73d-d285-4c21-8452-570d9d29e464
457	3	$2b$10$.fKpIMTKEPXIF7tDi33l5uCc.SBZ71X0ZrnTy5lfoU5dSQ0ZNOMSO	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:44:11.93	2026-06-11 08:44:11.93	2026-06-18 08:44:11.93	cf61229c-309e-4ab4-abbf-b53de92288f4
458	3	$2b$10$tvMzt1RKHeHpgi0PRr..9.sEkL3t7jxVkO9aZH3aMYPSstLwjT24a	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:44:12.049	2026-06-11 08:44:12.049	2026-06-18 08:44:12.048	fcc92a43-389d-4a8c-bd5c-d3a0322d907a
459	3	$2b$10$Y8bxSTGLV24npnoB0EDlL.FIQIF2Opvgjah9ULfi/CnPpj9vyv34C	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:47:02.556	2026-06-11 08:47:02.556	2026-06-18 08:47:02.55	37208b58-c41c-4dfb-8be0-e478315f94f3
460	3	$2b$10$XARyr/X6bunl0iyfIQGJUemQUP9KxMhUq1VPS2WqAiwNGsbavy0VS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:47:02.892	2026-06-11 08:47:02.892	2026-06-18 08:47:02.892	b0181fe6-f413-436d-ad06-ea716df96d56
461	3	$2b$10$Wmd6.5GwnHPH8mTDqEbdWO7k9BP3mHm5rZMrHBUk1ggZ4d0Z1Pr5m	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:47:03.214	2026-06-11 08:47:03.214	2026-06-18 08:47:03.212	31653b66-9db9-4ed5-952b-8748a88c79fa
462	3	$2b$10$ej3dCLq9BMlma5.zq1GN3eeYI27wQk0xHQrM7KfN0K.2zaXKPE5cm	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:47:03.44	2026-06-11 08:47:03.44	2026-06-18 08:47:03.44	c70b7906-ed80-42ea-8ed4-1b4f2ad0d576
463	3	$2b$10$XNV5S/eE/euMdJmKm13tIeG1ax4bKgjkr.SvmPNVMLLKOMVYKJnbu	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:47:03.65	2026-06-11 08:47:03.65	2026-06-18 08:47:03.65	755d65d1-679f-4605-afb9-74d01c84dcfd
464	3	$2b$10$sGQMuIiYlsYgyD33dKZR0ukQeFXbnBY40bdWyFLqleokB26OvYRjC	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:47:03.777	2026-06-11 08:47:03.777	2026-06-18 08:47:03.777	d6e624ad-9205-4a2a-8bc3-a90836fa00a4
465	3	$2b$10$ks/2K.Rs50hXtY18xp6Hg.dRoKYSZ0pBVs9UQ.gvQ00TMCWWybckG	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:47:04.173	2026-06-11 08:47:04.173	2026-06-18 08:47:04.173	38004fe2-10d1-4b4f-bfd2-548bc9e4157c
466	3	$2b$10$c829Ln7sSvbSP4If8T0H3.qUZ7AH7xn5MmsOd0AyrlIbDP4CcIfPy	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:47:04.424	2026-06-11 08:47:04.424	2026-06-18 08:47:04.424	e7ce8cef-4ac8-413d-908a-3e2965df3344
467	3	$2b$10$AC.EUZ2SmIHJXVigR/w08e9FO1gJgNIJt3cbEoC2qaW/gWwoh/1ne	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:47:04.558	2026-06-11 08:47:04.558	2026-06-18 08:47:04.557	3e4f9ce8-0fca-47f9-a3d1-a7fc78508d7b
468	3	$2b$10$PzTBM/3LgPHJOwqawreRh.OHYyhQqNoW4Um3.Ace9fH0k1z0fn0mG	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:47:04.678	2026-06-11 08:47:04.678	2026-06-18 08:47:04.678	35d983c1-0352-4581-952f-df642e2ec131
469	3	$2b$10$mEiijPF8CpBs3RT3JJOkKOT0n9182GC7FUmqSE/.Yi6dyBOGM.3DC	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:47:04.895	2026-06-11 08:47:04.895	2026-06-18 08:47:04.894	d425fdf5-c5ed-4804-980d-8fe57d2ab634
470	3	$2b$10$nL2GzjAnxQNowZSTPzE1H.bYbQL6JDgdci/o7KydhDVq0nAdDbc.G	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:47:05.338	2026-06-11 08:47:05.338	2026-06-18 08:47:05.337	3fabbd2c-e95a-4a55-ac64-823099559bc6
471	3	$2b$10$syboOs9C.VRn66JizE5Tiu8CFbN3m61NZi8muqHSvsU0KlaCvsDpC	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:47:05.462	2026-06-11 08:47:05.462	2026-06-18 08:47:05.462	e901bbe3-e148-4358-83bb-fc638284666c
472	3	$2b$10$4jpR12yM9PWz/mhFMSIrJuiL0cr0rjmozZW12M3HS3FWTOY4w3oo.	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:48:36.483	2026-06-11 08:48:36.483	2026-06-18 08:48:36.477	8a1145a1-5c3b-4db1-a316-b5d136d1e1c6
473	3	$2b$10$Le/xdSh/bz37mqfxRBAKr.w2RROa3xI0lJbLYQHOxAtgz5T/59yyO	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:48:36.793	2026-06-11 08:48:36.793	2026-06-18 08:48:36.793	79f4ad32-334e-4c51-b429-0743b2e9be06
474	3	$2b$10$1Ok9ea4si7cOS0GfgUXrLeRmTmGj5FeLxddBtSIYDHu2vx3reK5em	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:48:37.165	2026-06-11 08:48:37.165	2026-06-18 08:48:37.163	92c29401-73e2-4418-a209-2ae1a8d805d0
475	3	$2b$10$9QYrNii.8Psi20kCFqxHTOrGllBcD.ke0It8JnsXkMyJudSQw8gBy	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:48:37.624	2026-06-11 08:48:37.624	2026-06-18 08:48:37.624	fb747c21-3a27-4766-99f5-507968ceaeac
476	3	$2b$10$Er6VnaZ5gm7AKa7POPsoQO5KrPbUHLBlafm63HClfkqKJgTTz4Giy	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:48:37.763	2026-06-11 08:48:37.763	2026-06-18 08:48:37.763	b6a36243-22f1-4bfc-85a0-175a88f6dc3f
477	3	$2b$10$VibtFkZgg2HfSA.cIdA2iO7gCSDTCIE1I26QSJxmSngiJgWXfzOF.	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:48:37.895	2026-06-11 08:48:37.895	2026-06-18 08:48:37.894	e472606e-bc83-4b59-8ca9-0324dcef2618
478	3	$2b$10$yacrGY6yLKFHm33CMr/sFuOYoznK5KpYh.0tqwaNxgKSXV7PxF22K	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:48:38.292	2026-06-11 08:48:38.292	2026-06-18 08:48:38.291	fb816383-3203-4b76-b62d-19890fb7f3be
479	3	$2b$10$T5hVTbU4N1GPk6F.e8PQG.mf3Fyj0NJUkfwIf0gv7NYe6O9Km1aDW	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:48:38.573	2026-06-11 08:48:38.573	2026-06-18 08:48:38.572	a0a305b2-8de4-4243-8138-13c292dae03d
480	3	$2b$10$dM0Pj.vZmoiJcq1Ac3sODOZh5q393Xixb29vk4IRycaUzHQn/lCKS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:48:38.703	2026-06-11 08:48:38.703	2026-06-18 08:48:38.702	3b4b2ccf-be10-4486-b4af-ce568a01baa9
481	3	$2b$10$sQARvBn9.H5Q0C.Lr9TDaO0yPI3kZ0KXBCWYit4KkMDpypIL2s49i	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:48:38.833	2026-06-11 08:48:38.833	2026-06-18 08:48:38.833	9e4f15cf-6811-4d9e-bda1-a381d0236160
482	3	$2b$10$zrdafHlrY81coIhtqci0su8DtPVCe.btUtbwwvAk8hvnhDBptyIey	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:48:39.075	2026-06-11 08:48:39.075	2026-06-18 08:48:39.073	f4c86926-17d5-475b-9c33-39913e06f510
483	3	$2b$10$kl/qKokqY9T57FGTNeC4OeFgEIK7MTF9tNnebaWZShapHmtAdxDBO	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:48:39.529	2026-06-11 08:48:39.529	2026-06-18 08:48:39.529	d7d9a0d1-d6dd-4ca0-9f44-b4a81ff1bd71
484	3	$2b$10$zp8DHZBasC0HZPE9fYVbROBqlFviOcZO1nnjj.WvYb0cqFiJqfOTG	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:48:39.648	2026-06-11 08:48:39.648	2026-06-18 08:48:39.648	df361635-d2d5-45aa-a69f-cd734df1fb77
485	3	$2b$10$UJrtSHeaFZtMx81/i/hNouDap7YUnPr4m5vpHPwDlhyrK6K6psbtO	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:13.192	2026-06-11 08:49:13.192	2026-06-18 08:49:13.185	609a4637-fcf6-4b44-85c4-fc4a0d5617f0
486	3	$2b$10$HXiRYiIKkhIfantJ34hQguf1cOub9ODbZcYEfPnlOoDkx8VQp/1ri	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:13.457	2026-06-11 08:49:13.457	2026-06-18 08:49:13.457	8b9e9422-0cbf-4486-92b3-5f466301dcd2
487	3	$2b$10$hoEvykkWBJW8xt7y35p4iuaca3whvW9MjBnU43qBCRoIdgSPJhE9m	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:13.714	2026-06-11 08:49:13.714	2026-06-18 08:49:13.713	f95cac16-0caa-40ba-98fc-aaafe4dfbc5d
488	3	$2b$10$Zsn2mmjMPmpHhxVTjhuPxueH4eeJZmrqUBrhOuu0pFLs6ceYJq602	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:13.928	2026-06-11 08:49:13.928	2026-06-18 08:49:13.928	25025b39-6e5c-43a1-acfe-6038ab94abf4
489	3	$2b$10$xvpPNr9WJgMe98w6yXRSs.g9NUGcxO6mllU3ar9SMno89RFvFXt0u	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:14.064	2026-06-11 08:49:14.064	2026-06-18 08:49:14.064	75f42690-287c-41b3-b0e0-3030a199b837
490	3	$2b$10$VY731B3u65EqWCKdXP2w6edsJKhZcRj4nXu.tMpDN2YuSsQDKhYAe	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:14.195	2026-06-11 08:49:14.195	2026-06-18 08:49:14.194	5ea577a5-0c73-4769-842c-1851a71a930d
491	3	$2b$10$eoKj43kDERuozcqNLlZabe1iRswVapWrpA1H2Jb3vhNLbAvY8OY8m	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:14.574	2026-06-11 08:49:14.574	2026-06-18 08:49:14.573	06e0a288-7101-4c49-adc3-8ded40abb229
492	3	$2b$10$MZOO1y1PoHfeM3gfzWfNYOFf4jGFezpRQMFnylQAXiwfLjt9pszZe	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:15.068	2026-06-11 08:49:15.068	2026-06-18 08:49:15.067	3be05b5e-3b83-4b1a-bec0-2eae8d03ee61
493	3	$2b$10$8FEFirRnCFP3ycNJjQ2upuTx.IIWIquYM76KIGUDeKg38i66qBVey	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:15.197	2026-06-11 08:49:15.197	2026-06-18 08:49:15.197	fffe37af-419b-4e6e-90e8-b88de9dabeeb
494	3	$2b$10$MIiQRYgnyaRSFQsYbXfx9u8Q8HnYcZS3Re2vDjaJwuVU6xfB6sdmm	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:15.314	2026-06-11 08:49:15.314	2026-06-18 08:49:15.314	f17b6aed-a74c-4649-b651-c3105776a83c
495	3	$2b$10$o3b06BK4UyqXwaixZ0oc8ujWJjiJZumiP61JZU9hOsuDstFwIKMtm	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:15.523	2026-06-11 08:49:15.523	2026-06-18 08:49:15.522	355bbbb9-28df-4022-9223-35d2a5b97981
496	3	$2b$10$Z.C2N.BMuY6ZkoKEmkyq1.m0TS/VRdQlR4NmPXu.g3P31cMT.GhB.	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:15.786	2026-06-11 08:49:15.786	2026-06-18 08:49:15.786	d01f5a29-9899-48b1-9aa0-8627cf1e891f
497	3	$2b$10$r5Fs78/l4yke4C5GCamc8O3m.up152Dak64TTp3tgu2nN6nP8ZYV2	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:15.914	2026-06-11 08:49:15.914	2026-06-18 08:49:15.913	07851c75-a32a-4024-b2b0-62cbd6500df4
498	3	$2b$10$uTAWX6xO/AdrD0Wcwcg1Augi5aXFwHz5oPff.pV349WmhULQrMwwu	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:43.344	2026-06-11 08:49:43.344	2026-06-18 08:49:43.339	70a484b7-6ecd-4caa-b288-9a20d36f8a5c
499	3	$2b$10$FIY6JSwNRB7/1iiUM7bqhO6085jxnxGKZOtnpBJeZhZl78fWvW8pe	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:43.842	2026-06-11 08:49:43.842	2026-06-18 08:49:43.842	f97e7805-025f-43be-8441-21fb92d0b3ce
500	3	$2b$10$mAQQeYDJAdUAt90xsoahc.fWZVVqYls9MqaJMfZCRivB.dw0aO5s2	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:44.191	2026-06-11 08:49:44.191	2026-06-18 08:49:44.19	73bc00a4-f8b2-47a5-b440-bd2fb6dd1a69
501	3	$2b$10$yMnt3jysgwhsDMm45Yidp.dm//6Mhvk9xrzXsN5okW8cUVH4YKs3S	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:44.521	2026-06-11 08:49:44.521	2026-06-18 08:49:44.521	16b16bea-d707-4fcb-8a63-b0650cd01add
502	3	$2b$10$Ej50hA4gUg4ovBaEecYNYefZ6TQbU0ep3pKE5Yba0N0ADIYsQHgP.	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:44.732	2026-06-11 08:49:44.732	2026-06-18 08:49:44.732	58ea84d9-eaec-4962-8a46-7d8aec2a8798
503	3	$2b$10$jv9ijs15PUyJcb5NxUPX0.qRgguq83z.2mewiJg1s2S0I6uJT86j2	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:44.858	2026-06-11 08:49:44.858	2026-06-18 08:49:44.857	0595b936-1470-4cf8-99e1-f33d0edf1d6e
504	3	$2b$10$7HLDDWXleE6e8JqKQo8QKuolI5tAkN5O71LRZC6wehjxZD0ezI.yO	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:45.176	2026-06-11 08:49:45.176	2026-06-18 08:49:45.175	4533125a-7665-4df8-a5f7-6857e8a1e3bc
505	3	$2b$10$IufekVSMxix10avncQuooOZNm.VdGiiOZZA3jARzv7/0W.CDVsqMC	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:45.628	2026-06-11 08:49:45.628	2026-06-18 08:49:45.627	4bac2594-40ea-497c-9adf-a51ccb2c9765
506	3	$2b$10$ef1QSzmq5MHrnzz22R.DD.doJnTbXxOCIBvYzCYuAYoncDUGWCo7W	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:45.752	2026-06-11 08:49:45.752	2026-06-18 08:49:45.752	b0260e4e-ea94-4e4d-9fec-c581c22e00a4
507	3	$2b$10$cazzkXUniQh0V54cQWZY/Ou0Eh6qjsiDaeUMLNgj8RSSI48POK0tS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:45.88	2026-06-11 08:49:45.88	2026-06-18 08:49:45.879	74dd20e6-0277-46b2-8d80-5743c6b3d5a8
508	3	$2b$10$sZHx7XSbzJSDAs6bkX0va.GnUauqaQquzMEJgG.P/8uTte1QCcLaS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:46.127	2026-06-11 08:49:46.127	2026-06-18 08:49:46.126	d4c003ed-e0c4-44a9-92d2-10e65959bb30
509	3	$2b$10$I/FPXp7wMTJr1JwqMatCNOXEfSAA8gYnz/2L6sOzw9L4DqPoG0OpW	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:46.515	2026-06-11 08:49:46.515	2026-06-18 08:49:46.515	7bee9a36-ff6b-48d6-afc2-dc87f39e017c
510	3	$2b$10$SzrVZOYDVG9lSP9VFCbul.93IBi6jWBLCdKKQREUYACwFWmBdra7q	unknown	::ffff:127.0.0.1	unknown	t	2026-06-11 08:49:46.644	2026-06-11 08:49:46.644	2026-06-18 08:49:46.643	06371b82-b5a8-46e0-8351-6fdde2d28a5d
517	3	$2b$10$.io5DT/0F4XR58AF1JkkAeFDUrb8qlrFIOrXeNiOopBFsv/.o6x3W	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-12 10:35:37.95	2026-06-12 10:33:04.723	2026-06-19 10:33:04.688	b316ba8f-63d0-4c73-9492-b07284d8c7ff
511	3	$2b$10$hoc95iRs2LAkWwsIW8M8zuLlI.kGkMevVAP/I1tOqJUXQgXutgTkO	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-12 08:00:01.86	2026-06-12 07:52:52.2	2026-06-19 07:52:52.174	ec0cb6eb-9b75-42fc-b706-907e2e78ce7c
518	3	$2b$10$YiZu1Qwr5Ct0D2aBDhRVQetQKg9nYJX65ykkjNmDMBVzRX.CK7ufG	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-13 05:58:20.331	2026-06-13 05:56:27.339	2026-06-20 05:56:27.325	dbaf3d80-8d01-4aeb-bc39-c395415f429a
512	3	$2b$10$tmufxi.nz3/1MIGdKezh2urW7dQ7nqdIqTj8joHwBJF.hYd/8SW86	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-12 08:40:23.529	2026-06-12 08:36:37.672	2026-06-19 08:36:37.6	5b86881e-530c-4b98-aca0-775a4d0b5c1a
519	3	$2b$10$3TrbBDsA7Tctts5Bm8iwZOVln5.e1e5.H7NsXwfq8UtAtew1f8t12	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-13 06:50:32.216	2026-06-13 06:47:57.602	2026-06-20 06:47:57.592	98289b55-efd1-4c7b-ae87-79889aedce6b
513	3	$2b$10$wcVg0hA.wbJQt85k7qFDrOixWy.pEQuravEPuOcTwHHveSjirxLBm	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-12 08:59:48.048	2026-06-12 08:47:33.647	2026-06-19 08:47:33.611	e100f66f-3c04-4d5a-9bb1-a43c958a7121
520	3	$2b$10$k1fvFmISKpo56jI2m2kb5ODF8QDKJ9eBlau.6EZPL0LgDOY1gXMEW	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-13 08:02:15.437	2026-06-13 07:57:49.906	2026-06-20 07:57:49.893	70f66eb9-78df-448c-a6d6-c901e66d5029
521	3	$2b$10$fKAJ8Wa2isJkC8B.6ey29Ol29Gwd4yl3IqUy3TyNXC4MfZl/.ZgV.	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-13 08:26:18.391	2026-06-13 08:13:29.871	2026-06-20 08:13:29.857	3e23d12c-0f73-43ba-96fb-690d10d9f53a
514	3	$2b$10$WhlmtoTOPmZ04Ev0jQgokejsrLMQlbiUdxj5pmsU3YGVDFd7Dj0ei	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-12 09:12:52.221	2026-06-12 09:00:52.771	2026-06-19 09:00:52.752	2258ee1e-6f34-49d2-90f9-56debf208ceb
522	3	$2b$10$xK3OiNPcCCnMdk0vPXh0nOKuYzFoyZGjKglMe2i3UeKgiyCBzcmlu	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-13 08:33:19.377	2026-06-13 08:31:54.112	2026-06-20 08:31:54.11	2c743eba-54ba-4ac8-8bcf-5c49df264c40
515	3	$2b$10$AL/QyPlohGvN07s3AFLGV.VV7x6OwNKZ4hMqe2VtYafj5lgXEk6je	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-12 09:28:37.955	2026-06-12 09:14:46.688	2026-06-19 09:14:46.667	c7d6b0ee-2762-491d-9f79-c4fd7ef0ae3a
523	3	$2b$10$qyjgsPTHl94zI7wUt8PfDOB8zJHZ5ZpH5I3hRyraNw5P8cd1Q7eqS	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-13 09:04:17.887	2026-06-13 08:57:40.279	2026-06-20 08:57:40.246	71710ab3-18b8-48f3-9b21-30538346a140
516	3	$2b$10$Pi6uLvYIOZ3KhFwuRpl7FuQ3XzSD9g.pMiqH0z9coaMGKs.0Oz.1u	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-12 09:54:26.048	2026-06-12 09:41:37.671	2026-06-19 09:41:37.648	dbe81a5a-0a92-4a35-90ea-23b4afb7f9e7
524	3	$2b$10$/RwGuhMe1BmFlELRQzpEZu.HdnEFO7lX3J1P5Hthut8sR9F7sjNB2	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-13 12:00:14.967	2026-06-13 12:00:14.967	2026-06-20 12:00:14.949	5ba612d4-1153-4293-a359-5210ab0b6abc
526	3	$2b$10$P3pwat8MQ42oX/O4hUOdD.4xK3jmITjZWDshkQ/JKHxkqZGbFj4Oe	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-13 13:20:34.515	2026-06-13 13:06:09.726	2026-06-20 13:06:09.708	01a12d74-e093-4256-b40c-83fb39d8ff4c
525	3	$2b$10$ffCsr8Rtcu4KpPmEpWl16.28KY8FTGqn.cMu8bHurwuGNqXbqKVPi	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-13 12:44:30.498	2026-06-13 12:35:54.4	2026-06-20 12:35:54.384	833e686a-de5d-4363-946b-b9686763aa15
527	3	$2b$10$p6uxHGgdiEfJz4zx03JdTuAUEPY9jYBFsxpAwb7ZXb8/.0tSG7iTW	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-14 05:14:08.28	2026-06-14 05:14:08.28	2026-06-21 05:14:08.265	bb00d463-669d-44e7-a8eb-8d7296644d02
528	3	$2b$10$eHFe7F.NGxiMsGVKL9TcZOo8HUB2t6qWuVuRcUgR/DzsfRtaLj0rK	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-15 04:17:24.592	2026-06-15 04:17:24.592	2026-06-22 04:17:24.555	d2107234-aa1a-43a6-b1ff-f58e1297d629
559	3	$2b$10$MZNtmusFJIn3s5hwWa7thOhYabEScFjcUKE50Ao4qDFiHpRHUCFGG	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-16 06:33:57.938	2026-06-16 06:30:11.887	2026-06-23 06:30:11.848	52cf5558-e966-449d-9e19-f6c9ea80d5d9
561	3	$2b$10$7D0OXCjiTyCYECdBC90NnudBHIOmkee5HpALiRv4W9IGuBXf9nvaC	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-16 08:01:07.062	2026-06-16 08:00:01.321	2026-06-23 08:00:01.31	50b6f5f5-c03a-403c-893b-590465a7985d
530	3	$2b$10$vVlF92c5LQYiuTKOvbePO.Tab03ldH5mDg90cOitjmaN6HHkK9Vg.	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-15 07:34:51.399	2026-06-15 07:21:43.983	2026-06-22 07:21:43.971	3aa0d226-886b-46be-8ee2-74c1a596561a
563	3	$2b$10$DOp2ezpSYjZ12CRgQW65Wu415J8Nb5oF1sxnwBLrGkGrJjMsXwq9y	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-16 09:13:20.244	2026-06-16 09:04:11.239	2026-06-23 09:04:11.193	6e07d625-95c9-4935-ba64-f6e78a5259d0
534	3	$2b$10$Hj6/rv6WN6ahjUssGzdA9utlnG1rm.NIaAJHP9xcZu3SzshJZHvPW	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-15 08:09:27.407	2026-06-15 08:09:27.407	2026-06-22 08:09:27.396	64a3872b-f4e6-4ab6-a9c4-dc41a0bc0397
532	3	$2b$10$/Pvo67TNaZ26LVq4zl5wv.9Ftug/G.57.Ked3yqXj23wl8yAMhEfG	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-15 08:10:07.597	2026-06-15 07:55:53.237	2026-06-22 07:55:53.223	8dbbda82-81a0-47eb-9831-172d411c6890
536	3	$2b$10$mRgSDQY491EMZip9C149TOHHbJo.wp8jvJvRRuEyfW43yiQK8GT0G	unknown	::ffff:127.0.0.1	unknown	t	2026-06-15 08:29:30.842	2026-06-15 08:29:30.842	2026-06-22 08:29:30.836	1fe70132-2bd8-4d58-8d8d-e28f2999400a
537	3	$2b$10$1Rq.n8.zeBws4W7Z0N.c9u/3xz3XhRahLDx4Urv0uv9Ky4S5thcOq	unknown	::ffff:127.0.0.1	unknown	t	2026-06-15 08:29:31.196	2026-06-15 08:29:31.196	2026-06-22 08:29:31.196	93f79115-9635-440b-88cb-41104099d8e8
538	3	$2b$10$nyr5OPUxma9w3dFDFqp5/.lxuNJNVsD00n7p/Vf43R4qU5TxUOFue	unknown	::ffff:127.0.0.1	unknown	t	2026-06-15 08:29:31.334	2026-06-15 08:29:31.334	2026-06-22 08:29:31.332	8a5f7623-78d5-4d69-8ccf-de6bc78ed2f4
539	3	$2b$10$fWuOddQhHzQ9NBkKxKGEWe1dffmwH8UX5eM3C/Ywz9UKKWCqR27E2	unknown	::ffff:127.0.0.1	unknown	t	2026-06-15 08:29:31.48	2026-06-15 08:29:31.48	2026-06-22 08:29:31.479	43cf44dd-b249-4dfd-982d-21c739bd02b8
540	3	$2b$10$3Hsa7rbFoIxh24Xob8tevervPgwNtkMy83voZP.y0sKCQkTIJFc7u	unknown	::ffff:127.0.0.1	unknown	t	2026-06-15 08:29:31.621	2026-06-15 08:29:31.621	2026-06-22 08:29:31.62	720b4ac3-572e-42c9-bfaf-c97ebc9236a4
541	3	$2b$10$GIZFas9yjv7/AzzW5n.Ps.lrPDiJOcY9M6mBlDkrgieMYOcFbW8ZG	unknown	::ffff:127.0.0.1	unknown	t	2026-06-15 08:29:31.78	2026-06-15 08:29:31.78	2026-06-22 08:29:31.779	bf656d44-1934-4ebc-a512-98577e23819d
542	3	$2b$10$J6A1rVt8SqmyVvMwn1U46ORl7g9XAAk.UPUrwOfbkvoissudQ0.3a	unknown	::ffff:127.0.0.1	unknown	t	2026-06-15 08:29:31.959	2026-06-15 08:29:31.959	2026-06-22 08:29:31.959	d2b6c589-a70a-4727-96da-3ba2817fd6ce
543	3	$2b$10$DQ.oGmb2o2S0//o0gJu8NewysOwThq0Lf92X6SYTDbUzdhZ9IzYai	unknown	::ffff:127.0.0.1	unknown	t	2026-06-15 08:29:32.085	2026-06-15 08:29:32.085	2026-06-22 08:29:32.085	f50e11dd-cf1f-42de-abe4-9105f9142922
545	10	$2b$10$/CY7Bae/tRmcP3riuFohfeOQtm0cJxVxJEUiXbp1bNfkmFOcs7IQS	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-15 09:05:31.652	2026-06-15 09:00:15.664	2026-06-22 09:00:15.637	1c75263a-3d75-41cd-994a-2ffa1cf84295
547	3	$2b$10$B.JzAPwtvRi4FnVD8OhBceijSKIVX8kdFDB9qvSG1HqfmzuJlCBSS	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-15 09:16:47.921	2026-06-15 09:16:47.921	2026-06-22 09:16:47.896	e3d6ca7e-d58f-4c07-ad90-15a7ec958688
549	3	$2b$10$mX/K0x.B4BPpYjLqNg5Sgu03zG3A3r4P4chR01LnfTu1HlTLZpGFi	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-16 04:59:20.667	2026-06-16 04:51:07.178	2026-06-23 04:51:07.156	3540bce3-d37a-4849-baad-480100565a2b
551	3	$2b$10$AsBQoVi3xU27paZNbAkVPOQJt15AZyq08jtN0FyPBhhNsV6bazr6O	unknown	::ffff:127.0.0.1	unknown	t	2026-06-16 05:57:06.456	2026-06-16 05:57:06.456	2026-06-23 05:57:06.447	fe481364-097d-4841-9c7b-acaf748f5585
552	3	$2b$10$0P/O/KPgGlyZVmEJ0cfAKOyp0SCOVKUyUpETvrTiw5XCtb3pcicOq	unknown	::ffff:127.0.0.1	unknown	t	2026-06-16 05:57:06.761	2026-06-16 05:57:06.761	2026-06-23 05:57:06.76	80f3a2d1-6757-402c-a55d-89660271d5bd
553	3	$2b$10$F6JiubZoDWkJFfyJtwvq9.Yd3EK9lDc3k.uxg2iohxqcyjKF2nLT6	unknown	::ffff:127.0.0.1	unknown	t	2026-06-16 05:57:06.922	2026-06-16 05:57:06.922	2026-06-23 05:57:06.922	aedd6217-9908-42f5-960d-c7fa132a03d4
554	3	$2b$10$GTYaD3swt.UDxSGuXoRateVE.7dMNFXppg6pDfY5Gvvqxo0/IID7W	unknown	::ffff:127.0.0.1	unknown	t	2026-06-16 05:57:07.055	2026-06-16 05:57:07.055	2026-06-23 05:57:07.054	479ba239-e6b4-4506-95c5-30f325ba4209
529	3	$2b$10$ecxg7BeKcSMXRuY4qctuzevyZROKUj9rJkTTlIk4g2h90uiRs5VMO	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-15 04:47:18.619	2026-06-15 04:42:41.047	2026-06-22 04:42:41.024	896dd47b-5cee-4910-bbc4-f77392ff98df
531	3	$2b$10$u7MgbNK9p4IXtMkIBONa5ukPTlZFbE6ZfFgQCN1hR65M5y0IiGz5i	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-15 07:42:42.809	2026-06-15 07:40:35.779	2026-06-22 07:40:35.765	b14eb925-0460-4100-bc82-41a13510d7d8
533	3	$2b$10$8rA3BrWCgshThEosy6d1YeFXnF52ll0HvTp4Imsy3uWAMmyWK3Ks6	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-15 08:08:56.81	2026-06-15 08:08:56.81	2026-06-22 08:08:56.801	c12f8b5a-d568-4b47-8570-3be1d71082d5
535	3	$2b$10$miruPc/I4WbvMc6Q0YjZ6OnxeC.u0RlrOZ/7f35IrmXgUgeOGhjoe	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-15 08:20:25.855	2026-06-15 08:20:25.855	2026-06-22 08:20:25.808	e1522e8d-01e9-41e4-ae8e-7ac51ffc4f05
544	10	$2b$10$vQP7a1kyVnw0.8TZK/5MWe72pTkoZ601G6LA1A7DtQEI2lzCbN7F6	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-15 08:35:45.693	2026-06-15 08:35:45.693	2026-06-22 08:35:45.665	a83852a1-d448-441d-b2c9-c373d77f5f9e
546	3	$2b$10$k13zspHxffKDrrIiMZeojOEbpHjJsMUSAo1r0wPIwEHTfC9oRHuzO	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-15 09:02:12.343	2026-06-15 09:00:56.907	2026-06-22 09:00:56.906	0e01e406-fcb9-4557-83b3-a39299794da8
548	3	$2b$10$gBVRlOfaCuGT8AKTjgRtJukL2KOev2Tlanitd7sN10Z6XKw/WpO1m	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-16 04:39:26.342	2026-06-16 04:39:26.342	2026-06-23 04:39:26.332	0c354d42-d145-4485-85b5-48292c864a38
550	3	$2b$10$sXPCbeOeze6m2/FdQ7lbbeTSlFZE5X0cL2sEtBehfC4hBXIHBa/dS	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-16 05:55:32.204	2026-06-16 05:48:16.332	2026-06-23 05:48:16.286	8f8d8f12-063a-41cc-a8e6-fd3de1f41fd0
555	3	$2b$10$O9Do147bxI6YcuK6fAt9.OUGWNxV0nrmaWWZpc5F4HMMh/N7phYa.	unknown	::ffff:127.0.0.1	unknown	t	2026-06-16 05:58:48.556	2026-06-16 05:58:48.556	2026-06-23 05:58:48.551	578c9316-30f7-48a7-a721-86e26c1042b2
556	3	$2b$10$zNUcSRPDUkcLueb3ZUKirOKF.46M4Y3jrQd5VugI.e06ZwbZnHnWu	unknown	::ffff:127.0.0.1	unknown	t	2026-06-16 05:58:48.83	2026-06-16 05:58:48.83	2026-06-23 05:58:48.83	073078da-6a4d-4c99-924e-30c31b896d2c
557	3	$2b$10$6B6NdzqTYZMvElLU/D9Uy.yHZPWWz/yrBCN4onRoXeUElim9WWU4W	unknown	::ffff:127.0.0.1	unknown	t	2026-06-16 05:58:48.976	2026-06-16 05:58:48.976	2026-06-23 05:58:48.976	2e81968f-3ca1-4c31-8e8e-86306a6bfbb9
558	3	$2b$10$/Qhw9yWbBbKjdPM4yboK/eYJat5hX.9aOyc2Xuk5lqMBxuX8OUGjm	unknown	::ffff:127.0.0.1	unknown	t	2026-06-16 05:58:49.106	2026-06-16 05:58:49.106	2026-06-23 05:58:49.106	aa172cff-5fbd-4949-ad6f-f358f4712233
560	3	$2b$10$kKZk7G.jg3TCDrjjcAciZ.rVkSELhcsZIHrjH8U5HFIcG7YdXpHUa	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-16 06:33:12.688	2026-06-16 06:33:12.688	2026-06-23 06:33:12.635	91d8a0c4-02b1-4aab-807c-140ffbca9fc9
562	3	$2b$10$tUWc3rFYCBd3L0iVVfpiJeKi/Etvtmd0oqL4zojzkBy0f1UrQBlwC	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-16 08:20:54.529	2026-06-16 08:14:57.247	2026-06-23 08:14:57.236	53f0c634-8627-4a9a-9c15-3e6e5683db2f
564	3	$2b$10$lj1dG.NmTBJjcLjmFcXX/uSstvwb7DH2LqdHRafea5I8Rl9N3LIW6	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-24 04:46:03.169	2026-06-24 04:42:57.879	2026-07-01 04:42:57.864	3ee0dc81-7cc6-4977-96c8-716a85cd6c32
565	3	$2b$10$c9NUN3rKkpKFOc3/knpWPec8/UmGVAlX6ZKH/boEfGpmjJiAitLyS	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-24 10:31:11.851	2026-06-24 10:16:56.428	2026-07-01 10:16:56.401	04775ef1-6d75-4658-a519-28aa9f934940
566	3	$2b$10$qMZokTjJmE44taj1d27XDOcAJCL0XnXMEozOSzBURpUkFfKlDzXhC	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-24 10:59:08.387	2026-06-24 10:48:22.132	2026-07-01 10:48:22.111	a5905056-05d4-4221-80b7-924177cc1e45
567	3	$2b$10$fvAJNHLByzJPSrxBix3BguXlQxjC.Dz77Wc1rf0LRTOeMvz30oDrW	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-24 11:19:34.224	2026-06-24 11:06:08.806	2026-07-01 11:06:08.785	7c64bffe-10ff-491c-bf87-2822b3b656a7
568	3	$2b$10$ClXggkYY0eKaKSBtq0O4qONyKiUPgMYZf5FGpfqkaPHAUcudzQclK	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-24 11:35:07.274	2026-06-24 11:29:30.643	2026-07-01 11:29:30.634	2dcb8efe-4d99-4ebe-a4d3-8b9ecfffd3c7
569	3	$2b$10$DTSiJkWVGweCC8iuha/hmOwDOuLs95FYt0NdCE3MWCe.macwFCVTi	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-24 14:37:22.746	2026-06-24 14:22:59.567	2026-07-01 14:22:59.55	bd41bec6-8d14-4061-98ed-84df2f600658
570	3	$2b$10$F.dEnTTlb.en/bnYBVw2Au2ySwUtMDexXbMiCuHWeGR4di1LqTkA6	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-24 14:39:45.307	2026-06-24 14:38:42.214	2026-07-01 14:38:42.209	f22119ba-6784-459e-bcb7-08310867ba51
583	10	$2b$10$VlRzfSRwcXrhZKn2gMwOHuQG6KyeS6RRVqsm/U1XaHTa/S1JDiENO	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-28 12:59:17.269	2026-06-28 12:47:38.451	2026-07-05 12:47:38.431	ff40dccc-4d18-442b-928d-346f899f59af
571	3	$2b$10$14k6iZGtaXXXH/Wbg.2bM.3nlf8rM8xYh.woRDa6qI2JrC2NZsCT.	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-25 14:00:03.815	2026-06-25 13:50:59.188	2026-07-02 13:50:59.172	25eb94d2-f0b4-49d0-9f8c-b2854cb43b53
572	3	$2b$10$5KSSrP5rVlqUij1RWFE6TOWs2D6nUn9LRAJbvFNi.68cXPS95Bfma	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-25 14:12:06.227	2026-06-25 14:07:27.958	2026-07-02 14:07:27.943	e7b03ed7-c8df-4148-b47e-7c6acb18103c
573	3	$2b$10$ZrGOrYvRX4KsmVK2k/KBMulcCjeaujlaQkHyp9EirWYda.RA9dJ9u	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-25 14:28:45.684	2026-06-25 14:28:45.684	2026-07-02 14:28:45.669	73fdf56a-f1be-4bbe-a15c-4b7c36ef6e2d
574	3	$2b$10$uRVqirQGcvCz0YJrrAxM5.ceBCvgoC9sAiSoS4o2VaQ9TUwSGcQ3K	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-25 15:31:00.772	2026-06-25 15:31:00.772	2026-07-02 15:31:00.754	94399d0c-243a-4e02-9dd2-00b77aea5109
584	2	$2b$10$8NqRjpSFOcFhaut6yubJL.jFWB0Z36bh6s052T.q950qqYFsoVgfm	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-28 13:54:45.682	2026-06-28 13:54:45.682	2026-07-05 13:54:45.665	b59c05ff-3aa9-4d90-9dc5-af6f59bbb9f9
585	3	$2b$10$KKKpoaJygWwhWfP6nYCo.Ocoap/2DRnkvUGd3P1u/mH35gNO7QmSq	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-28 13:56:24.943	2026-06-28 13:55:17.442	2026-07-05 13:55:17.441	e40e8c9a-8378-43d7-a8c6-54ed37ddad1f
586	3	$2b$10$3bO.ltdsuPG6ZCgByeoi/eKPydcQ0GVfxG/UiUcZmbUb4/oEk1gXO	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-28 14:06:16.192	2026-06-28 14:06:16.192	2026-07-05 14:06:16.181	c6d6f10f-2c38-49b8-81d6-60e8ffb94a25
587	3	$2b$10$GosN/OwZfLABIYi9cfHK2.1w9GyH9LVViG3XdUX6PBk3sj9PfJiHi	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-28 15:39:53.368	2026-06-28 15:39:53.368	2026-07-05 15:39:53.359	7e2b8eee-94a7-4eee-9b2a-4bcb7f239099
575	3	$2b$10$VweUUZKhbdnOBP6R2fmfF.O5zfWGgPeGrn0ZJECpTbQQfJGzAYRJ.	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-26 15:12:43.351	2026-06-26 14:59:47.823	2026-07-03 14:59:47.805	49075bfe-959d-4443-9599-ce93ab918698
576	3	$2b$10$Uk9yDeODFKBDkncL.sybhOWNaEMeSfX2poWMrz4VD0txWNq/RfwKe	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-26 15:23:45.503	2026-06-26 15:23:45.503	2026-07-03 15:23:45.486	fdba555a-28f2-4575-807e-8ec6bdec5a7c
577	3	$2b$10$ymk9rr0aku53UAbW3mSu1uVJmg.2BupP8PgTWw/RdiaowZyDqUAK6	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-26 15:32:19.883	2026-06-26 15:30:12.057	2026-07-03 15:30:12.037	b5e4de84-7d80-41bb-bdd4-09e39f5bd440
588	3	$2b$10$SjKVm9F55ZBD0I.1MS1GP.aj70gRG6N7pq0WESd.w3QTN.L1551.G	unknown	::ffff:127.0.0.1	unknown	t	2026-06-28 15:42:39.338	2026-06-28 15:42:39.338	2026-07-05 15:42:39.329	33a0c8ae-1d9b-41d8-92df-8d1f3e436f87
589	3	$2b$10$sJy2yH1QcagmcwwmzsiN2.OeO7zamycs2D0w10lpDLrlokarS67pK	unknown	::ffff:127.0.0.1	unknown	t	2026-06-28 15:42:39.692	2026-06-28 15:42:39.692	2026-07-05 15:42:39.691	6a8c1da0-83ae-4005-bba3-c42ee0fe706d
590	3	$2b$10$b1R/1x63pkrLfPbPqot7OOT81aBmVORZViRzOrLzYfAejOVmyAePe	unknown	::ffff:127.0.0.1	unknown	t	2026-06-28 15:42:39.891	2026-06-28 15:42:39.891	2026-07-05 15:42:39.89	63a93ca5-055e-430a-8235-6ae17123af7e
578	3	$2b$10$vsv4LyKlnk95gSb2qbzQU.d.Il7jg.ysFUW02B23QVEDFkmy4wsYa	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-26 15:46:11.703	2026-06-26 15:40:52.26	2026-07-03 15:40:52.257	8d791dd8-032a-4b96-bbf0-7b3c8a18e14b
579	3	$2b$10$V1sMRjQoLF7y4FuKeiKUFO5pPVYXctEeUkAPYiYYF6SqQ4B5fs1WW	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-26 15:59:48.25	2026-06-26 15:59:48.25	2026-07-03 15:59:48.234	0a9a648a-b2ea-4cbb-aa70-a0176e2d4145
580	3	$2b$10$m8nM2087sO302xZpk6K1Cuom.VwNJdOJuCZmEsA6FVAHMwx40kv8S	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-27 12:42:59.387	2026-06-27 12:38:20.311	2026-07-04 12:38:20.294	c52e3e6e-dd32-4d47-ac2b-a7c93e6ce987
581	3	$2b$10$LqOn5gGsMawl6LBKf2Y31eljelGct2KHS.QDIAQ/YdVz7wJxEDY.u	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-27 12:57:45.288	2026-06-27 12:57:45.288	2026-07-04 12:57:45.271	23a65fc4-612d-442a-b889-deb8ee879585
582	10	$2b$10$gCdaQkE.pGwDmRfVdmw36uhHwiT4bu5ABG1lG/rIG1A5ko1it0DxO	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-27 12:58:29.515	2026-06-27 12:58:29.515	2026-07-04 12:58:29.514	d0f58fa8-444d-4b24-9d62-8ea44a96c637
591	3	$2b$10$pI6VIA3CjCXZHV2xmGzycO19iHo0BfjfRwPasqMfcYK0Pua6qut2e	unknown	::ffff:127.0.0.1	unknown	t	2026-06-29 05:31:03.413	2026-06-29 05:31:03.413	2026-07-06 05:31:03.364	6e71da08-b215-4858-b3b6-eda6f8d478eb
592	3	$2b$10$XYm3vSJRq43HINfpgPOCMOn9GnsoC8LFlkr3gBhDI0JmExp/EkYsy	unknown	::ffff:127.0.0.1	unknown	t	2026-06-29 05:31:04.709	2026-06-29 05:31:04.709	2026-07-06 05:31:04.708	33599898-f35c-4d34-b47e-862ff401f80c
593	3	$2b$10$DpE5pYvYccaqFl3hKINI2uFA9fCn8LXJrbh.T/uzh9zoxY0TnhUs.	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-29 07:19:28.288	2026-06-29 07:19:28.288	2026-07-06 07:19:28.251	2748c20c-66b7-4ff3-b8b8-ab85dd515214
595	10	$2b$10$8isyYFZryb4OicbF1DPl4.3ZrK3exlRP82mQK9w33za7Q2.PK7ypW	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-29 07:23:02.819	2026-06-29 07:23:02.819	2026-07-06 07:23:02.818	d06f14f1-5030-4b9e-92f6-d34d9e154af8
594	3	$2b$10$vxbSDyvPEcrKtNNlIbVjKOQtigbL0Jzvzs6VJm7liiVb8RUvc5NGu	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-29 07:23:34.525	2026-06-29 07:21:30.897	2026-07-06 07:21:30.893	0aa49ec2-6932-43bb-9075-4c93397715f1
596	8	$2b$10$Ju1G8lqjVbBjlrR9CZjgPuXv1VlvlnMGpOcSAnqZac5a4ogBsFqYG	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-29 07:33:41.258	2026-06-29 07:32:05.453	2026-07-06 07:32:05.345	af56e381-2f5b-4da7-bccf-36c36ac5add2
597	8	$2b$10$s10O.GKpjLK00yRpiOAWt.sF4KbXBVsdd4avj54JwgXs2oTgJEgeG	unknown	::ffff:127.0.0.1	unknown	t	2026-06-29 07:57:16.434	2026-06-29 07:57:16.434	2026-07-06 07:57:16.418	472f979f-ffcb-414d-90a6-6a4e3f453ca0
598	8	$2b$10$CXcKDHYZ2Ojblr/MJlDoXe8a3.KNiR0t95XwcFwb6s5ukfiVp/YjC	unknown	::ffff:127.0.0.1	unknown	t	2026-06-29 07:57:16.883	2026-06-29 07:57:16.883	2026-07-06 07:57:16.882	57b086b4-ec94-44f6-8863-520db5e66b83
599	8	$2b$10$M1y4f7CepLxtCYoekrmQMuw/gQysoIzNialyPeSp9XYmuw4Io5FKq	unknown	::ffff:127.0.0.1	unknown	t	2026-06-29 07:57:17.071	2026-06-29 07:57:17.071	2026-07-06 07:57:17.07	acc06a9e-f8fe-4941-81f4-25ea2e4f2716
600	8	$2b$10$8vmxOxRvH170qtmmFFoR2OKVkQeI2qpoPDAb/Qz/X2Pe8jdUDVGyK	unknown	::ffff:127.0.0.1	unknown	t	2026-06-29 07:57:17.249	2026-06-29 07:57:17.249	2026-07-06 07:57:17.248	cdb5b9e5-aebc-4104-8686-7468180f6e15
601	8	$2b$10$hiY2k7hx/J4EK/VW9zl.R.vCXpVaiV//3y4SJtNRZqN9KmiK8ADI6	unknown	::ffff:127.0.0.1	unknown	t	2026-06-29 07:57:17.407	2026-06-29 07:57:17.407	2026-07-06 07:57:17.406	e54f156b-98e2-4107-8b3f-da7517f94eb9
602	8	$2b$10$6b.09H1uYQwXtkK5Ymzvh.TgU.ra5CRCRJz4644TiCze4ThlZYpRm	unknown	::ffff:127.0.0.1	unknown	t	2026-06-29 08:00:02.022	2026-06-29 08:00:02.022	2026-07-06 08:00:02.011	dc781299-6223-496a-9f7d-ffc5192e0bb8
603	8	$2b$10$gJFDQVH9F.fOJMj5SMRtkO8V4q.TmOovurzzJiwFANYDlZ8qsXmna	unknown	::ffff:127.0.0.1	unknown	t	2026-06-29 08:00:02.455	2026-06-29 08:00:02.455	2026-07-06 08:00:02.454	e64159be-bbda-49fc-bfdf-97766883fcca
604	8	$2b$10$K0j.8gFbGrdu3IyBjVxOhO3waAtQVNibx2bzNDlY/pQphqV.pprAa	unknown	::ffff:127.0.0.1	unknown	t	2026-06-29 08:00:02.608	2026-06-29 08:00:02.608	2026-07-06 08:00:02.607	3d7baec9-d735-487f-b3b9-0ff91c6dc16b
605	8	$2b$10$KzyofaLoSt/yEyYTqwAg1eAeBtSr8XlZU3YYhkkBfQQBmysVs1qiq	unknown	::ffff:127.0.0.1	unknown	t	2026-06-29 08:00:02.813	2026-06-29 08:00:02.813	2026-07-06 08:00:02.813	6dc92f50-c181-4d9d-a638-f72d163727ee
606	8	$2b$10$CNP2s8mZJfyvsJbDNRxljuemaqu5r.nPvggH.hUV/jfpAElqwzwHW	unknown	::ffff:127.0.0.1	unknown	t	2026-06-29 08:00:02.961	2026-06-29 08:00:02.961	2026-07-06 08:00:02.961	ff18260b-ee71-4a29-a9a6-4ebab7b5370c
607	8	$2b$10$6lxHxOOBR7yMVm/Gz/YceueRUYEFZI/XTbyMR5Q/Apdhn7TLQgCIS	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-29 08:29:43.377	2026-06-29 08:29:43.377	2026-07-06 08:29:43.323	87fc5e6c-0eef-4d29-96cf-cb7fdeaf4fd7
608	8	$2b$10$fJF7TnhnCNa.pLCzpHPSweC/Qn4Msj6nuFXgOWU.AFnrLfu6Vm1sW	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-30 14:57:55.163	2026-06-30 14:57:55.163	2026-07-07 14:57:55.146	86baa1b1-25fc-4d1e-a857-a0690ef913b4
610	8	$2b$10$.9u7zj1M7OxCOpaMsD5WkOgn4ZwxQVwA6KC8uEdFWhxUg2BPftO5W	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-30 15:01:09.509	2026-06-30 14:59:16.593	2026-07-07 14:59:16.592	8efd9f8c-2930-451c-b9c1-7f716e8272e4
609	10	$2b$10$nObOqWGyklaLVQrz2DGNCeVTQn0NnUqSXZx1h.peqYeD.C6zlRgPK	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-30 15:04:20.564	2026-06-30 14:58:08.744	2026-07-07 14:58:08.744	9553e0ac-ea4f-4914-95cb-6580cef951d3
611	8	$2b$10$kIuBqBGBWHltqC6a7XkW7O1FW66RGqXXIhCJzh0/.ZDL0HlqFhify	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-30 15:17:15.269	2026-06-30 15:17:15.269	2026-07-07 15:17:15.253	353de3d7-9b8c-452c-8e50-62bd97231c68
612	8	$2b$10$75TT3DTfcGV54lZqLnKKFe0fMiwWZ339RjHLAy83L.yqhxjoOQcD.	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-30 15:19:52.895	2026-06-30 15:18:31.992	2026-07-07 15:18:31.991	e03f4bc0-9008-4ee5-8e36-ec4a30993242
613	10	$2b$10$dfKBP5IGo3LQyCVpQOv.ZOw7pBLXGSR7jtwTUmv2hWYJSY2G4p64y	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-30 15:24:15.404	2026-06-30 15:20:08.233	2026-07-07 15:20:08.23	2f313361-9e85-493e-b631-bc222835a9ee
614	10	$2b$10$swoe6xmzr6m8ZJ2Xaqw9z.DPqVPtJbxPvDMrl4looZo9/1VBMmZTm	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-30 15:47:26.385	2026-06-30 15:45:28.25	2026-07-07 15:45:28.231	c6a096e1-9b9d-4a38-994f-16bcd2176b54
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
\.


--
-- Name: AuditLog_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."AuditLog_id_seq"', 845, true);


--
-- Name: BreakdownAction_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."BreakdownAction_id_seq"', 6, true);


--
-- Name: BreakdownReport_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."BreakdownReport_id_seq"', 5, true);


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

SELECT pg_catalog.setval('maintix."Department_id_seq"', 13, true);


--
-- Name: EmailVerification_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."EmailVerification_id_seq"', 1, false);


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

SELECT pg_catalog.setval('maintix."Invitation_id_seq"', 9, true);


--
-- Name: Location_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."Location_id_seq"', 7, true);


--
-- Name: Notification_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."Notification_id_seq"', 1, false);


--
-- Name: Organization_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."Organization_id_seq"', 3, true);


--
-- Name: PMSchedule_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."PMSchedule_id_seq"', 7, true);


--
-- Name: PMTask_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."PMTask_id_seq"', 24, true);


--
-- Name: PasswordReset_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."PasswordReset_id_seq"', 1, false);


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

SELECT pg_catalog.setval('maintix."UserDepartment_id_seq"', 3, true);


--
-- Name: UserRole_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."UserRole_id_seq"', 25, true);


--
-- Name: UserSession_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."UserSession_id_seq"', 614, true);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."User_id_seq"', 12, true);


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
-- Name: Notification_createdAt_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "Notification_createdAt_idx" ON maintix."Notification" USING btree ("createdAt");


--
-- Name: Notification_isRead_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "Notification_isRead_idx" ON maintix."Notification" USING btree ("isRead");


--
-- Name: Notification_organizationId_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "Notification_organizationId_idx" ON maintix."Notification" USING btree ("organizationId");


--
-- Name: Notification_userId_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "Notification_userId_idx" ON maintix."Notification" USING btree ("userId");


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

\unrestrict mwd9jMsf1gABA94PTXjIPshXJbvub5fZp7cXQHFRJNC9saQtaijDt2XV7pyl5MA

