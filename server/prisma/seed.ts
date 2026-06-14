import { PrismaPg } from '@prisma/adapter-pg';
import { PrismaClient } from '@prisma/client';
import dotenv from 'dotenv';
import bcrypt from 'bcrypt';

dotenv.config();

console.log('DB URL:', process.env.DATABASE_URL);

const adapter = new PrismaPg(
  {
    connectionString: process.env.DATABASE_URL as string,
  },
  { schema: 'maintix' },
);

const prisma = new PrismaClient({ adapter });

async function main(): Promise<void> {
  const hashedPassword = await bcrypt.hash('Dhanush@3727', 10);

  const user = await prisma.user.create({
    data: {
      name: 'Engineer',
      organizationId: 3,
      passwordHash: hashedPassword,
      email: 'engineeruser@gmail.com',
    },
  });

  await prisma.userRole.create({
    data: {
      userId: user.id,
      roleId: 4,
    },
  });

  console.log('User seeded successfully');
}

main()
  .catch((err) => {
    console.log(err);
    process.exit(1);
  })
  .finally(() => prisma.$disconnect());
