/*
  Warnings:

  - Added the required column `username` to the `Posts` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Posts" ADD COLUMN     "username" TEXT NOT NULL;
