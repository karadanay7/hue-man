/*
  Warnings:

  - You are about to drop the `Frequency` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `frequency` to the `HabitCheckpoint` table without a default value. This is not possible if the table is not empty.
  - Added the required column `frequency` to the `TargetCheckpoint` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "HabitCheckpoint" DROP CONSTRAINT "HabitCheckpoint_frequencyId_fkey";

-- DropForeignKey
ALTER TABLE "TargetCheckpoint" DROP CONSTRAINT "TargetCheckpoint_frequencyId_fkey";

-- AlterTable
ALTER TABLE "HabitCheckpoint" ADD COLUMN     "frequency" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "TargetCheckpoint" ADD COLUMN     "frequency" TEXT NOT NULL;

-- DropTable
DROP TABLE "Frequency";
