import { PrismaPg } from '@prisma/adapter-pg';
import { PrismaClient, RoleType } from '@prisma/client';
import dotenv from 'dotenv';

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
  // It’s an array of RoleType that cannot be modified
  const roles: ReadonlyArray<RoleType> = [
    RoleType.ADMIN,
    RoleType.MANAGER,
    RoleType.TECHNICIAN,
    RoleType.INSPECTOR,
    RoleType.ENGINEER,
  ];

  for (const role of roles) {
    await prisma.role.upsert({
      where: { name: role }, // Check that name is already have or not
      update: {},
      create: { name: role },
    });
  }

  console.log('Roles seeded successfully');
}

main()
  .catch((err) => {
    console.log(err);
    process.exit(1);
  })
  .finally(() => prisma.$disconnect());
