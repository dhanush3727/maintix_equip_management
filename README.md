# Maintix — Equipment Maintenance Management System
## Overview
**Maintix** is a full-stack, multi-tenant equipment maintenance management system designed for manufacturing organizations and factories. It helps organizations manage their locations, departments, users, equipment, preventive maintenance schedules, maintenance tasks, checklists, breakdowns, notifications, and maintenance reports in one centralized platform. The main goal of Maintix is to help organizations reduce equipment downtime by making maintenance **planned, structured, and trackable**.

## Project Status
Status: Actively developed
Maintix is currently being developed as a portfolio-grade SaaS application to demonstrate real-world full-stack engineering concepts including:
* Multi-tenant architecture
* Authentication and authorization
* Role-based access control
* Equipment management
* Preventive maintenance
* Breakdown maintenance
* Maintenance checklists
* Notifications
* Maintenance reports
* REST API architecture
* Database design
* API authentication
* Token rotation
* Automated testing
* Docker containerization
* CI/CD and deployment concepts
The application is primarily intended to demonstrate the engineering architecture, implementation, and problem-solving approach behind a real-world maintenance management product.

## The Problem
In many manufacturing organizations, equipment maintenance is managed using spreadsheets, paper records, manual reminders, or separate communication channels. 
This can result in:
* Missed preventive maintenance
* Unexpected equipment breakdowns
* Increased production downtime
* Difficult-to-maintain maintenance history
* Poor visibility into equipment condition
* Manual tracking of maintenance tasks
* Difficulty managing multiple locations and departments
For example, if a machine needs maintenance every 30 days, manually remembering and assigning that maintenance can easily lead to missed schedules.

## How Maintix Solves the Problem
Maintix centralizes the complete maintenance workflow. An organization can configure its own **locations, departments, equipment types, checklists, users, and maintenance schedules** according to its requirements. Once a preventive maintenance schedule is created, Maintix automatically generates the required maintenance task when the scheduled time arrives. The task contains the appropriate checklist, allowing the assigned maintenance user to perform and record the maintenance in a structured way. Unexpected equipment failures can also be reported through the breakdown maintenance workflow and tracked until the issue is resolved.

## Who Is Maintix For?
Maintix is designed primarily for organizations that operate physical equipment, machinery, or industrial assets.
Potential users include:
* Manufacturing companies
* Factories
* Production plants
* Maintenance departments
* Facility management teams
* Equipment-heavy organizations
* Industrial operations

# Complete Workflow
## 1. Organization Registration
The organization first creates an account in Maintix. During registration, the organization establishes its own workspace and becomes a separate tenant within the system. The organization can then configure its maintenance environment based on how its business is structured.

## 2. Organization Setup
After registration, the administrator configures the organization.
The administrator can create and manage:
* Locations
* Departments
* Equipment types
* Users
* Roles and permissions
* Other organization-specific settings
This allows different organizations to customize Maintix according to their own structure instead of being forced to follow a fixed configuration.

## 3. User Invitation
Administrators can invite employees to the organization. Invited users can be assigned appropriate roles and permissions depending on their responsibilities. For example, a maintenance technician may have permission to perform maintenance tasks, while a manager may have access to maintenance monitoring and reports. This is controlled using **Role-Based Access Control (RBAC)**.

## 4. Equipment Setup
The organization creates its equipment records. Each equipment record can be associated with the appropriate location, department, and equipment type.
For example:
```text
Location: Production Plant 1
Department: Manufacturing
Equipment Type: Motor
Equipment: Production Motor 01
```
Equipment types are customizable, allowing different organizations to define equipment categories relevant to their operations.

## 5. Preventive Maintenance
The maintenance manager creates a preventive maintenance schedule for equipment. The schedule defines when and how frequently maintenance should be performed.
For example:
```text
Equipment: Production Motor 01
Maintenance: Monthly Motor Inspection
Frequency: Every 30 Days
Assigned To: Maintenance Team
```
The purpose is to ensure that maintenance is planned before equipment failure occurs.

## 6. Automatic Task Generation
This is one of the important workflows in Maintix. Maintenance tasks do not need to be manually created every time. When a preventive maintenance schedule reaches its scheduled date, Maintix automatically generates the corresponding maintenance task. The generated task contains the required maintenance information and checklist.
For example:
```text
Monthly Motor Inspection
[ ] Check motor temperature
[ ] Inspect bearings
[ ] Check lubrication
[ ] Inspect electrical connections
[ ] Check vibration
```
The checklist can be customized according to the organization's maintenance requirements. This reduces repetitive manual work for maintenance teams.

## 7. Breakdown Maintenance
Preventive maintenance cannot eliminate every equipment failure. When equipment unexpectedly fails, a user can report a breakdown. 
The breakdown can contain information such as:
* Equipment
* Problem title
* Description
* Severity
* Reporter
* Status
* Reported time
* Resolution information
The maintenance team can then investigate the issue, perform the repair, and record the resolution.

# Key Features
## Implemented
* Multi-tenant architecture
* Organization registration
* Customizable locations
* Customizable departments
* User invitation
* Role-Based Access Control
* Customizable equipment types
* Equipment management
* Customizable maintenance checklists
* Preventive maintenance schedules
* Automatic maintenance task generation
* Maintenance task management
* Checklist-based maintenance execution
* Breakdown maintenance
* Notifications
* Dashboard
* MTBF and MTTR reporting foundation
* Authentication with access and refresh tokens
* Refresh token rotation

## Planned
* Advanced maintenance analytics
* Equipment downtime tracking
* Maintenance cost tracking
* Spare parts management
* Audit logs
* Advanced reporting
* Predictive maintenance
* AI-assisted maintenance recommendations

# Tech Stack
## Frontend
* Next.js
* React
* TypeScript
* Tailwind CSS
* shadcn/ui
* TanStack Query
* Zustand
* React Hook Form
* Zod
* Axios

## Backend
* NestJS
* Node.js
* TypeScript
* PostgreSQL
* Prisma ORM
* JWT
* REST APIs

## Testing and DevOps
* Playwright
* Docker
* Git
* GitHub

# Project Goal
Maintix is being developed as a real-world full-stack SaaS application for equipment maintenance management. The long-term goal is to evolve Maintix from a maintenance management system into an **intelligent maintenance platform** that helps organizations reduce downtime, improve equipment reliability, and make better maintenance decisions. Future development will focus on advanced analytics, predictive maintenance, and AI-assisted maintenance workflows.