import request from 'supertest';
import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import { createApp } from '../../utils/create-app';
import { ApiResponse, LoginResponse } from '../../test.types';
import { BreakdownReport } from '@prisma/client';

describe('Assign Technician E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should assign technician', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'manageruser@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const assignPayload = {
      assignedTo: 10,
    };

    const res = await request(server)
      .patch('/api/breakdowns/2/assign')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(assignPayload)
      .expect(200);
    const body = res.body as ApiResponse<BreakdownReport>;

    expect(body).toStrictEqual({
      success: true,
      message: 'Technician Assigned',
    });
  });

  it('should fail for invalid breakdown', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'manageruser@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const assignPayload = {
      assignedTo: 10,
    };

    const res = await request(server)
      .patch('/api/breakdowns/10/assign')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(assignPayload)
      .expect(404);
    const body = res.body as ApiResponse<BreakdownReport>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Breakdown not found',
    });
  });

  it('should fail for already assigned', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'manageruser@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const assignPayload = {
      assignedTo: 10,
    };

    const res = await request(server)
      .patch('/api/breakdowns/1/assign')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(assignPayload)
      .expect(400);
    const body = res.body as ApiResponse<BreakdownReport>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Technician already assigned',
    });
  });

  it('should fail for user not found', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'manageruser@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const assignPayload = {
      assignedTo: 100,
    };

    const res = await request(server)
      .patch('/api/breakdowns/3/assign')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(assignPayload)
      .expect(404);
    const body = res.body as ApiResponse<BreakdownReport>;

    expect(body).toStrictEqual({
      success: false,
      message: 'User Not found',
    });
  });

  it('should fail for not technician role', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'manageruser@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const assignPayload = {
      assignedTo: 3,
    };

    const res = await request(server)
      .patch('/api/breakdowns/3/assign')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(assignPayload)
      .expect(400);
    const body = res.body as ApiResponse<BreakdownReport>;

    expect(body).toStrictEqual({
      success: false,
      message: 'User must have technician role',
    });
  });
});
