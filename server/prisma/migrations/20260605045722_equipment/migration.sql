/*
  Warnings:

  - You are about to drop the column `department` on the `Equipment` table. All the data in the column will be lost.
  - You are about to drop the column `equipmentId` on the `Equipment` table. All the data in the column will be lost.
  - You are about to drop the column `isActive` on the `Equipment` table. All the data in the column will be lost.
  - You are about to drop the column `location` on the `Equipment` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[organizationId,code]` on the table `Equipment` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[organizationId,code]` on the table `EquipmentType` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `code` to the `Equipment` table without a default value. This is not possible if the table is not empty.

*/
-- AlterEnum
-- This migration adds more than one value to an enum.
-- With PostgreSQL versions 11 and earlier, this is not possible
-- in a single migration. This can be worked around by creating
-- multiple migrations, each migration adding only one value to
-- the enum.


ALTER TYPE "EquipmentStatus" ADD VALUE 'BREAKDOWN';
ALTER TYPE "EquipmentStatus" ADD VALUE 'DECOMMISSIONED';

-- DropIndex
DROP INDEX "Equipment_organizationId_equipmentId_key";

-- AlterTable
ALTER TABLE "Equipment" DROP COLUMN "department",
DROP COLUMN "equipmentId",
DROP COLUMN "isActive",
DROP COLUMN "location",
ADD COLUMN     "code" TEXT NOT NULL,
ADD COLUMN     "departmentId" INTEGER,
ADD COLUMN     "locationId" INTEGER;

-- CreateIndex
CREATE UNIQUE INDEX "Equipment_organizationId_code_key" ON "Equipment"("organizationId", "code");

-- CreateIndex
CREATE UNIQUE INDEX "EquipmentType_organizationId_code_key" ON "EquipmentType"("organizationId", "code");

-- AddForeignKey
ALTER TABLE "Equipment" ADD CONSTRAINT "Equipment_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Equipment" ADD CONSTRAINT "Equipment_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "Location"("id") ON DELETE SET NULL ON UPDATE CASCADE;
