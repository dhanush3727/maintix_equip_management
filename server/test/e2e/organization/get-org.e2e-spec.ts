import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import { createApp } from '../../utils/create-app';
import request from 'supertest';
import { ApiResponse, LoginResponse } from '../../test.types';
import { Organization } from '@prisma/client';

describe('Get Organization E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should get organization details', async () => {
    const payload = {
      email: 'dhanush3727@gmail.com',
      password: 'Dhanush@3727',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const res = await request(server)
      .get('/api/organization')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(200);

    const body = res.body as ApiResponse<Organization>;

    expect(body.success).toBe(true);
    expect(body.message).toBe('Fetched organization successfully');
  });
});
