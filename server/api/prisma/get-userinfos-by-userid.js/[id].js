import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export default defineEventHandler(async (event) => {
  let userInfo = await prisma.userinfos.findFirst({
    where: { id: Number(userId) },
  });
  return userInfo;
});
