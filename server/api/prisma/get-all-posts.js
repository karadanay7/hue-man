import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  let posts = await prisma.post.findMany();
  return posts;
});
