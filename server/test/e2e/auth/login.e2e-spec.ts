import { INestApplication } from '@nestjs/common';
import request from 'supertest';
import { describe, it, expect, beforeAll, afterAll } from '@jest/globals';
import { createApp } from '../../utils/create-app';
import {
  createTestOrganization,
  createTestUser,
  prisma,
  TEST_USER,
} from '../../utils/test-data';

describe('Login E2E', () => {
  let app: INestApplication;
  let testUserEmail: string;

  beforeAll(async () => {
    app = await createApp();

    // Create test data
    const organization = await createTestOrganization();
    const user = await createTestUser(organization.id);

    testUserEmail = user.email;
  });

  // Clean up after all tests have run
  afterAll(async () => {
    // Delete sessions created during login
    await prisma.userSession.deleteMany({
      where: {
        user: {
          email: testUserEmail,
        },
      },
    });

    // Delete user role
    await prisma.userRole.deleteMany({
      where: {
        user: {
          email: testUserEmail,
        },
      },
    });

    // Delete test user
    await prisma.user.delete({
      where: {
        email: testUserEmail,
      },
    });

    // close the app after test and disconnect prisma
    await app.close();
    await prisma.$disconnect();
  });

  it('should login a existing user', async () => {
    const payload = {
      email: testUserEmail,
      password: TEST_USER.password,
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const res = await request(server).post('/api/auth/login').send(payload);

    const cookies = res.header['set-cookie'];

    expect(res.status).toBe(200);
    expect(res.body).toHaveProperty('data.accessToken');
    expect(res.body).toHaveProperty('data.user');
    expect(cookies).toBeDefined();
  });

  it('should fail for invalid email', async () => {
    const payload = {
      email: 'testgmail',
      password: 'Password@123',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const res = await request(server).post('/api/auth/login').send(payload);

    expect(res.status).toBe(400);
    expect(res.body).toHaveProperty('message');
  });

  it('should fail for user not found', async () => {
    const payload = {
      email: 'test1@gmail.com',
      password: 'password113',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const res = await request(server).post('/api/auth/login').send(payload);

    expect(res.status).toBe(404);
    expect(res.body).toHaveProperty('message');
  });

  it('should fail for password not match', async () => {
    const payload = {
      email: testUserEmail,
      password: 'password113',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const res = await request(server).post('/api/auth/login').send(payload);

    expect(res.status).toBe(401);
    expect(res.body).toHaveProperty('message');
  });
});
