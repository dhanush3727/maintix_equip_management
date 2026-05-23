-- AlterTable
ALTER TABLE "PasswordReset" ADD COLUMN     "isUsed" BOOLEAN NOT NULL DEFAULT false;

-- CreateIndex
CREATE INDEX "PasswordReset_userId_idx" ON "PasswordReset"("userId");

-- CreateIndex
CREATE INDEX "PasswordReset_expiresAt_idx" ON "PasswordReset"("expiresAt");
