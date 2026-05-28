import { INestApplication } from '@nestjs/common';
import request from 'supertest';
import { describe, it, beforeAll, afterAll, expect } from '@jest/globals';
import { createApp } from '../../utils/create-app';
import { ApiResponse, LoginResponse } from '../../test.types';
import { Department } from '@prisma/client';

describe('Create Department E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should cretae department', async () => {
    const payload = {
      email: `dhanush7825@gmail.com`,
      password: 'Dhanush@3727',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const depPayload = {
      name: '     electrical  ',
      type: 'ELECTRICAL',
      code: 'elec',
    };

    const res = await request(server)
      .post('/api/organization/department')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(depPayload)
      .expect(201);

    const body = res.body as ApiResponse<Department>;

    expect(body.message).toBe('Department Created');
    expect(body.success).toBe(true);
  });

  it('should fail for existing department name', async () => {
    const payload = {
      email: `dhanush7825@gmail.com`,
      password: 'Dhanush@3727',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const depPayload = {
      name: 'Mechanical',
      type: 'ELECTRICAL',
      code: 'Mech2',
    };

    const res = await request(server)
      .post('/api/organization/department')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(depPayload)
      .expect(400);

    const body = res.body as ApiResponse<Department>;

    expect(body.message).toBe('Department already exist');
    expect(body.success).toBe(false);
  });

  it('should fail for existing department code', async () => {
    const payload = {
      email: `dhanush7825@gmail.com`,
      password: 'Dhanush@3727',
    };

    const server = app.getHttpServer() as Parameters<typeof request>[0];
    const loginRes = await request(server)
      .post('/api/auth/login')
      .send(payload);

    const loginData = loginRes.body as LoginResponse;
    const accessToken = loginData.data.accessToken;

    const depPayload = {
      name: 'Instru',
      type: 'INSTRUMENTATION',
      code: 'MECH',
    };

    const res = await request(server)
      .post('/api/organization/department')
      .set('Authorization', `Bearer ${accessToken}`)
      .send(depPayload)
      .expect(400);

    const body = res.body as ApiResponse<Department>;

    expect(body.message).toBe('Department already exist');
    expect(body.success).toBe(false);
  });
});
