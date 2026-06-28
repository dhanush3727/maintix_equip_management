import request from 'supertest';
import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import { createApp } from '../../utils/create-app';
import { ApiResponse, LoginResponse } from '../../test.types';
import { BreakdownReport } from '@prisma/client';

describe('Create Breakdown E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should create new breakdown', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'dhanush7825@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const createPayload = {
      title: 'Test Breakdown',
      description: 'Testing purpose',
      severity: 'LOW',
      equipmentId: 5,
    };

    const res = await request(server)
      .post('/api/breakdowns')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(createPayload)
      .expect(201);
    const body = res.body as ApiResponse<BreakdownReport>;

    expect(body).toStrictEqual({
      success: true,
      message: 'Breakdown successfully created',
    });
  });

  it('should fail for invalid equipment', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'dhanush7825@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const createPayload = {
      title: 'Test Breakdown',
      description: 'Testing purpose',
      severity: 'LOW',
      equipmentId: 100,
    };

    const res = await request(server)
      .post('/api/breakdowns')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(createPayload)
      .expect(404);
    const body = res.body as ApiResponse<BreakdownReport>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Equipment not found',
    });
  });

  it('should fail for invalid severity', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: 'dhanush7825@gmail.com',
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload)
      .expect(200);
    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const createPayload = {
      title: 'Test Breakdown',
      description: 'Testing purpose',
      severity: 'low',
      equipmentId: 5,
    };

    const res = await request(server)
      .post('/api/breakdowns')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(createPayload)
      .expect(400);
    const body = res.body as ApiResponse<BreakdownReport>;

    expect(body).toStrictEqual({
      success: false,
      message:
        'severity must be one of the following values: LOW, MEDIUM, HIGH, CRITICAL',
    });
  });
});
