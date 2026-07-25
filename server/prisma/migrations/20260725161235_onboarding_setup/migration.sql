/*
  Warnings:

  - You are about to drop the column `isSetupCompleted` on the `Organization` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Organization" DROP COLUMN "isSetupCompleted",
ADD COLUMN     "onboardingStep" "OnboardingStep" NOT NULL DEFAULT 'ORGANIZATION';
