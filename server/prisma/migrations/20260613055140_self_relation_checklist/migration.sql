/*
  Warnings:

  - Made the column `parentId` on table `ChecklistTemplate` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "ChecklistTemplate" ALTER COLUMN "parentId" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "ChecklistTemplate" ADD CONSTRAINT "ChecklistTemplate_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "ChecklistTemplate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
