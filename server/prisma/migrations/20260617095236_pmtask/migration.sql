/*
  Warnings:

  - Added the required column `title` to the `PMTask` table without a default value. This is not possible if the table is not empty.
  - Added the required column `type` to the `TaskChecklistItem` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `TaskChecklistItem` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "PMTask" ADD COLUMN     "title" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "TaskChecklistItem" ADD COLUMN     "type" "ChecklistItemType" NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- CreateIndex
CREATE INDEX "PMTask_status_idx" ON "PMTask"("status");
