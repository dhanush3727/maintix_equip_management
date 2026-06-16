import request from 'supertest';
import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import { createApp } from '../../utils/create-app';
import { ApiResponse, LoginResponse } from '../../test.types';
import { PMSchedule } from '@prisma/client';

describe('Update PMSchedule E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should update full pmschedule', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: `dhanush7825@gmail.com`,
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const schedulePayload = {
      frequencyType: 'WEEKLY',
      interval: 1,
      startDate: '2026-06-20',
    };

    const res = await request(server)
      .patch('/api/pmschedules/3')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(schedulePayload)
      .expect(200);
    const body = res.body as ApiResponse<PMSchedule>;

    expect(body).toStrictEqual({
      success: true,
      message: 'PM Schedule updated successfully',
    });
  });

  it('should fail for not found schedule', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: `dhanush7825@gmail.com`,
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const schedulePayload = {
      frequencyType: 'WEEKLY',
      interval: 1,
      startDate: '2026-06-20',
    };

    const res = await request(server)
      .patch('/api/pmschedules/99')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(schedulePayload)
      .expect(404);
    const body = res.body as ApiResponse<PMSchedule>;

    expect(body).toStrictEqual({
      success: false,
      message: 'PMSchedule not found',
    });
  });

  it('should fail for invalid start date', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: `dhanush7825@gmail.com`,
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const schedulePayload = {
      frequencyType: 'WEEKLY',
      interval: 1,
      startDate: '2026-06-12',
    };

    const res = await request(server)
      .patch('/api/pmschedules/3')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(schedulePayload)
      .expect(400);
    const body = res.body as ApiResponse<PMSchedule>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Invalid start date',
    });
  });

  it('should fail for invalid user role', async () => {
    const server = app.getHttpServer() as Parameters<typeof request>[0];

    const payload = {
      email: `dhanush7825@gmail.com`,
      password: 'Dhanush@3727',
    };

    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const schedulePayload = {
      assignedTo: 3,
    };

    const res = await request(server)
      .patch('/api/pmschedules/3')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(schedulePayload)
      .expect(400);
    const body = res.body as ApiResponse<PMSchedule>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Assigned user must have Technician role',
    });
  });
});
