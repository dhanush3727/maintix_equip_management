import request from 'supertest';
import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import { createApp } from '../../utils/create-app';
import { ApiResponse, LoginResponse } from '../../test.types';
import { BreakdownReport } from '@prisma/client';

describe('Resolve Breakdown E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should resolve breakdown', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'technicianuser@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const resolve = {
      rootCause: 'Test root cause',
    };

    const res = await request(server)
      .patch('/api/breakdowns/2/resolve')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(resolve)
      .expect(200);
    const body = res.body as ApiResponse<BreakdownReport>;

    expect(body).toStrictEqual({
      success: true,
      message: 'Breakdown resolved successfully',
    });
  });

  it('should fail for invalid breakdown', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'technicianuser@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const resolve = {
      rootCause: 'Test root cause',
    };

    const res = await request(server)
      .patch('/api/breakdowns/10/resolve')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(resolve)
      .expect(404);
    const body = res.body as ApiResponse<BreakdownReport>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Breakdown not found',
    });
  });

  it('should fail for invalid status', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'technicianuser@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const resolve = {
      rootCause: 'Test root cause',
    };

    const res = await request(server)
      .patch('/api/breakdowns/1/resolve')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(resolve)
      .expect(400);
    const body = res.body as ApiResponse<BreakdownReport>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Breakdown is not in progress',
    });
  });

  it('should fail for other technician', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'technicianuser3@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const resolve = {
      rootCause: 'Test root cause',
    };

    const res = await request(server)
      .patch('/api/breakdowns/3/resolve')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(resolve)
      .expect(403);
    const body = res.body as ApiResponse<BreakdownReport>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Only assigned technician can resolve this action',
    });
  });
});
