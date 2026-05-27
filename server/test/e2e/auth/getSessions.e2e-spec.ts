import { INestApplication } from '@nestjs/common';
import request from 'supertest';
import { describe, it, expect, beforeAll, afterAll } from '@jest/globals';
import { createApp } from '../../utils/create-app';
import { LoginResponse } from '../../test.types';

describe('Get All Sessions E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  // Clean up after all tests have run
  afterAll(async () => {
    // close the app after test
    await app.close();
  });

  it('should get all sessions', async () => {
    const payload = {
      email: `test@gmail.com`,
      password: 'Password@123',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const res = await request(server)
      .get('/api/auth/sessions')
      .set('Authorization', `Bearer ${accessToken}`);

    expect(res.status).toBe(200);
    expect(res.body).toHaveProperty('data');
  });

  it('should fail for wihtout token', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const res = await request(server).get('/api/auth/sessions');

    expect(res.status).toBe(401);
    expect(res.body).toHaveProperty('message');
  });
});
