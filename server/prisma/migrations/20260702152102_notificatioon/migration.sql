/*
  Warnings:

  - The values [TASK_DUE] on the enum `NotificationType` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "NotificationType_new" AS ENUM ('TASK_ASSIGNED', 'TASK_OVERDUE', 'BREAKDOWN_RAISED', 'BREAKDOWN_ASSIGNED', 'BREAKDOWN_RESOLVED');
ALTER TABLE "Notification" ALTER COLUMN "type" TYPE "NotificationType_new" USING ("type"::text::"NotificationType_new");
ALTER TYPE "NotificationType" RENAME TO "NotificationType_old";
ALTER TYPE "NotificationType_new" RENAME TO "NotificationType";
DROP TYPE "maintix"."NotificationType_old";
COMMIT;
