// backend/api/prisma/add-target.js

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

    // Create new target with author field populated with the username
    const target = await prisma.target.create({
      data: {
        description: body.description,
        goal: body.goal,
        userId: body.userId,
       
        checkpoints: body.checkpoints, // Update to include checkpoints
        // Include other fields as needed
      },
    });

    return {
      statusCode: 200,
      body: JSON.stringify(target),
    };
  } catch (error) {
    console.error('Error adding target:', error);
    return {
      statusCode: 500,
      body: JSON.stringify({ message: 'Error adding target' }),
    };
  }
});
