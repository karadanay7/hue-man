/*
  Warnings:

  - You are about to drop the column `checkpoints` on the `Habit` table. All the data in the column will be lost.
  - You are about to drop the column `checkpoints` on the `Target` table. All the data in the column will be lost.

*/
-- CreateEnum
CREATE TYPE "Frequency" AS ENUM ('DAILY', 'WEEKLY', 'MONTHLY');

-- AlterTable
ALTER TABLE "Habit" DROP COLUMN "checkpoints";

-- AlterTable
ALTER TABLE "Target" DROP COLUMN "checkpoints";

-- CreateTable
CREATE TABLE "TargetCheckpoint" (
    "id" SERIAL NOT NULL,
    "targetId" INTEGER NOT NULL,
    "frequency" "Frequency" NOT NULL,
    "hours" TEXT[],
    "days" TEXT[],

    CONSTRAINT "TargetCheckpoint_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HabitCheckpoint" (
    "id" SERIAL NOT NULL,
    "habitId" INTEGER NOT NULL,
    "frequency" "Frequency" NOT NULL,
    "hours" TEXT[],
    "days" TEXT[],

    CONSTRAINT "HabitCheckpoint_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "TargetCheckpoint" ADD CONSTRAINT "TargetCheckpoint_targetId_fkey" FOREIGN KEY ("targetId") REFERENCES "Target"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HabitCheckpoint" ADD CONSTRAINT "HabitCheckpoint_habitId_fkey" FOREIGN KEY ("habitId") REFERENCES "Habit"("id") ON DELETE CASCADE ON UPDATE CASCADE;
