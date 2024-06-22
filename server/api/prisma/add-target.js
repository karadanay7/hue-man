import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  const body = await readBody(event);

  try {
    // Fetch user information
    const userInfo = await prisma.userInfos.findUnique({
      where: {
        userId: body.userId,
      },
    });

    if (!userInfo) {
      return {
        statusCode: 404,
        body: JSON.stringify({ message: 'User not found' }),
      };
    }

    // Start a transaction to create the target and checkpoints
    const target = await prisma.$transaction(async (prisma) => {
      // Create the target
      const newTarget = await prisma.target.create({
        data: {
          description: body.description,
          goal: body.goal,
          userId: body.userId,
          isCompleted: false,
        },
      });

      // Create checkpoints
      if (body.checkpoints && body.checkpoints.length > 0) {
        const checkpointPromises = body.checkpoints.map((checkpoint) => {
          return prisma.targetCheckpoint.create({
            data: {
              targetId: newTarget.id,
              frequency: checkpoint.frequency,
              hours: checkpoint.hours,
              days: checkpoint.days,
            },
          });
        });

        await Promise.all(checkpointPromises);
      }

      return newTarget;
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
  } finally {
    await prisma.$disconnect();
  }
});
