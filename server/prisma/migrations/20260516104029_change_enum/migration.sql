/*
  Warnings:

  - The values [VIEWER] on the enum `RoleType` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "RoleType_new" AS ENUM ('ADMIN', 'MANAGER', 'ENGNEER', 'TECHNICIAN', 'INSPECTOR');
ALTER TABLE "Role" ALTER COLUMN "name" TYPE "RoleType_new" USING ("name"::text::"RoleType_new");
ALTER TYPE "RoleType" RENAME TO "RoleType_old";
ALTER TYPE "RoleType_new" RENAME TO "RoleType";
DROP TYPE "maintix"."RoleType_old";
COMMIT;
