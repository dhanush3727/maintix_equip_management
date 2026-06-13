-- DropForeignKey
ALTER TABLE "ChecklistTemplate" DROP CONSTRAINT "ChecklistTemplate_parentId_fkey";

-- AlterTable
ALTER TABLE "ChecklistTemplate" ALTER COLUMN "parentId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "ChecklistTemplate" ADD CONSTRAINT "ChecklistTemplate_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "ChecklistTemplate"("id") ON DELETE SET NULL ON UPDATE CASCADE;
