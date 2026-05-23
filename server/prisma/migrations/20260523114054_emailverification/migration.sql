-- AlterTable
ALTER TABLE "EmailVerification" ADD COLUMN     "isUsed" BOOLEAN NOT NULL DEFAULT false;

-- CreateIndex
CREATE INDEX "EmailVerification_userId_idx" ON "EmailVerification"("userId");

-- CreateIndex
CREATE INDEX "EmailVerification_expiresAt_idx" ON "EmailVerification"("expiresAt");
