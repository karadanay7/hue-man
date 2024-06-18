-- DropForeignKey
ALTER TABLE "HabitProgresses" DROP CONSTRAINT "HabitProgresses_userId_fkey";

-- DropForeignKey
ALTER TABLE "Habits" DROP CONSTRAINT "Habits_userId_fkey";

-- DropForeignKey
ALTER TABLE "Interests" DROP CONSTRAINT "Interests_userId_fkey";

-- DropForeignKey
ALTER TABLE "Likes" DROP CONSTRAINT "Likes_userId_fkey";

-- DropForeignKey
ALTER TABLE "Posts" DROP CONSTRAINT "Posts_userId_fkey";

-- DropForeignKey
ALTER TABLE "SocialLinks" DROP CONSTRAINT "SocialLinks_userId_fkey";

-- DropForeignKey
ALTER TABLE "TargetProgresses" DROP CONSTRAINT "TargetProgresses_userId_fkey";

-- DropForeignKey
ALTER TABLE "Targets" DROP CONSTRAINT "Targets_userId_fkey";

-- AlterTable
ALTER TABLE "HabitProgresses" ALTER COLUMN "userId" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "Habits" ALTER COLUMN "userId" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "Interests" ALTER COLUMN "userId" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "Likes" ALTER COLUMN "userId" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "Posts" ALTER COLUMN "userId" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "SocialLinks" ALTER COLUMN "userId" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "TargetProgresses" ALTER COLUMN "userId" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "Targets" ALTER COLUMN "userId" SET DATA TYPE TEXT;

-- AddForeignKey
ALTER TABLE "Interests" ADD CONSTRAINT "Interests_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SocialLinks" ADD CONSTRAINT "SocialLinks_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Targets" ADD CONSTRAINT "Targets_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TargetProgresses" ADD CONSTRAINT "TargetProgresses_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Habits" ADD CONSTRAINT "Habits_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HabitProgresses" ADD CONSTRAINT "HabitProgresses_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Posts" ADD CONSTRAINT "Posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Likes" ADD CONSTRAINT "Likes_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Retweets" ADD CONSTRAINT "Retweets_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Retweets" ADD CONSTRAINT "Retweets_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Posts"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Diaries" ADD CONSTRAINT "Diaries_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserCategories" ADD CONSTRAINT "UserCategories_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserCategories" ADD CONSTRAINT "UserCategories_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Categories"("id") ON DELETE CASCADE ON UPDATE CASCADE;
