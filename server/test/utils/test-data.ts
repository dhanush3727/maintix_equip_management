import { PrismaPg } from '@prisma/adapter-pg';
import { PrismaClient, RoleType } from '@prisma/client';
import bcrypt from 'bcrypt';
import dotenv from 'dotenv';

dotenv.config({
  path: '.env.test',
});

const adapter = new PrismaPg(
  {
    connectionString: process.env.DATABASE_URL as string,
  },
  {
    schema: 'maintix',
  },
);

export const prisma = new PrismaClient({ adapter });

export const TEST_USER = {
  name: 'Test User',
  email: 'testuser@maintix.test',
  password: 'Test@1234',
};

export async function createTestOrganization() {
  return prisma.organization.create({
    data: {
      name: 'Test Organization',
      slug: `test-organization-${Date.now()}`,
    },
  });
}

export async function createTestUser(organizationId: number) {
  const hashedPassword = await bcrypt.hash(TEST_USER.password, 10);

  const user = await prisma.user.create({
    data: {
      name: TEST_USER.name,
      email: `${Date.now()} - ${TEST_USER.email}`,
      passwordHash: hashedPassword,
      organizationId,
    },
  });

  const role = await prisma.role.findUnique({
    where: {
      name: RoleType.ADMIN,
    },
  });

  if (!role) throw new Error('Admin role not found. Run the test seed first');

  await prisma.userRole.create({
    data: {
      userId: user.id,
      roleId: role.id,
    },
  });

  return user;
}
