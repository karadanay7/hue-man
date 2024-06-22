/*
  Warnings:

  - You are about to drop the column `frequency` on the `HabitCheckpoint` table. All the data in the column will be lost.
  - You are about to drop the column `frequency` on the `TargetCheckpoint` table. All the data in the column will be lost.
  - Added the required column `frequencyId` to the `HabitCheckpoint` table without a default value. This is not possible if the table is not empty.
  - Added the required column `frequencyId` to the `TargetCheckpoint` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "HabitCheckpoint" DROP COLUMN "frequency",
ADD COLUMN     "frequencyId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "TargetCheckpoint" DROP COLUMN "frequency",
ADD COLUMN     "frequencyId" INTEGER NOT NULL;

-- DropEnum
DROP TYPE "Frequency";

-- CreateTable
CREATE TABLE "Frequency" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Frequency_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Frequency_name_key" ON "Frequency"("name");

-- AddForeignKey
ALTER TABLE "TargetCheckpoint" ADD CONSTRAINT "TargetCheckpoint_frequencyId_fkey" FOREIGN KEY ("frequencyId") REFERENCES "Frequency"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HabitCheckpoint" ADD CONSTRAINT "HabitCheckpoint_frequencyId_fkey" FOREIGN KEY ("frequencyId") REFERENCES "Frequency"("id") ON DELETE SET NULL ON UPDATE CASCADE;
