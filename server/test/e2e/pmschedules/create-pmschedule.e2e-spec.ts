import request from 'supertest';
import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import { createApp } from '../../utils/create-app';
import { ApiResponse, LoginResponse } from '../../test.types';
import { PMSchedule } from '@prisma/client';

describe('Create PMSchedule E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should create pmschedule', async () => {
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
      equipmentId: 1,
      templateId: 49,
      frequencyType: 'WEEKLY',
      interval: 1,
      startDate: '2026-06-16',
      assignedTo: 10,
    };

    const res = await request(server)
      .post('/api/pmschedules')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(schedulePayload)
      .expect(200);

    const body = res.body as ApiResponse<PMSchedule>;

    expect(body).toStrictEqual({
      success: true,
      message: 'PM Schedule successfully created',
    });
  });

  it('should fail for equipment id not found', async () => {
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
      equipmentId: 100,
      templateId: 49,
      frequencyType: 'WEEKLY',
      interval: 1,
      startDate: '2026-06-16',
      assignedTo: 10,
    };

    const res = await request(server)
      .post('/api/pmschedules')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(schedulePayload)
      .expect(404);

    const body = res.body as ApiResponse<PMSchedule>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Equipment not found',
    });
  });

  it('should fail for template id not found', async () => {
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
      equipmentId: 1,
      templateId: 4,
      frequencyType: 'WEEKLY',
      interval: 1,
      startDate: '2026-06-16',
      assignedTo: 10,
    };

    const res = await request(server)
      .post('/api/pmschedules')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(schedulePayload)
      .expect(404);

    const body = res.body as ApiResponse<PMSchedule>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Checklist template not found',
    });
  });

  it('should fail for template id deactivated', async () => {
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
      equipmentId: 1,
      templateId: 53,
      frequencyType: 'WEEKLY',
      interval: 1,
      startDate: '2026-06-16',
      assignedTo: 10,
    };

    const res = await request(server)
      .post('/api/pmschedules')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(schedulePayload)
      .expect(400);

    const body = res.body as ApiResponse<PMSchedule>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Checklist template is deactivate',
    });
  });

  it('should fail for invalid frequency type', async () => {
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
      equipmentId: 1,
      templateId: 49,
      frequencyType: 'weekly',
      interval: 1,
      startDate: '2026-06-16',
      assignedTo: 10,
    };

    const res = await request(server)
      .post('/api/pmschedules')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(schedulePayload)
      .expect(400);

    const body = res.body as ApiResponse<PMSchedule>;

    expect(body).toStrictEqual({
      success: false,
      message:
        'frequencyType must be one of the following values: DAILY, WEEKLY, MONTHLY, YEARLY',
    });
  });

  it('should fail for invalid date', async () => {
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
      equipmentId: 1,
      templateId: 49,
      frequencyType: 'WEEKLY',
      interval: 1,
      startDate: '2026-06-14',
      assignedTo: 10,
    };

    const res = await request(server)
      .post('/api/pmschedules')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(schedulePayload)
      .expect(400);

    const body = res.body as ApiResponse<PMSchedule>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Invalid start date',
    });
  });

  it('should fail for user not found', async () => {
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
      equipmentId: 1,
      templateId: 49,
      frequencyType: 'WEEKLY',
      interval: 1,
      startDate: '2026-06-14',
      assignedTo: 2,
    };

    const res = await request(server)
      .post('/api/pmschedules')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(schedulePayload)
      .expect(404);

    const body = res.body as ApiResponse<PMSchedule>;

    expect(body).toStrictEqual({
      success: false,
      message: 'User not found',
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
      equipmentId: 1,
      templateId: 49,
      frequencyType: 'WEEKLY',
      interval: 1,
      startDate: '2026-06-14',
      assignedTo: 3,
    };

    const res = await request(server)
      .post('/api/pmschedules')
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
