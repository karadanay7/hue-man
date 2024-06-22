/*
  Warnings:

  - You are about to drop the column `frequencyId` on the `HabitCheckpoint` table. All the data in the column will be lost.
  - You are about to drop the column `frequencyId` on the `TargetCheckpoint` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "HabitCheckpoint" DROP COLUMN "frequencyId";

-- AlterTable
ALTER TABLE "TargetCheckpoint" DROP COLUMN "frequencyId";
