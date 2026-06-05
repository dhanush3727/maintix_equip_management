--
-- PostgreSQL database dump
--

\restrict Uhv0ZBnSgP6cWxwTfWRAKZ6pZPfI1PNAEwBLtwIbTAaeUYcKyI5o1pwhSKynwy6

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
DROP INDEX maintix."TaskChecklistItem_taskId_idx";
DROP INDEX maintix."Role_name_key";
DROP INDEX maintix."PasswordReset_userId_idx";
DROP INDEX maintix."PasswordReset_token_key";
DROP INDEX maintix."PasswordReset_expiresAt_idx";
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
DROP INDEX maintix."ChecklistTemplate_organizationId_idx";
DROP INDEX maintix."ChecklistTemplate_equipmentTypeId_idx";
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
    "rootCause" text NOT NULL,
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
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
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
    "updatedAt" timestamp(3) without time zone NOT NULL
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
    "updatedAt" timestamp(3) without time zone NOT NULL
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
    "updatedAt" timestamp(3) without time zone NOT NULL
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
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
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
\.


--
-- Data for Name: BreakdownAction; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."BreakdownAction" (id, "breakdownId", "performedBy", action, remarks, "createdAt") FROM stdin;
\.


--
-- Data for Name: BreakdownReport; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."BreakdownReport" (id, "organizationId", "equipmentId", "reportedBy", "assignedTo", title, "rootCause", description, severity, status, "reportedAt", "resolvedAt", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: ChecklistItem; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."ChecklistItem" (id, "templateId", name, "order", "expectedValue", "createdAt") FROM stdin;
\.


--
-- Data for Name: ChecklistTemplate; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."ChecklistTemplate" (id, "organizationId", "equipmentTypeId", name, description, "createdAt", "updatedAt") FROM stdin;
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
\.


--
-- Data for Name: EquipmentType; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."EquipmentType" (id, "organizationId", name, code, description, "isActive", "createdAt", "updatedAt") FROM stdin;
1	3	Mechanical	\N	\N	t	2026-06-05 06:21:32.239	2026-06-05 06:21:32.239
3	3	Civil	CIVIL	\N	t	2026-06-05 06:23:18.97	2026-06-05 06:23:18.97
6	3	Instrumentation	INSTRUMENT	This is the instrumentation type	t	2026-06-05 06:56:02.271	2026-06-05 06:56:02.271
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

COPY maintix."PMSchedule" (id, "organizationId", "equipmentId", "templateId", "frequencyType", "interval", "startDate", "nextDueDate", "assignedTo", "isActive", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: PMTask; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."PMTask" (id, "organizationId", "scheduleId", "equipmentId", "templateId", "assignedTo", "dueDate", "completedAt", status, priority, remarks, "createdAt", "updatedAt") FROM stdin;
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

COPY maintix."TaskChecklistItem" (id, "taskId", name, "order", "expectedValue", "actualValue", status, "createdAt") FROM stdin;
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix."User" (id, name, email, "createdAt", "isActive", "isEmailVerified", "lastLoginAt", "organizationId", "passwordHash", "updatedAt") FROM stdin;
3	Charu	dhanush7825@gmail.com	2026-05-27 10:17:22.496	t	f	\N	3	$2b$10$ZMdO7/xBGcpbjpOEU3hxnOoJvDXiVixFAaS0zhIf6FbFdK7IvlrUG	2026-06-04 05:23:27.672
2	Dhanush kumar	dhanush3727@gmail.com	2026-05-27 10:16:53.958	t	f	\N	2	$2b$10$2SNQJ2nd4P5upH.pYYHOt.pi1a0BJn1wKZTIi2edxKs96GhW7Mh0e	2026-06-04 05:31:01.546
4	John	dhanush1@gmail.com	2026-05-29 09:38:54.476	t	t	\N	3	$2b$10$2EzMpYFNkHk5RHqpnFsnL.6.UemjscxnL7096o4NQ1dTjNtoJXIWW	2026-06-04 09:05:53.889
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
41	3	$2b$10$gTpLNeG/y92q5QoJp7F6TuNcgVbqyzPNgmb/gxaERSymW5xnwXR5C	unknown	::ffff:127.0.0.1	unknown	f	2026-05-28 08:03:40.759	2026-05-28 08:03:40.759	2026-06-04 08:03:40.759	cf86bde1-fd97-4672-aafb-0fa3c5fd7fa5
143	2	$2b$10$QqYGiEd4uiEtpUxIrbTXl.xWY405q/3IOl5H7QZLOcxKq2I1XzTh2	unknown	::ffff:127.0.0.1	unknown	f	2026-06-03 05:07:04.634	2026-06-03 05:07:04.634	2026-06-10 05:07:04.634	c56257a4-a6b4-4124-a85c-41b23de50572
203	3	$2b$10$qWZZ.45WHVyaunlXEYyYNusqLkaYGzKaC6B5aH66OtO6fvWkOe872	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-04 08:12:07.702	2026-06-04 08:12:07.702	2026-06-11 08:12:07.685	10de9add-ff69-43d1-b6ab-935452e09698
106	4	$2b$10$zhzGyXSaNGumD/uBlFFWcOXTjiw4AyQXNXW3ifysMUHrI/3C3dbzi	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-29 09:39:22.534	2026-05-29 09:39:22.534	2026-06-05 09:39:22.534	ee031ba2-c6ac-4daf-9bc9-7148dc48af98
219	3	$2b$10$YdWZ6VzZqdCe8rK3AmzoVeJyFffADmPf6nHsYNIn34yeGW1H20oeq	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-05 04:06:10.049	2026-06-05 04:06:10.049	2026-06-12 04:06:10.013	caaf67a0-920b-40b3-bb4f-10589bf8109d
225	4	$2b$10$bQAP7O0kRpY/7NHT8hSZUutRnyN/q3AXxzWfqzX87msFvQJlHw5WK	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-05 06:25:45.708	2026-06-05 06:25:45.708	2026-06-12 06:25:45.707	00c1be23-38b5-42cf-a4d6-9c1264a7c11a
246	3	$2b$10$0rBbM5IZz1ZegtJTfVwuW.73U431luFy5VQXjOHgbrLp/MgHjM6Qy	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 08:54:07.368	2026-06-05 08:54:07.368	2026-06-12 08:54:07.367	14cb84f8-7daa-474d-93bc-6ec245fd5dcd
255	3	$2b$10$wU1l3a0tmzbq8SpB16gUEu1uldTTdo9HoaAQMpo26I51rcp9f8LPS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 09:19:25.098	2026-06-05 09:19:25.098	2026-06-12 09:19:25.097	38e7cc13-d919-4f4e-9d63-e99e0629abf3
256	3	$2b$10$ml2vS1J3E.AopBgLPmlpX..jamQPu3EAYDOHqa3XUv5rDQXxGA5BS	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 09:19:25.279	2026-06-05 09:19:25.279	2026-06-12 09:19:25.279	5a17921c-4c8e-41b2-93fa-f55e1d5cf98d
104	3	$2b$10$vDxXqWKNmhDGVXHAeiUFd.XmuOL9VU968iHG16NK1cA.OGQ3jZe.K	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-29 09:31:36.44	2026-05-29 09:20:19.675	2026-06-05 09:20:19.663	5ee278dc-8a8b-4861-812c-879dbeb7ad76
105	3	$2b$10$RfwdAyOLRYg9zFWWD7KXIuk7FpqtPp3lHJ1Mtm92YYOz2GFFqx0Q.	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	f	2026-05-29 09:36:50.988	2026-05-29 09:36:50.988	2026-06-05 09:36:50.983	1dca8763-8b64-4f99-9df3-dd0c8caa574d
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
220	3	$2b$10$kEHPcL5fwx/pdETI8c6GrOWp/fAbPwEdTQ98U6UX1RxfsOoJY87/W	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-05 04:17:29.152	2026-06-05 04:10:22.536	2026-06-12 04:10:22.535	1ac3d34f-1e6d-453c-a5fd-b35eaf748b33
226	3	$2b$10$8v6pOfyiADLajSwHpp16AOOynNxKu48yyV7DR3OVRpKWNwbLO09le	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-05 06:48:21.174	2026-06-05 06:48:21.174	2026-06-12 06:48:21.171	8a90cddb-4d7a-4091-b3db-291eb342c98e
247	3	$2b$10$B71PUrWnWhqBxwScVPUwcOsOl7G./AAmvXie8Q7ovQjpB9g73tmKm	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 09:01:34.152	2026-06-05 09:01:34.152	2026-06-12 09:01:34.146	322a06f3-2b03-4296-b95f-b8347767d01f
248	3	$2b$10$Mtvn9PTo3e5Cx0i7JzO1quNUxzTrHuaqJOSMNAhxOimFEL9YAwEdO	unknown	::ffff:127.0.0.1	unknown	t	2026-06-05 09:01:34.418	2026-06-05 09:01:34.418	2026-06-12 09:01:34.418	1b0f9074-d22e-4eb6-9965-01601785245b
257	3	$2b$10$mK9u5oRX4leoXTnVMuqJw.D3Fbx3dFZm1PQZRMmoZH79ARWBQuEZW	PostmanRuntime/7.54.0	::1	PostmanRuntime/7.54.0	t	2026-06-05 09:34:36.511	2026-06-05 09:25:01.658	2026-06-12 09:25:01.647	16480fe1-4355-489a-a8ba-e08a2db7defb
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
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: maintix; Owner: -
--

COPY maintix._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
54838640-ea2f-41ff-ba8e-2b3065f6e60e	b4402850a3c6541219bfcf25bf8ca80f005bea894d948f42b1c0392836b4c7ab	2026-05-27 15:43:11.52598+05:30	20260510102600_init	\N	\N	2026-05-27 15:43:11.503766+05:30	1
1b794e6d-1001-4907-9328-fa882cfe8fd5	6cf8851451c4178c2bfa78fde77fd3294f47438833db367100553e6ff2070dbf	2026-05-27 15:43:11.728392+05:30	20260513161309_schema_created	\N	\N	2026-05-27 15:43:11.527143+05:30	1
4e61a481-52f7-4b9b-ac82-6f4e4d2640f7	73b60d7d6f5ad21e94e75e40bc8f157d57cafcc88ab52e7242c5b50d8eaf1dc0	2026-05-27 15:43:11.735367+05:30	20260516104029_change_enum	\N	\N	2026-05-27 15:43:11.728653+05:30	1
5cadf90b-8a1f-4c8e-9b29-d803a7a042a4	e0efb9853f985db93912089420b7963e205b711966a000f06894e042e87f6f3a	2026-05-27 15:43:11.742661+05:30	20260518083631_changed_role_enum	\N	\N	2026-05-27 15:43:11.735655+05:30	1
919595c5-8d44-4981-b165-858c00ced962	42162cf8d0b9f2d5b4adb688cc8957899531df60adcca992e8b04fc727003f14	2026-05-27 15:43:11.749298+05:30	20260519051129_add_jti	\N	\N	2026-05-27 15:43:11.74303+05:30	1
6401857d-004d-4129-85a4-20907f7c7a13	c69831e974c57f607e53f6c15c19f3daa461034d3ed6eb96a198ccd33b8f4072	2026-05-27 15:43:11.753676+05:30	20260523073200_password_reset	\N	\N	2026-05-27 15:43:11.749569+05:30	1
e3bab796-d0ed-4b6c-ac64-c087dfc8d8c9	f79a7787a8026c38f8fae0f9956eb03fb20e90180119279e1db6d85c8834ed5e	2026-05-27 15:43:11.7592+05:30	20260523114054_emailverification	\N	\N	2026-05-27 15:43:11.753948+05:30	1
86f998aa-0d6f-487d-b9e7-f95bb33e1093	7d00d4e6fc38168ad9fa65491d5e8fef16919517da489358dcbe0e079987a372	2026-05-27 15:43:11.762725+05:30	20260525003618_accept_invitation	\N	\N	2026-05-27 15:43:11.759536+05:30	1
d21f9caa-e2d9-42be-a267-80044c624cc7	1c219de35db2852f0e0fbea8c795e265d75f0f65a0cbed2ddde7cf255fdf27c3	2026-05-27 15:43:11.764196+05:30	20260526095154_add_logo	\N	\N	2026-05-27 15:43:11.763006+05:30	1
ab4d9e42-2ebe-407e-a254-8d169a9bb738	a31ea9b42a86d895a7f164fe2d71b75b7880dd09f5971e05baccd2ae5ae53419	2026-05-28 14:30:27.816084+05:30	20260528090027_add_uniqueness	\N	\N	2026-05-28 14:30:27.764168+05:30	1
aecfa4d2-a838-4c43-b4cb-f5e55a354810	5d7ed9757f075cdce423645261de0220d3941ee5dc8d88e590be124009d995e7	2026-06-05 10:27:23.170992+05:30	20260605045722_equipment	\N	\N	2026-06-05 10:27:22.952003+05:30	1
\.


--
-- Name: AuditLog_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."AuditLog_id_seq"', 353, true);


--
-- Name: BreakdownAction_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."BreakdownAction_id_seq"', 1, false);


--
-- Name: BreakdownReport_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."BreakdownReport_id_seq"', 1, false);


--
-- Name: ChecklistItem_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."ChecklistItem_id_seq"', 1, false);


--
-- Name: ChecklistTemplate_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."ChecklistTemplate_id_seq"', 1, false);


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

SELECT pg_catalog.setval('maintix."Equipment_id_seq"', 1, false);


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

SELECT pg_catalog.setval('maintix."PMSchedule_id_seq"', 1, false);


--
-- Name: PMTask_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."PMTask_id_seq"', 1, false);


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

SELECT pg_catalog.setval('maintix."TaskChecklistItem_id_seq"', 1, false);


--
-- Name: UserDepartment_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."UserDepartment_id_seq"', 3, true);


--
-- Name: UserRole_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."UserRole_id_seq"', 19, true);


--
-- Name: UserSession_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."UserSession_id_seq"', 258, true);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: maintix; Owner: -
--

SELECT pg_catalog.setval('maintix."User_id_seq"', 4, true);


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
-- Name: ChecklistTemplate_equipmentTypeId_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "ChecklistTemplate_equipmentTypeId_idx" ON maintix."ChecklistTemplate" USING btree ("equipmentTypeId");


--
-- Name: ChecklistTemplate_organizationId_idx; Type: INDEX; Schema: maintix; Owner: -
--

CREATE INDEX "ChecklistTemplate_organizationId_idx" ON maintix."ChecklistTemplate" USING btree ("organizationId");


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

\unrestrict Uhv0ZBnSgP6cWxwTfWRAKZ6pZPfI1PNAEwBLtwIbTAaeUYcKyI5o1pwhSKynwy6

