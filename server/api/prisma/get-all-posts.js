import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  let posts = await prisma.posts.findMany();
  return posts;
});
