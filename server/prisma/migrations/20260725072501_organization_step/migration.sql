-- CreateEnum
CREATE TYPE "OnboardingStep" AS ENUM ('ORGANIZATION', 'LOCATION', 'DEPARTMENT', 'USERS', 'COMPLETED');

-- AlterTable
ALTER TABLE "Organization" ADD COLUMN     "isStepCompleted" "OnboardingStep" NOT NULL DEFAULT 'ORGANIZATION';
