/*
  Warnings:

  - You are about to drop the `Checkpoint` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Checkpoint" DROP CONSTRAINT "Checkpoint_habitId_fkey";

-- DropForeignKey
ALTER TABLE "Checkpoint" DROP CONSTRAINT "Checkpoint_targetId_fkey";

-- AlterTable
ALTER TABLE "Habit" ADD COLUMN     "checkpoints" TEXT[];

-- AlterTable
ALTER TABLE "Target" ADD COLUMN     "checkpoints" TEXT[];

-- DropTable
DROP TABLE "Checkpoint";
