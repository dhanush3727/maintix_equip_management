-- AlterTable
ALTER TABLE "Invitation" ALTER COLUMN "status" SET DEFAULT 'PENDING';

-- CreateIndex
CREATE INDEX "Invitation_email_idx" ON "Invitation"("email");
