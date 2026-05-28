import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import request from 'supertest';
import { createApp } from '../../utils/create-app';
import { ApiResponse, LoginResponse } from '../../test.types';
import { Department } from '@prisma/client';

describe('Delete Department E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should delete department', async () => {
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
      .delete('/api/organization/department/4')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(200);

    const body = res.body as ApiResponse<Department>;

    expect(body.success).toBe(true);
    expect(body.message).toBe('Department deleted successfully');
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
      .delete('/api/organization/department/4')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(404);

    const body = res.body as ApiResponse<Department>;

    expect(body.success).toBe(false);
    expect(body.message).toBe('Department not found');
  });

  it('should fail for without token', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    await request(server).delete('/api/organization/department/4').expect(401);
  });
});
