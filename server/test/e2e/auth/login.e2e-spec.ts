import { INestApplication } from '@nestjs/common';
import request from 'supertest';
import { describe, it, expect, beforeAll, afterAll } from '@jest/globals';
import { createApp } from '../../utils/create-app';

describe('Login E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  // Clean up after all tests have run
  afterAll(async () => {
    // close the app after test
    await app.close();
  });

  it('should login a existing user', async () => {
    const payload = {
      email: `test@gmail.com`,
      password: 'Password@123',
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
      email: 'test@gmail.com',
      password: 'password113',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const res = await request(server).post('/api/auth/login').send(payload);

    expect(res.status).toBe(401);
    expect(res.body).toHaveProperty('message');
  });
});
