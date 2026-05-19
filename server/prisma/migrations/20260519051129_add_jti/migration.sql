/*
  Warnings:

  - A unique constraint covering the columns `[jti]` on the table `UserSession` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `jti` to the `UserSession` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "UserSession_refreshToken_key";

-- AlterTable
ALTER TABLE "UserSession" ADD COLUMN     "jti" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "UserSession_jti_key" ON "UserSession"("jti");
