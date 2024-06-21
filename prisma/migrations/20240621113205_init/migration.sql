/*
  Warnings:

  - You are about to drop the `Categories` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Diaries` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `HabitProgresses` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Habits` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Interests` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Likes` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Posts` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Quotes` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Retweets` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `SocialLinks` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `TargetProgresses` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Targets` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `UserCategories` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Diaries" DROP CONSTRAINT "Diaries_userId_fkey";

-- DropForeignKey
ALTER TABLE "HabitProgresses" DROP CONSTRAINT "HabitProgresses_habitId_fkey";

-- DropForeignKey
ALTER TABLE "HabitProgresses" DROP CONSTRAINT "HabitProgresses_userId_fkey";

-- DropForeignKey
ALTER TABLE "Habits" DROP CONSTRAINT "Habits_userId_fkey";

-- DropForeignKey
ALTER TABLE "Interests" DROP CONSTRAINT "Interests_userId_fkey";

-- DropForeignKey
ALTER TABLE "Likes" DROP CONSTRAINT "Likes_postId_fkey";

-- DropForeignKey
ALTER TABLE "Likes" DROP CONSTRAINT "Likes_userId_fkey";

-- DropForeignKey
ALTER TABLE "Posts" DROP CONSTRAINT "Posts_userId_fkey";

-- DropForeignKey
ALTER TABLE "Quotes" DROP CONSTRAINT "Quotes_categoryId_fkey";

-- DropForeignKey
ALTER TABLE "Retweets" DROP CONSTRAINT "Retweets_postId_fkey";

-- DropForeignKey
ALTER TABLE "Retweets" DROP CONSTRAINT "Retweets_userId_fkey";

-- DropForeignKey
ALTER TABLE "SocialLinks" DROP CONSTRAINT "SocialLinks_userId_fkey";

-- DropForeignKey
ALTER TABLE "TargetProgresses" DROP CONSTRAINT "TargetProgresses_targetId_fkey";

-- DropForeignKey
ALTER TABLE "TargetProgresses" DROP CONSTRAINT "TargetProgresses_userId_fkey";

-- DropForeignKey
ALTER TABLE "Targets" DROP CONSTRAINT "Targets_userId_fkey";

-- DropForeignKey
ALTER TABLE "UserCategories" DROP CONSTRAINT "UserCategories_categoryId_fkey";

-- DropForeignKey
ALTER TABLE "UserCategories" DROP CONSTRAINT "UserCategories_userId_fkey";

-- DropTable
DROP TABLE "Categories";

-- DropTable
DROP TABLE "Diaries";

-- DropTable
DROP TABLE "HabitProgresses";

-- DropTable
DROP TABLE "Habits";

-- DropTable
DROP TABLE "Interests";

-- DropTable
DROP TABLE "Likes";

-- DropTable
DROP TABLE "Posts";

-- DropTable
DROP TABLE "Quotes";

-- DropTable
DROP TABLE "Retweets";

-- DropTable
DROP TABLE "SocialLinks";

-- DropTable
DROP TABLE "TargetProgresses";

-- DropTable
DROP TABLE "Targets";

-- DropTable
DROP TABLE "UserCategories";

-- CreateTable
CREATE TABLE "Interest" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Interest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SocialLink" (
    "id" SERIAL NOT NULL,
    "platform" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "SocialLink_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Target" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "goal" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "isCompleted" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Target_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TargetProgress" (
    "id" SERIAL NOT NULL,
    "targetId" INTEGER NOT NULL,
    "userId" TEXT NOT NULL,
    "details" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TargetProgress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Habit" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "goal" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Habit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HabitProgress" (
    "id" SERIAL NOT NULL,
    "habitId" INTEGER NOT NULL,
    "userId" TEXT NOT NULL,
    "completed" BOOLEAN NOT NULL,
    "amount" DOUBLE PRECISION,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "HabitProgress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Post" (
    "id" SERIAL NOT NULL,
    "content" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Post_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Checkpoint" (
    "id" SERIAL NOT NULL,
    "frequency" TEXT[],
    "hours" TEXT[],
    "days" TEXT[],
    "months" TEXT[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "targetId" INTEGER,
    "habitId" INTEGER,

    CONSTRAINT "Checkpoint_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Like" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "postId" INTEGER NOT NULL,

    CONSTRAINT "Like_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Retweet" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "postId" INTEGER NOT NULL,

    CONSTRAINT "Retweet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Diary" (
    "id" SERIAL NOT NULL,
    "content" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Diary_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Category" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Quote" (
    "id" SERIAL NOT NULL,
    "content" TEXT NOT NULL,
    "categoryId" INTEGER NOT NULL,

    CONSTRAINT "Quote_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserCategory" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "categoryId" INTEGER NOT NULL,

    CONSTRAINT "UserCategory_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Category_name_key" ON "Category"("name");

-- AddForeignKey
ALTER TABLE "Interest" ADD CONSTRAINT "Interest_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SocialLink" ADD CONSTRAINT "SocialLink_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Target" ADD CONSTRAINT "Target_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TargetProgress" ADD CONSTRAINT "TargetProgress_targetId_fkey" FOREIGN KEY ("targetId") REFERENCES "Target"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TargetProgress" ADD CONSTRAINT "TargetProgress_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Habit" ADD CONSTRAINT "Habit_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HabitProgress" ADD CONSTRAINT "HabitProgress_habitId_fkey" FOREIGN KEY ("habitId") REFERENCES "Habit"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HabitProgress" ADD CONSTRAINT "HabitProgress_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Checkpoint" ADD CONSTRAINT "Checkpoint_targetId_fkey" FOREIGN KEY ("targetId") REFERENCES "Target"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Checkpoint" ADD CONSTRAINT "Checkpoint_habitId_fkey" FOREIGN KEY ("habitId") REFERENCES "Habit"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Like" ADD CONSTRAINT "Like_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Like" ADD CONSTRAINT "Like_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Retweet" ADD CONSTRAINT "Retweet_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Retweet" ADD CONSTRAINT "Retweet_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Diary" ADD CONSTRAINT "Diary_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Quote" ADD CONSTRAINT "Quote_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserCategory" ADD CONSTRAINT "UserCategory_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserCategory" ADD CONSTRAINT "UserCategory_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE CASCADE ON UPDATE CASCADE;
