// backend/api/prisma/add-habit.js

import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  const body = await readBody(event);

  try {
    // Fetch username from UserInfo model based on userId
    const userInfo = await prisma.userInfos.findUnique({
      where: {
        userId: body.userId,
      },
    });

    // Create new habit with author field populated with the username
    const habit = await prisma.habit.create({
      data: {
        description: body.description,
        goal: body.goal,
        userId: body.userId,
        userInfo: { connect: { userId: body.userId } }, // Connect to user's info
        // Include other fields as needed
      },
    });

    return {
      statusCode: 200,
      body: JSON.stringify(habit),
    };
  } catch (error) {
    console.error('Error adding habit:', error);
    return {
      statusCode: 500,
      body: JSON.stringify({ message: 'Error adding habit' }),
    };
  }
});
