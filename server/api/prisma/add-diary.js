// backend/api/prisma/add-post.js


import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  const body = await readBody(event);

  try {
    // Fetch username from UserInfo model based on userId
   

    // Create new post with author field populated with the username
    const post = await prisma.diary.create({
      data: {
        content: body.content,
       
        userId: body.userId, // Populate the author field with the username
        // Include other fields as needed
      },
    });

    return {
      statusCode: 200,
      body: JSON.stringify(post),
    };
  } catch (error) {
    console.error('Error adding post:', error);
    return {
      statusCode: 500,
      body: JSON.stringify({ message: 'Error adding post' }),
    };
  }
});
