import request from 'supertest';
import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import { createApp } from '../../utils/create-app';
import { ApiResponse, LoginResponse } from '../../test.types';
import { BreakdownReport } from '@prisma/client';

describe('Update Breakdown E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should update breakdown', async () => {
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
      title: 'Update Breakdown',
      description: 'Update the description',
      severity: 'HIGH',
    };

    const res = await request(server)
      .patch('/api/breakdowns/4')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(createPayload)
      .expect(200);
    const body = res.body as ApiResponse<BreakdownReport>;

    expect(body).toStrictEqual({
      success: true,
      message: 'Breakdown update successfully',
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
      severity: 'low',
    };

    const res = await request(server)
      .patch('/api/breakdowns/1')
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
