import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import request from 'supertest';
import { createApp } from '../../utils/create-app';
import { ApiResponse, LoginResponse } from '../../test.types';
import { Location } from '@prisma/client';

describe('Delete Location E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should delete location', async () => {
    const payload = {
      email: 'dhanush7825@gmail.com',
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
      .delete('/api/organization/location/3')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(200);

    const body = res.body as ApiResponse<Location>;

    expect(body.success).toBe(true);
    expect(body.message).toBe('Location deleted successfully');
  });

  it('should fail for not found', async () => {
    const payload = {
      email: 'dhanush7825@gmail.com',
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
      .delete('/api/organization/location/4')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(404);

    const body = res.body as ApiResponse<Location>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('Location not found');
  });

  it('should fail for without token', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    await request(server).delete('/api/organization/location/4').expect(401);
  });
});
