import { PrismaPg } from '@prisma/adapter-pg';
import { OnboardingStep, PrismaClient, RoleType } from '@prisma/client';
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

const prisma = new PrismaClient({ adapter });

async function main(): Promise<void> {
  // Seed roles
  const roles: ReadonlyArray<RoleType> = [
    RoleType.ADMIN,
    RoleType.MANAGER,
    RoleType.TECHNICIAN,
    RoleType.INSPECTOR,
    RoleType.ENGINEER,
  ];

  for (const role of roles) {
    await prisma.role.upsert({
      where: { name: role },
      update: {},
      create: { name: role },
    });
  }

  console.log('Roles seeded successfully');

  // Test credentials
  const testEmail = process.env.PLAYWRIGHT_TEST_EMAIL;
  const testPassword = process.env.PLAYWRIGHT_TEST_PASSWORD;

  if (!testEmail || !testPassword) {
    throw new Error(
      'PLAYWRIGHT_TEST_EMAIL and PLAYWRIGHT_TEST_PASSWORD are required',
    );
  }

  // Seed test organization
  const organization = await prisma.organization.upsert({
    where: {
      slug: 'playwright-test-org',
    },
    update: {
      onboardingStep: OnboardingStep.COMPLETED,
    },
    create: {
      name: 'Playwright Test Organization',
      slug: 'playwright-test-org',
      onboardingStep: OnboardingStep.COMPLETED,
    },
  });

  console.log('Test organization seeded successfully');

  // Hash test password
  const passwordHash = await bcrypt.hash(testPassword, 10);

  // Seed test user
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
      name: 'Test User',
      email: testEmail,
      passwordHash,
      organizationId: organization.id,
      isEmailVerified: true,
      isActive: true,
    },
  });

  console.log(`Test user seeded successfully: ${testEmail}`);

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

  console.log('ADMIN role assigned to test user');
}

main()
  .catch((err) => {
    console.error(err);
    process.exit(1);
  })
  .finally(() => prisma.$disconnect());
