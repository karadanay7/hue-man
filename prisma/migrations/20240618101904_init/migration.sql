-- CreateTable
CREATE TABLE "UserInfos" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "username" TEXT,
    "bio" TEXT,
    "avatar" TEXT,
    "city" TEXT,
    "state" TEXT,
    "country" TEXT,
    "email" TEXT,

    CONSTRAINT "UserInfos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Interests" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Interests_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SocialLinks" (
    "id" SERIAL NOT NULL,
    "platform" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "SocialLinks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Targets" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "goal" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "isCompleted" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Targets_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TargetProgresses" (
    "id" SERIAL NOT NULL,
    "targetId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "details" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TargetProgresses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Habits" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "goal" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Habits_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HabitProgresses" (
    "id" SERIAL NOT NULL,
    "habitId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "completed" BOOLEAN NOT NULL,
    "amount" DOUBLE PRECISION,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "HabitProgresses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Posts" (
    "id" SERIAL NOT NULL,
    "content" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Posts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Likes" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "postId" INTEGER NOT NULL,

    CONSTRAINT "Likes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Retweets" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "postId" INTEGER NOT NULL,

    CONSTRAINT "Retweets_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Diaries" (
    "id" SERIAL NOT NULL,
    "content" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Diaries_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Categories" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Quotes" (
    "id" SERIAL NOT NULL,
    "content" TEXT NOT NULL,
    "categoryId" INTEGER NOT NULL,

    CONSTRAINT "Quotes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserCategories" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "categoryId" INTEGER NOT NULL,

    CONSTRAINT "UserCategories_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "UserInfos_userId_key" ON "UserInfos"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "UserInfos_email_key" ON "UserInfos"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Categories_name_key" ON "Categories"("name");

-- AddForeignKey
ALTER TABLE "Interests" ADD CONSTRAINT "Interests_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SocialLinks" ADD CONSTRAINT "SocialLinks_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Targets" ADD CONSTRAINT "Targets_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TargetProgresses" ADD CONSTRAINT "TargetProgresses_targetId_fkey" FOREIGN KEY ("targetId") REFERENCES "Targets"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TargetProgresses" ADD CONSTRAINT "TargetProgresses_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Habits" ADD CONSTRAINT "Habits_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HabitProgresses" ADD CONSTRAINT "HabitProgresses_habitId_fkey" FOREIGN KEY ("habitId") REFERENCES "Habits"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HabitProgresses" ADD CONSTRAINT "HabitProgresses_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Posts" ADD CONSTRAINT "Posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Likes" ADD CONSTRAINT "Likes_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserInfos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Likes" ADD CONSTRAINT "Likes_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Posts"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Quotes" ADD CONSTRAINT "Quotes_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
