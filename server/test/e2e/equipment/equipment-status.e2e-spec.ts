import { afterAll, beforeAll, describe, expect, it } from '@jest/globals';
import { INestApplication } from '@nestjs/common';
import request from 'supertest';
import { createApp } from '../../utils/create-app';
import { ApiResponse, LoginResponse } from '../../test.types';
import { Equipment } from '@prisma/client';

describe('Deactivate equipment E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should deactivate equipment', async () => {
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

    const res = await request(server)
      .patch('/api/equipment/3/deactivate')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(200);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: true,
      message: 'Equipment deactivated',
    });
  });

  it('should fail for not found', async () => {
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

    const res = await request(server)
      .patch('/api/equipment/2/deactivate')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(404);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Equipment not found',
    });
  });

  it('should fail for already deactivated', async () => {
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

    const res = await request(server)
      .patch('/api/equipment/3/deactivate')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(400);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Equipment already deactivated',
    });
  });
});

describe('Activate equipment E2E', () => {
  let app: INestApplication;

  beforeAll(async () => {
    app = await createApp();
  });

  afterAll(async () => {
    await app.close();
  });

  it('should activate equipment', async () => {
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

    const res = await request(server)
      .patch('/api/equipment/3/activate')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(200);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: true,
      message: 'Equipment activated',
    });
  });

  it('should fail for not found', async () => {
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

    const res = await request(server)
      .patch('/api/equipment/2/activate')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(404);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Equipment not found',
    });
  });

  it('should fail for already deactivated', async () => {
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

    const res = await request(server)
      .patch('/api/equipment/3/activate')
      .set('Authorization', `Bearer ${accessToken}`)
      .expect(400);
    const body = res.body as ApiResponse<Equipment>;

    expect(body).toStrictEqual({
      success: false,
      message: 'Equipment is already active',
    });
  });
});
