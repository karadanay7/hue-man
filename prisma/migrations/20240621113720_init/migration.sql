/*
  Warnings:

  - You are about to drop the column `days` on the `Checkpoint` table. All the data in the column will be lost.
  - You are about to drop the column `hours` on the `Checkpoint` table. All the data in the column will be lost.
  - You are about to drop the column `months` on the `Checkpoint` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Checkpoint" DROP COLUMN "days",
DROP COLUMN "hours",
DROP COLUMN "months";
