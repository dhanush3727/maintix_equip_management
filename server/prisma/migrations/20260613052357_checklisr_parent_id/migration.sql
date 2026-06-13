/*
  Warnings:

  - Added the required column `templateItemId` to the `TaskChecklistItem` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "ChecklistTemplate" ADD COLUMN     "parentId" INTEGER;

-- AlterTable
ALTER TABLE "TaskChecklistItem" ADD COLUMN     "maxValue" DOUBLE PRECISION,
ADD COLUMN     "minValue" DOUBLE PRECISION,
ADD COLUMN     "options" TEXT,
ADD COLUMN     "templateItemId" INTEGER NOT NULL;

-- CreateIndex
CREATE INDEX "TaskChecklistItem_templateItemId_idx" ON "TaskChecklistItem"("templateItemId");

-- AddForeignKey
ALTER TABLE "TaskChecklistItem" ADD CONSTRAINT "TaskChecklistItem_templateItemId_fkey" FOREIGN KEY ("templateItemId") REFERENCES "ChecklistItem"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
