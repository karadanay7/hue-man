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

    // Start a transaction to create the habit and checkpoints
    const habit = await prisma.$transaction(async (prisma) => {
      // Create the habit
      const newHabit = await prisma.habit.create({
        data: {
          description: body.description,
          goal: body.goal,
          userId: body.userId,
        },
      });

      // Create checkpoints
      if (body.checkpoints && body.checkpoints.length > 0) {
        const checkpointPromises = body.checkpoints.map((checkpoint) => {
          return prisma.habitCheckpoint.create({
            data: {
              habitId: newHabit.id,
              frequency: checkpoint.frequency,
              hours: checkpoint.hours,
              days: checkpoint.days,
            },
          });
        });

        await Promise.all(checkpointPromises);
      }

      return newHabit;
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
  } finally {
    await prisma.$disconnect();
  }
});
