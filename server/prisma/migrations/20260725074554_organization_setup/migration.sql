/*
  Warnings:

  - You are about to drop the column `isStepCompleted` on the `Organization` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Organization" DROP COLUMN "isStepCompleted",
ADD COLUMN     "isSetupCompleted" "OnboardingStep" NOT NULL DEFAULT 'ORGANIZATION';
