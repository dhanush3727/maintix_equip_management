/*
  Warnings:

  - A unique constraint covering the columns `[templateId,order]` on the table `ChecklistItem` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `type` to the `ChecklistItem` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "ChecklistItemType" AS ENUM ('TEXT', 'NUMBER', 'BOOLEAN', 'SELECT');

-- AlterTable
ALTER TABLE "ChecklistItem" ADD COLUMN     "isActive" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "isRequired" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "maxValue" DOUBLE PRECISION,
ADD COLUMN     "minValue" DOUBLE PRECISION,
ADD COLUMN     "options" TEXT,
ADD COLUMN     "type" "ChecklistItemType" NOT NULL;

-- AlterTable
ALTER TABLE "ChecklistTemplate" ADD COLUMN     "isActive" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "version" INTEGER NOT NULL DEFAULT 1;

-- CreateIndex
CREATE UNIQUE INDEX "ChecklistItem_templateId_order_key" ON "ChecklistItem"("templateId", "order");
