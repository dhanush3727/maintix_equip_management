/*
  Warnings:

  - The `options` column on the `ChecklistItem` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `options` column on the `TaskChecklistItem` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "ChecklistItem" DROP COLUMN "options",
ADD COLUMN     "options" JSONB;

-- AlterTable
ALTER TABLE "TaskChecklistItem" DROP COLUMN "options",
ADD COLUMN     "options" JSONB;
