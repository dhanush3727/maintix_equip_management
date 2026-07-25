--
-- PostgreSQL database dump
--

\restrict c2VZT8y1IqmShMIHArZw5P5txt8oIaEHV5YhdI3Z4nun3zDYMpEh68DkI1VyADy

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
    "isSetupCompleted" maintix."OnboardingStep" DEFAULT 'ORGANIZATION'::maintix."OnboardingStep" NOT NULL
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
9	3	10	SCHEDULE_ASSIGNED	PM Schedule Assigned	You have been assigned a PM schedule for "Pump".	15	SCHEDULE	f	2026-07-03 10:50:27.575	\N
11	3	10	BREAKDOWN_ASSIGNED	Breakdown Assigned	You have been assigned a breakdown for Screw	7	BREAKDOWN	f	2026-07-03 10:51:52.678	\N
13	3	10	BREAKDOWN_ASSIGNED	Breakdown Assigned	You have been assigned a breakdown for Screw	9	BREAKDOWN	f	2026-07-03 10:52:08.358	\N
\.


--
-- Data for Name: Organization; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."Organization" (id, name, slug, "industryType", "companySize", country, city, "logoUrl", "isActive", "createdAt", "updatedAt", "logoPublicId", "isSetupCompleted") FROM stdin;
2	DC Equipments	dc-equipments-faab32	\N	\N	\N	\N	\N	t	2026-05-27 10:16:53.948	2026-05-27 10:16:53.948	\N	ORGANIZATION
3	CD Equipments	cd-equipments-cdd0a4	MANUFACTURING	SMALL	India	Chennai	https://res.cloudinary.com/dxzdsnaye/image/upload/v1779949167/maintix/f9yjgge0y1ninitib9aq.png	t	2026-05-27 10:17:22.492	2026-05-28 06:21:57.983	maintix/f9yjgge0y1ninitib9aq	ORGANIZATION
4	DC equipments	dc-equipments-e1f0c2	\N	\N	\N	\N	\N	t	2026-07-23 05:33:21.816	2026-07-23 05:33:21.816	\N	ORGANIZATION
5	PS Construction	ps-construction-6b4348	\N	\N	\N	\N	\N	t	2026-07-23 09:02:44.661	2026-07-23 09:02:44.661	\N	ORGANIZATION
6	Web Head	web-head-327e7f	\N	\N	\N	\N	\N	t	2026-07-23 09:08:26.913	2026-07-23 09:08:26.913	\N	ORGANIZATION
7	DC Construction	dc-construction-8892f1	\N	\N	\N	\N	\N	t	2026-07-23 09:52:10.478	2026-07-23 09:52:10.478	\N	ORGANIZATION
8	test	test-b88a0f	\N	\N	\N	\N	\N	t	2026-07-23 10:18:23.857	2026-07-23 10:18:23.857	\N	ORGANIZATION
9	DC equipments	dc-equipments-2c1c4a	\N	\N	\N	\N	\N	t	2026-07-24 08:10:38.097	2026-07-24 08:10:38.097	\N	ORGANIZATION
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
3	Charu	dhanush7825@gmail.com	2026-05-27 10:17:22.496	t	f	\N	3	$2b$10$ZMdO7/xBGcpbjpOEU3hxnOoJvDXiVixFAaS0zhIf6FbFdK7IvlrUG	2026-06-04 05:23:27.672
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
19	Dhanush	dhanush@test.com	2026-07-23 10:18:23.915	t	f	\N	8	$2b$10$k66CWRaAS/hpppKo2JmlkO1yapCPpzuqhBPw/NE/925ZlbpqgQIKW	2026-07-23 10:18:23.915
2	Dhanush kumar	dhanush3727@gmail.com	2026-05-27 10:16:53.958	t	t	\N	2	$2b$10$YP.xX.dJzlLMuu7gPpT0auwPcM/WD0PI0uAQY52Gu85ZPsbsoGdp.	2026-07-24 07:54:19.254
20	Technician	dhanush8@maintix.com	2026-07-24 08:10:38.12	t	f	\N	9	$2b$10$ZKy5D86z.f42/zTGFoWvrex.xGjWQPfmfW3xVL6Ws8Wfy4DPZ/lU.	2026-07-24 08:10:38.12
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
26	13	4
27	14	3
28	15	1
29	16	1
30	17	1
31	18	1
32	19	1
33	20	1
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
\.


--
-- Name: AuditLog_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."AuditLog_id_seq"', 1123, true);


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

SELECT pg_catalog.setval('maintix."Department_id_seq"', 13, true);


--
-- Name: EmailVerification_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."EmailVerification_id_seq"', 17, true);


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

SELECT pg_catalog.setval('maintix."Notification_id_seq"', 13, true);


--
-- Name: Organization_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."Organization_id_seq"', 9, true);


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

SELECT pg_catalog.setval('maintix."UserDepartment_id_seq"', 3, true);


--
-- Name: UserRole_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."UserRole_id_seq"', 33, true);


--
-- Name: UserSession_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."UserSession_id_seq"', 811, true);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."User_id_seq"', 20, true);


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

\unrestrict c2VZT8y1IqmShMIHArZw5P5txt8oIaEHV5YhdI3Z4nun3zDYMpEh68DkI1VyADy

