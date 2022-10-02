import { PrismaClient } from '@prisma/client';
import { auth0 } from 'utils';
import { v4 as uuidv4 } from 'uuid';

let prisma: PrismaClient;

if (process.env.NODE_ENV === 'production') {
  prisma = new PrismaClient();
}

const context = async ({ req }: any) => {
  try {
    // @ts-ignore
    const { user: auth0User } = await auth0.getSession(req);
    let user = await prisma.user.findUnique({
      where: { auth0: auth0User.sub }
    });
    if (!user) {
      const { picture, nickname, sub } = auth0User;
      user = await prisma.user.create({
        data: {
          id: uuidv4(),
          auth0: sub,
          picture,
          nickname
        }
      });
    }

    return { user, prisma };
  } catch (e) {
    return { user: {}, prisma };
  }
};

export default context;
