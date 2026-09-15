import { PrismaPg } from '@prisma/adapter-pg';
import { PrismaClient, RoleType } from '@prisma/client';
import dotenv from 'dotenv';
import bcrypt from 'bcrypt';

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

const prisma = new PrismaClient({ adapter });

async function main(): Promise<void> {
  // Roles seed
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
  // Create test organization
  const organization = await prisma.organization.upsert({
    where: {
      // Use the unique field from your Organization model here
      slug: 'playwright-test-org',
    },
    update: {},
    create: {
      name: 'Playwright Test Organization',
      slug: 'playwright-test-org',
    },
  });

  // Test credentials
  const testEmail = process.env.PLAYWRIGHT_TEST_EMAIL;
  const testPassword = process.env.PLAYWRIGHT_TEST_PASSWORD;

  if (!testEmail || !testPassword) {
    throw new Error(
      'PLAYWRIGHT_TEST_EMAIL and PLAYWRIGHT_TEST_PASSWORD are required',
    );
  }

  const passwordHash = await bcrypt.hash(testPassword, 10);

  // Create test user
  const testUser = await prisma.user.upsert({
    where: {
      email: testEmail,
    },
    update: {
      passwordHash,
      organizationId: organization.id,
      isEmailVerified: true,
      isActive: true,
    },
    create: {
      name: 'Playwright Test User',
      email: testEmail,
      passwordHash,
      organizationId: organization.id,
      isEmailVerified: true,
      isActive: true,
    },
  });

  // Get ADMIN role
  const adminRole = await prisma.role.findUnique({
    where: {
      name: RoleType.ADMIN,
    },
  });

  if (!adminRole) {
    throw new Error('ADMIN role not found');
  }

  // Connect ADMIN role to test user
  await prisma.userRole.upsert({
    where: {
      userId_roleId: {
        userId: testUser.id,
        roleId: adminRole.id,
      },
    },
    update: {},
    create: {
      userId: testUser.id,
      roleId: adminRole.id,
    },
  });

  console.log(`Test user seeded: ${testEmail}`);
}

main()
  .catch((err) => {
    console.log(err);
    process.exit(1);
  })
  .finally(() => prisma.$disconnect());
